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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/VPNTestSupport';
import {
  badgeAfterAdd,
  badgeAfterSet,
} from '../model/VPNLogic';

/** BadgeTest logic checks (44 cases). */
export default function badgeTest(): void {
  describe('BadgeTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0001
     * @tc.name      VPN_Badge_0001
     * @tc.desc      badge updates for -5/-10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Badge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Badge_0001 begin`);
      logInfo("badgeAfterAdd(-5) + ':' + badgeAfterSet(-10)");
      const actual: string = badgeAfterAdd(-5) + ':' + badgeAfterSet(-10);
      logInfo('actual=' + String(actual) + ', expected=' + "-4:-10");
      expect(actual).assertEqual("-4:-10");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0002
     * @tc.name      VPN_Badge_0002
     * @tc.desc      badge updates for -4/-7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0002 begin`);
      logInfo("badgeAfterAdd(-4) + ':' + badgeAfterSet(-7)");
      const actual: string = badgeAfterAdd(-4) + ':' + badgeAfterSet(-7);
      logInfo('actual=' + String(actual) + ', expected=' + "-3:-7");
      expect(actual).assertEqual("-3:-7");
      logInfo(`${BUNDLE}Badge_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0003
     * @tc.name      VPN_Badge_0003
     * @tc.desc      badge updates for -3/-4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0003 begin`);
      logInfo("badgeAfterAdd(-3) + ':' + badgeAfterSet(-4)");
      const actual: string = badgeAfterAdd(-3) + ':' + badgeAfterSet(-4);
      logInfo('actual=' + String(actual) + ', expected=' + "-2:-4");
      expect(actual).assertEqual("-2:-4");
      logInfo(`${BUNDLE}Badge_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0004
     * @tc.name      VPN_Badge_0004
     * @tc.desc      badge updates for -2/-1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0004 begin`);
      logInfo("badgeAfterAdd(-2) + ':' + badgeAfterSet(-1)");
      const actual: string = badgeAfterAdd(-2) + ':' + badgeAfterSet(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1:-1");
      expect(actual).assertEqual("-1:-1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0005
     * @tc.name      VPN_Badge_0005
     * @tc.desc      badge updates for -1/2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0005 begin`);
      logInfo("badgeAfterAdd(-1) + ':' + badgeAfterSet(2)");
      const actual: string = badgeAfterAdd(-1) + ':' + badgeAfterSet(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0:2");
      expect(actual).assertEqual("0:2");
      logInfo(`${BUNDLE}Badge_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0006
     * @tc.name      VPN_Badge_0006
     * @tc.desc      badge updates for 0/5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0006 begin`);
      logInfo("badgeAfterAdd(0) + ':' + badgeAfterSet(5)");
      const actual: string = badgeAfterAdd(0) + ':' + badgeAfterSet(5);
      logInfo('actual=' + String(actual) + ', expected=' + "1:5");
      expect(actual).assertEqual("1:5");
      logInfo(`${BUNDLE}Badge_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0007
     * @tc.name      VPN_Badge_0007
     * @tc.desc      badge updates for 1/8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0007 begin`);
      logInfo("badgeAfterAdd(1) + ':' + badgeAfterSet(8)");
      const actual: string = badgeAfterAdd(1) + ':' + badgeAfterSet(8);
      logInfo('actual=' + String(actual) + ', expected=' + "2:8");
      expect(actual).assertEqual("2:8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0008
     * @tc.name      VPN_Badge_0008
     * @tc.desc      badge updates for 2/11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0008 begin`);
      logInfo("badgeAfterAdd(2) + ':' + badgeAfterSet(11)");
      const actual: string = badgeAfterAdd(2) + ':' + badgeAfterSet(11);
      logInfo('actual=' + String(actual) + ', expected=' + "3:11");
      expect(actual).assertEqual("3:11");
      logInfo(`${BUNDLE}Badge_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0009
     * @tc.name      VPN_Badge_0009
     * @tc.desc      badge updates for 3/14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0009 begin`);
      logInfo("badgeAfterAdd(3) + ':' + badgeAfterSet(14)");
      const actual: string = badgeAfterAdd(3) + ':' + badgeAfterSet(14);
      logInfo('actual=' + String(actual) + ', expected=' + "4:14");
      expect(actual).assertEqual("4:14");
      logInfo(`${BUNDLE}Badge_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0010
     * @tc.name      VPN_Badge_0010
     * @tc.desc      badge updates for 4/17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0010 begin`);
      logInfo("badgeAfterAdd(4) + ':' + badgeAfterSet(17)");
      const actual: string = badgeAfterAdd(4) + ':' + badgeAfterSet(17);
      logInfo('actual=' + String(actual) + ', expected=' + "5:17");
      expect(actual).assertEqual("5:17");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0011
     * @tc.name      VPN_Badge_0011
     * @tc.desc      badge updates for 5/20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0011 begin`);
      logInfo("badgeAfterAdd(5) + ':' + badgeAfterSet(20)");
      const actual: string = badgeAfterAdd(5) + ':' + badgeAfterSet(20);
      logInfo('actual=' + String(actual) + ', expected=' + "6:20");
      expect(actual).assertEqual("6:20");
      logInfo(`${BUNDLE}Badge_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0012
     * @tc.name      VPN_Badge_0012
     * @tc.desc      badge updates for 6/23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Badge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Badge_0012 begin`);
      logInfo("badgeAfterAdd(6) + ':' + badgeAfterSet(23)");
      const actual: string = badgeAfterAdd(6) + ':' + badgeAfterSet(23);
      logInfo('actual=' + String(actual) + ', expected=' + "7:23");
      expect(actual).assertEqual("7:23");
      logInfo(`${BUNDLE}Badge_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0013
     * @tc.name      VPN_Badge_0013
     * @tc.desc      badge updates for 7/26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0013 begin`);
      logInfo("badgeAfterAdd(7) + ':' + badgeAfterSet(26)");
      const actual: string = badgeAfterAdd(7) + ':' + badgeAfterSet(26);
      logInfo('actual=' + String(actual) + ', expected=' + "8:26");
      expect(actual).assertEqual("8:26");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0014
     * @tc.name      VPN_Badge_0014
     * @tc.desc      badge updates for 8/29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0014 begin`);
      logInfo("badgeAfterAdd(8) + ':' + badgeAfterSet(29)");
      const actual: string = badgeAfterAdd(8) + ':' + badgeAfterSet(29);
      logInfo('actual=' + String(actual) + ', expected=' + "9:29");
      expect(actual).assertEqual("9:29");
      logInfo(`${BUNDLE}Badge_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0015
     * @tc.name      VPN_Badge_0015
     * @tc.desc      badge updates for 9/32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0015 begin`);
      logInfo("badgeAfterAdd(9) + ':' + badgeAfterSet(32)");
      const actual: string = badgeAfterAdd(9) + ':' + badgeAfterSet(32);
      logInfo('actual=' + String(actual) + ', expected=' + "10:32");
      expect(actual).assertEqual("10:32");
      logInfo(`${BUNDLE}Badge_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0016
     * @tc.name      VPN_Badge_0016
     * @tc.desc      badge updates for 10/35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0016 begin`);
      logInfo("badgeAfterAdd(10) + ':' + badgeAfterSet(35)");
      const actual: string = badgeAfterAdd(10) + ':' + badgeAfterSet(35);
      logInfo('actual=' + String(actual) + ', expected=' + "11:35");
      expect(actual).assertEqual("11:35");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0017
     * @tc.name      VPN_Badge_0017
     * @tc.desc      badge updates for 11/38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0017 begin`);
      logInfo("badgeAfterAdd(11) + ':' + badgeAfterSet(38)");
      const actual: string = badgeAfterAdd(11) + ':' + badgeAfterSet(38);
      logInfo('actual=' + String(actual) + ', expected=' + "12:38");
      expect(actual).assertEqual("12:38");
      logInfo(`${BUNDLE}Badge_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0018
     * @tc.name      VPN_Badge_0018
     * @tc.desc      badge updates for 12/41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_Badge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Badge_0018 begin`);
      logInfo("badgeAfterAdd(12) + ':' + badgeAfterSet(41)");
      const actual: string = badgeAfterAdd(12) + ':' + badgeAfterSet(41);
      logInfo('actual=' + String(actual) + ', expected=' + "13:41");
      expect(actual).assertEqual("13:41");
      logInfo(`${BUNDLE}Badge_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0019
     * @tc.name      VPN_Badge_0019
     * @tc.desc      badge updates for 13/44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0019 begin`);
      logInfo("badgeAfterAdd(13) + ':' + badgeAfterSet(44)");
      const actual: string = badgeAfterAdd(13) + ':' + badgeAfterSet(44);
      logInfo('actual=' + String(actual) + ', expected=' + "14:44");
      expect(actual).assertEqual("14:44");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0020
     * @tc.name      VPN_Badge_0020
     * @tc.desc      badge updates for 14/47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0020 begin`);
      logInfo("badgeAfterAdd(14) + ':' + badgeAfterSet(47)");
      const actual: string = badgeAfterAdd(14) + ':' + badgeAfterSet(47);
      logInfo('actual=' + String(actual) + ', expected=' + "15:47");
      expect(actual).assertEqual("15:47");
      logInfo(`${BUNDLE}Badge_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0021
     * @tc.name      VPN_Badge_0021
     * @tc.desc      badge updates for 15/50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0021 begin`);
      logInfo("badgeAfterAdd(15) + ':' + badgeAfterSet(50)");
      const actual: string = badgeAfterAdd(15) + ':' + badgeAfterSet(50);
      logInfo('actual=' + String(actual) + ', expected=' + "16:50");
      expect(actual).assertEqual("16:50");
      logInfo(`${BUNDLE}Badge_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0022
     * @tc.name      VPN_Badge_0022
     * @tc.desc      badge updates for 16/53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0022 begin`);
      logInfo("badgeAfterAdd(16) + ':' + badgeAfterSet(53)");
      const actual: string = badgeAfterAdd(16) + ':' + badgeAfterSet(53);
      logInfo('actual=' + String(actual) + ', expected=' + "17:53");
      expect(actual).assertEqual("17:53");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0023
     * @tc.name      VPN_Badge_0023
     * @tc.desc      badge updates for 17/56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Badge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Badge_0023 begin`);
      logInfo("badgeAfterAdd(17) + ':' + badgeAfterSet(56)");
      const actual: string = badgeAfterAdd(17) + ':' + badgeAfterSet(56);
      logInfo('actual=' + String(actual) + ', expected=' + "18:56");
      expect(actual).assertEqual("18:56");
      logInfo(`${BUNDLE}Badge_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0024
     * @tc.name      VPN_Badge_0024
     * @tc.desc      badge updates for 18/59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0024 begin`);
      logInfo("badgeAfterAdd(18) + ':' + badgeAfterSet(59)");
      const actual: string = badgeAfterAdd(18) + ':' + badgeAfterSet(59);
      logInfo('actual=' + String(actual) + ', expected=' + "19:59");
      expect(actual).assertEqual("19:59");
      logInfo(`${BUNDLE}Badge_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0025
     * @tc.name      VPN_Badge_0025
     * @tc.desc      badge updates for 19/62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0025 begin`);
      logInfo("badgeAfterAdd(19) + ':' + badgeAfterSet(62)");
      const actual: string = badgeAfterAdd(19) + ':' + badgeAfterSet(62);
      logInfo('actual=' + String(actual) + ', expected=' + "20:62");
      expect(actual).assertEqual("20:62");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0026
     * @tc.name      VPN_Badge_0026
     * @tc.desc      badge updates for 20/65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0026 begin`);
      logInfo("badgeAfterAdd(20) + ':' + badgeAfterSet(65)");
      const actual: string = badgeAfterAdd(20) + ':' + badgeAfterSet(65);
      logInfo('actual=' + String(actual) + ', expected=' + "21:65");
      expect(actual).assertEqual("21:65");
      logInfo(`${BUNDLE}Badge_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0027
     * @tc.name      VPN_Badge_0027
     * @tc.desc      badge updates for 21/68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0027 begin`);
      logInfo("badgeAfterAdd(21) + ':' + badgeAfterSet(68)");
      const actual: string = badgeAfterAdd(21) + ':' + badgeAfterSet(68);
      logInfo('actual=' + String(actual) + ', expected=' + "22:68");
      expect(actual).assertEqual("22:68");
      logInfo(`${BUNDLE}Badge_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0028
     * @tc.name      VPN_Badge_0028
     * @tc.desc      badge updates for 22/71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0028 begin`);
      logInfo("badgeAfterAdd(22) + ':' + badgeAfterSet(71)");
      const actual: string = badgeAfterAdd(22) + ':' + badgeAfterSet(71);
      logInfo('actual=' + String(actual) + ', expected=' + "23:71");
      expect(actual).assertEqual("23:71");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0029
     * @tc.name      VPN_Badge_0029
     * @tc.desc      badge updates for 23/74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0029 begin`);
      logInfo("badgeAfterAdd(23) + ':' + badgeAfterSet(74)");
      const actual: string = badgeAfterAdd(23) + ':' + badgeAfterSet(74);
      logInfo('actual=' + String(actual) + ', expected=' + "24:74");
      expect(actual).assertEqual("24:74");
      logInfo(`${BUNDLE}Badge_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0030
     * @tc.name      VPN_Badge_0030
     * @tc.desc      badge updates for 24/77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0030 begin`);
      logInfo("badgeAfterAdd(24) + ':' + badgeAfterSet(77)");
      const actual: string = badgeAfterAdd(24) + ':' + badgeAfterSet(77);
      logInfo('actual=' + String(actual) + ', expected=' + "25:77");
      expect(actual).assertEqual("25:77");
      logInfo(`${BUNDLE}Badge_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0031
     * @tc.name      VPN_Badge_0031
     * @tc.desc      badge updates for 25/80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0031 begin`);
      logInfo("badgeAfterAdd(25) + ':' + badgeAfterSet(80)");
      const actual: string = badgeAfterAdd(25) + ':' + badgeAfterSet(80);
      logInfo('actual=' + String(actual) + ', expected=' + "26:80");
      expect(actual).assertEqual("26:80");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0032
     * @tc.name      VPN_Badge_0032
     * @tc.desc      badge updates for 26/83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0032 begin`);
      logInfo("badgeAfterAdd(26) + ':' + badgeAfterSet(83)");
      const actual: string = badgeAfterAdd(26) + ':' + badgeAfterSet(83);
      logInfo('actual=' + String(actual) + ', expected=' + "27:83");
      expect(actual).assertEqual("27:83");
      logInfo(`${BUNDLE}Badge_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0033
     * @tc.name      VPN_Badge_0033
     * @tc.desc      badge updates for 27/86.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0033 begin`);
      logInfo("badgeAfterAdd(27) + ':' + badgeAfterSet(86)");
      const actual: string = badgeAfterAdd(27) + ':' + badgeAfterSet(86);
      logInfo('actual=' + String(actual) + ', expected=' + "28:86");
      expect(actual).assertEqual("28:86");
      logInfo(`${BUNDLE}Badge_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0034
     * @tc.name      VPN_Badge_0034
     * @tc.desc      badge updates for 28/89.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Badge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Badge_0034 begin`);
      logInfo("badgeAfterAdd(28) + ':' + badgeAfterSet(89)");
      const actual: string = badgeAfterAdd(28) + ':' + badgeAfterSet(89);
      logInfo('actual=' + String(actual) + ', expected=' + "29:89");
      expect(actual).assertEqual("29:89");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0035
     * @tc.name      VPN_Badge_0035
     * @tc.desc      badge updates for 29/92.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_Badge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Badge_0035 begin`);
      logInfo("badgeAfterAdd(29) + ':' + badgeAfterSet(92)");
      const actual: string = badgeAfterAdd(29) + ':' + badgeAfterSet(92);
      logInfo('actual=' + String(actual) + ', expected=' + "30:92");
      expect(actual).assertEqual("30:92");
      logInfo(`${BUNDLE}Badge_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0036
     * @tc.name      VPN_Badge_0036
     * @tc.desc      badge updates for 30/95.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0036 begin`);
      logInfo("badgeAfterAdd(30) + ':' + badgeAfterSet(95)");
      const actual: string = badgeAfterAdd(30) + ':' + badgeAfterSet(95);
      logInfo('actual=' + String(actual) + ', expected=' + "31:95");
      expect(actual).assertEqual("31:95");
      logInfo(`${BUNDLE}Badge_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0037
     * @tc.name      VPN_Badge_0037
     * @tc.desc      badge updates for 31/98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0037 begin`);
      logInfo("badgeAfterAdd(31) + ':' + badgeAfterSet(98)");
      const actual: string = badgeAfterAdd(31) + ':' + badgeAfterSet(98);
      logInfo('actual=' + String(actual) + ', expected=' + "32:98");
      expect(actual).assertEqual("32:98");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0038
     * @tc.name      VPN_Badge_0038
     * @tc.desc      badge updates for 32/101.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0038 begin`);
      logInfo("badgeAfterAdd(32) + ':' + badgeAfterSet(101)");
      const actual: string = badgeAfterAdd(32) + ':' + badgeAfterSet(101);
      logInfo('actual=' + String(actual) + ', expected=' + "33:101");
      expect(actual).assertEqual("33:101");
      logInfo(`${BUNDLE}Badge_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0039
     * @tc.name      VPN_Badge_0039
     * @tc.desc      badge updates for 33/104.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0039 begin`);
      logInfo("badgeAfterAdd(33) + ':' + badgeAfterSet(104)");
      const actual: string = badgeAfterAdd(33) + ':' + badgeAfterSet(104);
      logInfo('actual=' + String(actual) + ', expected=' + "34:104");
      expect(actual).assertEqual("34:104");
      logInfo(`${BUNDLE}Badge_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0040
     * @tc.name      VPN_Badge_0040
     * @tc.desc      badge updates for 34/107.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0040 begin`);
      logInfo("badgeAfterAdd(34) + ':' + badgeAfterSet(107)");
      const actual: string = badgeAfterAdd(34) + ':' + badgeAfterSet(107);
      logInfo('actual=' + String(actual) + ', expected=' + "35:107");
      expect(actual).assertEqual("35:107");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0041
     * @tc.name      VPN_Badge_0041
     * @tc.desc      badge updates for 35/110.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0041 begin`);
      logInfo("badgeAfterAdd(35) + ':' + badgeAfterSet(110)");
      const actual: string = badgeAfterAdd(35) + ':' + badgeAfterSet(110);
      logInfo('actual=' + String(actual) + ', expected=' + "36:110");
      expect(actual).assertEqual("36:110");
      logInfo(`${BUNDLE}Badge_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0042
     * @tc.name      VPN_Badge_0042
     * @tc.desc      badge updates for 36/113.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0042 begin`);
      logInfo("badgeAfterAdd(36) + ':' + badgeAfterSet(113)");
      const actual: string = badgeAfterAdd(36) + ':' + badgeAfterSet(113);
      logInfo('actual=' + String(actual) + ', expected=' + "37:113");
      expect(actual).assertEqual("37:113");
      logInfo(`${BUNDLE}Badge_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0043
     * @tc.name      VPN_Badge_0043
     * @tc.desc      badge updates for 37/116.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0043 begin`);
      logInfo("badgeAfterAdd(37) + ':' + badgeAfterSet(116)");
      const actual: string = badgeAfterAdd(37) + ':' + badgeAfterSet(116);
      logInfo('actual=' + String(actual) + ', expected=' + "38:116");
      expect(actual).assertEqual("38:116");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Badge_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BADGE_0044
     * @tc.name      VPN_Badge_0044
     * @tc.desc      badge updates for 38/119.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Badge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Badge_0044 begin`);
      logInfo("badgeAfterAdd(38) + ':' + badgeAfterSet(119)");
      const actual: string = badgeAfterAdd(38) + ':' + badgeAfterSet(119);
      logInfo('actual=' + String(actual) + ', expected=' + "39:119");
      expect(actual).assertEqual("39:119");
      logInfo(`${BUNDLE}Badge_0044 end`);
    });
  });
}
