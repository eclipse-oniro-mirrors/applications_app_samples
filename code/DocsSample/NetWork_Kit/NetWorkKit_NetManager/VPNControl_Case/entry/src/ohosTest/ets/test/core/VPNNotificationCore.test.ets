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
  NOTIFICATION_TITLE,
  NOTIFICATION_TEXT,
  NOTIFICATION_ADDITIONAL,
  NOTIFICATION_CLICK_TITLE,
  NOTIFICATION_CLICK_TEXT,
  notificationRequestId,
  notificationSlotType,
  notificationContentType,
  wantAgentRequestCode,
  wantAgentBundleName,
  wantAgentAbilityName,
  nextNotificationId,
  badgeAfterAdd,
  badgeAfterSet,
} from '../model/VPNLogic';

/** VPNNotificationCoreTest logic checks (44 cases). */
export default function vpnNotificationCoreTest(): void {
  describe('VPNNotificationCoreTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0001
     * @tc.name      VPN_NotifCore_0001
     * @tc.desc      notification core case 0 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifCore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifCore_0001 begin`);
      logInfo("notification core 0");
      const actual: number = nextNotificationId(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0002
     * @tc.name      VPN_NotifCore_0002
     * @tc.desc      notification core case 1 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0002 begin`);
      logInfo("notification core 1");
      const actual: number = badgeAfterAdd(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0003
     * @tc.name      VPN_NotifCore_0003
     * @tc.desc      notification core case 2 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0003 begin`);
      logInfo("notification core 2");
      const actual: number = badgeAfterSet(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0004
     * @tc.name      VPN_NotifCore_0004
     * @tc.desc      notification core case 3 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0004 begin`);
      logInfo("notification core 3");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0005
     * @tc.name      VPN_NotifCore_0005
     * @tc.desc      notification core case 4 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0005 begin`);
      logInfo("notification core 4");
      const actual: number = nextNotificationId(4);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0006
     * @tc.name      VPN_NotifCore_0006
     * @tc.desc      notification core case 5 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0006 begin`);
      logInfo("notification core 5");
      const actual: number = badgeAfterAdd(5);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0007
     * @tc.name      VPN_NotifCore_0007
     * @tc.desc      notification core case 6 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0007 begin`);
      logInfo("notification core 6");
      const actual: number = badgeAfterSet(6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0008
     * @tc.name      VPN_NotifCore_0008
     * @tc.desc      notification core case 7 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0008 begin`);
      logInfo("notification core 7");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0009
     * @tc.name      VPN_NotifCore_0009
     * @tc.desc      notification core case 8 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0009 begin`);
      logInfo("notification core 8");
      const actual: number = nextNotificationId(8);
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0010
     * @tc.name      VPN_NotifCore_0010
     * @tc.desc      notification core case 9 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0010 begin`);
      logInfo("notification core 9");
      const actual: number = badgeAfterAdd(9);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0011
     * @tc.name      VPN_NotifCore_0011
     * @tc.desc      notification core case 10 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0011 begin`);
      logInfo("notification core 10");
      const actual: number = badgeAfterSet(10);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0012
     * @tc.name      VPN_NotifCore_0012
     * @tc.desc      notification core case 11 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifCore_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifCore_0012 begin`);
      logInfo("notification core 11");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0013
     * @tc.name      VPN_NotifCore_0013
     * @tc.desc      notification core case 12 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0013 begin`);
      logInfo("notification core 12");
      const actual: number = nextNotificationId(12);
      logInfo('actual=' + String(actual) + ', expected=' + "13");
      expect(actual).assertEqual(13);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0014
     * @tc.name      VPN_NotifCore_0014
     * @tc.desc      notification core case 13 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0014 begin`);
      logInfo("notification core 13");
      const actual: number = badgeAfterAdd(13);
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual(14);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0015
     * @tc.name      VPN_NotifCore_0015
     * @tc.desc      notification core case 14 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0015 begin`);
      logInfo("notification core 14");
      const actual: number = badgeAfterSet(14);
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual(14);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0016
     * @tc.name      VPN_NotifCore_0016
     * @tc.desc      notification core case 15 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0016 begin`);
      logInfo("notification core 15");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0017
     * @tc.name      VPN_NotifCore_0017
     * @tc.desc      notification core case 16 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0017 begin`);
      logInfo("notification core 16");
      const actual: number = nextNotificationId(16);
      logInfo('actual=' + String(actual) + ', expected=' + "17");
      expect(actual).assertEqual(17);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0018
     * @tc.name      VPN_NotifCore_0018
     * @tc.desc      notification core case 17 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifCore_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifCore_0018 begin`);
      logInfo("notification core 17");
      const actual: number = badgeAfterAdd(17);
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0019
     * @tc.name      VPN_NotifCore_0019
     * @tc.desc      notification core case 18 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0019 begin`);
      logInfo("notification core 18");
      const actual: number = badgeAfterSet(18);
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0020
     * @tc.name      VPN_NotifCore_0020
     * @tc.desc      notification core case 19 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0020 begin`);
      logInfo("notification core 19");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0021
     * @tc.name      VPN_NotifCore_0021
     * @tc.desc      notification core case 20 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0021 begin`);
      logInfo("notification core 20");
      const actual: number = nextNotificationId(20);
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0022
     * @tc.name      VPN_NotifCore_0022
     * @tc.desc      notification core case 21 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0022 begin`);
      logInfo("notification core 21");
      const actual: number = badgeAfterAdd(21);
      logInfo('actual=' + String(actual) + ', expected=' + "22");
      expect(actual).assertEqual(22);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0023
     * @tc.name      VPN_NotifCore_0023
     * @tc.desc      notification core case 22 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifCore_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifCore_0023 begin`);
      logInfo("notification core 22");
      const actual: number = badgeAfterSet(22);
      logInfo('actual=' + String(actual) + ', expected=' + "22");
      expect(actual).assertEqual(22);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0024
     * @tc.name      VPN_NotifCore_0024
     * @tc.desc      notification core case 23 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0024 begin`);
      logInfo("notification core 23");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0025
     * @tc.name      VPN_NotifCore_0025
     * @tc.desc      notification core case 24 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0025 begin`);
      logInfo("notification core 24");
      const actual: number = nextNotificationId(24);
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0026
     * @tc.name      VPN_NotifCore_0026
     * @tc.desc      notification core case 25 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0026 begin`);
      logInfo("notification core 25");
      const actual: number = badgeAfterAdd(25);
      logInfo('actual=' + String(actual) + ', expected=' + "26");
      expect(actual).assertEqual(26);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0027
     * @tc.name      VPN_NotifCore_0027
     * @tc.desc      notification core case 26 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0027 begin`);
      logInfo("notification core 26");
      const actual: number = badgeAfterSet(26);
      logInfo('actual=' + String(actual) + ', expected=' + "26");
      expect(actual).assertEqual(26);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0028
     * @tc.name      VPN_NotifCore_0028
     * @tc.desc      notification core case 27 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0028 begin`);
      logInfo("notification core 27");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0029
     * @tc.name      VPN_NotifCore_0029
     * @tc.desc      notification core case 28 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0029 begin`);
      logInfo("notification core 28");
      const actual: number = nextNotificationId(28);
      logInfo('actual=' + String(actual) + ', expected=' + "29");
      expect(actual).assertEqual(29);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0030
     * @tc.name      VPN_NotifCore_0030
     * @tc.desc      notification core case 29 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0030 begin`);
      logInfo("notification core 29");
      const actual: number = badgeAfterAdd(29);
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual(30);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0031
     * @tc.name      VPN_NotifCore_0031
     * @tc.desc      notification core case 30 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0031 begin`);
      logInfo("notification core 30");
      const actual: number = badgeAfterSet(30);
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual(30);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0032
     * @tc.name      VPN_NotifCore_0032
     * @tc.desc      notification core case 31 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0032 begin`);
      logInfo("notification core 31");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0033
     * @tc.name      VPN_NotifCore_0033
     * @tc.desc      notification core case 32 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0033 begin`);
      logInfo("notification core 32");
      const actual: number = nextNotificationId(32);
      logInfo('actual=' + String(actual) + ', expected=' + "33");
      expect(actual).assertEqual(33);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0034
     * @tc.name      VPN_NotifCore_0034
     * @tc.desc      notification core case 33 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifCore_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifCore_0034 begin`);
      logInfo("notification core 33");
      const actual: number = badgeAfterAdd(33);
      logInfo('actual=' + String(actual) + ', expected=' + "34");
      expect(actual).assertEqual(34);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0035
     * @tc.name      VPN_NotifCore_0035
     * @tc.desc      notification core case 34 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifCore_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifCore_0035 begin`);
      logInfo("notification core 34");
      const actual: number = badgeAfterSet(34);
      logInfo('actual=' + String(actual) + ', expected=' + "34");
      expect(actual).assertEqual(34);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0036
     * @tc.name      VPN_NotifCore_0036
     * @tc.desc      notification core case 35 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0036 begin`);
      logInfo("notification core 35");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0037
     * @tc.name      VPN_NotifCore_0037
     * @tc.desc      notification core case 36 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0037 begin`);
      logInfo("notification core 36");
      const actual: number = nextNotificationId(36);
      logInfo('actual=' + String(actual) + ', expected=' + "37");
      expect(actual).assertEqual(37);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0038
     * @tc.name      VPN_NotifCore_0038
     * @tc.desc      notification core case 37 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0038 begin`);
      logInfo("notification core 37");
      const actual: number = badgeAfterAdd(37);
      logInfo('actual=' + String(actual) + ', expected=' + "38");
      expect(actual).assertEqual(38);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0039
     * @tc.name      VPN_NotifCore_0039
     * @tc.desc      notification core case 38 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0039 begin`);
      logInfo("notification core 38");
      const actual: number = badgeAfterSet(38);
      logInfo('actual=' + String(actual) + ', expected=' + "38");
      expect(actual).assertEqual(38);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0040
     * @tc.name      VPN_NotifCore_0040
     * @tc.desc      notification core case 39 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0040 begin`);
      logInfo("notification core 39");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0041
     * @tc.name      VPN_NotifCore_0041
     * @tc.desc      notification core case 40 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0041 begin`);
      logInfo("notification core 40");
      const actual: number = nextNotificationId(40);
      logInfo('actual=' + String(actual) + ', expected=' + "41");
      expect(actual).assertEqual(41);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0042
     * @tc.name      VPN_NotifCore_0042
     * @tc.desc      notification core case 41 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0042 begin`);
      logInfo("notification core 41");
      const actual: number = badgeAfterAdd(41);
      logInfo('actual=' + String(actual) + ', expected=' + "42");
      expect(actual).assertEqual(42);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0043
     * @tc.name      VPN_NotifCore_0043
     * @tc.desc      notification core case 42 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0043 begin`);
      logInfo("notification core 42");
      const actual: number = badgeAfterSet(42);
      logInfo('actual=' + String(actual) + ', expected=' + "42");
      expect(actual).assertEqual(42);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NotifCore_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_CORE_0044
     * @tc.name      VPN_NotifCore_0044
     * @tc.desc      notification core case 43 keeps the request contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCore_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCore_0044 begin`);
      logInfo("notification core 43");
      const actual: string = notificationRequestId() + ":" + notificationSlotType() + ":" + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0");
      expect(actual).assertEqual("1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCore_0044 end`);
    });
  });
}
