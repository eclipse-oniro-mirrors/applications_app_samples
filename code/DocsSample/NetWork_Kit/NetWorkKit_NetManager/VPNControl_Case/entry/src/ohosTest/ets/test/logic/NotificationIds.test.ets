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
  nextNotificationId,
  notificationRequestId,
  notificationSlotType,
  notificationContentType,
} from '../model/VPNLogic';

/** NotificationIdsTest logic checks (44 cases). */
export default function notificationIdsTest(): void {
  describe('NotificationIdsTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0001
     * @tc.name      VPN_NotifIds_0001
     * @tc.desc      notification id sequence from -5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifIds_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifIds_0001 begin`);
      logInfo("nextNotificationId(-5) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(-5) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "-4:1:1:0");
      expect(actual).assertEqual("-4:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0002
     * @tc.name      VPN_NotifIds_0002
     * @tc.desc      notification id sequence from -4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0002 begin`);
      logInfo("nextNotificationId(-4) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(-4) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "-3:1:1:0");
      expect(actual).assertEqual("-3:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0003
     * @tc.name      VPN_NotifIds_0003
     * @tc.desc      notification id sequence from -3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0003 begin`);
      logInfo("nextNotificationId(-3) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(-3) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "-2:1:1:0");
      expect(actual).assertEqual("-2:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0004
     * @tc.name      VPN_NotifIds_0004
     * @tc.desc      notification id sequence from -2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0004 begin`);
      logInfo("nextNotificationId(-2) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(-2) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "-1:1:1:0");
      expect(actual).assertEqual("-1:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0005
     * @tc.name      VPN_NotifIds_0005
     * @tc.desc      notification id sequence from -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0005 begin`);
      logInfo("nextNotificationId(-1) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(-1) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:1:0");
      expect(actual).assertEqual("0:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0006
     * @tc.name      VPN_NotifIds_0006
     * @tc.desc      notification id sequence from 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0006 begin`);
      logInfo("nextNotificationId(0) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(0) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1:0");
      expect(actual).assertEqual("1:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0007
     * @tc.name      VPN_NotifIds_0007
     * @tc.desc      notification id sequence from 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0007 begin`);
      logInfo("nextNotificationId(1) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(1) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "2:1:1:0");
      expect(actual).assertEqual("2:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0008
     * @tc.name      VPN_NotifIds_0008
     * @tc.desc      notification id sequence from 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0008 begin`);
      logInfo("nextNotificationId(2) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(2) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "3:1:1:0");
      expect(actual).assertEqual("3:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0009
     * @tc.name      VPN_NotifIds_0009
     * @tc.desc      notification id sequence from 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0009 begin`);
      logInfo("nextNotificationId(3) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(3) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "4:1:1:0");
      expect(actual).assertEqual("4:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0010
     * @tc.name      VPN_NotifIds_0010
     * @tc.desc      notification id sequence from 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0010 begin`);
      logInfo("nextNotificationId(4) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(4) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "5:1:1:0");
      expect(actual).assertEqual("5:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0011
     * @tc.name      VPN_NotifIds_0011
     * @tc.desc      notification id sequence from 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0011 begin`);
      logInfo("nextNotificationId(5) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(5) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "6:1:1:0");
      expect(actual).assertEqual("6:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0012
     * @tc.name      VPN_NotifIds_0012
     * @tc.desc      notification id sequence from 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifIds_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifIds_0012 begin`);
      logInfo("nextNotificationId(6) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(6) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1:1:0");
      expect(actual).assertEqual("7:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0013
     * @tc.name      VPN_NotifIds_0013
     * @tc.desc      notification id sequence from 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0013 begin`);
      logInfo("nextNotificationId(7) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(7) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "8:1:1:0");
      expect(actual).assertEqual("8:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0014
     * @tc.name      VPN_NotifIds_0014
     * @tc.desc      notification id sequence from 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0014 begin`);
      logInfo("nextNotificationId(8) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(8) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "9:1:1:0");
      expect(actual).assertEqual("9:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0015
     * @tc.name      VPN_NotifIds_0015
     * @tc.desc      notification id sequence from 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0015 begin`);
      logInfo("nextNotificationId(9) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(9) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "10:1:1:0");
      expect(actual).assertEqual("10:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0016
     * @tc.name      VPN_NotifIds_0016
     * @tc.desc      notification id sequence from 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0016 begin`);
      logInfo("nextNotificationId(10) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(10) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1:1:0");
      expect(actual).assertEqual("11:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0017
     * @tc.name      VPN_NotifIds_0017
     * @tc.desc      notification id sequence from 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0017 begin`);
      logInfo("nextNotificationId(11) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(11) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "12:1:1:0");
      expect(actual).assertEqual("12:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0018
     * @tc.name      VPN_NotifIds_0018
     * @tc.desc      notification id sequence from 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifIds_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifIds_0018 begin`);
      logInfo("nextNotificationId(12) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(12) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "13:1:1:0");
      expect(actual).assertEqual("13:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0019
     * @tc.name      VPN_NotifIds_0019
     * @tc.desc      notification id sequence from 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0019 begin`);
      logInfo("nextNotificationId(13) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(13) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "14:1:1:0");
      expect(actual).assertEqual("14:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0020
     * @tc.name      VPN_NotifIds_0020
     * @tc.desc      notification id sequence from 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0020 begin`);
      logInfo("nextNotificationId(14) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(14) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "15:1:1:0");
      expect(actual).assertEqual("15:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0021
     * @tc.name      VPN_NotifIds_0021
     * @tc.desc      notification id sequence from 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0021 begin`);
      logInfo("nextNotificationId(15) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(15) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "16:1:1:0");
      expect(actual).assertEqual("16:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0022
     * @tc.name      VPN_NotifIds_0022
     * @tc.desc      notification id sequence from 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0022 begin`);
      logInfo("nextNotificationId(16) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(16) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "17:1:1:0");
      expect(actual).assertEqual("17:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0023
     * @tc.name      VPN_NotifIds_0023
     * @tc.desc      notification id sequence from 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifIds_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifIds_0023 begin`);
      logInfo("nextNotificationId(17) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(17) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "18:1:1:0");
      expect(actual).assertEqual("18:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0024
     * @tc.name      VPN_NotifIds_0024
     * @tc.desc      notification id sequence from 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0024 begin`);
      logInfo("nextNotificationId(18) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(18) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "19:1:1:0");
      expect(actual).assertEqual("19:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0025
     * @tc.name      VPN_NotifIds_0025
     * @tc.desc      notification id sequence from 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0025 begin`);
      logInfo("nextNotificationId(19) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(19) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "20:1:1:0");
      expect(actual).assertEqual("20:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0026
     * @tc.name      VPN_NotifIds_0026
     * @tc.desc      notification id sequence from 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0026 begin`);
      logInfo("nextNotificationId(20) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(20) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "21:1:1:0");
      expect(actual).assertEqual("21:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0027
     * @tc.name      VPN_NotifIds_0027
     * @tc.desc      notification id sequence from 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0027 begin`);
      logInfo("nextNotificationId(21) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(21) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "22:1:1:0");
      expect(actual).assertEqual("22:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0028
     * @tc.name      VPN_NotifIds_0028
     * @tc.desc      notification id sequence from 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0028 begin`);
      logInfo("nextNotificationId(22) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(22) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "23:1:1:0");
      expect(actual).assertEqual("23:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0029
     * @tc.name      VPN_NotifIds_0029
     * @tc.desc      notification id sequence from 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0029 begin`);
      logInfo("nextNotificationId(23) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(23) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "24:1:1:0");
      expect(actual).assertEqual("24:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0030
     * @tc.name      VPN_NotifIds_0030
     * @tc.desc      notification id sequence from 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0030 begin`);
      logInfo("nextNotificationId(24) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(24) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "25:1:1:0");
      expect(actual).assertEqual("25:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0031
     * @tc.name      VPN_NotifIds_0031
     * @tc.desc      notification id sequence from 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0031 begin`);
      logInfo("nextNotificationId(25) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(25) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "26:1:1:0");
      expect(actual).assertEqual("26:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0032
     * @tc.name      VPN_NotifIds_0032
     * @tc.desc      notification id sequence from 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0032 begin`);
      logInfo("nextNotificationId(26) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(26) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "27:1:1:0");
      expect(actual).assertEqual("27:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0033
     * @tc.name      VPN_NotifIds_0033
     * @tc.desc      notification id sequence from 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0033 begin`);
      logInfo("nextNotificationId(27) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(27) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "28:1:1:0");
      expect(actual).assertEqual("28:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0034
     * @tc.name      VPN_NotifIds_0034
     * @tc.desc      notification id sequence from 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifIds_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifIds_0034 begin`);
      logInfo("nextNotificationId(28) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(28) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "29:1:1:0");
      expect(actual).assertEqual("29:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0035
     * @tc.name      VPN_NotifIds_0035
     * @tc.desc      notification id sequence from 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifIds_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifIds_0035 begin`);
      logInfo("nextNotificationId(29) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(29) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "30:1:1:0");
      expect(actual).assertEqual("30:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0036
     * @tc.name      VPN_NotifIds_0036
     * @tc.desc      notification id sequence from 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0036 begin`);
      logInfo("nextNotificationId(30) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(30) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "31:1:1:0");
      expect(actual).assertEqual("31:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0037
     * @tc.name      VPN_NotifIds_0037
     * @tc.desc      notification id sequence from 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0037 begin`);
      logInfo("nextNotificationId(31) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(31) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "32:1:1:0");
      expect(actual).assertEqual("32:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0038
     * @tc.name      VPN_NotifIds_0038
     * @tc.desc      notification id sequence from 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0038 begin`);
      logInfo("nextNotificationId(32) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(32) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "33:1:1:0");
      expect(actual).assertEqual("33:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0039
     * @tc.name      VPN_NotifIds_0039
     * @tc.desc      notification id sequence from 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0039 begin`);
      logInfo("nextNotificationId(33) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(33) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "34:1:1:0");
      expect(actual).assertEqual("34:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0040
     * @tc.name      VPN_NotifIds_0040
     * @tc.desc      notification id sequence from 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0040 begin`);
      logInfo("nextNotificationId(34) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(34) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "35:1:1:0");
      expect(actual).assertEqual("35:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0041
     * @tc.name      VPN_NotifIds_0041
     * @tc.desc      notification id sequence from 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0041 begin`);
      logInfo("nextNotificationId(35) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(35) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "36:1:1:0");
      expect(actual).assertEqual("36:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0042
     * @tc.name      VPN_NotifIds_0042
     * @tc.desc      notification id sequence from 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0042 begin`);
      logInfo("nextNotificationId(36) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(36) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "37:1:1:0");
      expect(actual).assertEqual("37:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0043
     * @tc.name      VPN_NotifIds_0043
     * @tc.desc      notification id sequence from 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0043 begin`);
      logInfo("nextNotificationId(37) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(37) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "38:1:1:0");
      expect(actual).assertEqual("38:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifIds_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_IDS_0044
     * @tc.name      VPN_NotifIds_0044
     * @tc.desc      notification id sequence from 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifIds_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifIds_0044 begin`);
      logInfo("nextNotificationId(38) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType()");
      const actual: string = nextNotificationId(38) + ':' + notificationRequestId() + ':' + notificationSlotType() + ':' + notificationContentType();
      logInfo('actual=' + String(actual) + ', expected=' + "39:1:1:0");
      expect(actual).assertEqual("39:1:1:0");
      logInfo(`${BUNDLE}NotifIds_0044 end`);
    });
  });
}
