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
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';

export default function TimeFormatMatrixPro2Test() {
  describe('TimeFormatMatrixPro2Test', () => {
    /**
     * @tc.number SUB_TIME_PRO2_0100
     * @tc.name testTimePro20001
     * @tc.desc Verify msToCountdownTime(0) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
      let parts: string[] = MediaTools.msToCountdownTime(0).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_0200
     * @tc.name testTimePro20002
     * @tc.desc Verify msToCountdownTime(1) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1)).assertEqual('00:00');
      let parts: string[] = MediaTools.msToCountdownTime(1).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_0300
     * @tc.name testTimePro20003
     * @tc.desc Verify msToCountdownTime(2) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2)).assertEqual('00:00');
      let parts: string[] = MediaTools.msToCountdownTime(2).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_0400
     * @tc.name testTimePro20004
     * @tc.desc Verify msToCountdownTime(1000) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1000)).assertEqual('00:01');
      let parts: string[] = MediaTools.msToCountdownTime(1000).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_0500
     * @tc.name testTimePro20005
     * @tc.desc Verify msToCountdownTime(2000) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2000)).assertEqual('00:02');
      let parts: string[] = MediaTools.msToCountdownTime(2000).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_0600
     * @tc.name testTimePro20006
     * @tc.desc Verify msToCountdownTime(5555) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(5555)).assertEqual('00:05');
      let parts: string[] = MediaTools.msToCountdownTime(5555).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_0700
     * @tc.name testTimePro20007
     * @tc.desc Verify msToCountdownTime(59999) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59999)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59999).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_0800
     * @tc.name testTimePro20008
     * @tc.desc Verify msToCountdownTime(60001) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60001)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60001).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_0900
     * @tc.name testTimePro20009
     * @tc.desc Verify msToCountdownTime(119999) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(119999)).assertEqual('01:59');
      let parts: string[] = MediaTools.msToCountdownTime(119999).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1000
     * @tc.name testTimePro20010
     * @tc.desc Verify msToCountdownTime(3599999) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3599999)).assertEqual('59:59');
      let parts: string[] = MediaTools.msToCountdownTime(3599999).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1100
     * @tc.name testTimePro20011
     * @tc.desc Verify msToCountdownTime(3600001) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3600001)).assertEqual('01:00:00');
      let parts: string[] = MediaTools.msToCountdownTime(3600001).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1200
     * @tc.name testTimePro20012
     * @tc.desc Verify msToCountdownTime(7200000) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(7200000)).assertEqual('02:00:00');
      let parts: string[] = MediaTools.msToCountdownTime(7200000).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1300
     * @tc.name testTimePro20013
     * @tc.desc Verify msToCountdownTime(43200000) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(43200000)).assertEqual('12:00:00');
      let parts: string[] = MediaTools.msToCountdownTime(43200000).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1400
     * @tc.name testTimePro20014
     * @tc.desc Verify msToCountdownTime(86399998) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(86399998)).assertEqual('23:59:59');
      let parts: string[] = MediaTools.msToCountdownTime(86399998).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1500
     * @tc.name testTimePro20015
     * @tc.desc Verify msToCountdownTime(86400002) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(86400002)).assertEqual('01:00:00');
      let parts: string[] = MediaTools.msToCountdownTime(86400002).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1600
     * @tc.name testTimePro20016
     * @tc.desc Verify msToCountdownTime(172800000) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(172800000)).assertEqual('02:00:00');
      let parts: string[] = MediaTools.msToCountdownTime(172800000).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1700
     * @tc.name testTimePro20017
     * @tc.desc Verify msToCountdownTime(259200000) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(259200000)).assertEqual('03:00:00');
      let parts: string[] = MediaTools.msToCountdownTime(259200000).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1800
     * @tc.name testTimePro20018
     * @tc.desc Verify msToCountdownTime(-2) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-2)).assertEqual('-1:-1:-1:-1');
      let parts: string[] = MediaTools.msToCountdownTime(-2).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_1900
     * @tc.name testTimePro20019
     * @tc.desc Verify msToCountdownTime(-999) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-999)).assertEqual('-1:-1:-1:-1');
      let parts: string[] = MediaTools.msToCountdownTime(-999).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2000
     * @tc.name testTimePro20020
     * @tc.desc Verify msToCountdownTime(-1001) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-1001)).assertEqual('-1:-1:-1:-2');
      let parts: string[] = MediaTools.msToCountdownTime(-1001).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2100
     * @tc.name testTimePro20021
     * @tc.desc Verify msToCountdownTime(-59999) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-59999)).assertEqual('-1:-1:-1:-60');
      let parts: string[] = MediaTools.msToCountdownTime(-59999).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2200
     * @tc.name testTimePro20022
     * @tc.desc Verify msToCountdownTime(-60001) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-60001)).assertEqual('-1:-1:-2:-1');
      let parts: string[] = MediaTools.msToCountdownTime(-60001).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2300
     * @tc.name testTimePro20023
     * @tc.desc Verify msToCountdownTime(-3599999) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-3599999)).assertEqual('-1:-1:-60:-60');
      let parts: string[] = MediaTools.msToCountdownTime(-3599999).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2400
     * @tc.name testTimePro20024
     * @tc.desc Verify msToCountdownTime(-3600001) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-3600001)).assertEqual('-1:-2:-1:-1');
      let parts: string[] = MediaTools.msToCountdownTime(-3600001).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2500
     * @tc.name testTimePro20025
     * @tc.desc Verify msToCountdownTime(-7200000) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-7200000)).assertEqual('-1:-2:00:00');
      let parts: string[] = MediaTools.msToCountdownTime(-7200000).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2600
     * @tc.name testTimePro20026
     * @tc.desc Verify msToCountdownTime(-172800000) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-172800000)).assertEqual('-2:00:00');
      let parts: string[] = MediaTools.msToCountdownTime(-172800000).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2700
     * @tc.name testTimePro20027
     * @tc.desc Verify msToCountdownTime(357215081) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(357215081)).assertEqual('04:03:13:35');
      let parts: string[] = MediaTools.msToCountdownTime(357215081).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2800
     * @tc.name testTimePro20028
     * @tc.desc Verify msToCountdownTime(-30418341) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-30418341)).assertEqual('-1:-9:-27:-59');
      let parts: string[] = MediaTools.msToCountdownTime(-30418341).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_2900
     * @tc.name testTimePro20029
     * @tc.desc Verify msToCountdownTime(1333024) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1333024)).assertEqual('22:13');
      let parts: string[] = MediaTools.msToCountdownTime(1333024).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3000
     * @tc.name testTimePro20030
     * @tc.desc Verify msToCountdownTime(60439) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60439)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60439).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3100
     * @tc.name testTimePro20031
     * @tc.desc Verify msToCountdownTime(70313354) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(70313354)).assertEqual('19:31:53');
      let parts: string[] = MediaTools.msToCountdownTime(70313354).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3200
     * @tc.name testTimePro20032
     * @tc.desc Verify msToCountdownTime(231515092) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(231515092)).assertEqual('02:16:18:35');
      let parts: string[] = MediaTools.msToCountdownTime(231515092).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3300
     * @tc.name testTimePro20033
     * @tc.desc Verify msToCountdownTime(-6274415) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-6274415)).assertEqual('-1:-2:-45:-35');
      let parts: string[] = MediaTools.msToCountdownTime(-6274415).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3400
     * @tc.name testTimePro20034
     * @tc.desc Verify msToCountdownTime(1431144) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1431144)).assertEqual('23:51');
      let parts: string[] = MediaTools.msToCountdownTime(1431144).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3500
     * @tc.name testTimePro20035
     * @tc.desc Verify msToCountdownTime(59414) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59414)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59414).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3600
     * @tc.name testTimePro20036
     * @tc.desc Verify msToCountdownTime(18618009) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(18618009)).assertEqual('05:10:18');
      let parts: string[] = MediaTools.msToCountdownTime(18618009).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3700
     * @tc.name testTimePro20037
     * @tc.desc Verify msToCountdownTime(383634024) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(383634024)).assertEqual('04:10:33:54');
      let parts: string[] = MediaTools.msToCountdownTime(383634024).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3800
     * @tc.name testTimePro20038
     * @tc.desc Verify msToCountdownTime(-51146126) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-51146126)).assertEqual('-1:-15:-13:-27');
      let parts: string[] = MediaTools.msToCountdownTime(-51146126).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_3900
     * @tc.name testTimePro20039
     * @tc.desc Verify msToCountdownTime(1456781) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1456781)).assertEqual('24:16');
      let parts: string[] = MediaTools.msToCountdownTime(1456781).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4000
     * @tc.name testTimePro20040
     * @tc.desc Verify msToCountdownTime(60922) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60922)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60922).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4100
     * @tc.name testTimePro20041
     * @tc.desc Verify msToCountdownTime(54145317) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(54145317)).assertEqual('15:02:25');
      let parts: string[] = MediaTools.msToCountdownTime(54145317).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4200
     * @tc.name testTimePro20042
     * @tc.desc Verify msToCountdownTime(378550039) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(378550039)).assertEqual('04:09:09:10');
      let parts: string[] = MediaTools.msToCountdownTime(378550039).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4300
     * @tc.name testTimePro20043
     * @tc.desc Verify msToCountdownTime(-60873261) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-60873261)).assertEqual('-1:-17:-55:-34');
      let parts: string[] = MediaTools.msToCountdownTime(-60873261).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4400
     * @tc.name testTimePro20044
     * @tc.desc Verify msToCountdownTime(846087) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(846087)).assertEqual('14:06');
      let parts: string[] = MediaTools.msToCountdownTime(846087).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4500
     * @tc.name testTimePro20045
     * @tc.desc Verify msToCountdownTime(59318) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59318)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59318).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4600
     * @tc.name testTimePro20046
     * @tc.desc Verify msToCountdownTime(64161482) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(64161482)).assertEqual('17:49:21');
      let parts: string[] = MediaTools.msToCountdownTime(64161482).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4700
     * @tc.name testTimePro20047
     * @tc.desc Verify msToCountdownTime(476874707) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(476874707)).assertEqual('05:12:27:54');
      let parts: string[] = MediaTools.msToCountdownTime(476874707).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4800
     * @tc.name testTimePro20048
     * @tc.desc Verify msToCountdownTime(-41340467) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-41340467)).assertEqual('-1:-12:-30:-1');
      let parts: string[] = MediaTools.msToCountdownTime(-41340467).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_4900
     * @tc.name testTimePro20049
     * @tc.desc Verify msToCountdownTime(1788257) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1788257)).assertEqual('29:48');
      let parts: string[] = MediaTools.msToCountdownTime(1788257).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5000
     * @tc.name testTimePro20050
     * @tc.desc Verify msToCountdownTime(59008) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59008)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59008).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5100
     * @tc.name testTimePro20051
     * @tc.desc Verify msToCountdownTime(24710097) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(24710097)).assertEqual('06:51:50');
      let parts: string[] = MediaTools.msToCountdownTime(24710097).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5200
     * @tc.name testTimePro20052
     * @tc.desc Verify msToCountdownTime(192928917) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(192928917)).assertEqual('02:05:35:28');
      let parts: string[] = MediaTools.msToCountdownTime(192928917).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5300
     * @tc.name testTimePro20053
     * @tc.desc Verify msToCountdownTime(-80867154) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-80867154)).assertEqual('-1:-23:-28:-48');
      let parts: string[] = MediaTools.msToCountdownTime(-80867154).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5400
     * @tc.name testTimePro20054
     * @tc.desc Verify msToCountdownTime(2865091) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2865091)).assertEqual('47:45');
      let parts: string[] = MediaTools.msToCountdownTime(2865091).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5500
     * @tc.name testTimePro20055
     * @tc.desc Verify msToCountdownTime(59052) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59052)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59052).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5600
     * @tc.name testTimePro20056
     * @tc.desc Verify msToCountdownTime(59643233) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59643233)).assertEqual('16:34:03');
      let parts: string[] = MediaTools.msToCountdownTime(59643233).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5700
     * @tc.name testTimePro20057
     * @tc.desc Verify msToCountdownTime(387935726) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(387935726)).assertEqual('04:11:45:35');
      let parts: string[] = MediaTools.msToCountdownTime(387935726).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5800
     * @tc.name testTimePro20058
     * @tc.desc Verify msToCountdownTime(-73282322) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-73282322)).assertEqual('-1:-21:-22:-23');
      let parts: string[] = MediaTools.msToCountdownTime(-73282322).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_5900
     * @tc.name testTimePro20059
     * @tc.desc Verify msToCountdownTime(1754655) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1754655)).assertEqual('29:14');
      let parts: string[] = MediaTools.msToCountdownTime(1754655).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6000
     * @tc.name testTimePro20060
     * @tc.desc Verify msToCountdownTime(59204) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59204)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59204).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6100
     * @tc.name testTimePro20061
     * @tc.desc Verify msToCountdownTime(57340880) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(57340880)).assertEqual('15:55:40');
      let parts: string[] = MediaTools.msToCountdownTime(57340880).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6200
     * @tc.name testTimePro20062
     * @tc.desc Verify msToCountdownTime(394755842) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(394755842)).assertEqual('04:13:39:15');
      let parts: string[] = MediaTools.msToCountdownTime(394755842).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6300
     * @tc.name testTimePro20063
     * @tc.desc Verify msToCountdownTime(-19247444) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-19247444)).assertEqual('-1:-6:-21:-48');
      let parts: string[] = MediaTools.msToCountdownTime(-19247444).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6400
     * @tc.name testTimePro20064
     * @tc.desc Verify msToCountdownTime(3335861) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3335861)).assertEqual('55:35');
      let parts: string[] = MediaTools.msToCountdownTime(3335861).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6500
     * @tc.name testTimePro20065
     * @tc.desc Verify msToCountdownTime(59774) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59774)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59774).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6600
     * @tc.name testTimePro20066
     * @tc.desc Verify msToCountdownTime(22274576) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(22274576)).assertEqual('06:11:14');
      let parts: string[] = MediaTools.msToCountdownTime(22274576).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6700
     * @tc.name testTimePro20067
     * @tc.desc Verify msToCountdownTime(365760276) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(365760276)).assertEqual('04:05:36:00');
      let parts: string[] = MediaTools.msToCountdownTime(365760276).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6800
     * @tc.name testTimePro20068
     * @tc.desc Verify msToCountdownTime(-66900299) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-66900299)).assertEqual('-1:-19:-36:-1');
      let parts: string[] = MediaTools.msToCountdownTime(-66900299).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_6900
     * @tc.name testTimePro20069
     * @tc.desc Verify msToCountdownTime(3423975) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3423975)).assertEqual('57:03');
      let parts: string[] = MediaTools.msToCountdownTime(3423975).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7000
     * @tc.name testTimePro20070
     * @tc.desc Verify msToCountdownTime(59911) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59911)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59911).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7100
     * @tc.name testTimePro20071
     * @tc.desc Verify msToCountdownTime(31640980) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(31640980)).assertEqual('08:47:20');
      let parts: string[] = MediaTools.msToCountdownTime(31640980).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7200
     * @tc.name testTimePro20072
     * @tc.desc Verify msToCountdownTime(291931163) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(291931163)).assertEqual('03:09:05:31');
      let parts: string[] = MediaTools.msToCountdownTime(291931163).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7300
     * @tc.name testTimePro20073
     * @tc.desc Verify msToCountdownTime(-1398914) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-1398914)).assertEqual('-1:-1:-24:-19');
      let parts: string[] = MediaTools.msToCountdownTime(-1398914).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7400
     * @tc.name testTimePro20074
     * @tc.desc Verify msToCountdownTime(2183889) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2183889)).assertEqual('36:23');
      let parts: string[] = MediaTools.msToCountdownTime(2183889).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7500
     * @tc.name testTimePro20075
     * @tc.desc Verify msToCountdownTime(60504) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60504)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60504).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7600
     * @tc.name testTimePro20076
     * @tc.desc Verify msToCountdownTime(27283191) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(27283191)).assertEqual('07:34:43');
      let parts: string[] = MediaTools.msToCountdownTime(27283191).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7700
     * @tc.name testTimePro20077
     * @tc.desc Verify msToCountdownTime(463441016) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(463441016)).assertEqual('05:08:44:01');
      let parts: string[] = MediaTools.msToCountdownTime(463441016).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7800
     * @tc.name testTimePro20078
     * @tc.desc Verify msToCountdownTime(-84559157) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-84559157)).assertEqual('-1:-24:-30:-20');
      let parts: string[] = MediaTools.msToCountdownTime(-84559157).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_7900
     * @tc.name testTimePro20079
     * @tc.desc Verify msToCountdownTime(2853898) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2853898)).assertEqual('47:33');
      let parts: string[] = MediaTools.msToCountdownTime(2853898).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8000
     * @tc.name testTimePro20080
     * @tc.desc Verify msToCountdownTime(59280) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59280)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59280).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8100
     * @tc.name testTimePro20081
     * @tc.desc Verify msToCountdownTime(75912420) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(75912420)).assertEqual('21:05:12');
      let parts: string[] = MediaTools.msToCountdownTime(75912420).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8200
     * @tc.name testTimePro20082
     * @tc.desc Verify msToCountdownTime(412989958) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(412989958)).assertEqual('04:18:43:09');
      let parts: string[] = MediaTools.msToCountdownTime(412989958).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8300
     * @tc.name testTimePro20083
     * @tc.desc Verify msToCountdownTime(-30328857) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-30328857)).assertEqual('-1:-9:-26:-29');
      let parts: string[] = MediaTools.msToCountdownTime(-30328857).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8400
     * @tc.name testTimePro20084
     * @tc.desc Verify msToCountdownTime(1897111) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1897111)).assertEqual('31:37');
      let parts: string[] = MediaTools.msToCountdownTime(1897111).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8500
     * @tc.name testTimePro20085
     * @tc.desc Verify msToCountdownTime(59739) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59739)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59739).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8600
     * @tc.name testTimePro20086
     * @tc.desc Verify msToCountdownTime(12508389) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(12508389)).assertEqual('03:28:28');
      let parts: string[] = MediaTools.msToCountdownTime(12508389).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8700
     * @tc.name testTimePro20087
     * @tc.desc Verify msToCountdownTime(109709679) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(109709679)).assertEqual('01:06:28:29');
      let parts: string[] = MediaTools.msToCountdownTime(109709679).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8800
     * @tc.name testTimePro20088
     * @tc.desc Verify msToCountdownTime(-50105951) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-50105951)).assertEqual('-1:-14:-56:-6');
      let parts: string[] = MediaTools.msToCountdownTime(-50105951).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_8900
     * @tc.name testTimePro20089
     * @tc.desc Verify msToCountdownTime(2169766) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2169766)).assertEqual('36:09');
      let parts: string[] = MediaTools.msToCountdownTime(2169766).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9000
     * @tc.name testTimePro20090
     * @tc.desc Verify msToCountdownTime(59153) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59153)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59153).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9100
     * @tc.name testTimePro20091
     * @tc.desc Verify msToCountdownTime(85474565) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(85474565)).assertEqual('23:44:34');
      let parts: string[] = MediaTools.msToCountdownTime(85474565).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9200
     * @tc.name testTimePro20092
     * @tc.desc Verify msToCountdownTime(489791439) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(489791439)).assertEqual('05:16:03:11');
      let parts: string[] = MediaTools.msToCountdownTime(489791439).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9300
     * @tc.name testTimePro20093
     * @tc.desc Verify msToCountdownTime(-33782539) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-33782539)).assertEqual('-1:-10:-24:-3');
      let parts: string[] = MediaTools.msToCountdownTime(-33782539).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9400
     * @tc.name testTimePro20094
     * @tc.desc Verify msToCountdownTime(3391336) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3391336)).assertEqual('56:31');
      let parts: string[] = MediaTools.msToCountdownTime(3391336).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9500
     * @tc.name testTimePro20095
     * @tc.desc Verify msToCountdownTime(59673) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59673)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59673).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9600
     * @tc.name testTimePro20096
     * @tc.desc Verify msToCountdownTime(15645879) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(15645879)).assertEqual('04:20:45');
      let parts: string[] = MediaTools.msToCountdownTime(15645879).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9700
     * @tc.name testTimePro20097
     * @tc.desc Verify msToCountdownTime(308365138) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(308365138)).assertEqual('03:13:39:25');
      let parts: string[] = MediaTools.msToCountdownTime(308365138).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9800
     * @tc.name testTimePro20098
     * @tc.desc Verify msToCountdownTime(-29627890) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-29627890)).assertEqual('-1:-9:-14:-48');
      let parts: string[] = MediaTools.msToCountdownTime(-29627890).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_9900
     * @tc.name testTimePro20099
     * @tc.desc Verify msToCountdownTime(2159624) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2159624)).assertEqual('35:59');
      let parts: string[] = MediaTools.msToCountdownTime(2159624).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10000
     * @tc.name testTimePro20100
     * @tc.desc Verify msToCountdownTime(60718) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60718)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60718).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10100
     * @tc.name testTimePro20101
     * @tc.desc Verify msToCountdownTime(66045412) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(66045412)).assertEqual('18:20:45');
      let parts: string[] = MediaTools.msToCountdownTime(66045412).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10200
     * @tc.name testTimePro20102
     * @tc.desc Verify msToCountdownTime(136926694) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(136926694)).assertEqual('01:14:02:06');
      let parts: string[] = MediaTools.msToCountdownTime(136926694).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10300
     * @tc.name testTimePro20103
     * @tc.desc Verify msToCountdownTime(-18807645) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-18807645)).assertEqual('-1:-6:-14:-28');
      let parts: string[] = MediaTools.msToCountdownTime(-18807645).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10400
     * @tc.name testTimePro20104
     * @tc.desc Verify msToCountdownTime(94206) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(94206)).assertEqual('01:34');
      let parts: string[] = MediaTools.msToCountdownTime(94206).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10500
     * @tc.name testTimePro20105
     * @tc.desc Verify msToCountdownTime(59733) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59733)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59733).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10600
     * @tc.name testTimePro20106
     * @tc.desc Verify msToCountdownTime(3937620) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3937620)).assertEqual('01:05:37');
      let parts: string[] = MediaTools.msToCountdownTime(3937620).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10700
     * @tc.name testTimePro20107
     * @tc.desc Verify msToCountdownTime(289381460) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(289381460)).assertEqual('03:08:23:01');
      let parts: string[] = MediaTools.msToCountdownTime(289381460).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10800
     * @tc.name testTimePro20108
     * @tc.desc Verify msToCountdownTime(-34431684) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-34431684)).assertEqual('-1:-10:-34:-52');
      let parts: string[] = MediaTools.msToCountdownTime(-34431684).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_10900
     * @tc.name testTimePro20109
     * @tc.desc Verify msToCountdownTime(858374) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(858374)).assertEqual('14:18');
      let parts: string[] = MediaTools.msToCountdownTime(858374).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11000
     * @tc.name testTimePro20110
     * @tc.desc Verify msToCountdownTime(59233) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59233)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59233).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11100
     * @tc.name testTimePro20111
     * @tc.desc Verify msToCountdownTime(3191065) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3191065)).assertEqual('53:11');
      let parts: string[] = MediaTools.msToCountdownTime(3191065).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11200
     * @tc.name testTimePro20112
     * @tc.desc Verify msToCountdownTime(459299296) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(459299296)).assertEqual('05:07:34:59');
      let parts: string[] = MediaTools.msToCountdownTime(459299296).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11300
     * @tc.name testTimePro20113
     * @tc.desc Verify msToCountdownTime(-10293229) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-10293229)).assertEqual('-1:-3:-52:-34');
      let parts: string[] = MediaTools.msToCountdownTime(-10293229).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11400
     * @tc.name testTimePro20114
     * @tc.desc Verify msToCountdownTime(1392786) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1392786)).assertEqual('23:12');
      let parts: string[] = MediaTools.msToCountdownTime(1392786).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11500
     * @tc.name testTimePro20115
     * @tc.desc Verify msToCountdownTime(60578) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60578)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60578).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11600
     * @tc.name testTimePro20116
     * @tc.desc Verify msToCountdownTime(77384343) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(77384343)).assertEqual('21:29:44');
      let parts: string[] = MediaTools.msToCountdownTime(77384343).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11700
     * @tc.name testTimePro20117
     * @tc.desc Verify msToCountdownTime(185984376) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(185984376)).assertEqual('02:03:39:44');
      let parts: string[] = MediaTools.msToCountdownTime(185984376).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11800
     * @tc.name testTimePro20118
     * @tc.desc Verify msToCountdownTime(-21463332) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-21463332)).assertEqual('-1:-6:-58:-44');
      let parts: string[] = MediaTools.msToCountdownTime(-21463332).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_11900
     * @tc.name testTimePro20119
     * @tc.desc Verify msToCountdownTime(3116824) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3116824)).assertEqual('51:56');
      let parts: string[] = MediaTools.msToCountdownTime(3116824).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12000
     * @tc.name testTimePro20120
     * @tc.desc Verify msToCountdownTime(59608) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59608)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59608).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12100
     * @tc.name testTimePro20121
     * @tc.desc Verify msToCountdownTime(47655785) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(47655785)).assertEqual('13:14:15');
      let parts: string[] = MediaTools.msToCountdownTime(47655785).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12200
     * @tc.name testTimePro20122
     * @tc.desc Verify msToCountdownTime(173157936) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(173157936)).assertEqual('02:05:57');
      let parts: string[] = MediaTools.msToCountdownTime(173157936).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12300
     * @tc.name testTimePro20123
     * @tc.desc Verify msToCountdownTime(-61459844) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-61459844)).assertEqual('-1:-18:-5:-20');
      let parts: string[] = MediaTools.msToCountdownTime(-61459844).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12400
     * @tc.name testTimePro20124
     * @tc.desc Verify msToCountdownTime(3369291) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3369291)).assertEqual('56:09');
      let parts: string[] = MediaTools.msToCountdownTime(3369291).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12500
     * @tc.name testTimePro20125
     * @tc.desc Verify msToCountdownTime(60458) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60458)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60458).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12600
     * @tc.name testTimePro20126
     * @tc.desc Verify msToCountdownTime(19011053) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(19011053)).assertEqual('05:16:51');
      let parts: string[] = MediaTools.msToCountdownTime(19011053).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12700
     * @tc.name testTimePro20127
     * @tc.desc Verify msToCountdownTime(100168256) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(100168256)).assertEqual('01:03:49:28');
      let parts: string[] = MediaTools.msToCountdownTime(100168256).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12800
     * @tc.name testTimePro20128
     * @tc.desc Verify msToCountdownTime(-31367258) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-31367258)).assertEqual('-1:-9:-43:-48');
      let parts: string[] = MediaTools.msToCountdownTime(-31367258).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_12900
     * @tc.name testTimePro20129
     * @tc.desc Verify msToCountdownTime(520537) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(520537)).assertEqual('08:40');
      let parts: string[] = MediaTools.msToCountdownTime(520537).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13000
     * @tc.name testTimePro20130
     * @tc.desc Verify msToCountdownTime(59253) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59253)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59253).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13100
     * @tc.name testTimePro20131
     * @tc.desc Verify msToCountdownTime(42780709) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(42780709)).assertEqual('11:53:00');
      let parts: string[] = MediaTools.msToCountdownTime(42780709).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13200
     * @tc.name testTimePro20132
     * @tc.desc Verify msToCountdownTime(464603391) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(464603391)).assertEqual('05:09:03:23');
      let parts: string[] = MediaTools.msToCountdownTime(464603391).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13300
     * @tc.name testTimePro20133
     * @tc.desc Verify msToCountdownTime(-38709724) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-38709724)).assertEqual('-1:-11:-46:-10');
      let parts: string[] = MediaTools.msToCountdownTime(-38709724).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13400
     * @tc.name testTimePro20134
     * @tc.desc Verify msToCountdownTime(164991) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(164991)).assertEqual('02:44');
      let parts: string[] = MediaTools.msToCountdownTime(164991).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13500
     * @tc.name testTimePro20135
     * @tc.desc Verify msToCountdownTime(60029) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60029)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60029).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13600
     * @tc.name testTimePro20136
     * @tc.desc Verify msToCountdownTime(65808857) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(65808857)).assertEqual('18:16:48');
      let parts: string[] = MediaTools.msToCountdownTime(65808857).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13700
     * @tc.name testTimePro20137
     * @tc.desc Verify msToCountdownTime(278957136) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(278957136)).assertEqual('03:05:29:17');
      let parts: string[] = MediaTools.msToCountdownTime(278957136).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13800
     * @tc.name testTimePro20138
     * @tc.desc Verify msToCountdownTime(-3023088) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-3023088)).assertEqual('-1:-1:-51:-24');
      let parts: string[] = MediaTools.msToCountdownTime(-3023088).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_13900
     * @tc.name testTimePro20139
     * @tc.desc Verify msToCountdownTime(1981270) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1981270)).assertEqual('33:01');
      let parts: string[] = MediaTools.msToCountdownTime(1981270).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14000
     * @tc.name testTimePro20140
     * @tc.desc Verify msToCountdownTime(60818) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60818)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60818).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14100
     * @tc.name testTimePro20141
     * @tc.desc Verify msToCountdownTime(35570806) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(35570806)).assertEqual('09:52:50');
      let parts: string[] = MediaTools.msToCountdownTime(35570806).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14200
     * @tc.name testTimePro20142
     * @tc.desc Verify msToCountdownTime(277480010) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(277480010)).assertEqual('03:05:04:40');
      let parts: string[] = MediaTools.msToCountdownTime(277480010).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14300
     * @tc.name testTimePro20143
     * @tc.desc Verify msToCountdownTime(-47669033) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-47669033)).assertEqual('-1:-14:-15:-30');
      let parts: string[] = MediaTools.msToCountdownTime(-47669033).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14400
     * @tc.name testTimePro20144
     * @tc.desc Verify msToCountdownTime(636751) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(636751)).assertEqual('10:36');
      let parts: string[] = MediaTools.msToCountdownTime(636751).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14500
     * @tc.name testTimePro20145
     * @tc.desc Verify msToCountdownTime(59400) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59400)).assertEqual('00:59');
      let parts: string[] = MediaTools.msToCountdownTime(59400).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14600
     * @tc.name testTimePro20146
     * @tc.desc Verify msToCountdownTime(9253038) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(9253038)).assertEqual('02:34:13');
      let parts: string[] = MediaTools.msToCountdownTime(9253038).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14700
     * @tc.name testTimePro20147
     * @tc.desc Verify msToCountdownTime(351313934) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(351313934)).assertEqual('04:01:35:13');
      let parts: string[] = MediaTools.msToCountdownTime(351313934).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14800
     * @tc.name testTimePro20148
     * @tc.desc Verify msToCountdownTime(-2246487) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-2246487)).assertEqual('-1:-1:-38:-27');
      let parts: string[] = MediaTools.msToCountdownTime(-2246487).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_14900
     * @tc.name testTimePro20149
     * @tc.desc Verify msToCountdownTime(1127645) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1127645)).assertEqual('18:47');
      let parts: string[] = MediaTools.msToCountdownTime(1127645).split(':');
      expect(parts.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO2_15000
     * @tc.name testTimePro20150
     * @tc.desc Verify msToCountdownTime(60378) matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro20150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60378)).assertEqual('01:00');
      let parts: string[] = MediaTools.msToCountdownTime(60378).split(':');
      expect(parts.length >= 2).assertTrue();
    });
  });
}
