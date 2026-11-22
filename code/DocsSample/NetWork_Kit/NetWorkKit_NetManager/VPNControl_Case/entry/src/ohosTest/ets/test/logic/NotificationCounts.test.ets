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
  countsByTypeIncrement,
  badgeTotal,
  notificationTypeCount,
  emptyNotificationCounts,
} from '../model/VPNLogic';

/** NotificationCountsTest logic checks (44 cases). */
export default function notificationCountsTest(): void {
  describe('NotificationCountsTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0001
     * @tc.name      VPN_NotifCounts_0001
     * @tc.desc      notification counts for type 0/query 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifCounts_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifCounts_0001 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0);
      logInfo('actual=' + String(actual) + ', expected=' + "1,0,0,0,0,0:1:1");
      expect(actual).assertEqual("1,0,0,0,0,0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0002
     * @tc.name      VPN_NotifCounts_0002
     * @tc.desc      notification counts for type 1/query 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0002 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0,1,0,0,0,0:1:1");
      expect(actual).assertEqual("0,1,0,0,0,0:1:1");
      logInfo(`${BUNDLE}NotifCounts_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0003
     * @tc.name      VPN_NotifCounts_0003
     * @tc.desc      notification counts for type 2/query 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0003 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,1,0,0,0:1:1");
      expect(actual).assertEqual("0,0,1,0,0,0:1:1");
      logInfo(`${BUNDLE}NotifCounts_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0004
     * @tc.name      VPN_NotifCounts_0004
     * @tc.desc      notification counts for type 3/query 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0004 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,1,0,0:1:1");
      expect(actual).assertEqual("0,0,0,1,0,0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0005
     * @tc.name      VPN_NotifCounts_0005
     * @tc.desc      notification counts for type 4/query 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0005 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,1,0:1:1");
      expect(actual).assertEqual("0,0,0,0,1,0:1:1");
      logInfo(`${BUNDLE}NotifCounts_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0006
     * @tc.name      VPN_NotifCounts_0006
     * @tc.desc      notification counts for type 5/query 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0006 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,1:1:1");
      expect(actual).assertEqual("0,0,0,0,0,1:1:1");
      logInfo(`${BUNDLE}NotifCounts_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0007
     * @tc.name      VPN_NotifCounts_0007
     * @tc.desc      notification counts for type 6/query 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0007 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 6)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0008
     * @tc.name      VPN_NotifCounts_0008
     * @tc.desc      notification counts for type 7/query 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0008 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 0)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo(`${BUNDLE}NotifCounts_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0009
     * @tc.name      VPN_NotifCounts_0009
     * @tc.desc      notification counts for type 0/query 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0009 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1,0,0,0,0,0:1:0");
      expect(actual).assertEqual("1,0,0,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0010
     * @tc.name      VPN_NotifCounts_0010
     * @tc.desc      notification counts for type 1/query 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0010 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0,1,0,0,0,0:1:0");
      expect(actual).assertEqual("0,1,0,0,0,0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0011
     * @tc.name      VPN_NotifCounts_0011
     * @tc.desc      notification counts for type 2/query 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0011 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,1,0,0,0:1:0");
      expect(actual).assertEqual("0,0,1,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0012
     * @tc.name      VPN_NotifCounts_0012
     * @tc.desc      notification counts for type 3/query 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifCounts_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifCounts_0012 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,1,0,0:1:0");
      expect(actual).assertEqual("0,0,0,1,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0013
     * @tc.name      VPN_NotifCounts_0013
     * @tc.desc      notification counts for type 4/query 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0013 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,1,0:1:0");
      expect(actual).assertEqual("0,0,0,0,1,0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0014
     * @tc.name      VPN_NotifCounts_0014
     * @tc.desc      notification counts for type 5/query 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0014 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,1:1:0");
      expect(actual).assertEqual("0,0,0,0,0,1:1:0");
      logInfo(`${BUNDLE}NotifCounts_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0015
     * @tc.name      VPN_NotifCounts_0015
     * @tc.desc      notification counts for type 6/query 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0015 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 0)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo(`${BUNDLE}NotifCounts_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0016
     * @tc.name      VPN_NotifCounts_0016
     * @tc.desc      notification counts for type 7/query 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0016 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 1)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0017
     * @tc.name      VPN_NotifCounts_0017
     * @tc.desc      notification counts for type 0/query 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0017 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1,0,0,0,0,0:1:0");
      expect(actual).assertEqual("1,0,0,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0018
     * @tc.name      VPN_NotifCounts_0018
     * @tc.desc      notification counts for type 1/query 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifCounts_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifCounts_0018 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3);
      logInfo('actual=' + String(actual) + ', expected=' + "0,1,0,0,0,0:1:0");
      expect(actual).assertEqual("0,1,0,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0019
     * @tc.name      VPN_NotifCounts_0019
     * @tc.desc      notification counts for type 2/query 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0019 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,1,0,0,0:1:0");
      expect(actual).assertEqual("0,0,1,0,0,0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0020
     * @tc.name      VPN_NotifCounts_0020
     * @tc.desc      notification counts for type 3/query 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0020 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,1,0,0:1:0");
      expect(actual).assertEqual("0,0,0,1,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0021
     * @tc.name      VPN_NotifCounts_0021
     * @tc.desc      notification counts for type 4/query 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0021 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,1,0:1:0");
      expect(actual).assertEqual("0,0,0,0,1,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0022
     * @tc.name      VPN_NotifCounts_0022
     * @tc.desc      notification counts for type 5/query 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0022 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,1:1:0");
      expect(actual).assertEqual("0,0,0,0,0,1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0023
     * @tc.name      VPN_NotifCounts_0023
     * @tc.desc      notification counts for type 6/query 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifCounts_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifCounts_0023 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 1)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo(`${BUNDLE}NotifCounts_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0024
     * @tc.name      VPN_NotifCounts_0024
     * @tc.desc      notification counts for type 7/query 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0024 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 2)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo(`${BUNDLE}NotifCounts_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0025
     * @tc.name      VPN_NotifCounts_0025
     * @tc.desc      notification counts for type 0/query 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0025 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3);
      logInfo('actual=' + String(actual) + ', expected=' + "1,0,0,0,0,0:1:0");
      expect(actual).assertEqual("1,0,0,0,0,0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0026
     * @tc.name      VPN_NotifCounts_0026
     * @tc.desc      notification counts for type 1/query 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0026 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4);
      logInfo('actual=' + String(actual) + ', expected=' + "0,1,0,0,0,0:1:0");
      expect(actual).assertEqual("0,1,0,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0027
     * @tc.name      VPN_NotifCounts_0027
     * @tc.desc      notification counts for type 2/query 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0027 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,1,0,0,0:1:0");
      expect(actual).assertEqual("0,0,1,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0028
     * @tc.name      VPN_NotifCounts_0028
     * @tc.desc      notification counts for type 3/query 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0028 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,1,0,0:1:0");
      expect(actual).assertEqual("0,0,0,1,0,0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0029
     * @tc.name      VPN_NotifCounts_0029
     * @tc.desc      notification counts for type 4/query 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0029 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,1,0:1:0");
      expect(actual).assertEqual("0,0,0,0,1,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0030
     * @tc.name      VPN_NotifCounts_0030
     * @tc.desc      notification counts for type 5/query 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0030 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,1:1:0");
      expect(actual).assertEqual("0,0,0,0,0,1:1:0");
      logInfo(`${BUNDLE}NotifCounts_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0031
     * @tc.name      VPN_NotifCounts_0031
     * @tc.desc      notification counts for type 6/query 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0031 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 2)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0032
     * @tc.name      VPN_NotifCounts_0032
     * @tc.desc      notification counts for type 7/query 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0032 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 3)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 3);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo(`${BUNDLE}NotifCounts_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0033
     * @tc.name      VPN_NotifCounts_0033
     * @tc.desc      notification counts for type 0/query 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0033 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4);
      logInfo('actual=' + String(actual) + ', expected=' + "1,0,0,0,0,0:1:0");
      expect(actual).assertEqual("1,0,0,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0034
     * @tc.name      VPN_NotifCounts_0034
     * @tc.desc      notification counts for type 1/query 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifCounts_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifCounts_0034 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5);
      logInfo('actual=' + String(actual) + ', expected=' + "0,1,0,0,0,0:1:0");
      expect(actual).assertEqual("0,1,0,0,0,0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0035
     * @tc.name      VPN_NotifCounts_0035
     * @tc.desc      notification counts for type 2/query 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifCounts_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifCounts_0035 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,1,0,0,0:1:0");
      expect(actual).assertEqual("0,0,1,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0036
     * @tc.name      VPN_NotifCounts_0036
     * @tc.desc      notification counts for type 3/query 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0036 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,1,0,0:1:0");
      expect(actual).assertEqual("0,0,0,1,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0037
     * @tc.name      VPN_NotifCounts_0037
     * @tc.desc      notification counts for type 4/query 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0037 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 4).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,1,0:1:0");
      expect(actual).assertEqual("0,0,0,0,1,0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0038
     * @tc.name      VPN_NotifCounts_0038
     * @tc.desc      notification counts for type 5/query 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0038 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 5).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,1:1:0");
      expect(actual).assertEqual("0,0,0,0,0,1:1:0");
      logInfo(`${BUNDLE}NotifCounts_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0039
     * @tc.name      VPN_NotifCounts_0039
     * @tc.desc      notification counts for type 6/query 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0039 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 3)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 6).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 6)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 6), 3);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo(`${BUNDLE}NotifCounts_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0040
     * @tc.name      VPN_NotifCounts_0040
     * @tc.desc      notification counts for type 7/query 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0040 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 4)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 7).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 7)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 7), 4);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,0,0,0:0:0");
      expect(actual).assertEqual("0,0,0,0,0,0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0041
     * @tc.name      VPN_NotifCounts_0041
     * @tc.desc      notification counts for type 0/query 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0041 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 0).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5);
      logInfo('actual=' + String(actual) + ', expected=' + "1,0,0,0,0,0:1:0");
      expect(actual).assertEqual("1,0,0,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0042
     * @tc.name      VPN_NotifCounts_0042
     * @tc.desc      notification counts for type 1/query 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0042 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 1).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0,1,0,0,0,0:1:0");
      expect(actual).assertEqual("0,1,0,0,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0043
     * @tc.name      VPN_NotifCounts_0043
     * @tc.desc      notification counts for type 2/query 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0043 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 2).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,1,0,0,0:1:0");
      expect(actual).assertEqual("0,0,1,0,0,0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifCounts_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_COUNTS_0044
     * @tc.name      VPN_NotifCounts_0044
     * @tc.desc      notification counts for type 3/query 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifCounts_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifCounts_0044 begin`);
      logInfo("countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1)");
      const actual: string = countsByTypeIncrement(emptyNotificationCounts(), 3).join(',') + ':' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + ':' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0,0,1,0,0:1:0");
      expect(actual).assertEqual("0,0,0,1,0,0:1:0");
      logInfo(`${BUNDLE}NotifCounts_0044 end`);
    });
  });
}
