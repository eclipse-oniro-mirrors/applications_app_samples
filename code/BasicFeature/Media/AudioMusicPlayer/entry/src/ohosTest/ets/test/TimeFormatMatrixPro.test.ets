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

export default function TimeFormatMatrixProTest() {
  describe('TimeFormatMatrixProTest', () => {
    /**
     * @tc.number SUB_TIME_PRO_0100
     * @tc.name testTimePro0001
     * @tc.desc Verify msToCountdownTime(0) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
      expect(MediaTools.msToCountdownTime(0).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_0200
     * @tc.name testTimePro0002
     * @tc.desc Verify msToCountdownTime(1) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1)).assertEqual('00:00');
      expect(MediaTools.msToCountdownTime(1).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_0300
     * @tc.name testTimePro0003
     * @tc.desc Verify msToCountdownTime(999) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(999)).assertEqual('00:00');
      expect(MediaTools.msToCountdownTime(999).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_0400
     * @tc.name testTimePro0004
     * @tc.desc Verify msToCountdownTime(1000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1000)).assertEqual('00:01');
      expect(MediaTools.msToCountdownTime(1000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_0500
     * @tc.name testTimePro0005
     * @tc.desc Verify msToCountdownTime(1999) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1999)).assertEqual('00:01');
      expect(MediaTools.msToCountdownTime(1999).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_0600
     * @tc.name testTimePro0006
     * @tc.desc Verify msToCountdownTime(59999) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59999)).assertEqual('00:59');
      expect(MediaTools.msToCountdownTime(59999).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_0700
     * @tc.name testTimePro0007
     * @tc.desc Verify msToCountdownTime(60000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(60000)).assertEqual('01:00');
      expect(MediaTools.msToCountdownTime(60000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_0800
     * @tc.name testTimePro0008
     * @tc.desc Verify msToCountdownTime(61000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(61000)).assertEqual('01:01');
      expect(MediaTools.msToCountdownTime(61000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_0900
     * @tc.name testTimePro0009
     * @tc.desc Verify msToCountdownTime(3599000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3599000)).assertEqual('59:59');
      expect(MediaTools.msToCountdownTime(3599000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1000
     * @tc.name testTimePro0010
     * @tc.desc Verify msToCountdownTime(3599999) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3599999)).assertEqual('59:59');
      expect(MediaTools.msToCountdownTime(3599999).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1100
     * @tc.name testTimePro0011
     * @tc.desc Verify msToCountdownTime(3600000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3600000)).assertEqual('01:00:00');
      expect(MediaTools.msToCountdownTime(3600000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1200
     * @tc.name testTimePro0012
     * @tc.desc Verify msToCountdownTime(3600001) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3600001)).assertEqual('01:00:00');
      expect(MediaTools.msToCountdownTime(3600001).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1300
     * @tc.name testTimePro0013
     * @tc.desc Verify msToCountdownTime(3661000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3661000)).assertEqual('01:01:01');
      expect(MediaTools.msToCountdownTime(3661000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1400
     * @tc.name testTimePro0014
     * @tc.desc Verify msToCountdownTime(86399999) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(86399999)).assertEqual('23:59:59');
      expect(MediaTools.msToCountdownTime(86399999).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1500
     * @tc.name testTimePro0015
     * @tc.desc Verify msToCountdownTime(86400000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(86400000)).assertEqual('01:00:00');
      expect(MediaTools.msToCountdownTime(86400000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1600
     * @tc.name testTimePro0016
     * @tc.desc Verify msToCountdownTime(86400001) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(86400001)).assertEqual('01:00:00');
      expect(MediaTools.msToCountdownTime(86400001).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1700
     * @tc.name testTimePro0017
     * @tc.desc Verify msToCountdownTime(90000000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(90000000)).assertEqual('01:01:00:00');
      expect(MediaTools.msToCountdownTime(90000000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1800
     * @tc.name testTimePro0018
     * @tc.desc Verify msToCountdownTime(90061000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(90061000)).assertEqual('01:01:01:01');
      expect(MediaTools.msToCountdownTime(90061000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_1900
     * @tc.name testTimePro0019
     * @tc.desc Verify msToCountdownTime(183845000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(183845000)).assertEqual('02:03:04:05');
      expect(MediaTools.msToCountdownTime(183845000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2000
     * @tc.name testTimePro0020
     * @tc.desc Verify msToCountdownTime(183845000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(183845000)).assertEqual('02:03:04:05');
      expect(MediaTools.msToCountdownTime(183845000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2100
     * @tc.name testTimePro0021
     * @tc.desc Verify msToCountdownTime(-1) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-1)).assertEqual('-1:-1:-1:-1');
      expect(MediaTools.msToCountdownTime(-1).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2200
     * @tc.name testTimePro0022
     * @tc.desc Verify msToCountdownTime(-500) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-500)).assertEqual('-1:-1:-1:-1');
      expect(MediaTools.msToCountdownTime(-500).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2300
     * @tc.name testTimePro0023
     * @tc.desc Verify msToCountdownTime(-999) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-999)).assertEqual('-1:-1:-1:-1');
      expect(MediaTools.msToCountdownTime(-999).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2400
     * @tc.name testTimePro0024
     * @tc.desc Verify msToCountdownTime(-1000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-1000)).assertEqual('-1:-1:-1:-1');
      expect(MediaTools.msToCountdownTime(-1000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2500
     * @tc.name testTimePro0025
     * @tc.desc Verify msToCountdownTime(-1500) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-1500)).assertEqual('-1:-1:-1:-2');
      expect(MediaTools.msToCountdownTime(-1500).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2600
     * @tc.name testTimePro0026
     * @tc.desc Verify msToCountdownTime(-2000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-2000)).assertEqual('-1:-1:-1:-2');
      expect(MediaTools.msToCountdownTime(-2000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2700
     * @tc.name testTimePro0027
     * @tc.desc Verify msToCountdownTime(-61000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-61000)).assertEqual('-1:-1:-2:-1');
      expect(MediaTools.msToCountdownTime(-61000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2800
     * @tc.name testTimePro0028
     * @tc.desc Verify msToCountdownTime(-3600000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-3600000)).assertEqual('-1:-1:00:00');
      expect(MediaTools.msToCountdownTime(-3600000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_2900
     * @tc.name testTimePro0029
     * @tc.desc Verify msToCountdownTime(-86400000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-86400000)).assertEqual('-1:00:00');
      expect(MediaTools.msToCountdownTime(-86400000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3000
     * @tc.name testTimePro0030
     * @tc.desc Verify msToCountdownTime(-90000000) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-90000000)).assertEqual('-2:-1:00:00');
      expect(MediaTools.msToCountdownTime(-90000000).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3100
     * @tc.name testTimePro0031
     * @tc.desc Verify msToCountdownTime(-87881768) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-87881768)).assertEqual('-2:-1:-25:-42');
      expect(MediaTools.msToCountdownTime(-87881768).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3200
     * @tc.name testTimePro0032
     * @tc.desc Verify msToCountdownTime(29528) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(29528)).assertEqual('00:29');
      expect(MediaTools.msToCountdownTime(29528).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3300
     * @tc.name testTimePro0033
     * @tc.desc Verify msToCountdownTime(59885275) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(59885275)).assertEqual('16:38:05');
      expect(MediaTools.msToCountdownTime(59885275).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3400
     * @tc.name testTimePro0034
     * @tc.desc Verify msToCountdownTime(1250753) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1250753)).assertEqual('20:50');
      expect(MediaTools.msToCountdownTime(1250753).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3500
     * @tc.name testTimePro0035
     * @tc.desc Verify msToCountdownTime(-103536901) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-103536901)).assertEqual('-2:-5:-46:-37');
      expect(MediaTools.msToCountdownTime(-103536901).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3600
     * @tc.name testTimePro0036
     * @tc.desc Verify msToCountdownTime(36330) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(36330)).assertEqual('00:36');
      expect(MediaTools.msToCountdownTime(36330).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3700
     * @tc.name testTimePro0037
     * @tc.desc Verify msToCountdownTime(3957357) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3957357)).assertEqual('01:05:57');
      expect(MediaTools.msToCountdownTime(3957357).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3800
     * @tc.name testTimePro0038
     * @tc.desc Verify msToCountdownTime(2301599) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2301599)).assertEqual('38:21');
      expect(MediaTools.msToCountdownTime(2301599).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_3900
     * @tc.name testTimePro0039
     * @tc.desc Verify msToCountdownTime(-179855468) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-179855468)).assertEqual('-3:-2:-58:-36');
      expect(MediaTools.msToCountdownTime(-179855468).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4000
     * @tc.name testTimePro0040
     * @tc.desc Verify msToCountdownTime(27867) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(27867)).assertEqual('00:27');
      expect(MediaTools.msToCountdownTime(27867).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4100
     * @tc.name testTimePro0041
     * @tc.desc Verify msToCountdownTime(21785377) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(21785377)).assertEqual('06:03:05');
      expect(MediaTools.msToCountdownTime(21785377).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4200
     * @tc.name testTimePro0042
     * @tc.desc Verify msToCountdownTime(3582952) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3582952)).assertEqual('59:42');
      expect(MediaTools.msToCountdownTime(3582952).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4300
     * @tc.name testTimePro0043
     * @tc.desc Verify msToCountdownTime(-114004645) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-114004645)).assertEqual('-2:-8:-41:-5');
      expect(MediaTools.msToCountdownTime(-114004645).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4400
     * @tc.name testTimePro0044
     * @tc.desc Verify msToCountdownTime(45859) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(45859)).assertEqual('00:45');
      expect(MediaTools.msToCountdownTime(45859).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4500
     * @tc.name testTimePro0045
     * @tc.desc Verify msToCountdownTime(29299773) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(29299773)).assertEqual('08:08:19');
      expect(MediaTools.msToCountdownTime(29299773).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4600
     * @tc.name testTimePro0046
     * @tc.desc Verify msToCountdownTime(2480) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2480)).assertEqual('00:02');
      expect(MediaTools.msToCountdownTime(2480).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4700
     * @tc.name testTimePro0047
     * @tc.desc Verify msToCountdownTime(-100259250) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-100259250)).assertEqual('-2:-4:-51:-60');
      expect(MediaTools.msToCountdownTime(-100259250).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4800
     * @tc.name testTimePro0048
     * @tc.desc Verify msToCountdownTime(19477) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(19477)).assertEqual('00:19');
      expect(MediaTools.msToCountdownTime(19477).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_4900
     * @tc.name testTimePro0049
     * @tc.desc Verify msToCountdownTime(179398502) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(179398502)).assertEqual('02:01:49:58');
      expect(MediaTools.msToCountdownTime(179398502).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5000
     * @tc.name testTimePro0050
     * @tc.desc Verify msToCountdownTime(1692793) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1692793)).assertEqual('28:12');
      expect(MediaTools.msToCountdownTime(1692793).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5100
     * @tc.name testTimePro0051
     * @tc.desc Verify msToCountdownTime(-125411739) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-125411739)).assertEqual('-2:-11:-51:-12');
      expect(MediaTools.msToCountdownTime(-125411739).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5200
     * @tc.name testTimePro0052
     * @tc.desc Verify msToCountdownTime(58710) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(58710)).assertEqual('00:58');
      expect(MediaTools.msToCountdownTime(58710).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5300
     * @tc.name testTimePro0053
     * @tc.desc Verify msToCountdownTime(22096792) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(22096792)).assertEqual('06:08:16');
      expect(MediaTools.msToCountdownTime(22096792).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5400
     * @tc.name testTimePro0054
     * @tc.desc Verify msToCountdownTime(1104911) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1104911)).assertEqual('18:24');
      expect(MediaTools.msToCountdownTime(1104911).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5500
     * @tc.name testTimePro0055
     * @tc.desc Verify msToCountdownTime(-100560021) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-100560021)).assertEqual('-2:-4:-57:-1');
      expect(MediaTools.msToCountdownTime(-100560021).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5600
     * @tc.name testTimePro0056
     * @tc.desc Verify msToCountdownTime(53498) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(53498)).assertEqual('00:53');
      expect(MediaTools.msToCountdownTime(53498).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5700
     * @tc.name testTimePro0057
     * @tc.desc Verify msToCountdownTime(185519643) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(185519643)).assertEqual('02:03:31:59');
      expect(MediaTools.msToCountdownTime(185519643).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5800
     * @tc.name testTimePro0058
     * @tc.desc Verify msToCountdownTime(1783649) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1783649)).assertEqual('29:43');
      expect(MediaTools.msToCountdownTime(1783649).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_5900
     * @tc.name testTimePro0059
     * @tc.desc Verify msToCountdownTime(-20367) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-20367)).assertEqual('-1:-1:-1:-21');
      expect(MediaTools.msToCountdownTime(-20367).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6000
     * @tc.name testTimePro0060
     * @tc.desc Verify msToCountdownTime(27868) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(27868)).assertEqual('00:27');
      expect(MediaTools.msToCountdownTime(27868).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6100
     * @tc.name testTimePro0061
     * @tc.desc Verify msToCountdownTime(151836667) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(151836667)).assertEqual('01:18:10:36');
      expect(MediaTools.msToCountdownTime(151836667).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6200
     * @tc.name testTimePro0062
     * @tc.desc Verify msToCountdownTime(1408837) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1408837)).assertEqual('23:28');
      expect(MediaTools.msToCountdownTime(1408837).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6300
     * @tc.name testTimePro0063
     * @tc.desc Verify msToCountdownTime(-54236094) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-54236094)).assertEqual('-1:-16:-4:-57');
      expect(MediaTools.msToCountdownTime(-54236094).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6400
     * @tc.name testTimePro0064
     * @tc.desc Verify msToCountdownTime(28331) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(28331)).assertEqual('00:28');
      expect(MediaTools.msToCountdownTime(28331).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6500
     * @tc.name testTimePro0065
     * @tc.desc Verify msToCountdownTime(105243904) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(105243904)).assertEqual('01:05:14:03');
      expect(MediaTools.msToCountdownTime(105243904).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6600
     * @tc.name testTimePro0066
     * @tc.desc Verify msToCountdownTime(2051434) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2051434)).assertEqual('34:11');
      expect(MediaTools.msToCountdownTime(2051434).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6700
     * @tc.name testTimePro0067
     * @tc.desc Verify msToCountdownTime(-175274181) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-175274181)).assertEqual('-3:-1:-42:-15');
      expect(MediaTools.msToCountdownTime(-175274181).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6800
     * @tc.name testTimePro0068
     * @tc.desc Verify msToCountdownTime(12034) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(12034)).assertEqual('00:12');
      expect(MediaTools.msToCountdownTime(12034).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_6900
     * @tc.name testTimePro0069
     * @tc.desc Verify msToCountdownTime(3503046) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3503046)).assertEqual('58:23');
      expect(MediaTools.msToCountdownTime(3503046).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7000
     * @tc.name testTimePro0070
     * @tc.desc Verify msToCountdownTime(3234197) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3234197)).assertEqual('53:54');
      expect(MediaTools.msToCountdownTime(3234197).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7100
     * @tc.name testTimePro0071
     * @tc.desc Verify msToCountdownTime(-107353780) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-107353780)).assertEqual('-2:-6:-50:-14');
      expect(MediaTools.msToCountdownTime(-107353780).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7200
     * @tc.name testTimePro0072
     * @tc.desc Verify msToCountdownTime(45126) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(45126)).assertEqual('00:45');
      expect(MediaTools.msToCountdownTime(45126).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7300
     * @tc.name testTimePro0073
     * @tc.desc Verify msToCountdownTime(134134531) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(134134531)).assertEqual('01:13:15:34');
      expect(MediaTools.msToCountdownTime(134134531).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7400
     * @tc.name testTimePro0074
     * @tc.desc Verify msToCountdownTime(2881044) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2881044)).assertEqual('48:01');
      expect(MediaTools.msToCountdownTime(2881044).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7500
     * @tc.name testTimePro0075
     * @tc.desc Verify msToCountdownTime(-25908731) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-25908731)).assertEqual('-1:-8:-12:-49');
      expect(MediaTools.msToCountdownTime(-25908731).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7600
     * @tc.name testTimePro0076
     * @tc.desc Verify msToCountdownTime(54082) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(54082)).assertEqual('00:54');
      expect(MediaTools.msToCountdownTime(54082).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7700
     * @tc.name testTimePro0077
     * @tc.desc Verify msToCountdownTime(121034779) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(121034779)).assertEqual('01:09:37:14');
      expect(MediaTools.msToCountdownTime(121034779).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7800
     * @tc.name testTimePro0078
     * @tc.desc Verify msToCountdownTime(1923114) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1923114)).assertEqual('32:03');
      expect(MediaTools.msToCountdownTime(1923114).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_7900
     * @tc.name testTimePro0079
     * @tc.desc Verify msToCountdownTime(-191781814) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-191781814)).assertEqual('-3:-6:-17:-22');
      expect(MediaTools.msToCountdownTime(-191781814).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8000
     * @tc.name testTimePro0080
     * @tc.desc Verify msToCountdownTime(32535) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(32535)).assertEqual('00:32');
      expect(MediaTools.msToCountdownTime(32535).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8100
     * @tc.name testTimePro0081
     * @tc.desc Verify msToCountdownTime(20849036) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(20849036)).assertEqual('05:47:29');
      expect(MediaTools.msToCountdownTime(20849036).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8200
     * @tc.name testTimePro0082
     * @tc.desc Verify msToCountdownTime(3400217) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3400217)).assertEqual('56:40');
      expect(MediaTools.msToCountdownTime(3400217).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8300
     * @tc.name testTimePro0083
     * @tc.desc Verify msToCountdownTime(-150118663) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-150118663)).assertEqual('-2:-18:-42:-59');
      expect(MediaTools.msToCountdownTime(-150118663).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8400
     * @tc.name testTimePro0084
     * @tc.desc Verify msToCountdownTime(57836) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(57836)).assertEqual('00:57');
      expect(MediaTools.msToCountdownTime(57836).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8500
     * @tc.name testTimePro0085
     * @tc.desc Verify msToCountdownTime(103687922) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(103687922)).assertEqual('01:04:48:07');
      expect(MediaTools.msToCountdownTime(103687922).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8600
     * @tc.name testTimePro0086
     * @tc.desc Verify msToCountdownTime(2709401) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2709401)).assertEqual('45:09');
      expect(MediaTools.msToCountdownTime(2709401).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8700
     * @tc.name testTimePro0087
     * @tc.desc Verify msToCountdownTime(-138262009) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-138262009)).assertEqual('-2:-15:-25:-23');
      expect(MediaTools.msToCountdownTime(-138262009).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8800
     * @tc.name testTimePro0088
     * @tc.desc Verify msToCountdownTime(5612) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(5612)).assertEqual('00:05');
      expect(MediaTools.msToCountdownTime(5612).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_8900
     * @tc.name testTimePro0089
     * @tc.desc Verify msToCountdownTime(23094950) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(23094950)).assertEqual('06:24:54');
      expect(MediaTools.msToCountdownTime(23094950).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9000
     * @tc.name testTimePro0090
     * @tc.desc Verify msToCountdownTime(2669835) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2669835)).assertEqual('44:29');
      expect(MediaTools.msToCountdownTime(2669835).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9100
     * @tc.name testTimePro0091
     * @tc.desc Verify msToCountdownTime(-185391416) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-185391416)).assertEqual('-3:-4:-30:-52');
      expect(MediaTools.msToCountdownTime(-185391416).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9200
     * @tc.name testTimePro0092
     * @tc.desc Verify msToCountdownTime(51807) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(51807)).assertEqual('00:51');
      expect(MediaTools.msToCountdownTime(51807).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9300
     * @tc.name testTimePro0093
     * @tc.desc Verify msToCountdownTime(171080201) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(171080201)).assertEqual('01:23:31:20');
      expect(MediaTools.msToCountdownTime(171080201).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9400
     * @tc.name testTimePro0094
     * @tc.desc Verify msToCountdownTime(1502197) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1502197)).assertEqual('25:02');
      expect(MediaTools.msToCountdownTime(1502197).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9500
     * @tc.name testTimePro0095
     * @tc.desc Verify msToCountdownTime(-13665648) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-13665648)).assertEqual('-1:-4:-48:-46');
      expect(MediaTools.msToCountdownTime(-13665648).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9600
     * @tc.name testTimePro0096
     * @tc.desc Verify msToCountdownTime(17995) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(17995)).assertEqual('00:17');
      expect(MediaTools.msToCountdownTime(17995).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9700
     * @tc.name testTimePro0097
     * @tc.desc Verify msToCountdownTime(133268559) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(133268559)).assertEqual('01:13:01:08');
      expect(MediaTools.msToCountdownTime(133268559).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9800
     * @tc.name testTimePro0098
     * @tc.desc Verify msToCountdownTime(3428528) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3428528)).assertEqual('57:08');
      expect(MediaTools.msToCountdownTime(3428528).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_9900
     * @tc.name testTimePro0099
     * @tc.desc Verify msToCountdownTime(-40424809) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-40424809)).assertEqual('-1:-12:-14:-45');
      expect(MediaTools.msToCountdownTime(-40424809).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10000
     * @tc.name testTimePro0100
     * @tc.desc Verify msToCountdownTime(618) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(618)).assertEqual('00:00');
      expect(MediaTools.msToCountdownTime(618).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10100
     * @tc.name testTimePro0101
     * @tc.desc Verify msToCountdownTime(68201784) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(68201784)).assertEqual('18:56:41');
      expect(MediaTools.msToCountdownTime(68201784).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10200
     * @tc.name testTimePro0102
     * @tc.desc Verify msToCountdownTime(2194562) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2194562)).assertEqual('36:34');
      expect(MediaTools.msToCountdownTime(2194562).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10300
     * @tc.name testTimePro0103
     * @tc.desc Verify msToCountdownTime(-105822236) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-105822236)).assertEqual('-2:-6:-24:-43');
      expect(MediaTools.msToCountdownTime(-105822236).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10400
     * @tc.name testTimePro0104
     * @tc.desc Verify msToCountdownTime(55246) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(55246)).assertEqual('00:55');
      expect(MediaTools.msToCountdownTime(55246).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10500
     * @tc.name testTimePro0105
     * @tc.desc Verify msToCountdownTime(27747522) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(27747522)).assertEqual('07:42:27');
      expect(MediaTools.msToCountdownTime(27747522).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10600
     * @tc.name testTimePro0106
     * @tc.desc Verify msToCountdownTime(1051784) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1051784)).assertEqual('17:31');
      expect(MediaTools.msToCountdownTime(1051784).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10700
     * @tc.name testTimePro0107
     * @tc.desc Verify msToCountdownTime(-107751137) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-107751137)).assertEqual('-2:-6:-56:-52');
      expect(MediaTools.msToCountdownTime(-107751137).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10800
     * @tc.name testTimePro0108
     * @tc.desc Verify msToCountdownTime(41901) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(41901)).assertEqual('00:41');
      expect(MediaTools.msToCountdownTime(41901).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_10900
     * @tc.name testTimePro0109
     * @tc.desc Verify msToCountdownTime(56985998) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(56985998)).assertEqual('15:49:45');
      expect(MediaTools.msToCountdownTime(56985998).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11000
     * @tc.name testTimePro0110
     * @tc.desc Verify msToCountdownTime(176951) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(176951)).assertEqual('02:56');
      expect(MediaTools.msToCountdownTime(176951).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11100
     * @tc.name testTimePro0111
     * @tc.desc Verify msToCountdownTime(-1132809) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-1132809)).assertEqual('-1:-1:-19:-53');
      expect(MediaTools.msToCountdownTime(-1132809).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11200
     * @tc.name testTimePro0112
     * @tc.desc Verify msToCountdownTime(33623) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(33623)).assertEqual('00:33');
      expect(MediaTools.msToCountdownTime(33623).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11300
     * @tc.name testTimePro0113
     * @tc.desc Verify msToCountdownTime(198512671) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(198512671)).assertEqual('02:07:08:32');
      expect(MediaTools.msToCountdownTime(198512671).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11400
     * @tc.name testTimePro0114
     * @tc.desc Verify msToCountdownTime(3035092) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3035092)).assertEqual('50:35');
      expect(MediaTools.msToCountdownTime(3035092).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11500
     * @tc.name testTimePro0115
     * @tc.desc Verify msToCountdownTime(-147622260) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-147622260)).assertEqual('-2:-18:-1:-23');
      expect(MediaTools.msToCountdownTime(-147622260).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11600
     * @tc.name testTimePro0116
     * @tc.desc Verify msToCountdownTime(24133) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(24133)).assertEqual('00:24');
      expect(MediaTools.msToCountdownTime(24133).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11700
     * @tc.name testTimePro0117
     * @tc.desc Verify msToCountdownTime(25849923) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(25849923)).assertEqual('07:10:49');
      expect(MediaTools.msToCountdownTime(25849923).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11800
     * @tc.name testTimePro0118
     * @tc.desc Verify msToCountdownTime(643667) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(643667)).assertEqual('10:43');
      expect(MediaTools.msToCountdownTime(643667).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_11900
     * @tc.name testTimePro0119
     * @tc.desc Verify msToCountdownTime(-83018361) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-83018361)).assertEqual('-1:-24:-4:-39');
      expect(MediaTools.msToCountdownTime(-83018361).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12000
     * @tc.name testTimePro0120
     * @tc.desc Verify msToCountdownTime(32289) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(32289)).assertEqual('00:32');
      expect(MediaTools.msToCountdownTime(32289).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12100
     * @tc.name testTimePro0121
     * @tc.desc Verify msToCountdownTime(88947143) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(88947143)).assertEqual('01:42:27');
      expect(MediaTools.msToCountdownTime(88947143).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12200
     * @tc.name testTimePro0122
     * @tc.desc Verify msToCountdownTime(535879) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(535879)).assertEqual('08:55');
      expect(MediaTools.msToCountdownTime(535879).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12300
     * @tc.name testTimePro0123
     * @tc.desc Verify msToCountdownTime(-141758768) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-141758768)).assertEqual('-2:-16:-23:-39');
      expect(MediaTools.msToCountdownTime(-141758768).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12400
     * @tc.name testTimePro0124
     * @tc.desc Verify msToCountdownTime(30506) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(30506)).assertEqual('00:30');
      expect(MediaTools.msToCountdownTime(30506).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12500
     * @tc.name testTimePro0125
     * @tc.desc Verify msToCountdownTime(99044589) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(99044589)).assertEqual('01:03:30:44');
      expect(MediaTools.msToCountdownTime(99044589).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12600
     * @tc.name testTimePro0126
     * @tc.desc Verify msToCountdownTime(467967) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(467967)).assertEqual('07:47');
      expect(MediaTools.msToCountdownTime(467967).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12700
     * @tc.name testTimePro0127
     * @tc.desc Verify msToCountdownTime(-123552859) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-123552859)).assertEqual('-2:-11:-20:-13');
      expect(MediaTools.msToCountdownTime(-123552859).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12800
     * @tc.name testTimePro0128
     * @tc.desc Verify msToCountdownTime(25022) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(25022)).assertEqual('00:25');
      expect(MediaTools.msToCountdownTime(25022).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_12900
     * @tc.name testTimePro0129
     * @tc.desc Verify msToCountdownTime(1006644) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1006644)).assertEqual('16:46');
      expect(MediaTools.msToCountdownTime(1006644).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13000
     * @tc.name testTimePro0130
     * @tc.desc Verify msToCountdownTime(2445572) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(2445572)).assertEqual('40:45');
      expect(MediaTools.msToCountdownTime(2445572).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13100
     * @tc.name testTimePro0131
     * @tc.desc Verify msToCountdownTime(-65621234) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-65621234)).assertEqual('-1:-19:-14:-42');
      expect(MediaTools.msToCountdownTime(-65621234).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13200
     * @tc.name testTimePro0132
     * @tc.desc Verify msToCountdownTime(35775) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(35775)).assertEqual('00:35');
      expect(MediaTools.msToCountdownTime(35775).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13300
     * @tc.name testTimePro0133
     * @tc.desc Verify msToCountdownTime(57222873) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(57222873)).assertEqual('15:53:42');
      expect(MediaTools.msToCountdownTime(57222873).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13400
     * @tc.name testTimePro0134
     * @tc.desc Verify msToCountdownTime(1035226) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1035226)).assertEqual('17:15');
      expect(MediaTools.msToCountdownTime(1035226).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13500
     * @tc.name testTimePro0135
     * @tc.desc Verify msToCountdownTime(-181675779) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-181675779)).assertEqual('-3:-3:-28:-56');
      expect(MediaTools.msToCountdownTime(-181675779).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13600
     * @tc.name testTimePro0136
     * @tc.desc Verify msToCountdownTime(31304) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(31304)).assertEqual('00:31');
      expect(MediaTools.msToCountdownTime(31304).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13700
     * @tc.name testTimePro0137
     * @tc.desc Verify msToCountdownTime(85807303) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(85807303)).assertEqual('23:50:07');
      expect(MediaTools.msToCountdownTime(85807303).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13800
     * @tc.name testTimePro0138
     * @tc.desc Verify msToCountdownTime(1950148) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1950148)).assertEqual('32:30');
      expect(MediaTools.msToCountdownTime(1950148).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_13900
     * @tc.name testTimePro0139
     * @tc.desc Verify msToCountdownTime(-96642145) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-96642145)).assertEqual('-2:-3:-51:-43');
      expect(MediaTools.msToCountdownTime(-96642145).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14000
     * @tc.name testTimePro0140
     * @tc.desc Verify msToCountdownTime(4534) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(4534)).assertEqual('00:04');
      expect(MediaTools.msToCountdownTime(4534).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14100
     * @tc.name testTimePro0141
     * @tc.desc Verify msToCountdownTime(155931089) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(155931089)).assertEqual('01:19:18:51');
      expect(MediaTools.msToCountdownTime(155931089).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14200
     * @tc.name testTimePro0142
     * @tc.desc Verify msToCountdownTime(795589) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(795589)).assertEqual('13:15');
      expect(MediaTools.msToCountdownTime(795589).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14300
     * @tc.name testTimePro0143
     * @tc.desc Verify msToCountdownTime(-24631794) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-24631794)).assertEqual('-1:-7:-51:-32');
      expect(MediaTools.msToCountdownTime(-24631794).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14400
     * @tc.name testTimePro0144
     * @tc.desc Verify msToCountdownTime(17659) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(17659)).assertEqual('00:17');
      expect(MediaTools.msToCountdownTime(17659).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14500
     * @tc.name testTimePro0145
     * @tc.desc Verify msToCountdownTime(123781602) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(123781602)).assertEqual('01:10:23:01');
      expect(MediaTools.msToCountdownTime(123781602).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14600
     * @tc.name testTimePro0146
     * @tc.desc Verify msToCountdownTime(1363654) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1363654)).assertEqual('22:43');
      expect(MediaTools.msToCountdownTime(1363654).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14700
     * @tc.name testTimePro0147
     * @tc.desc Verify msToCountdownTime(-192661080) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-192661080)).assertEqual('-3:-6:-32:-2');
      expect(MediaTools.msToCountdownTime(-192661080).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14800
     * @tc.name testTimePro0148
     * @tc.desc Verify msToCountdownTime(30407) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(30407)).assertEqual('00:30');
      expect(MediaTools.msToCountdownTime(30407).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_14900
     * @tc.name testTimePro0149
     * @tc.desc Verify msToCountdownTime(155589833) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(155589833)).assertEqual('01:19:13:09');
      expect(MediaTools.msToCountdownTime(155589833).split(':').length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_TIME_PRO_15000
     * @tc.name testTimePro0150
     * @tc.desc Verify msToCountdownTime(1228693) formats as the independent oracle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testTimePro0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(1228693)).assertEqual('20:28');
      expect(MediaTools.msToCountdownTime(1228693).split(':').length >= 2).assertTrue();
    });
  });
}
