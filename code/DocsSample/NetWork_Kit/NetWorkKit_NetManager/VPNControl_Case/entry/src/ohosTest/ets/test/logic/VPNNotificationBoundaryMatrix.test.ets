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
  badgeAfterAdd,
  badgeAfterSet,
  countsByTypeIncrement,
  badgeTotal,
  notificationTypeCount,
  emptyNotificationCounts,
  wantAgentActionType,
  notificationGroup,
} from '../model/VPNLogic';

/** VPNNotificationBoundaryMatrixTest logic checks (450 cases). */
export default function vpnNotificationBoundaryMatrixTest(): void {
  describe('VPNNotificationBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0001
     * @tc.name      VPN_NotifBoundary_0001
     * @tc.desc      notification boundary 0 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0001 begin`);
      logInfo("notification boundary 0");
      const actual: string = nextNotificationId(0) + '|' + badgeAfterAdd(0) + '|' + badgeAfterSet(0) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "1|1|0|1|1|0|");
      expect(actual).assertEqual("1|1|0|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0002
     * @tc.name      VPN_NotifBoundary_0002
     * @tc.desc      notification boundary 1 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0002 begin`);
      logInfo("notification boundary 1");
      const actual: string = nextNotificationId(1) + '|' + badgeAfterAdd(1) + '|' + badgeAfterSet(1) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g1");
      logInfo('actual=' + String(actual) + ', expected=' + "2|2|1|1|1|1|g1");
      expect(actual).assertEqual("2|2|1|1|1|1|g1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0003
     * @tc.name      VPN_NotifBoundary_0003
     * @tc.desc      notification boundary 2 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0003 begin`);
      logInfo("notification boundary 2");
      const actual: string = nextNotificationId(2) + '|' + badgeAfterAdd(2) + '|' + badgeAfterSet(2) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g2");
      logInfo('actual=' + String(actual) + ', expected=' + "3|3|2|1|1|0|g2");
      expect(actual).assertEqual("3|3|2|1|1|0|g2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0004
     * @tc.name      VPN_NotifBoundary_0004
     * @tc.desc      notification boundary 3 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0004 begin`);
      logInfo("notification boundary 3");
      const actual: string = nextNotificationId(3) + '|' + badgeAfterAdd(3) + '|' + badgeAfterSet(3) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "4|4|3|1|1|1|");
      expect(actual).assertEqual("4|4|3|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0005
     * @tc.name      VPN_NotifBoundary_0005
     * @tc.desc      notification boundary 4 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0005 begin`);
      logInfo("notification boundary 4");
      const actual: string = nextNotificationId(4) + '|' + badgeAfterAdd(4) + '|' + badgeAfterSet(4) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g4");
      logInfo('actual=' + String(actual) + ', expected=' + "5|5|4|1|1|0|g4");
      expect(actual).assertEqual("5|5|4|1|1|0|g4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0006
     * @tc.name      VPN_NotifBoundary_0006
     * @tc.desc      notification boundary 5 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0006 begin`);
      logInfo("notification boundary 5");
      const actual: string = nextNotificationId(5) + '|' + badgeAfterAdd(5) + '|' + badgeAfterSet(5) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g5");
      logInfo('actual=' + String(actual) + ', expected=' + "6|6|5|1|1|1|g5");
      expect(actual).assertEqual("6|6|5|1|1|1|g5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0007
     * @tc.name      VPN_NotifBoundary_0007
     * @tc.desc      notification boundary 6 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0007 begin`);
      logInfo("notification boundary 6");
      const actual: string = nextNotificationId(6) + '|' + badgeAfterAdd(6) + '|' + badgeAfterSet(6) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "7|7|6|1|0|0|");
      expect(actual).assertEqual("7|7|6|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0008
     * @tc.name      VPN_NotifBoundary_0008
     * @tc.desc      notification boundary 7 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0008 begin`);
      logInfo("notification boundary 7");
      const actual: string = nextNotificationId(7) + '|' + badgeAfterAdd(7) + '|' + badgeAfterSet(7) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g7");
      logInfo('actual=' + String(actual) + ', expected=' + "8|8|7|1|0|1|g7");
      expect(actual).assertEqual("8|8|7|1|0|1|g7");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0009
     * @tc.name      VPN_NotifBoundary_0009
     * @tc.desc      notification boundary 8 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0009 begin`);
      logInfo("notification boundary 8");
      const actual: string = nextNotificationId(8) + '|' + badgeAfterAdd(8) + '|' + badgeAfterSet(8) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g8");
      logInfo('actual=' + String(actual) + ', expected=' + "9|9|8|1|0|0|g8");
      expect(actual).assertEqual("9|9|8|1|0|0|g8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0010
     * @tc.name      VPN_NotifBoundary_0010
     * @tc.desc      notification boundary 9 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0010 begin`);
      logInfo("notification boundary 9");
      const actual: string = nextNotificationId(9) + '|' + badgeAfterAdd(9) + '|' + badgeAfterSet(9) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "10|10|9|1|0|1|");
      expect(actual).assertEqual("10|10|9|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0011
     * @tc.name      VPN_NotifBoundary_0011
     * @tc.desc      notification boundary 10 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0011 begin`);
      logInfo("notification boundary 10");
      const actual: string = nextNotificationId(10) + '|' + badgeAfterAdd(10) + '|' + badgeAfterSet(10) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g10");
      logInfo('actual=' + String(actual) + ', expected=' + "11|11|10|1|0|0|g10");
      expect(actual).assertEqual("11|11|10|1|0|0|g10");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0012
     * @tc.name      VPN_NotifBoundary_0012
     * @tc.desc      notification boundary 11 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0012 begin`);
      logInfo("notification boundary 11");
      const actual: string = nextNotificationId(11) + '|' + badgeAfterAdd(11) + '|' + badgeAfterSet(11) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g11");
      logInfo('actual=' + String(actual) + ', expected=' + "12|12|11|1|0|1|g11");
      expect(actual).assertEqual("12|12|11|1|0|1|g11");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0013
     * @tc.name      VPN_NotifBoundary_0013
     * @tc.desc      notification boundary 12 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0013 begin`);
      logInfo("notification boundary 12");
      const actual: string = nextNotificationId(12) + '|' + badgeAfterAdd(12) + '|' + badgeAfterSet(12) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "13|13|12|1|0|0|");
      expect(actual).assertEqual("13|13|12|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0014
     * @tc.name      VPN_NotifBoundary_0014
     * @tc.desc      notification boundary 13 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0014 begin`);
      logInfo("notification boundary 13");
      const actual: string = nextNotificationId(13) + '|' + badgeAfterAdd(13) + '|' + badgeAfterSet(13) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g13");
      logInfo('actual=' + String(actual) + ', expected=' + "14|14|13|1|0|1|g13");
      expect(actual).assertEqual("14|14|13|1|0|1|g13");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0015
     * @tc.name      VPN_NotifBoundary_0015
     * @tc.desc      notification boundary 14 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0015 begin`);
      logInfo("notification boundary 14");
      const actual: string = nextNotificationId(14) + '|' + badgeAfterAdd(14) + '|' + badgeAfterSet(14) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g14");
      logInfo('actual=' + String(actual) + ', expected=' + "15|15|14|1|0|0|g14");
      expect(actual).assertEqual("15|15|14|1|0|0|g14");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0016
     * @tc.name      VPN_NotifBoundary_0016
     * @tc.desc      notification boundary 15 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0016 begin`);
      logInfo("notification boundary 15");
      const actual: string = nextNotificationId(15) + '|' + badgeAfterAdd(15) + '|' + badgeAfterSet(15) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "16|16|15|1|0|1|");
      expect(actual).assertEqual("16|16|15|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0017
     * @tc.name      VPN_NotifBoundary_0017
     * @tc.desc      notification boundary 16 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0017 begin`);
      logInfo("notification boundary 16");
      const actual: string = nextNotificationId(16) + '|' + badgeAfterAdd(16) + '|' + badgeAfterSet(16) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g16");
      logInfo('actual=' + String(actual) + ', expected=' + "17|17|16|1|0|0|g16");
      expect(actual).assertEqual("17|17|16|1|0|0|g16");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0018
     * @tc.name      VPN_NotifBoundary_0018
     * @tc.desc      notification boundary 17 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0018 begin`);
      logInfo("notification boundary 17");
      const actual: string = nextNotificationId(17) + '|' + badgeAfterAdd(17) + '|' + badgeAfterSet(17) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g17");
      logInfo('actual=' + String(actual) + ', expected=' + "18|18|17|1|0|1|g17");
      expect(actual).assertEqual("18|18|17|1|0|1|g17");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0019
     * @tc.name      VPN_NotifBoundary_0019
     * @tc.desc      notification boundary 18 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0019 begin`);
      logInfo("notification boundary 18");
      const actual: string = nextNotificationId(18) + '|' + badgeAfterAdd(18) + '|' + badgeAfterSet(18) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "19|19|18|1|0|0|");
      expect(actual).assertEqual("19|19|18|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0020
     * @tc.name      VPN_NotifBoundary_0020
     * @tc.desc      notification boundary 19 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0020 begin`);
      logInfo("notification boundary 19");
      const actual: string = nextNotificationId(19) + '|' + badgeAfterAdd(19) + '|' + badgeAfterSet(19) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g19");
      logInfo('actual=' + String(actual) + ', expected=' + "20|20|19|1|0|1|g19");
      expect(actual).assertEqual("20|20|19|1|0|1|g19");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0021
     * @tc.name      VPN_NotifBoundary_0021
     * @tc.desc      notification boundary 20 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0021 begin`);
      logInfo("notification boundary 20");
      const actual: string = nextNotificationId(20) + '|' + badgeAfterAdd(20) + '|' + badgeAfterSet(20) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g20");
      logInfo('actual=' + String(actual) + ', expected=' + "21|21|20|1|0|0|g20");
      expect(actual).assertEqual("21|21|20|1|0|0|g20");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0022
     * @tc.name      VPN_NotifBoundary_0022
     * @tc.desc      notification boundary 21 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0022 begin`);
      logInfo("notification boundary 21");
      const actual: string = nextNotificationId(21) + '|' + badgeAfterAdd(21) + '|' + badgeAfterSet(21) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "22|22|21|1|0|1|");
      expect(actual).assertEqual("22|22|21|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0023
     * @tc.name      VPN_NotifBoundary_0023
     * @tc.desc      notification boundary 22 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0023 begin`);
      logInfo("notification boundary 22");
      const actual: string = nextNotificationId(22) + '|' + badgeAfterAdd(22) + '|' + badgeAfterSet(22) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g22");
      logInfo('actual=' + String(actual) + ', expected=' + "23|23|22|1|0|0|g22");
      expect(actual).assertEqual("23|23|22|1|0|0|g22");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0024
     * @tc.name      VPN_NotifBoundary_0024
     * @tc.desc      notification boundary 23 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0024 begin`);
      logInfo("notification boundary 23");
      const actual: string = nextNotificationId(23) + '|' + badgeAfterAdd(23) + '|' + badgeAfterSet(23) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g23");
      logInfo('actual=' + String(actual) + ', expected=' + "24|24|23|1|0|1|g23");
      expect(actual).assertEqual("24|24|23|1|0|1|g23");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0025
     * @tc.name      VPN_NotifBoundary_0025
     * @tc.desc      notification boundary 24 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0025 begin`);
      logInfo("notification boundary 24");
      const actual: string = nextNotificationId(24) + '|' + badgeAfterAdd(24) + '|' + badgeAfterSet(24) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "25|25|24|1|0|0|");
      expect(actual).assertEqual("25|25|24|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0026
     * @tc.name      VPN_NotifBoundary_0026
     * @tc.desc      notification boundary 25 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0026 begin`);
      logInfo("notification boundary 25");
      const actual: string = nextNotificationId(25) + '|' + badgeAfterAdd(25) + '|' + badgeAfterSet(25) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g25");
      logInfo('actual=' + String(actual) + ', expected=' + "26|26|25|1|0|1|g25");
      expect(actual).assertEqual("26|26|25|1|0|1|g25");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0027
     * @tc.name      VPN_NotifBoundary_0027
     * @tc.desc      notification boundary 26 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0027 begin`);
      logInfo("notification boundary 26");
      const actual: string = nextNotificationId(26) + '|' + badgeAfterAdd(26) + '|' + badgeAfterSet(26) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g26");
      logInfo('actual=' + String(actual) + ', expected=' + "27|27|26|1|0|0|g26");
      expect(actual).assertEqual("27|27|26|1|0|0|g26");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0028
     * @tc.name      VPN_NotifBoundary_0028
     * @tc.desc      notification boundary 27 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0028 begin`);
      logInfo("notification boundary 27");
      const actual: string = nextNotificationId(27) + '|' + badgeAfterAdd(27) + '|' + badgeAfterSet(27) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "28|28|27|1|0|1|");
      expect(actual).assertEqual("28|28|27|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0029
     * @tc.name      VPN_NotifBoundary_0029
     * @tc.desc      notification boundary 28 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0029 begin`);
      logInfo("notification boundary 28");
      const actual: string = nextNotificationId(28) + '|' + badgeAfterAdd(28) + '|' + badgeAfterSet(28) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g28");
      logInfo('actual=' + String(actual) + ', expected=' + "29|29|28|1|0|0|g28");
      expect(actual).assertEqual("29|29|28|1|0|0|g28");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0030
     * @tc.name      VPN_NotifBoundary_0030
     * @tc.desc      notification boundary 29 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0030 begin`);
      logInfo("notification boundary 29");
      const actual: string = nextNotificationId(29) + '|' + badgeAfterAdd(29) + '|' + badgeAfterSet(29) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g29");
      logInfo('actual=' + String(actual) + ', expected=' + "30|30|29|1|0|1|g29");
      expect(actual).assertEqual("30|30|29|1|0|1|g29");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0031
     * @tc.name      VPN_NotifBoundary_0031
     * @tc.desc      notification boundary 30 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0031 begin`);
      logInfo("notification boundary 30");
      const actual: string = nextNotificationId(30) + '|' + badgeAfterAdd(30) + '|' + badgeAfterSet(30) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "31|31|30|1|0|0|");
      expect(actual).assertEqual("31|31|30|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0032
     * @tc.name      VPN_NotifBoundary_0032
     * @tc.desc      notification boundary 31 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0032 begin`);
      logInfo("notification boundary 31");
      const actual: string = nextNotificationId(31) + '|' + badgeAfterAdd(31) + '|' + badgeAfterSet(31) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g31");
      logInfo('actual=' + String(actual) + ', expected=' + "32|32|31|1|0|1|g31");
      expect(actual).assertEqual("32|32|31|1|0|1|g31");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0033
     * @tc.name      VPN_NotifBoundary_0033
     * @tc.desc      notification boundary 32 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0033 begin`);
      logInfo("notification boundary 32");
      const actual: string = nextNotificationId(32) + '|' + badgeAfterAdd(32) + '|' + badgeAfterSet(32) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g32");
      logInfo('actual=' + String(actual) + ', expected=' + "33|33|32|1|0|0|g32");
      expect(actual).assertEqual("33|33|32|1|0|0|g32");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0034
     * @tc.name      VPN_NotifBoundary_0034
     * @tc.desc      notification boundary 33 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0034 begin`);
      logInfo("notification boundary 33");
      const actual: string = nextNotificationId(33) + '|' + badgeAfterAdd(33) + '|' + badgeAfterSet(33) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "34|34|33|1|0|1|");
      expect(actual).assertEqual("34|34|33|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0035
     * @tc.name      VPN_NotifBoundary_0035
     * @tc.desc      notification boundary 34 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0035 begin`);
      logInfo("notification boundary 34");
      const actual: string = nextNotificationId(34) + '|' + badgeAfterAdd(34) + '|' + badgeAfterSet(34) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g34");
      logInfo('actual=' + String(actual) + ', expected=' + "35|35|34|1|0|0|g34");
      expect(actual).assertEqual("35|35|34|1|0|0|g34");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0036
     * @tc.name      VPN_NotifBoundary_0036
     * @tc.desc      notification boundary 35 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0036 begin`);
      logInfo("notification boundary 35");
      const actual: string = nextNotificationId(35) + '|' + badgeAfterAdd(35) + '|' + badgeAfterSet(35) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g35");
      logInfo('actual=' + String(actual) + ', expected=' + "36|36|35|1|0|1|g35");
      expect(actual).assertEqual("36|36|35|1|0|1|g35");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0037
     * @tc.name      VPN_NotifBoundary_0037
     * @tc.desc      notification boundary 36 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0037 begin`);
      logInfo("notification boundary 36");
      const actual: string = nextNotificationId(36) + '|' + badgeAfterAdd(36) + '|' + badgeAfterSet(36) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "37|37|36|1|0|0|");
      expect(actual).assertEqual("37|37|36|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0038
     * @tc.name      VPN_NotifBoundary_0038
     * @tc.desc      notification boundary 37 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0038 begin`);
      logInfo("notification boundary 37");
      const actual: string = nextNotificationId(37) + '|' + badgeAfterAdd(37) + '|' + badgeAfterSet(37) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g37");
      logInfo('actual=' + String(actual) + ', expected=' + "38|38|37|1|0|1|g37");
      expect(actual).assertEqual("38|38|37|1|0|1|g37");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0039
     * @tc.name      VPN_NotifBoundary_0039
     * @tc.desc      notification boundary 38 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0039 begin`);
      logInfo("notification boundary 38");
      const actual: string = nextNotificationId(38) + '|' + badgeAfterAdd(38) + '|' + badgeAfterSet(38) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g38");
      logInfo('actual=' + String(actual) + ', expected=' + "39|39|38|1|0|0|g38");
      expect(actual).assertEqual("39|39|38|1|0|0|g38");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0040
     * @tc.name      VPN_NotifBoundary_0040
     * @tc.desc      notification boundary 39 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0040 begin`);
      logInfo("notification boundary 39");
      const actual: string = nextNotificationId(39) + '|' + badgeAfterAdd(39) + '|' + badgeAfterSet(39) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "40|40|39|1|0|1|");
      expect(actual).assertEqual("40|40|39|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0041
     * @tc.name      VPN_NotifBoundary_0041
     * @tc.desc      notification boundary 40 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0041 begin`);
      logInfo("notification boundary 40");
      const actual: string = nextNotificationId(40) + '|' + badgeAfterAdd(40) + '|' + badgeAfterSet(40) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g40");
      logInfo('actual=' + String(actual) + ', expected=' + "41|41|40|1|0|0|g40");
      expect(actual).assertEqual("41|41|40|1|0|0|g40");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0042
     * @tc.name      VPN_NotifBoundary_0042
     * @tc.desc      notification boundary 41 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0042 begin`);
      logInfo("notification boundary 41");
      const actual: string = nextNotificationId(41) + '|' + badgeAfterAdd(41) + '|' + badgeAfterSet(41) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g41");
      logInfo('actual=' + String(actual) + ', expected=' + "42|42|41|1|0|1|g41");
      expect(actual).assertEqual("42|42|41|1|0|1|g41");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0043
     * @tc.name      VPN_NotifBoundary_0043
     * @tc.desc      notification boundary 42 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0043 begin`);
      logInfo("notification boundary 42");
      const actual: string = nextNotificationId(42) + '|' + badgeAfterAdd(42) + '|' + badgeAfterSet(42) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "43|43|42|1|1|0|");
      expect(actual).assertEqual("43|43|42|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0044
     * @tc.name      VPN_NotifBoundary_0044
     * @tc.desc      notification boundary 43 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0044 begin`);
      logInfo("notification boundary 43");
      const actual: string = nextNotificationId(43) + '|' + badgeAfterAdd(43) + '|' + badgeAfterSet(43) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g43");
      logInfo('actual=' + String(actual) + ', expected=' + "44|44|43|1|1|1|g43");
      expect(actual).assertEqual("44|44|43|1|1|1|g43");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0044 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0045
     * @tc.name      VPN_NotifBoundary_0045
     * @tc.desc      notification boundary 44 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0045 begin`);
      logInfo("notification boundary 44");
      const actual: string = nextNotificationId(44) + '|' + badgeAfterAdd(44) + '|' + badgeAfterSet(44) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g44");
      logInfo('actual=' + String(actual) + ', expected=' + "45|45|44|1|1|0|g44");
      expect(actual).assertEqual("45|45|44|1|1|0|g44");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0045 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0046
     * @tc.name      VPN_NotifBoundary_0046
     * @tc.desc      notification boundary 45 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0046 begin`);
      logInfo("notification boundary 45");
      const actual: string = nextNotificationId(45) + '|' + badgeAfterAdd(45) + '|' + badgeAfterSet(45) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "46|46|45|1|1|1|");
      expect(actual).assertEqual("46|46|45|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0046 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0047
     * @tc.name      VPN_NotifBoundary_0047
     * @tc.desc      notification boundary 46 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0047 begin`);
      logInfo("notification boundary 46");
      const actual: string = nextNotificationId(46) + '|' + badgeAfterAdd(46) + '|' + badgeAfterSet(46) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g46");
      logInfo('actual=' + String(actual) + ', expected=' + "47|47|46|1|1|0|g46");
      expect(actual).assertEqual("47|47|46|1|1|0|g46");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0047 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0048
     * @tc.name      VPN_NotifBoundary_0048
     * @tc.desc      notification boundary 47 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0048 begin`);
      logInfo("notification boundary 47");
      const actual: string = nextNotificationId(47) + '|' + badgeAfterAdd(47) + '|' + badgeAfterSet(47) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g47");
      logInfo('actual=' + String(actual) + ', expected=' + "48|48|47|1|1|1|g47");
      expect(actual).assertEqual("48|48|47|1|1|1|g47");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0048 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0049
     * @tc.name      VPN_NotifBoundary_0049
     * @tc.desc      notification boundary 48 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0049 begin`);
      logInfo("notification boundary 48");
      const actual: string = nextNotificationId(48) + '|' + badgeAfterAdd(48) + '|' + badgeAfterSet(48) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "49|49|48|1|0|0|");
      expect(actual).assertEqual("49|49|48|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0049 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0050
     * @tc.name      VPN_NotifBoundary_0050
     * @tc.desc      notification boundary 49 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0050 begin`);
      logInfo("notification boundary 49");
      const actual: string = nextNotificationId(49) + '|' + badgeAfterAdd(49) + '|' + badgeAfterSet(49) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g49");
      logInfo('actual=' + String(actual) + ', expected=' + "50|50|49|1|0|1|g49");
      expect(actual).assertEqual("50|50|49|1|0|1|g49");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0050 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0051
     * @tc.name      VPN_NotifBoundary_0051
     * @tc.desc      notification boundary 50 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0051 begin`);
      logInfo("notification boundary 50");
      const actual: string = nextNotificationId(50) + '|' + badgeAfterAdd(50) + '|' + badgeAfterSet(50) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g50");
      logInfo('actual=' + String(actual) + ', expected=' + "51|51|50|1|0|0|g50");
      expect(actual).assertEqual("51|51|50|1|0|0|g50");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0051 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0052
     * @tc.name      VPN_NotifBoundary_0052
     * @tc.desc      notification boundary 51 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0052 begin`);
      logInfo("notification boundary 51");
      const actual: string = nextNotificationId(51) + '|' + badgeAfterAdd(51) + '|' + badgeAfterSet(51) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "52|52|51|1|0|1|");
      expect(actual).assertEqual("52|52|51|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0052 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0053
     * @tc.name      VPN_NotifBoundary_0053
     * @tc.desc      notification boundary 52 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0053 begin`);
      logInfo("notification boundary 52");
      const actual: string = nextNotificationId(52) + '|' + badgeAfterAdd(52) + '|' + badgeAfterSet(52) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g52");
      logInfo('actual=' + String(actual) + ', expected=' + "53|53|52|1|0|0|g52");
      expect(actual).assertEqual("53|53|52|1|0|0|g52");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0053 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0054
     * @tc.name      VPN_NotifBoundary_0054
     * @tc.desc      notification boundary 53 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0054 begin`);
      logInfo("notification boundary 53");
      const actual: string = nextNotificationId(53) + '|' + badgeAfterAdd(53) + '|' + badgeAfterSet(53) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g53");
      logInfo('actual=' + String(actual) + ', expected=' + "54|54|53|1|0|1|g53");
      expect(actual).assertEqual("54|54|53|1|0|1|g53");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0054 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0055
     * @tc.name      VPN_NotifBoundary_0055
     * @tc.desc      notification boundary 54 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0055 begin`);
      logInfo("notification boundary 54");
      const actual: string = nextNotificationId(54) + '|' + badgeAfterAdd(54) + '|' + badgeAfterSet(54) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "55|55|54|1|0|0|");
      expect(actual).assertEqual("55|55|54|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0055 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0056
     * @tc.name      VPN_NotifBoundary_0056
     * @tc.desc      notification boundary 55 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0056 begin`);
      logInfo("notification boundary 55");
      const actual: string = nextNotificationId(55) + '|' + badgeAfterAdd(55) + '|' + badgeAfterSet(55) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g55");
      logInfo('actual=' + String(actual) + ', expected=' + "56|56|55|1|0|1|g55");
      expect(actual).assertEqual("56|56|55|1|0|1|g55");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0056 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0057
     * @tc.name      VPN_NotifBoundary_0057
     * @tc.desc      notification boundary 56 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0057 begin`);
      logInfo("notification boundary 56");
      const actual: string = nextNotificationId(56) + '|' + badgeAfterAdd(56) + '|' + badgeAfterSet(56) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g56");
      logInfo('actual=' + String(actual) + ', expected=' + "57|57|56|1|0|0|g56");
      expect(actual).assertEqual("57|57|56|1|0|0|g56");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0057 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0058
     * @tc.name      VPN_NotifBoundary_0058
     * @tc.desc      notification boundary 57 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0058 begin`);
      logInfo("notification boundary 57");
      const actual: string = nextNotificationId(57) + '|' + badgeAfterAdd(57) + '|' + badgeAfterSet(57) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "58|58|57|1|0|1|");
      expect(actual).assertEqual("58|58|57|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0058 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0059
     * @tc.name      VPN_NotifBoundary_0059
     * @tc.desc      notification boundary 58 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0059 begin`);
      logInfo("notification boundary 58");
      const actual: string = nextNotificationId(58) + '|' + badgeAfterAdd(58) + '|' + badgeAfterSet(58) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g58");
      logInfo('actual=' + String(actual) + ', expected=' + "59|59|58|1|0|0|g58");
      expect(actual).assertEqual("59|59|58|1|0|0|g58");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0059 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0060
     * @tc.name      VPN_NotifBoundary_0060
     * @tc.desc      notification boundary 59 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0060 begin`);
      logInfo("notification boundary 59");
      const actual: string = nextNotificationId(59) + '|' + badgeAfterAdd(59) + '|' + badgeAfterSet(59) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g59");
      logInfo('actual=' + String(actual) + ', expected=' + "60|60|59|1|0|1|g59");
      expect(actual).assertEqual("60|60|59|1|0|1|g59");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0060 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0061
     * @tc.name      VPN_NotifBoundary_0061
     * @tc.desc      notification boundary 60 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0061 begin`);
      logInfo("notification boundary 60");
      const actual: string = nextNotificationId(60) + '|' + badgeAfterAdd(60) + '|' + badgeAfterSet(60) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "61|61|60|1|0|0|");
      expect(actual).assertEqual("61|61|60|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0061 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0062
     * @tc.name      VPN_NotifBoundary_0062
     * @tc.desc      notification boundary 61 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0062 begin`);
      logInfo("notification boundary 61");
      const actual: string = nextNotificationId(61) + '|' + badgeAfterAdd(61) + '|' + badgeAfterSet(61) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g61");
      logInfo('actual=' + String(actual) + ', expected=' + "62|62|61|1|0|1|g61");
      expect(actual).assertEqual("62|62|61|1|0|1|g61");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0062 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0063
     * @tc.name      VPN_NotifBoundary_0063
     * @tc.desc      notification boundary 62 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0063 begin`);
      logInfo("notification boundary 62");
      const actual: string = nextNotificationId(62) + '|' + badgeAfterAdd(62) + '|' + badgeAfterSet(62) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g62");
      logInfo('actual=' + String(actual) + ', expected=' + "63|63|62|1|0|0|g62");
      expect(actual).assertEqual("63|63|62|1|0|0|g62");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0063 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0064
     * @tc.name      VPN_NotifBoundary_0064
     * @tc.desc      notification boundary 63 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0064 begin`);
      logInfo("notification boundary 63");
      const actual: string = nextNotificationId(63) + '|' + badgeAfterAdd(63) + '|' + badgeAfterSet(63) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "64|64|63|1|0|1|");
      expect(actual).assertEqual("64|64|63|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0064 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0065
     * @tc.name      VPN_NotifBoundary_0065
     * @tc.desc      notification boundary 64 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0065 begin`);
      logInfo("notification boundary 64");
      const actual: string = nextNotificationId(64) + '|' + badgeAfterAdd(64) + '|' + badgeAfterSet(64) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g64");
      logInfo('actual=' + String(actual) + ', expected=' + "65|65|64|1|0|0|g64");
      expect(actual).assertEqual("65|65|64|1|0|0|g64");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0065 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0066
     * @tc.name      VPN_NotifBoundary_0066
     * @tc.desc      notification boundary 65 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0066 begin`);
      logInfo("notification boundary 65");
      const actual: string = nextNotificationId(65) + '|' + badgeAfterAdd(65) + '|' + badgeAfterSet(65) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g65");
      logInfo('actual=' + String(actual) + ', expected=' + "66|66|65|1|0|1|g65");
      expect(actual).assertEqual("66|66|65|1|0|1|g65");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0066 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0067
     * @tc.name      VPN_NotifBoundary_0067
     * @tc.desc      notification boundary 66 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0067 begin`);
      logInfo("notification boundary 66");
      const actual: string = nextNotificationId(66) + '|' + badgeAfterAdd(66) + '|' + badgeAfterSet(66) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "67|67|66|1|0|0|");
      expect(actual).assertEqual("67|67|66|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0067 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0068
     * @tc.name      VPN_NotifBoundary_0068
     * @tc.desc      notification boundary 67 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0068 begin`);
      logInfo("notification boundary 67");
      const actual: string = nextNotificationId(67) + '|' + badgeAfterAdd(67) + '|' + badgeAfterSet(67) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g67");
      logInfo('actual=' + String(actual) + ', expected=' + "68|68|67|1|0|1|g67");
      expect(actual).assertEqual("68|68|67|1|0|1|g67");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0068 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0069
     * @tc.name      VPN_NotifBoundary_0069
     * @tc.desc      notification boundary 68 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0069 begin`);
      logInfo("notification boundary 68");
      const actual: string = nextNotificationId(68) + '|' + badgeAfterAdd(68) + '|' + badgeAfterSet(68) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g68");
      logInfo('actual=' + String(actual) + ', expected=' + "69|69|68|1|0|0|g68");
      expect(actual).assertEqual("69|69|68|1|0|0|g68");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0069 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0070
     * @tc.name      VPN_NotifBoundary_0070
     * @tc.desc      notification boundary 69 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0070 begin`);
      logInfo("notification boundary 69");
      const actual: string = nextNotificationId(69) + '|' + badgeAfterAdd(69) + '|' + badgeAfterSet(69) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "70|70|69|1|0|1|");
      expect(actual).assertEqual("70|70|69|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0070 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0071
     * @tc.name      VPN_NotifBoundary_0071
     * @tc.desc      notification boundary 70 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0071 begin`);
      logInfo("notification boundary 70");
      const actual: string = nextNotificationId(70) + '|' + badgeAfterAdd(70) + '|' + badgeAfterSet(70) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g70");
      logInfo('actual=' + String(actual) + ', expected=' + "71|71|70|1|0|0|g70");
      expect(actual).assertEqual("71|71|70|1|0|0|g70");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0071 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0072
     * @tc.name      VPN_NotifBoundary_0072
     * @tc.desc      notification boundary 71 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0072 begin`);
      logInfo("notification boundary 71");
      const actual: string = nextNotificationId(71) + '|' + badgeAfterAdd(71) + '|' + badgeAfterSet(71) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g71");
      logInfo('actual=' + String(actual) + ', expected=' + "72|72|71|1|0|1|g71");
      expect(actual).assertEqual("72|72|71|1|0|1|g71");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0072 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0073
     * @tc.name      VPN_NotifBoundary_0073
     * @tc.desc      notification boundary 72 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0073 begin`);
      logInfo("notification boundary 72");
      const actual: string = nextNotificationId(72) + '|' + badgeAfterAdd(72) + '|' + badgeAfterSet(72) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "73|73|72|1|0|0|");
      expect(actual).assertEqual("73|73|72|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0073 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0074
     * @tc.name      VPN_NotifBoundary_0074
     * @tc.desc      notification boundary 73 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0074 begin`);
      logInfo("notification boundary 73");
      const actual: string = nextNotificationId(73) + '|' + badgeAfterAdd(73) + '|' + badgeAfterSet(73) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g73");
      logInfo('actual=' + String(actual) + ', expected=' + "74|74|73|1|0|1|g73");
      expect(actual).assertEqual("74|74|73|1|0|1|g73");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0074 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0075
     * @tc.name      VPN_NotifBoundary_0075
     * @tc.desc      notification boundary 74 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0075 begin`);
      logInfo("notification boundary 74");
      const actual: string = nextNotificationId(74) + '|' + badgeAfterAdd(74) + '|' + badgeAfterSet(74) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g74");
      logInfo('actual=' + String(actual) + ', expected=' + "75|75|74|1|0|0|g74");
      expect(actual).assertEqual("75|75|74|1|0|0|g74");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0075 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0076
     * @tc.name      VPN_NotifBoundary_0076
     * @tc.desc      notification boundary 75 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0076 begin`);
      logInfo("notification boundary 75");
      const actual: string = nextNotificationId(75) + '|' + badgeAfterAdd(75) + '|' + badgeAfterSet(75) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "76|76|75|1|0|1|");
      expect(actual).assertEqual("76|76|75|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0076 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0077
     * @tc.name      VPN_NotifBoundary_0077
     * @tc.desc      notification boundary 76 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0077 begin`);
      logInfo("notification boundary 76");
      const actual: string = nextNotificationId(76) + '|' + badgeAfterAdd(76) + '|' + badgeAfterSet(76) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g76");
      logInfo('actual=' + String(actual) + ', expected=' + "77|77|76|1|0|0|g76");
      expect(actual).assertEqual("77|77|76|1|0|0|g76");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0077 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0078
     * @tc.name      VPN_NotifBoundary_0078
     * @tc.desc      notification boundary 77 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0078 begin`);
      logInfo("notification boundary 77");
      const actual: string = nextNotificationId(77) + '|' + badgeAfterAdd(77) + '|' + badgeAfterSet(77) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g77");
      logInfo('actual=' + String(actual) + ', expected=' + "78|78|77|1|0|1|g77");
      expect(actual).assertEqual("78|78|77|1|0|1|g77");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0078 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0079
     * @tc.name      VPN_NotifBoundary_0079
     * @tc.desc      notification boundary 78 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0079 begin`);
      logInfo("notification boundary 78");
      const actual: string = nextNotificationId(78) + '|' + badgeAfterAdd(78) + '|' + badgeAfterSet(78) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "79|79|78|1|0|0|");
      expect(actual).assertEqual("79|79|78|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0079 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0080
     * @tc.name      VPN_NotifBoundary_0080
     * @tc.desc      notification boundary 79 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0080 begin`);
      logInfo("notification boundary 79");
      const actual: string = nextNotificationId(79) + '|' + badgeAfterAdd(79) + '|' + badgeAfterSet(79) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g79");
      logInfo('actual=' + String(actual) + ', expected=' + "80|80|79|1|0|1|g79");
      expect(actual).assertEqual("80|80|79|1|0|1|g79");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0080 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0081
     * @tc.name      VPN_NotifBoundary_0081
     * @tc.desc      notification boundary 80 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0081 begin`);
      logInfo("notification boundary 80");
      const actual: string = nextNotificationId(80) + '|' + badgeAfterAdd(80) + '|' + badgeAfterSet(80) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g80");
      logInfo('actual=' + String(actual) + ', expected=' + "81|81|80|1|0|0|g80");
      expect(actual).assertEqual("81|81|80|1|0|0|g80");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0081 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0082
     * @tc.name      VPN_NotifBoundary_0082
     * @tc.desc      notification boundary 81 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0082 begin`);
      logInfo("notification boundary 81");
      const actual: string = nextNotificationId(81) + '|' + badgeAfterAdd(81) + '|' + badgeAfterSet(81) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "82|82|81|1|0|1|");
      expect(actual).assertEqual("82|82|81|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0082 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0083
     * @tc.name      VPN_NotifBoundary_0083
     * @tc.desc      notification boundary 82 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0083 begin`);
      logInfo("notification boundary 82");
      const actual: string = nextNotificationId(82) + '|' + badgeAfterAdd(82) + '|' + badgeAfterSet(82) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g82");
      logInfo('actual=' + String(actual) + ', expected=' + "83|83|82|1|0|0|g82");
      expect(actual).assertEqual("83|83|82|1|0|0|g82");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0083 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0084
     * @tc.name      VPN_NotifBoundary_0084
     * @tc.desc      notification boundary 83 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0084 begin`);
      logInfo("notification boundary 83");
      const actual: string = nextNotificationId(83) + '|' + badgeAfterAdd(83) + '|' + badgeAfterSet(83) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g83");
      logInfo('actual=' + String(actual) + ', expected=' + "84|84|83|1|0|1|g83");
      expect(actual).assertEqual("84|84|83|1|0|1|g83");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0084 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0085
     * @tc.name      VPN_NotifBoundary_0085
     * @tc.desc      notification boundary 84 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0085 begin`);
      logInfo("notification boundary 84");
      const actual: string = nextNotificationId(84) + '|' + badgeAfterAdd(84) + '|' + badgeAfterSet(84) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "85|85|84|1|1|0|");
      expect(actual).assertEqual("85|85|84|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0085 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0086
     * @tc.name      VPN_NotifBoundary_0086
     * @tc.desc      notification boundary 85 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0086 begin`);
      logInfo("notification boundary 85");
      const actual: string = nextNotificationId(85) + '|' + badgeAfterAdd(85) + '|' + badgeAfterSet(85) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g85");
      logInfo('actual=' + String(actual) + ', expected=' + "86|86|85|1|1|1|g85");
      expect(actual).assertEqual("86|86|85|1|1|1|g85");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0086 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0087
     * @tc.name      VPN_NotifBoundary_0087
     * @tc.desc      notification boundary 86 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0087 begin`);
      logInfo("notification boundary 86");
      const actual: string = nextNotificationId(86) + '|' + badgeAfterAdd(86) + '|' + badgeAfterSet(86) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g86");
      logInfo('actual=' + String(actual) + ', expected=' + "87|87|86|1|1|0|g86");
      expect(actual).assertEqual("87|87|86|1|1|0|g86");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0087 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0088
     * @tc.name      VPN_NotifBoundary_0088
     * @tc.desc      notification boundary 87 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0088 begin`);
      logInfo("notification boundary 87");
      const actual: string = nextNotificationId(87) + '|' + badgeAfterAdd(87) + '|' + badgeAfterSet(87) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "88|88|87|1|1|1|");
      expect(actual).assertEqual("88|88|87|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0088 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0089
     * @tc.name      VPN_NotifBoundary_0089
     * @tc.desc      notification boundary 88 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0089 begin`);
      logInfo("notification boundary 88");
      const actual: string = nextNotificationId(88) + '|' + badgeAfterAdd(88) + '|' + badgeAfterSet(88) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g88");
      logInfo('actual=' + String(actual) + ', expected=' + "89|89|88|1|1|0|g88");
      expect(actual).assertEqual("89|89|88|1|1|0|g88");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0089 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0090
     * @tc.name      VPN_NotifBoundary_0090
     * @tc.desc      notification boundary 89 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0090 begin`);
      logInfo("notification boundary 89");
      const actual: string = nextNotificationId(89) + '|' + badgeAfterAdd(89) + '|' + badgeAfterSet(89) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g89");
      logInfo('actual=' + String(actual) + ', expected=' + "90|90|89|1|1|1|g89");
      expect(actual).assertEqual("90|90|89|1|1|1|g89");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0090 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0091
     * @tc.name      VPN_NotifBoundary_0091
     * @tc.desc      notification boundary 90 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0091 begin`);
      logInfo("notification boundary 90");
      const actual: string = nextNotificationId(90) + '|' + badgeAfterAdd(90) + '|' + badgeAfterSet(90) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "91|91|90|1|0|0|");
      expect(actual).assertEqual("91|91|90|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0091 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0092
     * @tc.name      VPN_NotifBoundary_0092
     * @tc.desc      notification boundary 91 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0092 begin`);
      logInfo("notification boundary 91");
      const actual: string = nextNotificationId(91) + '|' + badgeAfterAdd(91) + '|' + badgeAfterSet(91) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g91");
      logInfo('actual=' + String(actual) + ', expected=' + "92|92|91|1|0|1|g91");
      expect(actual).assertEqual("92|92|91|1|0|1|g91");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0092 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0093
     * @tc.name      VPN_NotifBoundary_0093
     * @tc.desc      notification boundary 92 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0093 begin`);
      logInfo("notification boundary 92");
      const actual: string = nextNotificationId(92) + '|' + badgeAfterAdd(92) + '|' + badgeAfterSet(92) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g92");
      logInfo('actual=' + String(actual) + ', expected=' + "93|93|92|1|0|0|g92");
      expect(actual).assertEqual("93|93|92|1|0|0|g92");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0093 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0094
     * @tc.name      VPN_NotifBoundary_0094
     * @tc.desc      notification boundary 93 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0094 begin`);
      logInfo("notification boundary 93");
      const actual: string = nextNotificationId(93) + '|' + badgeAfterAdd(93) + '|' + badgeAfterSet(93) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "94|94|93|1|0|1|");
      expect(actual).assertEqual("94|94|93|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0094 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0095
     * @tc.name      VPN_NotifBoundary_0095
     * @tc.desc      notification boundary 94 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0095 begin`);
      logInfo("notification boundary 94");
      const actual: string = nextNotificationId(94) + '|' + badgeAfterAdd(94) + '|' + badgeAfterSet(94) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g94");
      logInfo('actual=' + String(actual) + ', expected=' + "95|95|94|1|0|0|g94");
      expect(actual).assertEqual("95|95|94|1|0|0|g94");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0095 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0096
     * @tc.name      VPN_NotifBoundary_0096
     * @tc.desc      notification boundary 95 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0096 begin`);
      logInfo("notification boundary 95");
      const actual: string = nextNotificationId(95) + '|' + badgeAfterAdd(95) + '|' + badgeAfterSet(95) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g95");
      logInfo('actual=' + String(actual) + ', expected=' + "96|96|95|1|0|1|g95");
      expect(actual).assertEqual("96|96|95|1|0|1|g95");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0096 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0097
     * @tc.name      VPN_NotifBoundary_0097
     * @tc.desc      notification boundary 96 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0097 begin`);
      logInfo("notification boundary 96");
      const actual: string = nextNotificationId(96) + '|' + badgeAfterAdd(96) + '|' + badgeAfterSet(96) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "97|97|96|1|0|0|");
      expect(actual).assertEqual("97|97|96|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0097 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0098
     * @tc.name      VPN_NotifBoundary_0098
     * @tc.desc      notification boundary 97 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0098 begin`);
      logInfo("notification boundary 97");
      const actual: string = nextNotificationId(97) + '|' + badgeAfterAdd(97) + '|' + badgeAfterSet(97) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g97");
      logInfo('actual=' + String(actual) + ', expected=' + "98|98|97|1|0|1|g97");
      expect(actual).assertEqual("98|98|97|1|0|1|g97");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0098 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0099
     * @tc.name      VPN_NotifBoundary_0099
     * @tc.desc      notification boundary 98 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0099 begin`);
      logInfo("notification boundary 98");
      const actual: string = nextNotificationId(98) + '|' + badgeAfterAdd(98) + '|' + badgeAfterSet(98) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g98");
      logInfo('actual=' + String(actual) + ', expected=' + "99|99|98|1|0|0|g98");
      expect(actual).assertEqual("99|99|98|1|0|0|g98");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0099 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0100
     * @tc.name      VPN_NotifBoundary_0100
     * @tc.desc      notification boundary 99 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0100 begin`);
      logInfo("notification boundary 99");
      const actual: string = nextNotificationId(99) + '|' + badgeAfterAdd(99) + '|' + badgeAfterSet(99) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "100|100|99|1|0|1|");
      expect(actual).assertEqual("100|100|99|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0100 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0101
     * @tc.name      VPN_NotifBoundary_0101
     * @tc.desc      notification boundary 100 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0101 begin`);
      logInfo("notification boundary 100");
      const actual: string = nextNotificationId(100) + '|' + badgeAfterAdd(100) + '|' + badgeAfterSet(100) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g100");
      logInfo('actual=' + String(actual) + ', expected=' + "101|101|100|1|0|0|g100");
      expect(actual).assertEqual("101|101|100|1|0|0|g100");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0101 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0102
     * @tc.name      VPN_NotifBoundary_0102
     * @tc.desc      notification boundary 101 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0102 begin`);
      logInfo("notification boundary 101");
      const actual: string = nextNotificationId(101) + '|' + badgeAfterAdd(101) + '|' + badgeAfterSet(101) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g101");
      logInfo('actual=' + String(actual) + ', expected=' + "102|102|101|1|0|1|g101");
      expect(actual).assertEqual("102|102|101|1|0|1|g101");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0102 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0103
     * @tc.name      VPN_NotifBoundary_0103
     * @tc.desc      notification boundary 102 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0103 begin`);
      logInfo("notification boundary 102");
      const actual: string = nextNotificationId(102) + '|' + badgeAfterAdd(102) + '|' + badgeAfterSet(102) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "103|103|102|1|0|0|");
      expect(actual).assertEqual("103|103|102|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0103 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0104
     * @tc.name      VPN_NotifBoundary_0104
     * @tc.desc      notification boundary 103 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0104 begin`);
      logInfo("notification boundary 103");
      const actual: string = nextNotificationId(103) + '|' + badgeAfterAdd(103) + '|' + badgeAfterSet(103) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g103");
      logInfo('actual=' + String(actual) + ', expected=' + "104|104|103|1|0|1|g103");
      expect(actual).assertEqual("104|104|103|1|0|1|g103");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0104 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0105
     * @tc.name      VPN_NotifBoundary_0105
     * @tc.desc      notification boundary 104 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0105 begin`);
      logInfo("notification boundary 104");
      const actual: string = nextNotificationId(104) + '|' + badgeAfterAdd(104) + '|' + badgeAfterSet(104) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g104");
      logInfo('actual=' + String(actual) + ', expected=' + "105|105|104|1|0|0|g104");
      expect(actual).assertEqual("105|105|104|1|0|0|g104");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0105 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0106
     * @tc.name      VPN_NotifBoundary_0106
     * @tc.desc      notification boundary 105 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0106 begin`);
      logInfo("notification boundary 105");
      const actual: string = nextNotificationId(105) + '|' + badgeAfterAdd(105) + '|' + badgeAfterSet(105) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "106|106|105|1|0|1|");
      expect(actual).assertEqual("106|106|105|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0106 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0107
     * @tc.name      VPN_NotifBoundary_0107
     * @tc.desc      notification boundary 106 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0107 begin`);
      logInfo("notification boundary 106");
      const actual: string = nextNotificationId(106) + '|' + badgeAfterAdd(106) + '|' + badgeAfterSet(106) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g106");
      logInfo('actual=' + String(actual) + ', expected=' + "107|107|106|1|0|0|g106");
      expect(actual).assertEqual("107|107|106|1|0|0|g106");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0107 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0108
     * @tc.name      VPN_NotifBoundary_0108
     * @tc.desc      notification boundary 107 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0108 begin`);
      logInfo("notification boundary 107");
      const actual: string = nextNotificationId(107) + '|' + badgeAfterAdd(107) + '|' + badgeAfterSet(107) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g107");
      logInfo('actual=' + String(actual) + ', expected=' + "108|108|107|1|0|1|g107");
      expect(actual).assertEqual("108|108|107|1|0|1|g107");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0108 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0109
     * @tc.name      VPN_NotifBoundary_0109
     * @tc.desc      notification boundary 108 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0109 begin`);
      logInfo("notification boundary 108");
      const actual: string = nextNotificationId(108) + '|' + badgeAfterAdd(108) + '|' + badgeAfterSet(108) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "109|109|108|1|0|0|");
      expect(actual).assertEqual("109|109|108|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0109 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0110
     * @tc.name      VPN_NotifBoundary_0110
     * @tc.desc      notification boundary 109 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0110 begin`);
      logInfo("notification boundary 109");
      const actual: string = nextNotificationId(109) + '|' + badgeAfterAdd(109) + '|' + badgeAfterSet(109) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g109");
      logInfo('actual=' + String(actual) + ', expected=' + "110|110|109|1|0|1|g109");
      expect(actual).assertEqual("110|110|109|1|0|1|g109");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0110 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0111
     * @tc.name      VPN_NotifBoundary_0111
     * @tc.desc      notification boundary 110 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0111 begin`);
      logInfo("notification boundary 110");
      const actual: string = nextNotificationId(110) + '|' + badgeAfterAdd(110) + '|' + badgeAfterSet(110) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g110");
      logInfo('actual=' + String(actual) + ', expected=' + "111|111|110|1|0|0|g110");
      expect(actual).assertEqual("111|111|110|1|0|0|g110");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0111 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0112
     * @tc.name      VPN_NotifBoundary_0112
     * @tc.desc      notification boundary 111 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0112 begin`);
      logInfo("notification boundary 111");
      const actual: string = nextNotificationId(111) + '|' + badgeAfterAdd(111) + '|' + badgeAfterSet(111) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "112|112|111|1|0|1|");
      expect(actual).assertEqual("112|112|111|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0112 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0113
     * @tc.name      VPN_NotifBoundary_0113
     * @tc.desc      notification boundary 112 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0113 begin`);
      logInfo("notification boundary 112");
      const actual: string = nextNotificationId(112) + '|' + badgeAfterAdd(112) + '|' + badgeAfterSet(112) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g112");
      logInfo('actual=' + String(actual) + ', expected=' + "113|113|112|1|0|0|g112");
      expect(actual).assertEqual("113|113|112|1|0|0|g112");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0113 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0114
     * @tc.name      VPN_NotifBoundary_0114
     * @tc.desc      notification boundary 113 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0114 begin`);
      logInfo("notification boundary 113");
      const actual: string = nextNotificationId(113) + '|' + badgeAfterAdd(113) + '|' + badgeAfterSet(113) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g113");
      logInfo('actual=' + String(actual) + ', expected=' + "114|114|113|1|0|1|g113");
      expect(actual).assertEqual("114|114|113|1|0|1|g113");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0114 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0115
     * @tc.name      VPN_NotifBoundary_0115
     * @tc.desc      notification boundary 114 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0115 begin`);
      logInfo("notification boundary 114");
      const actual: string = nextNotificationId(114) + '|' + badgeAfterAdd(114) + '|' + badgeAfterSet(114) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "115|115|114|1|0|0|");
      expect(actual).assertEqual("115|115|114|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0115 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0116
     * @tc.name      VPN_NotifBoundary_0116
     * @tc.desc      notification boundary 115 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0116 begin`);
      logInfo("notification boundary 115");
      const actual: string = nextNotificationId(115) + '|' + badgeAfterAdd(115) + '|' + badgeAfterSet(115) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g115");
      logInfo('actual=' + String(actual) + ', expected=' + "116|116|115|1|0|1|g115");
      expect(actual).assertEqual("116|116|115|1|0|1|g115");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0116 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0117
     * @tc.name      VPN_NotifBoundary_0117
     * @tc.desc      notification boundary 116 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0117 begin`);
      logInfo("notification boundary 116");
      const actual: string = nextNotificationId(116) + '|' + badgeAfterAdd(116) + '|' + badgeAfterSet(116) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g116");
      logInfo('actual=' + String(actual) + ', expected=' + "117|117|116|1|0|0|g116");
      expect(actual).assertEqual("117|117|116|1|0|0|g116");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0117 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0118
     * @tc.name      VPN_NotifBoundary_0118
     * @tc.desc      notification boundary 117 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0118 begin`);
      logInfo("notification boundary 117");
      const actual: string = nextNotificationId(117) + '|' + badgeAfterAdd(117) + '|' + badgeAfterSet(117) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "118|118|117|1|0|1|");
      expect(actual).assertEqual("118|118|117|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0118 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0119
     * @tc.name      VPN_NotifBoundary_0119
     * @tc.desc      notification boundary 118 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0119 begin`);
      logInfo("notification boundary 118");
      const actual: string = nextNotificationId(118) + '|' + badgeAfterAdd(118) + '|' + badgeAfterSet(118) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g118");
      logInfo('actual=' + String(actual) + ', expected=' + "119|119|118|1|0|0|g118");
      expect(actual).assertEqual("119|119|118|1|0|0|g118");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0119 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0120
     * @tc.name      VPN_NotifBoundary_0120
     * @tc.desc      notification boundary 119 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0120 begin`);
      logInfo("notification boundary 119");
      const actual: string = nextNotificationId(119) + '|' + badgeAfterAdd(119) + '|' + badgeAfterSet(119) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g119");
      logInfo('actual=' + String(actual) + ', expected=' + "120|120|119|1|0|1|g119");
      expect(actual).assertEqual("120|120|119|1|0|1|g119");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0120 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0121
     * @tc.name      VPN_NotifBoundary_0121
     * @tc.desc      notification boundary 120 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0121 begin`);
      logInfo("notification boundary 120");
      const actual: string = nextNotificationId(120) + '|' + badgeAfterAdd(120) + '|' + badgeAfterSet(120) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "121|121|120|1|0|0|");
      expect(actual).assertEqual("121|121|120|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0121 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0122
     * @tc.name      VPN_NotifBoundary_0122
     * @tc.desc      notification boundary 121 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0122 begin`);
      logInfo("notification boundary 121");
      const actual: string = nextNotificationId(121) + '|' + badgeAfterAdd(121) + '|' + badgeAfterSet(121) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g121");
      logInfo('actual=' + String(actual) + ', expected=' + "122|122|121|1|0|1|g121");
      expect(actual).assertEqual("122|122|121|1|0|1|g121");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0122 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0123
     * @tc.name      VPN_NotifBoundary_0123
     * @tc.desc      notification boundary 122 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0123 begin`);
      logInfo("notification boundary 122");
      const actual: string = nextNotificationId(122) + '|' + badgeAfterAdd(122) + '|' + badgeAfterSet(122) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g122");
      logInfo('actual=' + String(actual) + ', expected=' + "123|123|122|1|0|0|g122");
      expect(actual).assertEqual("123|123|122|1|0|0|g122");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0123 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0124
     * @tc.name      VPN_NotifBoundary_0124
     * @tc.desc      notification boundary 123 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0124 begin`);
      logInfo("notification boundary 123");
      const actual: string = nextNotificationId(123) + '|' + badgeAfterAdd(123) + '|' + badgeAfterSet(123) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "124|124|123|1|0|1|");
      expect(actual).assertEqual("124|124|123|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0124 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0125
     * @tc.name      VPN_NotifBoundary_0125
     * @tc.desc      notification boundary 124 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0125 begin`);
      logInfo("notification boundary 124");
      const actual: string = nextNotificationId(124) + '|' + badgeAfterAdd(124) + '|' + badgeAfterSet(124) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g124");
      logInfo('actual=' + String(actual) + ', expected=' + "125|125|124|1|0|0|g124");
      expect(actual).assertEqual("125|125|124|1|0|0|g124");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0125 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0126
     * @tc.name      VPN_NotifBoundary_0126
     * @tc.desc      notification boundary 125 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0126 begin`);
      logInfo("notification boundary 125");
      const actual: string = nextNotificationId(125) + '|' + badgeAfterAdd(125) + '|' + badgeAfterSet(125) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g125");
      logInfo('actual=' + String(actual) + ', expected=' + "126|126|125|1|0|1|g125");
      expect(actual).assertEqual("126|126|125|1|0|1|g125");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0126 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0127
     * @tc.name      VPN_NotifBoundary_0127
     * @tc.desc      notification boundary 126 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0127 begin`);
      logInfo("notification boundary 126");
      const actual: string = nextNotificationId(126) + '|' + badgeAfterAdd(126) + '|' + badgeAfterSet(126) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "127|127|126|1|1|0|");
      expect(actual).assertEqual("127|127|126|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0127 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0128
     * @tc.name      VPN_NotifBoundary_0128
     * @tc.desc      notification boundary 127 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0128 begin`);
      logInfo("notification boundary 127");
      const actual: string = nextNotificationId(127) + '|' + badgeAfterAdd(127) + '|' + badgeAfterSet(127) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g127");
      logInfo('actual=' + String(actual) + ', expected=' + "128|128|127|1|1|1|g127");
      expect(actual).assertEqual("128|128|127|1|1|1|g127");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0128 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0129
     * @tc.name      VPN_NotifBoundary_0129
     * @tc.desc      notification boundary 128 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0129 begin`);
      logInfo("notification boundary 128");
      const actual: string = nextNotificationId(128) + '|' + badgeAfterAdd(128) + '|' + badgeAfterSet(128) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g128");
      logInfo('actual=' + String(actual) + ', expected=' + "129|129|128|1|1|0|g128");
      expect(actual).assertEqual("129|129|128|1|1|0|g128");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0129 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0130
     * @tc.name      VPN_NotifBoundary_0130
     * @tc.desc      notification boundary 129 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0130 begin`);
      logInfo("notification boundary 129");
      const actual: string = nextNotificationId(129) + '|' + badgeAfterAdd(129) + '|' + badgeAfterSet(129) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "130|130|129|1|1|1|");
      expect(actual).assertEqual("130|130|129|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0130 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0131
     * @tc.name      VPN_NotifBoundary_0131
     * @tc.desc      notification boundary 130 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0131 begin`);
      logInfo("notification boundary 130");
      const actual: string = nextNotificationId(130) + '|' + badgeAfterAdd(130) + '|' + badgeAfterSet(130) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g130");
      logInfo('actual=' + String(actual) + ', expected=' + "131|131|130|1|1|0|g130");
      expect(actual).assertEqual("131|131|130|1|1|0|g130");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0131 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0132
     * @tc.name      VPN_NotifBoundary_0132
     * @tc.desc      notification boundary 131 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0132 begin`);
      logInfo("notification boundary 131");
      const actual: string = nextNotificationId(131) + '|' + badgeAfterAdd(131) + '|' + badgeAfterSet(131) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g131");
      logInfo('actual=' + String(actual) + ', expected=' + "132|132|131|1|1|1|g131");
      expect(actual).assertEqual("132|132|131|1|1|1|g131");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0132 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0133
     * @tc.name      VPN_NotifBoundary_0133
     * @tc.desc      notification boundary 132 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0133 begin`);
      logInfo("notification boundary 132");
      const actual: string = nextNotificationId(132) + '|' + badgeAfterAdd(132) + '|' + badgeAfterSet(132) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "133|133|132|1|0|0|");
      expect(actual).assertEqual("133|133|132|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0133 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0134
     * @tc.name      VPN_NotifBoundary_0134
     * @tc.desc      notification boundary 133 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0134 begin`);
      logInfo("notification boundary 133");
      const actual: string = nextNotificationId(133) + '|' + badgeAfterAdd(133) + '|' + badgeAfterSet(133) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g133");
      logInfo('actual=' + String(actual) + ', expected=' + "134|134|133|1|0|1|g133");
      expect(actual).assertEqual("134|134|133|1|0|1|g133");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0134 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0135
     * @tc.name      VPN_NotifBoundary_0135
     * @tc.desc      notification boundary 134 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0135 begin`);
      logInfo("notification boundary 134");
      const actual: string = nextNotificationId(134) + '|' + badgeAfterAdd(134) + '|' + badgeAfterSet(134) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g134");
      logInfo('actual=' + String(actual) + ', expected=' + "135|135|134|1|0|0|g134");
      expect(actual).assertEqual("135|135|134|1|0|0|g134");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0135 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0136
     * @tc.name      VPN_NotifBoundary_0136
     * @tc.desc      notification boundary 135 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0136 begin`);
      logInfo("notification boundary 135");
      const actual: string = nextNotificationId(135) + '|' + badgeAfterAdd(135) + '|' + badgeAfterSet(135) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "136|136|135|1|0|1|");
      expect(actual).assertEqual("136|136|135|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0136 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0137
     * @tc.name      VPN_NotifBoundary_0137
     * @tc.desc      notification boundary 136 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0137 begin`);
      logInfo("notification boundary 136");
      const actual: string = nextNotificationId(136) + '|' + badgeAfterAdd(136) + '|' + badgeAfterSet(136) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g136");
      logInfo('actual=' + String(actual) + ', expected=' + "137|137|136|1|0|0|g136");
      expect(actual).assertEqual("137|137|136|1|0|0|g136");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0137 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0138
     * @tc.name      VPN_NotifBoundary_0138
     * @tc.desc      notification boundary 137 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0138 begin`);
      logInfo("notification boundary 137");
      const actual: string = nextNotificationId(137) + '|' + badgeAfterAdd(137) + '|' + badgeAfterSet(137) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g137");
      logInfo('actual=' + String(actual) + ', expected=' + "138|138|137|1|0|1|g137");
      expect(actual).assertEqual("138|138|137|1|0|1|g137");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0138 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0139
     * @tc.name      VPN_NotifBoundary_0139
     * @tc.desc      notification boundary 138 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0139 begin`);
      logInfo("notification boundary 138");
      const actual: string = nextNotificationId(138) + '|' + badgeAfterAdd(138) + '|' + badgeAfterSet(138) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "139|139|138|1|0|0|");
      expect(actual).assertEqual("139|139|138|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0139 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0140
     * @tc.name      VPN_NotifBoundary_0140
     * @tc.desc      notification boundary 139 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0140 begin`);
      logInfo("notification boundary 139");
      const actual: string = nextNotificationId(139) + '|' + badgeAfterAdd(139) + '|' + badgeAfterSet(139) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g139");
      logInfo('actual=' + String(actual) + ', expected=' + "140|140|139|1|0|1|g139");
      expect(actual).assertEqual("140|140|139|1|0|1|g139");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0140 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0141
     * @tc.name      VPN_NotifBoundary_0141
     * @tc.desc      notification boundary 140 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0141 begin`);
      logInfo("notification boundary 140");
      const actual: string = nextNotificationId(140) + '|' + badgeAfterAdd(140) + '|' + badgeAfterSet(140) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g140");
      logInfo('actual=' + String(actual) + ', expected=' + "141|141|140|1|0|0|g140");
      expect(actual).assertEqual("141|141|140|1|0|0|g140");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0141 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0142
     * @tc.name      VPN_NotifBoundary_0142
     * @tc.desc      notification boundary 141 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0142 begin`);
      logInfo("notification boundary 141");
      const actual: string = nextNotificationId(141) + '|' + badgeAfterAdd(141) + '|' + badgeAfterSet(141) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "142|142|141|1|0|1|");
      expect(actual).assertEqual("142|142|141|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0142 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0143
     * @tc.name      VPN_NotifBoundary_0143
     * @tc.desc      notification boundary 142 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0143 begin`);
      logInfo("notification boundary 142");
      const actual: string = nextNotificationId(142) + '|' + badgeAfterAdd(142) + '|' + badgeAfterSet(142) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g142");
      logInfo('actual=' + String(actual) + ', expected=' + "143|143|142|1|0|0|g142");
      expect(actual).assertEqual("143|143|142|1|0|0|g142");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0143 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0144
     * @tc.name      VPN_NotifBoundary_0144
     * @tc.desc      notification boundary 143 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0144 begin`);
      logInfo("notification boundary 143");
      const actual: string = nextNotificationId(143) + '|' + badgeAfterAdd(143) + '|' + badgeAfterSet(143) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g143");
      logInfo('actual=' + String(actual) + ', expected=' + "144|144|143|1|0|1|g143");
      expect(actual).assertEqual("144|144|143|1|0|1|g143");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0144 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0145
     * @tc.name      VPN_NotifBoundary_0145
     * @tc.desc      notification boundary 144 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0145 begin`);
      logInfo("notification boundary 144");
      const actual: string = nextNotificationId(144) + '|' + badgeAfterAdd(144) + '|' + badgeAfterSet(144) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "145|145|144|1|0|0|");
      expect(actual).assertEqual("145|145|144|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0145 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0146
     * @tc.name      VPN_NotifBoundary_0146
     * @tc.desc      notification boundary 145 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0146 begin`);
      logInfo("notification boundary 145");
      const actual: string = nextNotificationId(145) + '|' + badgeAfterAdd(145) + '|' + badgeAfterSet(145) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g145");
      logInfo('actual=' + String(actual) + ', expected=' + "146|146|145|1|0|1|g145");
      expect(actual).assertEqual("146|146|145|1|0|1|g145");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0146 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0147
     * @tc.name      VPN_NotifBoundary_0147
     * @tc.desc      notification boundary 146 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0147 begin`);
      logInfo("notification boundary 146");
      const actual: string = nextNotificationId(146) + '|' + badgeAfterAdd(146) + '|' + badgeAfterSet(146) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g146");
      logInfo('actual=' + String(actual) + ', expected=' + "147|147|146|1|0|0|g146");
      expect(actual).assertEqual("147|147|146|1|0|0|g146");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0147 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0148
     * @tc.name      VPN_NotifBoundary_0148
     * @tc.desc      notification boundary 147 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0148 begin`);
      logInfo("notification boundary 147");
      const actual: string = nextNotificationId(147) + '|' + badgeAfterAdd(147) + '|' + badgeAfterSet(147) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "148|148|147|1|0|1|");
      expect(actual).assertEqual("148|148|147|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0148 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0149
     * @tc.name      VPN_NotifBoundary_0149
     * @tc.desc      notification boundary 148 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0149 begin`);
      logInfo("notification boundary 148");
      const actual: string = nextNotificationId(148) + '|' + badgeAfterAdd(148) + '|' + badgeAfterSet(148) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g148");
      logInfo('actual=' + String(actual) + ', expected=' + "149|149|148|1|0|0|g148");
      expect(actual).assertEqual("149|149|148|1|0|0|g148");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0149 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0150
     * @tc.name      VPN_NotifBoundary_0150
     * @tc.desc      notification boundary 149 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0150 begin`);
      logInfo("notification boundary 149");
      const actual: string = nextNotificationId(149) + '|' + badgeAfterAdd(149) + '|' + badgeAfterSet(149) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g149");
      logInfo('actual=' + String(actual) + ', expected=' + "150|150|149|1|0|1|g149");
      expect(actual).assertEqual("150|150|149|1|0|1|g149");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0150 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0151
     * @tc.name      VPN_NotifBoundary_0151
     * @tc.desc      notification boundary 150 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0151 begin`);
      logInfo("notification boundary 150");
      const actual: string = nextNotificationId(150) + '|' + badgeAfterAdd(150) + '|' + badgeAfterSet(150) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "151|151|150|1|0|0|");
      expect(actual).assertEqual("151|151|150|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0151 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0152
     * @tc.name      VPN_NotifBoundary_0152
     * @tc.desc      notification boundary 151 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0152 begin`);
      logInfo("notification boundary 151");
      const actual: string = nextNotificationId(151) + '|' + badgeAfterAdd(151) + '|' + badgeAfterSet(151) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g151");
      logInfo('actual=' + String(actual) + ', expected=' + "152|152|151|1|0|1|g151");
      expect(actual).assertEqual("152|152|151|1|0|1|g151");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0152 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0153
     * @tc.name      VPN_NotifBoundary_0153
     * @tc.desc      notification boundary 152 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0153 begin`);
      logInfo("notification boundary 152");
      const actual: string = nextNotificationId(152) + '|' + badgeAfterAdd(152) + '|' + badgeAfterSet(152) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g152");
      logInfo('actual=' + String(actual) + ', expected=' + "153|153|152|1|0|0|g152");
      expect(actual).assertEqual("153|153|152|1|0|0|g152");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0153 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0154
     * @tc.name      VPN_NotifBoundary_0154
     * @tc.desc      notification boundary 153 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0154 begin`);
      logInfo("notification boundary 153");
      const actual: string = nextNotificationId(153) + '|' + badgeAfterAdd(153) + '|' + badgeAfterSet(153) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "154|154|153|1|0|1|");
      expect(actual).assertEqual("154|154|153|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0154 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0155
     * @tc.name      VPN_NotifBoundary_0155
     * @tc.desc      notification boundary 154 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0155 begin`);
      logInfo("notification boundary 154");
      const actual: string = nextNotificationId(154) + '|' + badgeAfterAdd(154) + '|' + badgeAfterSet(154) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g154");
      logInfo('actual=' + String(actual) + ', expected=' + "155|155|154|1|0|0|g154");
      expect(actual).assertEqual("155|155|154|1|0|0|g154");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0155 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0156
     * @tc.name      VPN_NotifBoundary_0156
     * @tc.desc      notification boundary 155 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0156 begin`);
      logInfo("notification boundary 155");
      const actual: string = nextNotificationId(155) + '|' + badgeAfterAdd(155) + '|' + badgeAfterSet(155) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g155");
      logInfo('actual=' + String(actual) + ', expected=' + "156|156|155|1|0|1|g155");
      expect(actual).assertEqual("156|156|155|1|0|1|g155");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0156 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0157
     * @tc.name      VPN_NotifBoundary_0157
     * @tc.desc      notification boundary 156 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0157 begin`);
      logInfo("notification boundary 156");
      const actual: string = nextNotificationId(156) + '|' + badgeAfterAdd(156) + '|' + badgeAfterSet(156) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "157|157|156|1|0|0|");
      expect(actual).assertEqual("157|157|156|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0157 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0158
     * @tc.name      VPN_NotifBoundary_0158
     * @tc.desc      notification boundary 157 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0158 begin`);
      logInfo("notification boundary 157");
      const actual: string = nextNotificationId(157) + '|' + badgeAfterAdd(157) + '|' + badgeAfterSet(157) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g157");
      logInfo('actual=' + String(actual) + ', expected=' + "158|158|157|1|0|1|g157");
      expect(actual).assertEqual("158|158|157|1|0|1|g157");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0158 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0159
     * @tc.name      VPN_NotifBoundary_0159
     * @tc.desc      notification boundary 158 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0159 begin`);
      logInfo("notification boundary 158");
      const actual: string = nextNotificationId(158) + '|' + badgeAfterAdd(158) + '|' + badgeAfterSet(158) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g158");
      logInfo('actual=' + String(actual) + ', expected=' + "159|159|158|1|0|0|g158");
      expect(actual).assertEqual("159|159|158|1|0|0|g158");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0159 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0160
     * @tc.name      VPN_NotifBoundary_0160
     * @tc.desc      notification boundary 159 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0160 begin`);
      logInfo("notification boundary 159");
      const actual: string = nextNotificationId(159) + '|' + badgeAfterAdd(159) + '|' + badgeAfterSet(159) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "160|160|159|1|0|1|");
      expect(actual).assertEqual("160|160|159|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0160 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0161
     * @tc.name      VPN_NotifBoundary_0161
     * @tc.desc      notification boundary 160 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0161 begin`);
      logInfo("notification boundary 160");
      const actual: string = nextNotificationId(160) + '|' + badgeAfterAdd(160) + '|' + badgeAfterSet(160) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g160");
      logInfo('actual=' + String(actual) + ', expected=' + "161|161|160|1|0|0|g160");
      expect(actual).assertEqual("161|161|160|1|0|0|g160");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0161 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0162
     * @tc.name      VPN_NotifBoundary_0162
     * @tc.desc      notification boundary 161 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0162 begin`);
      logInfo("notification boundary 161");
      const actual: string = nextNotificationId(161) + '|' + badgeAfterAdd(161) + '|' + badgeAfterSet(161) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g161");
      logInfo('actual=' + String(actual) + ', expected=' + "162|162|161|1|0|1|g161");
      expect(actual).assertEqual("162|162|161|1|0|1|g161");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0162 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0163
     * @tc.name      VPN_NotifBoundary_0163
     * @tc.desc      notification boundary 162 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0163 begin`);
      logInfo("notification boundary 162");
      const actual: string = nextNotificationId(162) + '|' + badgeAfterAdd(162) + '|' + badgeAfterSet(162) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "163|163|162|1|0|0|");
      expect(actual).assertEqual("163|163|162|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0163 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0164
     * @tc.name      VPN_NotifBoundary_0164
     * @tc.desc      notification boundary 163 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0164 begin`);
      logInfo("notification boundary 163");
      const actual: string = nextNotificationId(163) + '|' + badgeAfterAdd(163) + '|' + badgeAfterSet(163) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g163");
      logInfo('actual=' + String(actual) + ', expected=' + "164|164|163|1|0|1|g163");
      expect(actual).assertEqual("164|164|163|1|0|1|g163");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0164 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0165
     * @tc.name      VPN_NotifBoundary_0165
     * @tc.desc      notification boundary 164 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0165 begin`);
      logInfo("notification boundary 164");
      const actual: string = nextNotificationId(164) + '|' + badgeAfterAdd(164) + '|' + badgeAfterSet(164) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g164");
      logInfo('actual=' + String(actual) + ', expected=' + "165|165|164|1|0|0|g164");
      expect(actual).assertEqual("165|165|164|1|0|0|g164");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0165 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0166
     * @tc.name      VPN_NotifBoundary_0166
     * @tc.desc      notification boundary 165 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0166 begin`);
      logInfo("notification boundary 165");
      const actual: string = nextNotificationId(165) + '|' + badgeAfterAdd(165) + '|' + badgeAfterSet(165) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "166|166|165|1|0|1|");
      expect(actual).assertEqual("166|166|165|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0166 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0167
     * @tc.name      VPN_NotifBoundary_0167
     * @tc.desc      notification boundary 166 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0167 begin`);
      logInfo("notification boundary 166");
      const actual: string = nextNotificationId(166) + '|' + badgeAfterAdd(166) + '|' + badgeAfterSet(166) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g166");
      logInfo('actual=' + String(actual) + ', expected=' + "167|167|166|1|0|0|g166");
      expect(actual).assertEqual("167|167|166|1|0|0|g166");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0167 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0168
     * @tc.name      VPN_NotifBoundary_0168
     * @tc.desc      notification boundary 167 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0168 begin`);
      logInfo("notification boundary 167");
      const actual: string = nextNotificationId(167) + '|' + badgeAfterAdd(167) + '|' + badgeAfterSet(167) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g167");
      logInfo('actual=' + String(actual) + ', expected=' + "168|168|167|1|0|1|g167");
      expect(actual).assertEqual("168|168|167|1|0|1|g167");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0168 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0169
     * @tc.name      VPN_NotifBoundary_0169
     * @tc.desc      notification boundary 168 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0169 begin`);
      logInfo("notification boundary 168");
      const actual: string = nextNotificationId(168) + '|' + badgeAfterAdd(168) + '|' + badgeAfterSet(168) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "169|169|168|1|1|0|");
      expect(actual).assertEqual("169|169|168|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0169 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0170
     * @tc.name      VPN_NotifBoundary_0170
     * @tc.desc      notification boundary 169 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0170 begin`);
      logInfo("notification boundary 169");
      const actual: string = nextNotificationId(169) + '|' + badgeAfterAdd(169) + '|' + badgeAfterSet(169) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g169");
      logInfo('actual=' + String(actual) + ', expected=' + "170|170|169|1|1|1|g169");
      expect(actual).assertEqual("170|170|169|1|1|1|g169");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0170 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0171
     * @tc.name      VPN_NotifBoundary_0171
     * @tc.desc      notification boundary 170 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0171 begin`);
      logInfo("notification boundary 170");
      const actual: string = nextNotificationId(170) + '|' + badgeAfterAdd(170) + '|' + badgeAfterSet(170) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g170");
      logInfo('actual=' + String(actual) + ', expected=' + "171|171|170|1|1|0|g170");
      expect(actual).assertEqual("171|171|170|1|1|0|g170");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0171 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0172
     * @tc.name      VPN_NotifBoundary_0172
     * @tc.desc      notification boundary 171 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0172 begin`);
      logInfo("notification boundary 171");
      const actual: string = nextNotificationId(171) + '|' + badgeAfterAdd(171) + '|' + badgeAfterSet(171) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "172|172|171|1|1|1|");
      expect(actual).assertEqual("172|172|171|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0172 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0173
     * @tc.name      VPN_NotifBoundary_0173
     * @tc.desc      notification boundary 172 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0173 begin`);
      logInfo("notification boundary 172");
      const actual: string = nextNotificationId(172) + '|' + badgeAfterAdd(172) + '|' + badgeAfterSet(172) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g172");
      logInfo('actual=' + String(actual) + ', expected=' + "173|173|172|1|1|0|g172");
      expect(actual).assertEqual("173|173|172|1|1|0|g172");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0173 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0174
     * @tc.name      VPN_NotifBoundary_0174
     * @tc.desc      notification boundary 173 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0174 begin`);
      logInfo("notification boundary 173");
      const actual: string = nextNotificationId(173) + '|' + badgeAfterAdd(173) + '|' + badgeAfterSet(173) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g173");
      logInfo('actual=' + String(actual) + ', expected=' + "174|174|173|1|1|1|g173");
      expect(actual).assertEqual("174|174|173|1|1|1|g173");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0174 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0175
     * @tc.name      VPN_NotifBoundary_0175
     * @tc.desc      notification boundary 174 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0175 begin`);
      logInfo("notification boundary 174");
      const actual: string = nextNotificationId(174) + '|' + badgeAfterAdd(174) + '|' + badgeAfterSet(174) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "175|175|174|1|0|0|");
      expect(actual).assertEqual("175|175|174|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0175 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0176
     * @tc.name      VPN_NotifBoundary_0176
     * @tc.desc      notification boundary 175 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0176 begin`);
      logInfo("notification boundary 175");
      const actual: string = nextNotificationId(175) + '|' + badgeAfterAdd(175) + '|' + badgeAfterSet(175) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g175");
      logInfo('actual=' + String(actual) + ', expected=' + "176|176|175|1|0|1|g175");
      expect(actual).assertEqual("176|176|175|1|0|1|g175");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0176 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0177
     * @tc.name      VPN_NotifBoundary_0177
     * @tc.desc      notification boundary 176 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0177 begin`);
      logInfo("notification boundary 176");
      const actual: string = nextNotificationId(176) + '|' + badgeAfterAdd(176) + '|' + badgeAfterSet(176) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g176");
      logInfo('actual=' + String(actual) + ', expected=' + "177|177|176|1|0|0|g176");
      expect(actual).assertEqual("177|177|176|1|0|0|g176");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0177 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0178
     * @tc.name      VPN_NotifBoundary_0178
     * @tc.desc      notification boundary 177 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0178 begin`);
      logInfo("notification boundary 177");
      const actual: string = nextNotificationId(177) + '|' + badgeAfterAdd(177) + '|' + badgeAfterSet(177) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "178|178|177|1|0|1|");
      expect(actual).assertEqual("178|178|177|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0178 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0179
     * @tc.name      VPN_NotifBoundary_0179
     * @tc.desc      notification boundary 178 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0179 begin`);
      logInfo("notification boundary 178");
      const actual: string = nextNotificationId(178) + '|' + badgeAfterAdd(178) + '|' + badgeAfterSet(178) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g178");
      logInfo('actual=' + String(actual) + ', expected=' + "179|179|178|1|0|0|g178");
      expect(actual).assertEqual("179|179|178|1|0|0|g178");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0179 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0180
     * @tc.name      VPN_NotifBoundary_0180
     * @tc.desc      notification boundary 179 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0180 begin`);
      logInfo("notification boundary 179");
      const actual: string = nextNotificationId(179) + '|' + badgeAfterAdd(179) + '|' + badgeAfterSet(179) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g179");
      logInfo('actual=' + String(actual) + ', expected=' + "180|180|179|1|0|1|g179");
      expect(actual).assertEqual("180|180|179|1|0|1|g179");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0180 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0181
     * @tc.name      VPN_NotifBoundary_0181
     * @tc.desc      notification boundary 180 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0181 begin`);
      logInfo("notification boundary 180");
      const actual: string = nextNotificationId(180) + '|' + badgeAfterAdd(180) + '|' + badgeAfterSet(180) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "181|181|180|1|0|0|");
      expect(actual).assertEqual("181|181|180|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0181 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0182
     * @tc.name      VPN_NotifBoundary_0182
     * @tc.desc      notification boundary 181 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0182 begin`);
      logInfo("notification boundary 181");
      const actual: string = nextNotificationId(181) + '|' + badgeAfterAdd(181) + '|' + badgeAfterSet(181) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g181");
      logInfo('actual=' + String(actual) + ', expected=' + "182|182|181|1|0|1|g181");
      expect(actual).assertEqual("182|182|181|1|0|1|g181");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0182 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0183
     * @tc.name      VPN_NotifBoundary_0183
     * @tc.desc      notification boundary 182 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0183 begin`);
      logInfo("notification boundary 182");
      const actual: string = nextNotificationId(182) + '|' + badgeAfterAdd(182) + '|' + badgeAfterSet(182) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g182");
      logInfo('actual=' + String(actual) + ', expected=' + "183|183|182|1|0|0|g182");
      expect(actual).assertEqual("183|183|182|1|0|0|g182");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0183 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0184
     * @tc.name      VPN_NotifBoundary_0184
     * @tc.desc      notification boundary 183 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0184 begin`);
      logInfo("notification boundary 183");
      const actual: string = nextNotificationId(183) + '|' + badgeAfterAdd(183) + '|' + badgeAfterSet(183) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "184|184|183|1|0|1|");
      expect(actual).assertEqual("184|184|183|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0184 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0185
     * @tc.name      VPN_NotifBoundary_0185
     * @tc.desc      notification boundary 184 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0185 begin`);
      logInfo("notification boundary 184");
      const actual: string = nextNotificationId(184) + '|' + badgeAfterAdd(184) + '|' + badgeAfterSet(184) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g184");
      logInfo('actual=' + String(actual) + ', expected=' + "185|185|184|1|0|0|g184");
      expect(actual).assertEqual("185|185|184|1|0|0|g184");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0185 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0186
     * @tc.name      VPN_NotifBoundary_0186
     * @tc.desc      notification boundary 185 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0186 begin`);
      logInfo("notification boundary 185");
      const actual: string = nextNotificationId(185) + '|' + badgeAfterAdd(185) + '|' + badgeAfterSet(185) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g185");
      logInfo('actual=' + String(actual) + ', expected=' + "186|186|185|1|0|1|g185");
      expect(actual).assertEqual("186|186|185|1|0|1|g185");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0186 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0187
     * @tc.name      VPN_NotifBoundary_0187
     * @tc.desc      notification boundary 186 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0187 begin`);
      logInfo("notification boundary 186");
      const actual: string = nextNotificationId(186) + '|' + badgeAfterAdd(186) + '|' + badgeAfterSet(186) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "187|187|186|1|0|0|");
      expect(actual).assertEqual("187|187|186|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0187 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0188
     * @tc.name      VPN_NotifBoundary_0188
     * @tc.desc      notification boundary 187 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0188 begin`);
      logInfo("notification boundary 187");
      const actual: string = nextNotificationId(187) + '|' + badgeAfterAdd(187) + '|' + badgeAfterSet(187) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g187");
      logInfo('actual=' + String(actual) + ', expected=' + "188|188|187|1|0|1|g187");
      expect(actual).assertEqual("188|188|187|1|0|1|g187");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0188 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0189
     * @tc.name      VPN_NotifBoundary_0189
     * @tc.desc      notification boundary 188 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0189 begin`);
      logInfo("notification boundary 188");
      const actual: string = nextNotificationId(188) + '|' + badgeAfterAdd(188) + '|' + badgeAfterSet(188) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g188");
      logInfo('actual=' + String(actual) + ', expected=' + "189|189|188|1|0|0|g188");
      expect(actual).assertEqual("189|189|188|1|0|0|g188");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0189 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0190
     * @tc.name      VPN_NotifBoundary_0190
     * @tc.desc      notification boundary 189 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0190 begin`);
      logInfo("notification boundary 189");
      const actual: string = nextNotificationId(189) + '|' + badgeAfterAdd(189) + '|' + badgeAfterSet(189) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "190|190|189|1|0|1|");
      expect(actual).assertEqual("190|190|189|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0190 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0191
     * @tc.name      VPN_NotifBoundary_0191
     * @tc.desc      notification boundary 190 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0191 begin`);
      logInfo("notification boundary 190");
      const actual: string = nextNotificationId(190) + '|' + badgeAfterAdd(190) + '|' + badgeAfterSet(190) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g190");
      logInfo('actual=' + String(actual) + ', expected=' + "191|191|190|1|0|0|g190");
      expect(actual).assertEqual("191|191|190|1|0|0|g190");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0191 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0192
     * @tc.name      VPN_NotifBoundary_0192
     * @tc.desc      notification boundary 191 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0192 begin`);
      logInfo("notification boundary 191");
      const actual: string = nextNotificationId(191) + '|' + badgeAfterAdd(191) + '|' + badgeAfterSet(191) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g191");
      logInfo('actual=' + String(actual) + ', expected=' + "192|192|191|1|0|1|g191");
      expect(actual).assertEqual("192|192|191|1|0|1|g191");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0192 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0193
     * @tc.name      VPN_NotifBoundary_0193
     * @tc.desc      notification boundary 192 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0193 begin`);
      logInfo("notification boundary 192");
      const actual: string = nextNotificationId(192) + '|' + badgeAfterAdd(192) + '|' + badgeAfterSet(192) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "193|193|192|1|0|0|");
      expect(actual).assertEqual("193|193|192|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0193 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0194
     * @tc.name      VPN_NotifBoundary_0194
     * @tc.desc      notification boundary 193 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0194 begin`);
      logInfo("notification boundary 193");
      const actual: string = nextNotificationId(193) + '|' + badgeAfterAdd(193) + '|' + badgeAfterSet(193) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g193");
      logInfo('actual=' + String(actual) + ', expected=' + "194|194|193|1|0|1|g193");
      expect(actual).assertEqual("194|194|193|1|0|1|g193");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0194 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0195
     * @tc.name      VPN_NotifBoundary_0195
     * @tc.desc      notification boundary 194 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0195 begin`);
      logInfo("notification boundary 194");
      const actual: string = nextNotificationId(194) + '|' + badgeAfterAdd(194) + '|' + badgeAfterSet(194) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g194");
      logInfo('actual=' + String(actual) + ', expected=' + "195|195|194|1|0|0|g194");
      expect(actual).assertEqual("195|195|194|1|0|0|g194");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0195 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0196
     * @tc.name      VPN_NotifBoundary_0196
     * @tc.desc      notification boundary 195 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0196 begin`);
      logInfo("notification boundary 195");
      const actual: string = nextNotificationId(195) + '|' + badgeAfterAdd(195) + '|' + badgeAfterSet(195) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "196|196|195|1|0|1|");
      expect(actual).assertEqual("196|196|195|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0196 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0197
     * @tc.name      VPN_NotifBoundary_0197
     * @tc.desc      notification boundary 196 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0197 begin`);
      logInfo("notification boundary 196");
      const actual: string = nextNotificationId(196) + '|' + badgeAfterAdd(196) + '|' + badgeAfterSet(196) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g196");
      logInfo('actual=' + String(actual) + ', expected=' + "197|197|196|1|0|0|g196");
      expect(actual).assertEqual("197|197|196|1|0|0|g196");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0197 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0198
     * @tc.name      VPN_NotifBoundary_0198
     * @tc.desc      notification boundary 197 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0198 begin`);
      logInfo("notification boundary 197");
      const actual: string = nextNotificationId(197) + '|' + badgeAfterAdd(197) + '|' + badgeAfterSet(197) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g197");
      logInfo('actual=' + String(actual) + ', expected=' + "198|198|197|1|0|1|g197");
      expect(actual).assertEqual("198|198|197|1|0|1|g197");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0198 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0199
     * @tc.name      VPN_NotifBoundary_0199
     * @tc.desc      notification boundary 198 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0199 begin`);
      logInfo("notification boundary 198");
      const actual: string = nextNotificationId(198) + '|' + badgeAfterAdd(198) + '|' + badgeAfterSet(198) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "199|199|198|1|0|0|");
      expect(actual).assertEqual("199|199|198|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0199 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0200
     * @tc.name      VPN_NotifBoundary_0200
     * @tc.desc      notification boundary 199 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0200 begin`);
      logInfo("notification boundary 199");
      const actual: string = nextNotificationId(199) + '|' + badgeAfterAdd(199) + '|' + badgeAfterSet(199) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g199");
      logInfo('actual=' + String(actual) + ', expected=' + "200|200|199|1|0|1|g199");
      expect(actual).assertEqual("200|200|199|1|0|1|g199");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0200 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0201
     * @tc.name      VPN_NotifBoundary_0201
     * @tc.desc      notification boundary 200 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0201 begin`);
      logInfo("notification boundary 200");
      const actual: string = nextNotificationId(200) + '|' + badgeAfterAdd(200) + '|' + badgeAfterSet(200) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g200");
      logInfo('actual=' + String(actual) + ', expected=' + "201|201|200|1|0|0|g200");
      expect(actual).assertEqual("201|201|200|1|0|0|g200");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0201 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0202
     * @tc.name      VPN_NotifBoundary_0202
     * @tc.desc      notification boundary 201 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0202 begin`);
      logInfo("notification boundary 201");
      const actual: string = nextNotificationId(201) + '|' + badgeAfterAdd(201) + '|' + badgeAfterSet(201) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "202|202|201|1|0|1|");
      expect(actual).assertEqual("202|202|201|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0202 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0203
     * @tc.name      VPN_NotifBoundary_0203
     * @tc.desc      notification boundary 202 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0203 begin`);
      logInfo("notification boundary 202");
      const actual: string = nextNotificationId(202) + '|' + badgeAfterAdd(202) + '|' + badgeAfterSet(202) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g202");
      logInfo('actual=' + String(actual) + ', expected=' + "203|203|202|1|0|0|g202");
      expect(actual).assertEqual("203|203|202|1|0|0|g202");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0203 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0204
     * @tc.name      VPN_NotifBoundary_0204
     * @tc.desc      notification boundary 203 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0204 begin`);
      logInfo("notification boundary 203");
      const actual: string = nextNotificationId(203) + '|' + badgeAfterAdd(203) + '|' + badgeAfterSet(203) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g203");
      logInfo('actual=' + String(actual) + ', expected=' + "204|204|203|1|0|1|g203");
      expect(actual).assertEqual("204|204|203|1|0|1|g203");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0204 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0205
     * @tc.name      VPN_NotifBoundary_0205
     * @tc.desc      notification boundary 204 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0205 begin`);
      logInfo("notification boundary 204");
      const actual: string = nextNotificationId(204) + '|' + badgeAfterAdd(204) + '|' + badgeAfterSet(204) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "205|205|204|1|0|0|");
      expect(actual).assertEqual("205|205|204|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0205 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0206
     * @tc.name      VPN_NotifBoundary_0206
     * @tc.desc      notification boundary 205 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0206 begin`);
      logInfo("notification boundary 205");
      const actual: string = nextNotificationId(205) + '|' + badgeAfterAdd(205) + '|' + badgeAfterSet(205) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g205");
      logInfo('actual=' + String(actual) + ', expected=' + "206|206|205|1|0|1|g205");
      expect(actual).assertEqual("206|206|205|1|0|1|g205");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0206 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0207
     * @tc.name      VPN_NotifBoundary_0207
     * @tc.desc      notification boundary 206 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0207 begin`);
      logInfo("notification boundary 206");
      const actual: string = nextNotificationId(206) + '|' + badgeAfterAdd(206) + '|' + badgeAfterSet(206) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g206");
      logInfo('actual=' + String(actual) + ', expected=' + "207|207|206|1|0|0|g206");
      expect(actual).assertEqual("207|207|206|1|0|0|g206");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0207 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0208
     * @tc.name      VPN_NotifBoundary_0208
     * @tc.desc      notification boundary 207 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0208 begin`);
      logInfo("notification boundary 207");
      const actual: string = nextNotificationId(207) + '|' + badgeAfterAdd(207) + '|' + badgeAfterSet(207) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "208|208|207|1|0|1|");
      expect(actual).assertEqual("208|208|207|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0208 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0209
     * @tc.name      VPN_NotifBoundary_0209
     * @tc.desc      notification boundary 208 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0209 begin`);
      logInfo("notification boundary 208");
      const actual: string = nextNotificationId(208) + '|' + badgeAfterAdd(208) + '|' + badgeAfterSet(208) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g208");
      logInfo('actual=' + String(actual) + ', expected=' + "209|209|208|1|0|0|g208");
      expect(actual).assertEqual("209|209|208|1|0|0|g208");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0209 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0210
     * @tc.name      VPN_NotifBoundary_0210
     * @tc.desc      notification boundary 209 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0210 begin`);
      logInfo("notification boundary 209");
      const actual: string = nextNotificationId(209) + '|' + badgeAfterAdd(209) + '|' + badgeAfterSet(209) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g209");
      logInfo('actual=' + String(actual) + ', expected=' + "210|210|209|1|0|1|g209");
      expect(actual).assertEqual("210|210|209|1|0|1|g209");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0210 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0211
     * @tc.name      VPN_NotifBoundary_0211
     * @tc.desc      notification boundary 210 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0211 begin`);
      logInfo("notification boundary 210");
      const actual: string = nextNotificationId(210) + '|' + badgeAfterAdd(210) + '|' + badgeAfterSet(210) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "211|211|210|1|1|0|");
      expect(actual).assertEqual("211|211|210|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0211 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0212
     * @tc.name      VPN_NotifBoundary_0212
     * @tc.desc      notification boundary 211 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0212 begin`);
      logInfo("notification boundary 211");
      const actual: string = nextNotificationId(211) + '|' + badgeAfterAdd(211) + '|' + badgeAfterSet(211) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g211");
      logInfo('actual=' + String(actual) + ', expected=' + "212|212|211|1|1|1|g211");
      expect(actual).assertEqual("212|212|211|1|1|1|g211");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0212 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0213
     * @tc.name      VPN_NotifBoundary_0213
     * @tc.desc      notification boundary 212 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0213 begin`);
      logInfo("notification boundary 212");
      const actual: string = nextNotificationId(212) + '|' + badgeAfterAdd(212) + '|' + badgeAfterSet(212) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g212");
      logInfo('actual=' + String(actual) + ', expected=' + "213|213|212|1|1|0|g212");
      expect(actual).assertEqual("213|213|212|1|1|0|g212");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0213 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0214
     * @tc.name      VPN_NotifBoundary_0214
     * @tc.desc      notification boundary 213 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0214 begin`);
      logInfo("notification boundary 213");
      const actual: string = nextNotificationId(213) + '|' + badgeAfterAdd(213) + '|' + badgeAfterSet(213) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "214|214|213|1|1|1|");
      expect(actual).assertEqual("214|214|213|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0214 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0215
     * @tc.name      VPN_NotifBoundary_0215
     * @tc.desc      notification boundary 214 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0215 begin`);
      logInfo("notification boundary 214");
      const actual: string = nextNotificationId(214) + '|' + badgeAfterAdd(214) + '|' + badgeAfterSet(214) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g214");
      logInfo('actual=' + String(actual) + ', expected=' + "215|215|214|1|1|0|g214");
      expect(actual).assertEqual("215|215|214|1|1|0|g214");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0215 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0216
     * @tc.name      VPN_NotifBoundary_0216
     * @tc.desc      notification boundary 215 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0216 begin`);
      logInfo("notification boundary 215");
      const actual: string = nextNotificationId(215) + '|' + badgeAfterAdd(215) + '|' + badgeAfterSet(215) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g215");
      logInfo('actual=' + String(actual) + ', expected=' + "216|216|215|1|1|1|g215");
      expect(actual).assertEqual("216|216|215|1|1|1|g215");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0216 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0217
     * @tc.name      VPN_NotifBoundary_0217
     * @tc.desc      notification boundary 216 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0217 begin`);
      logInfo("notification boundary 216");
      const actual: string = nextNotificationId(216) + '|' + badgeAfterAdd(216) + '|' + badgeAfterSet(216) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "217|217|216|1|0|0|");
      expect(actual).assertEqual("217|217|216|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0217 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0218
     * @tc.name      VPN_NotifBoundary_0218
     * @tc.desc      notification boundary 217 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0218 begin`);
      logInfo("notification boundary 217");
      const actual: string = nextNotificationId(217) + '|' + badgeAfterAdd(217) + '|' + badgeAfterSet(217) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g217");
      logInfo('actual=' + String(actual) + ', expected=' + "218|218|217|1|0|1|g217");
      expect(actual).assertEqual("218|218|217|1|0|1|g217");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0218 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0219
     * @tc.name      VPN_NotifBoundary_0219
     * @tc.desc      notification boundary 218 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0219 begin`);
      logInfo("notification boundary 218");
      const actual: string = nextNotificationId(218) + '|' + badgeAfterAdd(218) + '|' + badgeAfterSet(218) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g218");
      logInfo('actual=' + String(actual) + ', expected=' + "219|219|218|1|0|0|g218");
      expect(actual).assertEqual("219|219|218|1|0|0|g218");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0219 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0220
     * @tc.name      VPN_NotifBoundary_0220
     * @tc.desc      notification boundary 219 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0220 begin`);
      logInfo("notification boundary 219");
      const actual: string = nextNotificationId(219) + '|' + badgeAfterAdd(219) + '|' + badgeAfterSet(219) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "220|220|219|1|0|1|");
      expect(actual).assertEqual("220|220|219|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0220 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0221
     * @tc.name      VPN_NotifBoundary_0221
     * @tc.desc      notification boundary 220 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0221 begin`);
      logInfo("notification boundary 220");
      const actual: string = nextNotificationId(220) + '|' + badgeAfterAdd(220) + '|' + badgeAfterSet(220) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g220");
      logInfo('actual=' + String(actual) + ', expected=' + "221|221|220|1|0|0|g220");
      expect(actual).assertEqual("221|221|220|1|0|0|g220");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0221 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0222
     * @tc.name      VPN_NotifBoundary_0222
     * @tc.desc      notification boundary 221 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0222 begin`);
      logInfo("notification boundary 221");
      const actual: string = nextNotificationId(221) + '|' + badgeAfterAdd(221) + '|' + badgeAfterSet(221) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g221");
      logInfo('actual=' + String(actual) + ', expected=' + "222|222|221|1|0|1|g221");
      expect(actual).assertEqual("222|222|221|1|0|1|g221");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0222 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0223
     * @tc.name      VPN_NotifBoundary_0223
     * @tc.desc      notification boundary 222 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0223 begin`);
      logInfo("notification boundary 222");
      const actual: string = nextNotificationId(222) + '|' + badgeAfterAdd(222) + '|' + badgeAfterSet(222) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "223|223|222|1|0|0|");
      expect(actual).assertEqual("223|223|222|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0223 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0224
     * @tc.name      VPN_NotifBoundary_0224
     * @tc.desc      notification boundary 223 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0224 begin`);
      logInfo("notification boundary 223");
      const actual: string = nextNotificationId(223) + '|' + badgeAfterAdd(223) + '|' + badgeAfterSet(223) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g223");
      logInfo('actual=' + String(actual) + ', expected=' + "224|224|223|1|0|1|g223");
      expect(actual).assertEqual("224|224|223|1|0|1|g223");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0224 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0225
     * @tc.name      VPN_NotifBoundary_0225
     * @tc.desc      notification boundary 224 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0225 begin`);
      logInfo("notification boundary 224");
      const actual: string = nextNotificationId(224) + '|' + badgeAfterAdd(224) + '|' + badgeAfterSet(224) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g224");
      logInfo('actual=' + String(actual) + ', expected=' + "225|225|224|1|0|0|g224");
      expect(actual).assertEqual("225|225|224|1|0|0|g224");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0225 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0226
     * @tc.name      VPN_NotifBoundary_0226
     * @tc.desc      notification boundary 225 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0226 begin`);
      logInfo("notification boundary 225");
      const actual: string = nextNotificationId(225) + '|' + badgeAfterAdd(225) + '|' + badgeAfterSet(225) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "226|226|225|1|0|1|");
      expect(actual).assertEqual("226|226|225|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0226 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0227
     * @tc.name      VPN_NotifBoundary_0227
     * @tc.desc      notification boundary 226 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0227 begin`);
      logInfo("notification boundary 226");
      const actual: string = nextNotificationId(226) + '|' + badgeAfterAdd(226) + '|' + badgeAfterSet(226) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g226");
      logInfo('actual=' + String(actual) + ', expected=' + "227|227|226|1|0|0|g226");
      expect(actual).assertEqual("227|227|226|1|0|0|g226");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0227 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0228
     * @tc.name      VPN_NotifBoundary_0228
     * @tc.desc      notification boundary 227 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0228 begin`);
      logInfo("notification boundary 227");
      const actual: string = nextNotificationId(227) + '|' + badgeAfterAdd(227) + '|' + badgeAfterSet(227) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g227");
      logInfo('actual=' + String(actual) + ', expected=' + "228|228|227|1|0|1|g227");
      expect(actual).assertEqual("228|228|227|1|0|1|g227");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0228 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0229
     * @tc.name      VPN_NotifBoundary_0229
     * @tc.desc      notification boundary 228 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0229 begin`);
      logInfo("notification boundary 228");
      const actual: string = nextNotificationId(228) + '|' + badgeAfterAdd(228) + '|' + badgeAfterSet(228) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "229|229|228|1|0|0|");
      expect(actual).assertEqual("229|229|228|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0229 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0230
     * @tc.name      VPN_NotifBoundary_0230
     * @tc.desc      notification boundary 229 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0230 begin`);
      logInfo("notification boundary 229");
      const actual: string = nextNotificationId(229) + '|' + badgeAfterAdd(229) + '|' + badgeAfterSet(229) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g229");
      logInfo('actual=' + String(actual) + ', expected=' + "230|230|229|1|0|1|g229");
      expect(actual).assertEqual("230|230|229|1|0|1|g229");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0230 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0231
     * @tc.name      VPN_NotifBoundary_0231
     * @tc.desc      notification boundary 230 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0231 begin`);
      logInfo("notification boundary 230");
      const actual: string = nextNotificationId(230) + '|' + badgeAfterAdd(230) + '|' + badgeAfterSet(230) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g230");
      logInfo('actual=' + String(actual) + ', expected=' + "231|231|230|1|0|0|g230");
      expect(actual).assertEqual("231|231|230|1|0|0|g230");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0231 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0232
     * @tc.name      VPN_NotifBoundary_0232
     * @tc.desc      notification boundary 231 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0232 begin`);
      logInfo("notification boundary 231");
      const actual: string = nextNotificationId(231) + '|' + badgeAfterAdd(231) + '|' + badgeAfterSet(231) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "232|232|231|1|0|1|");
      expect(actual).assertEqual("232|232|231|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0232 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0233
     * @tc.name      VPN_NotifBoundary_0233
     * @tc.desc      notification boundary 232 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0233 begin`);
      logInfo("notification boundary 232");
      const actual: string = nextNotificationId(232) + '|' + badgeAfterAdd(232) + '|' + badgeAfterSet(232) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g232");
      logInfo('actual=' + String(actual) + ', expected=' + "233|233|232|1|0|0|g232");
      expect(actual).assertEqual("233|233|232|1|0|0|g232");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0233 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0234
     * @tc.name      VPN_NotifBoundary_0234
     * @tc.desc      notification boundary 233 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0234 begin`);
      logInfo("notification boundary 233");
      const actual: string = nextNotificationId(233) + '|' + badgeAfterAdd(233) + '|' + badgeAfterSet(233) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g233");
      logInfo('actual=' + String(actual) + ', expected=' + "234|234|233|1|0|1|g233");
      expect(actual).assertEqual("234|234|233|1|0|1|g233");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0234 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0235
     * @tc.name      VPN_NotifBoundary_0235
     * @tc.desc      notification boundary 234 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0235 begin`);
      logInfo("notification boundary 234");
      const actual: string = nextNotificationId(234) + '|' + badgeAfterAdd(234) + '|' + badgeAfterSet(234) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "235|235|234|1|0|0|");
      expect(actual).assertEqual("235|235|234|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0235 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0236
     * @tc.name      VPN_NotifBoundary_0236
     * @tc.desc      notification boundary 235 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0236 begin`);
      logInfo("notification boundary 235");
      const actual: string = nextNotificationId(235) + '|' + badgeAfterAdd(235) + '|' + badgeAfterSet(235) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g235");
      logInfo('actual=' + String(actual) + ', expected=' + "236|236|235|1|0|1|g235");
      expect(actual).assertEqual("236|236|235|1|0|1|g235");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0236 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0237
     * @tc.name      VPN_NotifBoundary_0237
     * @tc.desc      notification boundary 236 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0237 begin`);
      logInfo("notification boundary 236");
      const actual: string = nextNotificationId(236) + '|' + badgeAfterAdd(236) + '|' + badgeAfterSet(236) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g236");
      logInfo('actual=' + String(actual) + ', expected=' + "237|237|236|1|0|0|g236");
      expect(actual).assertEqual("237|237|236|1|0|0|g236");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0237 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0238
     * @tc.name      VPN_NotifBoundary_0238
     * @tc.desc      notification boundary 237 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0238 begin`);
      logInfo("notification boundary 237");
      const actual: string = nextNotificationId(237) + '|' + badgeAfterAdd(237) + '|' + badgeAfterSet(237) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "238|238|237|1|0|1|");
      expect(actual).assertEqual("238|238|237|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0238 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0239
     * @tc.name      VPN_NotifBoundary_0239
     * @tc.desc      notification boundary 238 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0239 begin`);
      logInfo("notification boundary 238");
      const actual: string = nextNotificationId(238) + '|' + badgeAfterAdd(238) + '|' + badgeAfterSet(238) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g238");
      logInfo('actual=' + String(actual) + ', expected=' + "239|239|238|1|0|0|g238");
      expect(actual).assertEqual("239|239|238|1|0|0|g238");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0239 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0240
     * @tc.name      VPN_NotifBoundary_0240
     * @tc.desc      notification boundary 239 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0240 begin`);
      logInfo("notification boundary 239");
      const actual: string = nextNotificationId(239) + '|' + badgeAfterAdd(239) + '|' + badgeAfterSet(239) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g239");
      logInfo('actual=' + String(actual) + ', expected=' + "240|240|239|1|0|1|g239");
      expect(actual).assertEqual("240|240|239|1|0|1|g239");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0240 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0241
     * @tc.name      VPN_NotifBoundary_0241
     * @tc.desc      notification boundary 240 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0241 begin`);
      logInfo("notification boundary 240");
      const actual: string = nextNotificationId(240) + '|' + badgeAfterAdd(240) + '|' + badgeAfterSet(240) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "241|241|240|1|0|0|");
      expect(actual).assertEqual("241|241|240|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0241 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0242
     * @tc.name      VPN_NotifBoundary_0242
     * @tc.desc      notification boundary 241 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0242 begin`);
      logInfo("notification boundary 241");
      const actual: string = nextNotificationId(241) + '|' + badgeAfterAdd(241) + '|' + badgeAfterSet(241) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g241");
      logInfo('actual=' + String(actual) + ', expected=' + "242|242|241|1|0|1|g241");
      expect(actual).assertEqual("242|242|241|1|0|1|g241");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0242 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0243
     * @tc.name      VPN_NotifBoundary_0243
     * @tc.desc      notification boundary 242 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0243 begin`);
      logInfo("notification boundary 242");
      const actual: string = nextNotificationId(242) + '|' + badgeAfterAdd(242) + '|' + badgeAfterSet(242) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g242");
      logInfo('actual=' + String(actual) + ', expected=' + "243|243|242|1|0|0|g242");
      expect(actual).assertEqual("243|243|242|1|0|0|g242");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0243 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0244
     * @tc.name      VPN_NotifBoundary_0244
     * @tc.desc      notification boundary 243 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0244 begin`);
      logInfo("notification boundary 243");
      const actual: string = nextNotificationId(243) + '|' + badgeAfterAdd(243) + '|' + badgeAfterSet(243) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "244|244|243|1|0|1|");
      expect(actual).assertEqual("244|244|243|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0244 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0245
     * @tc.name      VPN_NotifBoundary_0245
     * @tc.desc      notification boundary 244 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0245 begin`);
      logInfo("notification boundary 244");
      const actual: string = nextNotificationId(244) + '|' + badgeAfterAdd(244) + '|' + badgeAfterSet(244) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g244");
      logInfo('actual=' + String(actual) + ', expected=' + "245|245|244|1|0|0|g244");
      expect(actual).assertEqual("245|245|244|1|0|0|g244");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0245 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0246
     * @tc.name      VPN_NotifBoundary_0246
     * @tc.desc      notification boundary 245 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0246 begin`);
      logInfo("notification boundary 245");
      const actual: string = nextNotificationId(245) + '|' + badgeAfterAdd(245) + '|' + badgeAfterSet(245) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g245");
      logInfo('actual=' + String(actual) + ', expected=' + "246|246|245|1|0|1|g245");
      expect(actual).assertEqual("246|246|245|1|0|1|g245");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0246 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0247
     * @tc.name      VPN_NotifBoundary_0247
     * @tc.desc      notification boundary 246 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0247 begin`);
      logInfo("notification boundary 246");
      const actual: string = nextNotificationId(246) + '|' + badgeAfterAdd(246) + '|' + badgeAfterSet(246) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "247|247|246|1|0|0|");
      expect(actual).assertEqual("247|247|246|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0247 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0248
     * @tc.name      VPN_NotifBoundary_0248
     * @tc.desc      notification boundary 247 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0248 begin`);
      logInfo("notification boundary 247");
      const actual: string = nextNotificationId(247) + '|' + badgeAfterAdd(247) + '|' + badgeAfterSet(247) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g247");
      logInfo('actual=' + String(actual) + ', expected=' + "248|248|247|1|0|1|g247");
      expect(actual).assertEqual("248|248|247|1|0|1|g247");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0248 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0249
     * @tc.name      VPN_NotifBoundary_0249
     * @tc.desc      notification boundary 248 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0249 begin`);
      logInfo("notification boundary 248");
      const actual: string = nextNotificationId(248) + '|' + badgeAfterAdd(248) + '|' + badgeAfterSet(248) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g248");
      logInfo('actual=' + String(actual) + ', expected=' + "249|249|248|1|0|0|g248");
      expect(actual).assertEqual("249|249|248|1|0|0|g248");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0249 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0250
     * @tc.name      VPN_NotifBoundary_0250
     * @tc.desc      notification boundary 249 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0250 begin`);
      logInfo("notification boundary 249");
      const actual: string = nextNotificationId(249) + '|' + badgeAfterAdd(249) + '|' + badgeAfterSet(249) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "250|250|249|1|0|1|");
      expect(actual).assertEqual("250|250|249|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0250 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0251
     * @tc.name      VPN_NotifBoundary_0251
     * @tc.desc      notification boundary 250 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0251 begin`);
      logInfo("notification boundary 250");
      const actual: string = nextNotificationId(250) + '|' + badgeAfterAdd(250) + '|' + badgeAfterSet(250) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g250");
      logInfo('actual=' + String(actual) + ', expected=' + "251|251|250|1|0|0|g250");
      expect(actual).assertEqual("251|251|250|1|0|0|g250");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0251 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0252
     * @tc.name      VPN_NotifBoundary_0252
     * @tc.desc      notification boundary 251 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0252 begin`);
      logInfo("notification boundary 251");
      const actual: string = nextNotificationId(251) + '|' + badgeAfterAdd(251) + '|' + badgeAfterSet(251) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g251");
      logInfo('actual=' + String(actual) + ', expected=' + "252|252|251|1|0|1|g251");
      expect(actual).assertEqual("252|252|251|1|0|1|g251");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0252 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0253
     * @tc.name      VPN_NotifBoundary_0253
     * @tc.desc      notification boundary 252 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0253 begin`);
      logInfo("notification boundary 252");
      const actual: string = nextNotificationId(252) + '|' + badgeAfterAdd(252) + '|' + badgeAfterSet(252) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "253|253|252|1|1|0|");
      expect(actual).assertEqual("253|253|252|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0253 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0254
     * @tc.name      VPN_NotifBoundary_0254
     * @tc.desc      notification boundary 253 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0254 begin`);
      logInfo("notification boundary 253");
      const actual: string = nextNotificationId(253) + '|' + badgeAfterAdd(253) + '|' + badgeAfterSet(253) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g253");
      logInfo('actual=' + String(actual) + ', expected=' + "254|254|253|1|1|1|g253");
      expect(actual).assertEqual("254|254|253|1|1|1|g253");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0254 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0255
     * @tc.name      VPN_NotifBoundary_0255
     * @tc.desc      notification boundary 254 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0255 begin`);
      logInfo("notification boundary 254");
      const actual: string = nextNotificationId(254) + '|' + badgeAfterAdd(254) + '|' + badgeAfterSet(254) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g254");
      logInfo('actual=' + String(actual) + ', expected=' + "255|255|254|1|1|0|g254");
      expect(actual).assertEqual("255|255|254|1|1|0|g254");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0255 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0256
     * @tc.name      VPN_NotifBoundary_0256
     * @tc.desc      notification boundary 255 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0256 begin`);
      logInfo("notification boundary 255");
      const actual: string = nextNotificationId(255) + '|' + badgeAfterAdd(255) + '|' + badgeAfterSet(255) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "256|256|255|1|1|1|");
      expect(actual).assertEqual("256|256|255|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0256 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0257
     * @tc.name      VPN_NotifBoundary_0257
     * @tc.desc      notification boundary 256 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0257 begin`);
      logInfo("notification boundary 256");
      const actual: string = nextNotificationId(256) + '|' + badgeAfterAdd(256) + '|' + badgeAfterSet(256) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g256");
      logInfo('actual=' + String(actual) + ', expected=' + "257|257|256|1|1|0|g256");
      expect(actual).assertEqual("257|257|256|1|1|0|g256");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0257 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0258
     * @tc.name      VPN_NotifBoundary_0258
     * @tc.desc      notification boundary 257 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0258 begin`);
      logInfo("notification boundary 257");
      const actual: string = nextNotificationId(257) + '|' + badgeAfterAdd(257) + '|' + badgeAfterSet(257) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g257");
      logInfo('actual=' + String(actual) + ', expected=' + "258|258|257|1|1|1|g257");
      expect(actual).assertEqual("258|258|257|1|1|1|g257");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0258 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0259
     * @tc.name      VPN_NotifBoundary_0259
     * @tc.desc      notification boundary 258 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0259 begin`);
      logInfo("notification boundary 258");
      const actual: string = nextNotificationId(258) + '|' + badgeAfterAdd(258) + '|' + badgeAfterSet(258) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "259|259|258|1|0|0|");
      expect(actual).assertEqual("259|259|258|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0259 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0260
     * @tc.name      VPN_NotifBoundary_0260
     * @tc.desc      notification boundary 259 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0260 begin`);
      logInfo("notification boundary 259");
      const actual: string = nextNotificationId(259) + '|' + badgeAfterAdd(259) + '|' + badgeAfterSet(259) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g259");
      logInfo('actual=' + String(actual) + ', expected=' + "260|260|259|1|0|1|g259");
      expect(actual).assertEqual("260|260|259|1|0|1|g259");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0260 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0261
     * @tc.name      VPN_NotifBoundary_0261
     * @tc.desc      notification boundary 260 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0261 begin`);
      logInfo("notification boundary 260");
      const actual: string = nextNotificationId(260) + '|' + badgeAfterAdd(260) + '|' + badgeAfterSet(260) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g260");
      logInfo('actual=' + String(actual) + ', expected=' + "261|261|260|1|0|0|g260");
      expect(actual).assertEqual("261|261|260|1|0|0|g260");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0261 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0262
     * @tc.name      VPN_NotifBoundary_0262
     * @tc.desc      notification boundary 261 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0262 begin`);
      logInfo("notification boundary 261");
      const actual: string = nextNotificationId(261) + '|' + badgeAfterAdd(261) + '|' + badgeAfterSet(261) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "262|262|261|1|0|1|");
      expect(actual).assertEqual("262|262|261|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0262 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0263
     * @tc.name      VPN_NotifBoundary_0263
     * @tc.desc      notification boundary 262 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0263 begin`);
      logInfo("notification boundary 262");
      const actual: string = nextNotificationId(262) + '|' + badgeAfterAdd(262) + '|' + badgeAfterSet(262) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g262");
      logInfo('actual=' + String(actual) + ', expected=' + "263|263|262|1|0|0|g262");
      expect(actual).assertEqual("263|263|262|1|0|0|g262");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0263 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0264
     * @tc.name      VPN_NotifBoundary_0264
     * @tc.desc      notification boundary 263 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0264 begin`);
      logInfo("notification boundary 263");
      const actual: string = nextNotificationId(263) + '|' + badgeAfterAdd(263) + '|' + badgeAfterSet(263) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g263");
      logInfo('actual=' + String(actual) + ', expected=' + "264|264|263|1|0|1|g263");
      expect(actual).assertEqual("264|264|263|1|0|1|g263");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0264 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0265
     * @tc.name      VPN_NotifBoundary_0265
     * @tc.desc      notification boundary 264 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0265 begin`);
      logInfo("notification boundary 264");
      const actual: string = nextNotificationId(264) + '|' + badgeAfterAdd(264) + '|' + badgeAfterSet(264) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "265|265|264|1|0|0|");
      expect(actual).assertEqual("265|265|264|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0265 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0266
     * @tc.name      VPN_NotifBoundary_0266
     * @tc.desc      notification boundary 265 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0266 begin`);
      logInfo("notification boundary 265");
      const actual: string = nextNotificationId(265) + '|' + badgeAfterAdd(265) + '|' + badgeAfterSet(265) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g265");
      logInfo('actual=' + String(actual) + ', expected=' + "266|266|265|1|0|1|g265");
      expect(actual).assertEqual("266|266|265|1|0|1|g265");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0266 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0267
     * @tc.name      VPN_NotifBoundary_0267
     * @tc.desc      notification boundary 266 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0267 begin`);
      logInfo("notification boundary 266");
      const actual: string = nextNotificationId(266) + '|' + badgeAfterAdd(266) + '|' + badgeAfterSet(266) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g266");
      logInfo('actual=' + String(actual) + ', expected=' + "267|267|266|1|0|0|g266");
      expect(actual).assertEqual("267|267|266|1|0|0|g266");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0267 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0268
     * @tc.name      VPN_NotifBoundary_0268
     * @tc.desc      notification boundary 267 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0268 begin`);
      logInfo("notification boundary 267");
      const actual: string = nextNotificationId(267) + '|' + badgeAfterAdd(267) + '|' + badgeAfterSet(267) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "268|268|267|1|0|1|");
      expect(actual).assertEqual("268|268|267|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0268 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0269
     * @tc.name      VPN_NotifBoundary_0269
     * @tc.desc      notification boundary 268 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0269 begin`);
      logInfo("notification boundary 268");
      const actual: string = nextNotificationId(268) + '|' + badgeAfterAdd(268) + '|' + badgeAfterSet(268) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g268");
      logInfo('actual=' + String(actual) + ', expected=' + "269|269|268|1|0|0|g268");
      expect(actual).assertEqual("269|269|268|1|0|0|g268");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0269 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0270
     * @tc.name      VPN_NotifBoundary_0270
     * @tc.desc      notification boundary 269 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0270 begin`);
      logInfo("notification boundary 269");
      const actual: string = nextNotificationId(269) + '|' + badgeAfterAdd(269) + '|' + badgeAfterSet(269) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g269");
      logInfo('actual=' + String(actual) + ', expected=' + "270|270|269|1|0|1|g269");
      expect(actual).assertEqual("270|270|269|1|0|1|g269");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0270 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0271
     * @tc.name      VPN_NotifBoundary_0271
     * @tc.desc      notification boundary 270 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0271 begin`);
      logInfo("notification boundary 270");
      const actual: string = nextNotificationId(270) + '|' + badgeAfterAdd(270) + '|' + badgeAfterSet(270) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "271|271|270|1|0|0|");
      expect(actual).assertEqual("271|271|270|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0271 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0272
     * @tc.name      VPN_NotifBoundary_0272
     * @tc.desc      notification boundary 271 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0272 begin`);
      logInfo("notification boundary 271");
      const actual: string = nextNotificationId(271) + '|' + badgeAfterAdd(271) + '|' + badgeAfterSet(271) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g271");
      logInfo('actual=' + String(actual) + ', expected=' + "272|272|271|1|0|1|g271");
      expect(actual).assertEqual("272|272|271|1|0|1|g271");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0272 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0273
     * @tc.name      VPN_NotifBoundary_0273
     * @tc.desc      notification boundary 272 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0273 begin`);
      logInfo("notification boundary 272");
      const actual: string = nextNotificationId(272) + '|' + badgeAfterAdd(272) + '|' + badgeAfterSet(272) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g272");
      logInfo('actual=' + String(actual) + ', expected=' + "273|273|272|1|0|0|g272");
      expect(actual).assertEqual("273|273|272|1|0|0|g272");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0273 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0274
     * @tc.name      VPN_NotifBoundary_0274
     * @tc.desc      notification boundary 273 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0274 begin`);
      logInfo("notification boundary 273");
      const actual: string = nextNotificationId(273) + '|' + badgeAfterAdd(273) + '|' + badgeAfterSet(273) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "274|274|273|1|0|1|");
      expect(actual).assertEqual("274|274|273|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0274 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0275
     * @tc.name      VPN_NotifBoundary_0275
     * @tc.desc      notification boundary 274 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0275 begin`);
      logInfo("notification boundary 274");
      const actual: string = nextNotificationId(274) + '|' + badgeAfterAdd(274) + '|' + badgeAfterSet(274) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g274");
      logInfo('actual=' + String(actual) + ', expected=' + "275|275|274|1|0|0|g274");
      expect(actual).assertEqual("275|275|274|1|0|0|g274");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0275 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0276
     * @tc.name      VPN_NotifBoundary_0276
     * @tc.desc      notification boundary 275 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0276 begin`);
      logInfo("notification boundary 275");
      const actual: string = nextNotificationId(275) + '|' + badgeAfterAdd(275) + '|' + badgeAfterSet(275) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g275");
      logInfo('actual=' + String(actual) + ', expected=' + "276|276|275|1|0|1|g275");
      expect(actual).assertEqual("276|276|275|1|0|1|g275");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0276 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0277
     * @tc.name      VPN_NotifBoundary_0277
     * @tc.desc      notification boundary 276 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0277 begin`);
      logInfo("notification boundary 276");
      const actual: string = nextNotificationId(276) + '|' + badgeAfterAdd(276) + '|' + badgeAfterSet(276) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "277|277|276|1|0|0|");
      expect(actual).assertEqual("277|277|276|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0277 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0278
     * @tc.name      VPN_NotifBoundary_0278
     * @tc.desc      notification boundary 277 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0278 begin`);
      logInfo("notification boundary 277");
      const actual: string = nextNotificationId(277) + '|' + badgeAfterAdd(277) + '|' + badgeAfterSet(277) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g277");
      logInfo('actual=' + String(actual) + ', expected=' + "278|278|277|1|0|1|g277");
      expect(actual).assertEqual("278|278|277|1|0|1|g277");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0278 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0279
     * @tc.name      VPN_NotifBoundary_0279
     * @tc.desc      notification boundary 278 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0279 begin`);
      logInfo("notification boundary 278");
      const actual: string = nextNotificationId(278) + '|' + badgeAfterAdd(278) + '|' + badgeAfterSet(278) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g278");
      logInfo('actual=' + String(actual) + ', expected=' + "279|279|278|1|0|0|g278");
      expect(actual).assertEqual("279|279|278|1|0|0|g278");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0279 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0280
     * @tc.name      VPN_NotifBoundary_0280
     * @tc.desc      notification boundary 279 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0280 begin`);
      logInfo("notification boundary 279");
      const actual: string = nextNotificationId(279) + '|' + badgeAfterAdd(279) + '|' + badgeAfterSet(279) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "280|280|279|1|0|1|");
      expect(actual).assertEqual("280|280|279|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0280 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0281
     * @tc.name      VPN_NotifBoundary_0281
     * @tc.desc      notification boundary 280 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0281 begin`);
      logInfo("notification boundary 280");
      const actual: string = nextNotificationId(280) + '|' + badgeAfterAdd(280) + '|' + badgeAfterSet(280) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g280");
      logInfo('actual=' + String(actual) + ', expected=' + "281|281|280|1|0|0|g280");
      expect(actual).assertEqual("281|281|280|1|0|0|g280");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0281 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0282
     * @tc.name      VPN_NotifBoundary_0282
     * @tc.desc      notification boundary 281 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0282 begin`);
      logInfo("notification boundary 281");
      const actual: string = nextNotificationId(281) + '|' + badgeAfterAdd(281) + '|' + badgeAfterSet(281) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g281");
      logInfo('actual=' + String(actual) + ', expected=' + "282|282|281|1|0|1|g281");
      expect(actual).assertEqual("282|282|281|1|0|1|g281");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0282 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0283
     * @tc.name      VPN_NotifBoundary_0283
     * @tc.desc      notification boundary 282 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0283 begin`);
      logInfo("notification boundary 282");
      const actual: string = nextNotificationId(282) + '|' + badgeAfterAdd(282) + '|' + badgeAfterSet(282) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "283|283|282|1|0|0|");
      expect(actual).assertEqual("283|283|282|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0283 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0284
     * @tc.name      VPN_NotifBoundary_0284
     * @tc.desc      notification boundary 283 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0284 begin`);
      logInfo("notification boundary 283");
      const actual: string = nextNotificationId(283) + '|' + badgeAfterAdd(283) + '|' + badgeAfterSet(283) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g283");
      logInfo('actual=' + String(actual) + ', expected=' + "284|284|283|1|0|1|g283");
      expect(actual).assertEqual("284|284|283|1|0|1|g283");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0284 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0285
     * @tc.name      VPN_NotifBoundary_0285
     * @tc.desc      notification boundary 284 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0285 begin`);
      logInfo("notification boundary 284");
      const actual: string = nextNotificationId(284) + '|' + badgeAfterAdd(284) + '|' + badgeAfterSet(284) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g284");
      logInfo('actual=' + String(actual) + ', expected=' + "285|285|284|1|0|0|g284");
      expect(actual).assertEqual("285|285|284|1|0|0|g284");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0285 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0286
     * @tc.name      VPN_NotifBoundary_0286
     * @tc.desc      notification boundary 285 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0286 begin`);
      logInfo("notification boundary 285");
      const actual: string = nextNotificationId(285) + '|' + badgeAfterAdd(285) + '|' + badgeAfterSet(285) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "286|286|285|1|0|1|");
      expect(actual).assertEqual("286|286|285|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0286 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0287
     * @tc.name      VPN_NotifBoundary_0287
     * @tc.desc      notification boundary 286 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0287 begin`);
      logInfo("notification boundary 286");
      const actual: string = nextNotificationId(286) + '|' + badgeAfterAdd(286) + '|' + badgeAfterSet(286) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g286");
      logInfo('actual=' + String(actual) + ', expected=' + "287|287|286|1|0|0|g286");
      expect(actual).assertEqual("287|287|286|1|0|0|g286");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0287 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0288
     * @tc.name      VPN_NotifBoundary_0288
     * @tc.desc      notification boundary 287 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0288 begin`);
      logInfo("notification boundary 287");
      const actual: string = nextNotificationId(287) + '|' + badgeAfterAdd(287) + '|' + badgeAfterSet(287) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g287");
      logInfo('actual=' + String(actual) + ', expected=' + "288|288|287|1|0|1|g287");
      expect(actual).assertEqual("288|288|287|1|0|1|g287");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0288 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0289
     * @tc.name      VPN_NotifBoundary_0289
     * @tc.desc      notification boundary 288 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0289 begin`);
      logInfo("notification boundary 288");
      const actual: string = nextNotificationId(288) + '|' + badgeAfterAdd(288) + '|' + badgeAfterSet(288) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "289|289|288|1|0|0|");
      expect(actual).assertEqual("289|289|288|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0289 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0290
     * @tc.name      VPN_NotifBoundary_0290
     * @tc.desc      notification boundary 289 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0290 begin`);
      logInfo("notification boundary 289");
      const actual: string = nextNotificationId(289) + '|' + badgeAfterAdd(289) + '|' + badgeAfterSet(289) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g289");
      logInfo('actual=' + String(actual) + ', expected=' + "290|290|289|1|0|1|g289");
      expect(actual).assertEqual("290|290|289|1|0|1|g289");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0290 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0291
     * @tc.name      VPN_NotifBoundary_0291
     * @tc.desc      notification boundary 290 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0291 begin`);
      logInfo("notification boundary 290");
      const actual: string = nextNotificationId(290) + '|' + badgeAfterAdd(290) + '|' + badgeAfterSet(290) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g290");
      logInfo('actual=' + String(actual) + ', expected=' + "291|291|290|1|0|0|g290");
      expect(actual).assertEqual("291|291|290|1|0|0|g290");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0291 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0292
     * @tc.name      VPN_NotifBoundary_0292
     * @tc.desc      notification boundary 291 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0292 begin`);
      logInfo("notification boundary 291");
      const actual: string = nextNotificationId(291) + '|' + badgeAfterAdd(291) + '|' + badgeAfterSet(291) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "292|292|291|1|0|1|");
      expect(actual).assertEqual("292|292|291|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0292 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0293
     * @tc.name      VPN_NotifBoundary_0293
     * @tc.desc      notification boundary 292 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0293 begin`);
      logInfo("notification boundary 292");
      const actual: string = nextNotificationId(292) + '|' + badgeAfterAdd(292) + '|' + badgeAfterSet(292) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g292");
      logInfo('actual=' + String(actual) + ', expected=' + "293|293|292|1|0|0|g292");
      expect(actual).assertEqual("293|293|292|1|0|0|g292");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0293 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0294
     * @tc.name      VPN_NotifBoundary_0294
     * @tc.desc      notification boundary 293 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0294 begin`);
      logInfo("notification boundary 293");
      const actual: string = nextNotificationId(293) + '|' + badgeAfterAdd(293) + '|' + badgeAfterSet(293) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g293");
      logInfo('actual=' + String(actual) + ', expected=' + "294|294|293|1|0|1|g293");
      expect(actual).assertEqual("294|294|293|1|0|1|g293");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0294 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0295
     * @tc.name      VPN_NotifBoundary_0295
     * @tc.desc      notification boundary 294 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0295 begin`);
      logInfo("notification boundary 294");
      const actual: string = nextNotificationId(294) + '|' + badgeAfterAdd(294) + '|' + badgeAfterSet(294) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "295|295|294|1|1|0|");
      expect(actual).assertEqual("295|295|294|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0295 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0296
     * @tc.name      VPN_NotifBoundary_0296
     * @tc.desc      notification boundary 295 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0296 begin`);
      logInfo("notification boundary 295");
      const actual: string = nextNotificationId(295) + '|' + badgeAfterAdd(295) + '|' + badgeAfterSet(295) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g295");
      logInfo('actual=' + String(actual) + ', expected=' + "296|296|295|1|1|1|g295");
      expect(actual).assertEqual("296|296|295|1|1|1|g295");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0296 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0297
     * @tc.name      VPN_NotifBoundary_0297
     * @tc.desc      notification boundary 296 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0297 begin`);
      logInfo("notification boundary 296");
      const actual: string = nextNotificationId(296) + '|' + badgeAfterAdd(296) + '|' + badgeAfterSet(296) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g296");
      logInfo('actual=' + String(actual) + ', expected=' + "297|297|296|1|1|0|g296");
      expect(actual).assertEqual("297|297|296|1|1|0|g296");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0297 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0298
     * @tc.name      VPN_NotifBoundary_0298
     * @tc.desc      notification boundary 297 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0298 begin`);
      logInfo("notification boundary 297");
      const actual: string = nextNotificationId(297) + '|' + badgeAfterAdd(297) + '|' + badgeAfterSet(297) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "298|298|297|1|1|1|");
      expect(actual).assertEqual("298|298|297|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0298 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0299
     * @tc.name      VPN_NotifBoundary_0299
     * @tc.desc      notification boundary 298 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0299 begin`);
      logInfo("notification boundary 298");
      const actual: string = nextNotificationId(298) + '|' + badgeAfterAdd(298) + '|' + badgeAfterSet(298) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g298");
      logInfo('actual=' + String(actual) + ', expected=' + "299|299|298|1|1|0|g298");
      expect(actual).assertEqual("299|299|298|1|1|0|g298");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0299 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0300
     * @tc.name      VPN_NotifBoundary_0300
     * @tc.desc      notification boundary 299 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0300 begin`);
      logInfo("notification boundary 299");
      const actual: string = nextNotificationId(299) + '|' + badgeAfterAdd(299) + '|' + badgeAfterSet(299) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g299");
      logInfo('actual=' + String(actual) + ', expected=' + "300|300|299|1|1|1|g299");
      expect(actual).assertEqual("300|300|299|1|1|1|g299");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0300 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0301
     * @tc.name      VPN_NotifBoundary_0301
     * @tc.desc      notification boundary 300 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0301 begin`);
      logInfo("notification boundary 300");
      const actual: string = nextNotificationId(300) + '|' + badgeAfterAdd(300) + '|' + badgeAfterSet(300) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "301|301|300|1|0|0|");
      expect(actual).assertEqual("301|301|300|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0301 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0302
     * @tc.name      VPN_NotifBoundary_0302
     * @tc.desc      notification boundary 301 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0302 begin`);
      logInfo("notification boundary 301");
      const actual: string = nextNotificationId(301) + '|' + badgeAfterAdd(301) + '|' + badgeAfterSet(301) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g301");
      logInfo('actual=' + String(actual) + ', expected=' + "302|302|301|1|0|1|g301");
      expect(actual).assertEqual("302|302|301|1|0|1|g301");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0302 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0303
     * @tc.name      VPN_NotifBoundary_0303
     * @tc.desc      notification boundary 302 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0303 begin`);
      logInfo("notification boundary 302");
      const actual: string = nextNotificationId(302) + '|' + badgeAfterAdd(302) + '|' + badgeAfterSet(302) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g302");
      logInfo('actual=' + String(actual) + ', expected=' + "303|303|302|1|0|0|g302");
      expect(actual).assertEqual("303|303|302|1|0|0|g302");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0303 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0304
     * @tc.name      VPN_NotifBoundary_0304
     * @tc.desc      notification boundary 303 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0304 begin`);
      logInfo("notification boundary 303");
      const actual: string = nextNotificationId(303) + '|' + badgeAfterAdd(303) + '|' + badgeAfterSet(303) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "304|304|303|1|0|1|");
      expect(actual).assertEqual("304|304|303|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0304 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0305
     * @tc.name      VPN_NotifBoundary_0305
     * @tc.desc      notification boundary 304 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0305 begin`);
      logInfo("notification boundary 304");
      const actual: string = nextNotificationId(304) + '|' + badgeAfterAdd(304) + '|' + badgeAfterSet(304) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g304");
      logInfo('actual=' + String(actual) + ', expected=' + "305|305|304|1|0|0|g304");
      expect(actual).assertEqual("305|305|304|1|0|0|g304");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0305 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0306
     * @tc.name      VPN_NotifBoundary_0306
     * @tc.desc      notification boundary 305 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0306 begin`);
      logInfo("notification boundary 305");
      const actual: string = nextNotificationId(305) + '|' + badgeAfterAdd(305) + '|' + badgeAfterSet(305) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g305");
      logInfo('actual=' + String(actual) + ', expected=' + "306|306|305|1|0|1|g305");
      expect(actual).assertEqual("306|306|305|1|0|1|g305");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0306 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0307
     * @tc.name      VPN_NotifBoundary_0307
     * @tc.desc      notification boundary 306 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0307 begin`);
      logInfo("notification boundary 306");
      const actual: string = nextNotificationId(306) + '|' + badgeAfterAdd(306) + '|' + badgeAfterSet(306) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "307|307|306|1|0|0|");
      expect(actual).assertEqual("307|307|306|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0307 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0308
     * @tc.name      VPN_NotifBoundary_0308
     * @tc.desc      notification boundary 307 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0308 begin`);
      logInfo("notification boundary 307");
      const actual: string = nextNotificationId(307) + '|' + badgeAfterAdd(307) + '|' + badgeAfterSet(307) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g307");
      logInfo('actual=' + String(actual) + ', expected=' + "308|308|307|1|0|1|g307");
      expect(actual).assertEqual("308|308|307|1|0|1|g307");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0308 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0309
     * @tc.name      VPN_NotifBoundary_0309
     * @tc.desc      notification boundary 308 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0309 begin`);
      logInfo("notification boundary 308");
      const actual: string = nextNotificationId(308) + '|' + badgeAfterAdd(308) + '|' + badgeAfterSet(308) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g308");
      logInfo('actual=' + String(actual) + ', expected=' + "309|309|308|1|0|0|g308");
      expect(actual).assertEqual("309|309|308|1|0|0|g308");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0309 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0310
     * @tc.name      VPN_NotifBoundary_0310
     * @tc.desc      notification boundary 309 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0310 begin`);
      logInfo("notification boundary 309");
      const actual: string = nextNotificationId(309) + '|' + badgeAfterAdd(309) + '|' + badgeAfterSet(309) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "310|310|309|1|0|1|");
      expect(actual).assertEqual("310|310|309|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0310 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0311
     * @tc.name      VPN_NotifBoundary_0311
     * @tc.desc      notification boundary 310 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0311 begin`);
      logInfo("notification boundary 310");
      const actual: string = nextNotificationId(310) + '|' + badgeAfterAdd(310) + '|' + badgeAfterSet(310) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g310");
      logInfo('actual=' + String(actual) + ', expected=' + "311|311|310|1|0|0|g310");
      expect(actual).assertEqual("311|311|310|1|0|0|g310");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0311 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0312
     * @tc.name      VPN_NotifBoundary_0312
     * @tc.desc      notification boundary 311 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0312 begin`);
      logInfo("notification boundary 311");
      const actual: string = nextNotificationId(311) + '|' + badgeAfterAdd(311) + '|' + badgeAfterSet(311) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g311");
      logInfo('actual=' + String(actual) + ', expected=' + "312|312|311|1|0|1|g311");
      expect(actual).assertEqual("312|312|311|1|0|1|g311");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0312 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0313
     * @tc.name      VPN_NotifBoundary_0313
     * @tc.desc      notification boundary 312 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0313 begin`);
      logInfo("notification boundary 312");
      const actual: string = nextNotificationId(312) + '|' + badgeAfterAdd(312) + '|' + badgeAfterSet(312) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "313|313|312|1|0|0|");
      expect(actual).assertEqual("313|313|312|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0313 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0314
     * @tc.name      VPN_NotifBoundary_0314
     * @tc.desc      notification boundary 313 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0314 begin`);
      logInfo("notification boundary 313");
      const actual: string = nextNotificationId(313) + '|' + badgeAfterAdd(313) + '|' + badgeAfterSet(313) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g313");
      logInfo('actual=' + String(actual) + ', expected=' + "314|314|313|1|0|1|g313");
      expect(actual).assertEqual("314|314|313|1|0|1|g313");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0314 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0315
     * @tc.name      VPN_NotifBoundary_0315
     * @tc.desc      notification boundary 314 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0315 begin`);
      logInfo("notification boundary 314");
      const actual: string = nextNotificationId(314) + '|' + badgeAfterAdd(314) + '|' + badgeAfterSet(314) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g314");
      logInfo('actual=' + String(actual) + ', expected=' + "315|315|314|1|0|0|g314");
      expect(actual).assertEqual("315|315|314|1|0|0|g314");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0315 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0316
     * @tc.name      VPN_NotifBoundary_0316
     * @tc.desc      notification boundary 315 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0316 begin`);
      logInfo("notification boundary 315");
      const actual: string = nextNotificationId(315) + '|' + badgeAfterAdd(315) + '|' + badgeAfterSet(315) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "316|316|315|1|0|1|");
      expect(actual).assertEqual("316|316|315|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0316 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0317
     * @tc.name      VPN_NotifBoundary_0317
     * @tc.desc      notification boundary 316 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0317 begin`);
      logInfo("notification boundary 316");
      const actual: string = nextNotificationId(316) + '|' + badgeAfterAdd(316) + '|' + badgeAfterSet(316) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g316");
      logInfo('actual=' + String(actual) + ', expected=' + "317|317|316|1|0|0|g316");
      expect(actual).assertEqual("317|317|316|1|0|0|g316");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0317 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0318
     * @tc.name      VPN_NotifBoundary_0318
     * @tc.desc      notification boundary 317 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0318 begin`);
      logInfo("notification boundary 317");
      const actual: string = nextNotificationId(317) + '|' + badgeAfterAdd(317) + '|' + badgeAfterSet(317) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g317");
      logInfo('actual=' + String(actual) + ', expected=' + "318|318|317|1|0|1|g317");
      expect(actual).assertEqual("318|318|317|1|0|1|g317");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0318 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0319
     * @tc.name      VPN_NotifBoundary_0319
     * @tc.desc      notification boundary 318 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0319 begin`);
      logInfo("notification boundary 318");
      const actual: string = nextNotificationId(318) + '|' + badgeAfterAdd(318) + '|' + badgeAfterSet(318) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "319|319|318|1|0|0|");
      expect(actual).assertEqual("319|319|318|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0319 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0320
     * @tc.name      VPN_NotifBoundary_0320
     * @tc.desc      notification boundary 319 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0320 begin`);
      logInfo("notification boundary 319");
      const actual: string = nextNotificationId(319) + '|' + badgeAfterAdd(319) + '|' + badgeAfterSet(319) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g319");
      logInfo('actual=' + String(actual) + ', expected=' + "320|320|319|1|0|1|g319");
      expect(actual).assertEqual("320|320|319|1|0|1|g319");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0320 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0321
     * @tc.name      VPN_NotifBoundary_0321
     * @tc.desc      notification boundary 320 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0321 begin`);
      logInfo("notification boundary 320");
      const actual: string = nextNotificationId(320) + '|' + badgeAfterAdd(320) + '|' + badgeAfterSet(320) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g320");
      logInfo('actual=' + String(actual) + ', expected=' + "321|321|320|1|0|0|g320");
      expect(actual).assertEqual("321|321|320|1|0|0|g320");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0321 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0322
     * @tc.name      VPN_NotifBoundary_0322
     * @tc.desc      notification boundary 321 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0322 begin`);
      logInfo("notification boundary 321");
      const actual: string = nextNotificationId(321) + '|' + badgeAfterAdd(321) + '|' + badgeAfterSet(321) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "322|322|321|1|0|1|");
      expect(actual).assertEqual("322|322|321|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0322 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0323
     * @tc.name      VPN_NotifBoundary_0323
     * @tc.desc      notification boundary 322 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0323 begin`);
      logInfo("notification boundary 322");
      const actual: string = nextNotificationId(322) + '|' + badgeAfterAdd(322) + '|' + badgeAfterSet(322) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g322");
      logInfo('actual=' + String(actual) + ', expected=' + "323|323|322|1|0|0|g322");
      expect(actual).assertEqual("323|323|322|1|0|0|g322");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0323 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0324
     * @tc.name      VPN_NotifBoundary_0324
     * @tc.desc      notification boundary 323 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0324 begin`);
      logInfo("notification boundary 323");
      const actual: string = nextNotificationId(323) + '|' + badgeAfterAdd(323) + '|' + badgeAfterSet(323) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g323");
      logInfo('actual=' + String(actual) + ', expected=' + "324|324|323|1|0|1|g323");
      expect(actual).assertEqual("324|324|323|1|0|1|g323");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0324 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0325
     * @tc.name      VPN_NotifBoundary_0325
     * @tc.desc      notification boundary 324 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0325 begin`);
      logInfo("notification boundary 324");
      const actual: string = nextNotificationId(324) + '|' + badgeAfterAdd(324) + '|' + badgeAfterSet(324) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "325|325|324|1|0|0|");
      expect(actual).assertEqual("325|325|324|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0325 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0326
     * @tc.name      VPN_NotifBoundary_0326
     * @tc.desc      notification boundary 325 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0326 begin`);
      logInfo("notification boundary 325");
      const actual: string = nextNotificationId(325) + '|' + badgeAfterAdd(325) + '|' + badgeAfterSet(325) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g325");
      logInfo('actual=' + String(actual) + ', expected=' + "326|326|325|1|0|1|g325");
      expect(actual).assertEqual("326|326|325|1|0|1|g325");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0326 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0327
     * @tc.name      VPN_NotifBoundary_0327
     * @tc.desc      notification boundary 326 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0327 begin`);
      logInfo("notification boundary 326");
      const actual: string = nextNotificationId(326) + '|' + badgeAfterAdd(326) + '|' + badgeAfterSet(326) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g326");
      logInfo('actual=' + String(actual) + ', expected=' + "327|327|326|1|0|0|g326");
      expect(actual).assertEqual("327|327|326|1|0|0|g326");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0327 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0328
     * @tc.name      VPN_NotifBoundary_0328
     * @tc.desc      notification boundary 327 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0328 begin`);
      logInfo("notification boundary 327");
      const actual: string = nextNotificationId(327) + '|' + badgeAfterAdd(327) + '|' + badgeAfterSet(327) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "328|328|327|1|0|1|");
      expect(actual).assertEqual("328|328|327|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0328 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0329
     * @tc.name      VPN_NotifBoundary_0329
     * @tc.desc      notification boundary 328 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0329 begin`);
      logInfo("notification boundary 328");
      const actual: string = nextNotificationId(328) + '|' + badgeAfterAdd(328) + '|' + badgeAfterSet(328) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g328");
      logInfo('actual=' + String(actual) + ', expected=' + "329|329|328|1|0|0|g328");
      expect(actual).assertEqual("329|329|328|1|0|0|g328");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0329 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0330
     * @tc.name      VPN_NotifBoundary_0330
     * @tc.desc      notification boundary 329 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0330 begin`);
      logInfo("notification boundary 329");
      const actual: string = nextNotificationId(329) + '|' + badgeAfterAdd(329) + '|' + badgeAfterSet(329) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g329");
      logInfo('actual=' + String(actual) + ', expected=' + "330|330|329|1|0|1|g329");
      expect(actual).assertEqual("330|330|329|1|0|1|g329");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0330 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0331
     * @tc.name      VPN_NotifBoundary_0331
     * @tc.desc      notification boundary 330 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0331 begin`);
      logInfo("notification boundary 330");
      const actual: string = nextNotificationId(330) + '|' + badgeAfterAdd(330) + '|' + badgeAfterSet(330) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "331|331|330|1|0|0|");
      expect(actual).assertEqual("331|331|330|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0331 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0332
     * @tc.name      VPN_NotifBoundary_0332
     * @tc.desc      notification boundary 331 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0332 begin`);
      logInfo("notification boundary 331");
      const actual: string = nextNotificationId(331) + '|' + badgeAfterAdd(331) + '|' + badgeAfterSet(331) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g331");
      logInfo('actual=' + String(actual) + ', expected=' + "332|332|331|1|0|1|g331");
      expect(actual).assertEqual("332|332|331|1|0|1|g331");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0332 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0333
     * @tc.name      VPN_NotifBoundary_0333
     * @tc.desc      notification boundary 332 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0333 begin`);
      logInfo("notification boundary 332");
      const actual: string = nextNotificationId(332) + '|' + badgeAfterAdd(332) + '|' + badgeAfterSet(332) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g332");
      logInfo('actual=' + String(actual) + ', expected=' + "333|333|332|1|0|0|g332");
      expect(actual).assertEqual("333|333|332|1|0|0|g332");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0333 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0334
     * @tc.name      VPN_NotifBoundary_0334
     * @tc.desc      notification boundary 333 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0334 begin`);
      logInfo("notification boundary 333");
      const actual: string = nextNotificationId(333) + '|' + badgeAfterAdd(333) + '|' + badgeAfterSet(333) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "334|334|333|1|0|1|");
      expect(actual).assertEqual("334|334|333|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0334 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0335
     * @tc.name      VPN_NotifBoundary_0335
     * @tc.desc      notification boundary 334 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0335 begin`);
      logInfo("notification boundary 334");
      const actual: string = nextNotificationId(334) + '|' + badgeAfterAdd(334) + '|' + badgeAfterSet(334) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g334");
      logInfo('actual=' + String(actual) + ', expected=' + "335|335|334|1|0|0|g334");
      expect(actual).assertEqual("335|335|334|1|0|0|g334");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0335 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0336
     * @tc.name      VPN_NotifBoundary_0336
     * @tc.desc      notification boundary 335 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0336 begin`);
      logInfo("notification boundary 335");
      const actual: string = nextNotificationId(335) + '|' + badgeAfterAdd(335) + '|' + badgeAfterSet(335) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g335");
      logInfo('actual=' + String(actual) + ', expected=' + "336|336|335|1|0|1|g335");
      expect(actual).assertEqual("336|336|335|1|0|1|g335");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0336 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0337
     * @tc.name      VPN_NotifBoundary_0337
     * @tc.desc      notification boundary 336 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0337 begin`);
      logInfo("notification boundary 336");
      const actual: string = nextNotificationId(336) + '|' + badgeAfterAdd(336) + '|' + badgeAfterSet(336) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "337|337|336|1|1|0|");
      expect(actual).assertEqual("337|337|336|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0337 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0338
     * @tc.name      VPN_NotifBoundary_0338
     * @tc.desc      notification boundary 337 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0338 begin`);
      logInfo("notification boundary 337");
      const actual: string = nextNotificationId(337) + '|' + badgeAfterAdd(337) + '|' + badgeAfterSet(337) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g337");
      logInfo('actual=' + String(actual) + ', expected=' + "338|338|337|1|1|1|g337");
      expect(actual).assertEqual("338|338|337|1|1|1|g337");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0338 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0339
     * @tc.name      VPN_NotifBoundary_0339
     * @tc.desc      notification boundary 338 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0339 begin`);
      logInfo("notification boundary 338");
      const actual: string = nextNotificationId(338) + '|' + badgeAfterAdd(338) + '|' + badgeAfterSet(338) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g338");
      logInfo('actual=' + String(actual) + ', expected=' + "339|339|338|1|1|0|g338");
      expect(actual).assertEqual("339|339|338|1|1|0|g338");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0339 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0340
     * @tc.name      VPN_NotifBoundary_0340
     * @tc.desc      notification boundary 339 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0340 begin`);
      logInfo("notification boundary 339");
      const actual: string = nextNotificationId(339) + '|' + badgeAfterAdd(339) + '|' + badgeAfterSet(339) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "340|340|339|1|1|1|");
      expect(actual).assertEqual("340|340|339|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0340 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0341
     * @tc.name      VPN_NotifBoundary_0341
     * @tc.desc      notification boundary 340 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0341 begin`);
      logInfo("notification boundary 340");
      const actual: string = nextNotificationId(340) + '|' + badgeAfterAdd(340) + '|' + badgeAfterSet(340) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g340");
      logInfo('actual=' + String(actual) + ', expected=' + "341|341|340|1|1|0|g340");
      expect(actual).assertEqual("341|341|340|1|1|0|g340");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0341 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0342
     * @tc.name      VPN_NotifBoundary_0342
     * @tc.desc      notification boundary 341 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0342 begin`);
      logInfo("notification boundary 341");
      const actual: string = nextNotificationId(341) + '|' + badgeAfterAdd(341) + '|' + badgeAfterSet(341) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g341");
      logInfo('actual=' + String(actual) + ', expected=' + "342|342|341|1|1|1|g341");
      expect(actual).assertEqual("342|342|341|1|1|1|g341");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0342 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0343
     * @tc.name      VPN_NotifBoundary_0343
     * @tc.desc      notification boundary 342 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0343 begin`);
      logInfo("notification boundary 342");
      const actual: string = nextNotificationId(342) + '|' + badgeAfterAdd(342) + '|' + badgeAfterSet(342) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "343|343|342|1|0|0|");
      expect(actual).assertEqual("343|343|342|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0343 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0344
     * @tc.name      VPN_NotifBoundary_0344
     * @tc.desc      notification boundary 343 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0344 begin`);
      logInfo("notification boundary 343");
      const actual: string = nextNotificationId(343) + '|' + badgeAfterAdd(343) + '|' + badgeAfterSet(343) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g343");
      logInfo('actual=' + String(actual) + ', expected=' + "344|344|343|1|0|1|g343");
      expect(actual).assertEqual("344|344|343|1|0|1|g343");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0344 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0345
     * @tc.name      VPN_NotifBoundary_0345
     * @tc.desc      notification boundary 344 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0345 begin`);
      logInfo("notification boundary 344");
      const actual: string = nextNotificationId(344) + '|' + badgeAfterAdd(344) + '|' + badgeAfterSet(344) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g344");
      logInfo('actual=' + String(actual) + ', expected=' + "345|345|344|1|0|0|g344");
      expect(actual).assertEqual("345|345|344|1|0|0|g344");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0345 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0346
     * @tc.name      VPN_NotifBoundary_0346
     * @tc.desc      notification boundary 345 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0346 begin`);
      logInfo("notification boundary 345");
      const actual: string = nextNotificationId(345) + '|' + badgeAfterAdd(345) + '|' + badgeAfterSet(345) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "346|346|345|1|0|1|");
      expect(actual).assertEqual("346|346|345|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0346 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0347
     * @tc.name      VPN_NotifBoundary_0347
     * @tc.desc      notification boundary 346 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0347 begin`);
      logInfo("notification boundary 346");
      const actual: string = nextNotificationId(346) + '|' + badgeAfterAdd(346) + '|' + badgeAfterSet(346) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g346");
      logInfo('actual=' + String(actual) + ', expected=' + "347|347|346|1|0|0|g346");
      expect(actual).assertEqual("347|347|346|1|0|0|g346");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0347 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0348
     * @tc.name      VPN_NotifBoundary_0348
     * @tc.desc      notification boundary 347 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0348 begin`);
      logInfo("notification boundary 347");
      const actual: string = nextNotificationId(347) + '|' + badgeAfterAdd(347) + '|' + badgeAfterSet(347) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g347");
      logInfo('actual=' + String(actual) + ', expected=' + "348|348|347|1|0|1|g347");
      expect(actual).assertEqual("348|348|347|1|0|1|g347");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0348 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0349
     * @tc.name      VPN_NotifBoundary_0349
     * @tc.desc      notification boundary 348 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0349 begin`);
      logInfo("notification boundary 348");
      const actual: string = nextNotificationId(348) + '|' + badgeAfterAdd(348) + '|' + badgeAfterSet(348) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "349|349|348|1|0|0|");
      expect(actual).assertEqual("349|349|348|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0349 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0350
     * @tc.name      VPN_NotifBoundary_0350
     * @tc.desc      notification boundary 349 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0350 begin`);
      logInfo("notification boundary 349");
      const actual: string = nextNotificationId(349) + '|' + badgeAfterAdd(349) + '|' + badgeAfterSet(349) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g349");
      logInfo('actual=' + String(actual) + ', expected=' + "350|350|349|1|0|1|g349");
      expect(actual).assertEqual("350|350|349|1|0|1|g349");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0350 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0351
     * @tc.name      VPN_NotifBoundary_0351
     * @tc.desc      notification boundary 350 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0351 begin`);
      logInfo("notification boundary 350");
      const actual: string = nextNotificationId(350) + '|' + badgeAfterAdd(350) + '|' + badgeAfterSet(350) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g350");
      logInfo('actual=' + String(actual) + ', expected=' + "351|351|350|1|0|0|g350");
      expect(actual).assertEqual("351|351|350|1|0|0|g350");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0351 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0352
     * @tc.name      VPN_NotifBoundary_0352
     * @tc.desc      notification boundary 351 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0352 begin`);
      logInfo("notification boundary 351");
      const actual: string = nextNotificationId(351) + '|' + badgeAfterAdd(351) + '|' + badgeAfterSet(351) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "352|352|351|1|0|1|");
      expect(actual).assertEqual("352|352|351|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0352 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0353
     * @tc.name      VPN_NotifBoundary_0353
     * @tc.desc      notification boundary 352 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0353 begin`);
      logInfo("notification boundary 352");
      const actual: string = nextNotificationId(352) + '|' + badgeAfterAdd(352) + '|' + badgeAfterSet(352) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g352");
      logInfo('actual=' + String(actual) + ', expected=' + "353|353|352|1|0|0|g352");
      expect(actual).assertEqual("353|353|352|1|0|0|g352");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0353 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0354
     * @tc.name      VPN_NotifBoundary_0354
     * @tc.desc      notification boundary 353 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0354 begin`);
      logInfo("notification boundary 353");
      const actual: string = nextNotificationId(353) + '|' + badgeAfterAdd(353) + '|' + badgeAfterSet(353) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g353");
      logInfo('actual=' + String(actual) + ', expected=' + "354|354|353|1|0|1|g353");
      expect(actual).assertEqual("354|354|353|1|0|1|g353");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0354 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0355
     * @tc.name      VPN_NotifBoundary_0355
     * @tc.desc      notification boundary 354 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0355 begin`);
      logInfo("notification boundary 354");
      const actual: string = nextNotificationId(354) + '|' + badgeAfterAdd(354) + '|' + badgeAfterSet(354) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "355|355|354|1|0|0|");
      expect(actual).assertEqual("355|355|354|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0355 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0356
     * @tc.name      VPN_NotifBoundary_0356
     * @tc.desc      notification boundary 355 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0356 begin`);
      logInfo("notification boundary 355");
      const actual: string = nextNotificationId(355) + '|' + badgeAfterAdd(355) + '|' + badgeAfterSet(355) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g355");
      logInfo('actual=' + String(actual) + ', expected=' + "356|356|355|1|0|1|g355");
      expect(actual).assertEqual("356|356|355|1|0|1|g355");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0356 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0357
     * @tc.name      VPN_NotifBoundary_0357
     * @tc.desc      notification boundary 356 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0357 begin`);
      logInfo("notification boundary 356");
      const actual: string = nextNotificationId(356) + '|' + badgeAfterAdd(356) + '|' + badgeAfterSet(356) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g356");
      logInfo('actual=' + String(actual) + ', expected=' + "357|357|356|1|0|0|g356");
      expect(actual).assertEqual("357|357|356|1|0|0|g356");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0357 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0358
     * @tc.name      VPN_NotifBoundary_0358
     * @tc.desc      notification boundary 357 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0358 begin`);
      logInfo("notification boundary 357");
      const actual: string = nextNotificationId(357) + '|' + badgeAfterAdd(357) + '|' + badgeAfterSet(357) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "358|358|357|1|0|1|");
      expect(actual).assertEqual("358|358|357|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0358 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0359
     * @tc.name      VPN_NotifBoundary_0359
     * @tc.desc      notification boundary 358 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0359 begin`);
      logInfo("notification boundary 358");
      const actual: string = nextNotificationId(358) + '|' + badgeAfterAdd(358) + '|' + badgeAfterSet(358) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g358");
      logInfo('actual=' + String(actual) + ', expected=' + "359|359|358|1|0|0|g358");
      expect(actual).assertEqual("359|359|358|1|0|0|g358");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0359 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0360
     * @tc.name      VPN_NotifBoundary_0360
     * @tc.desc      notification boundary 359 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0360 begin`);
      logInfo("notification boundary 359");
      const actual: string = nextNotificationId(359) + '|' + badgeAfterAdd(359) + '|' + badgeAfterSet(359) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g359");
      logInfo('actual=' + String(actual) + ', expected=' + "360|360|359|1|0|1|g359");
      expect(actual).assertEqual("360|360|359|1|0|1|g359");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0360 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0361
     * @tc.name      VPN_NotifBoundary_0361
     * @tc.desc      notification boundary 360 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0361 begin`);
      logInfo("notification boundary 360");
      const actual: string = nextNotificationId(360) + '|' + badgeAfterAdd(360) + '|' + badgeAfterSet(360) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "361|361|360|1|0|0|");
      expect(actual).assertEqual("361|361|360|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0361 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0362
     * @tc.name      VPN_NotifBoundary_0362
     * @tc.desc      notification boundary 361 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0362 begin`);
      logInfo("notification boundary 361");
      const actual: string = nextNotificationId(361) + '|' + badgeAfterAdd(361) + '|' + badgeAfterSet(361) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g361");
      logInfo('actual=' + String(actual) + ', expected=' + "362|362|361|1|0|1|g361");
      expect(actual).assertEqual("362|362|361|1|0|1|g361");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0362 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0363
     * @tc.name      VPN_NotifBoundary_0363
     * @tc.desc      notification boundary 362 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0363 begin`);
      logInfo("notification boundary 362");
      const actual: string = nextNotificationId(362) + '|' + badgeAfterAdd(362) + '|' + badgeAfterSet(362) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g362");
      logInfo('actual=' + String(actual) + ', expected=' + "363|363|362|1|0|0|g362");
      expect(actual).assertEqual("363|363|362|1|0|0|g362");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0363 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0364
     * @tc.name      VPN_NotifBoundary_0364
     * @tc.desc      notification boundary 363 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0364 begin`);
      logInfo("notification boundary 363");
      const actual: string = nextNotificationId(363) + '|' + badgeAfterAdd(363) + '|' + badgeAfterSet(363) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "364|364|363|1|0|1|");
      expect(actual).assertEqual("364|364|363|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0364 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0365
     * @tc.name      VPN_NotifBoundary_0365
     * @tc.desc      notification boundary 364 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0365 begin`);
      logInfo("notification boundary 364");
      const actual: string = nextNotificationId(364) + '|' + badgeAfterAdd(364) + '|' + badgeAfterSet(364) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g364");
      logInfo('actual=' + String(actual) + ', expected=' + "365|365|364|1|0|0|g364");
      expect(actual).assertEqual("365|365|364|1|0|0|g364");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0365 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0366
     * @tc.name      VPN_NotifBoundary_0366
     * @tc.desc      notification boundary 365 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0366 begin`);
      logInfo("notification boundary 365");
      const actual: string = nextNotificationId(365) + '|' + badgeAfterAdd(365) + '|' + badgeAfterSet(365) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g365");
      logInfo('actual=' + String(actual) + ', expected=' + "366|366|365|1|0|1|g365");
      expect(actual).assertEqual("366|366|365|1|0|1|g365");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0366 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0367
     * @tc.name      VPN_NotifBoundary_0367
     * @tc.desc      notification boundary 366 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0367 begin`);
      logInfo("notification boundary 366");
      const actual: string = nextNotificationId(366) + '|' + badgeAfterAdd(366) + '|' + badgeAfterSet(366) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "367|367|366|1|0|0|");
      expect(actual).assertEqual("367|367|366|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0367 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0368
     * @tc.name      VPN_NotifBoundary_0368
     * @tc.desc      notification boundary 367 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0368 begin`);
      logInfo("notification boundary 367");
      const actual: string = nextNotificationId(367) + '|' + badgeAfterAdd(367) + '|' + badgeAfterSet(367) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g367");
      logInfo('actual=' + String(actual) + ', expected=' + "368|368|367|1|0|1|g367");
      expect(actual).assertEqual("368|368|367|1|0|1|g367");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0368 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0369
     * @tc.name      VPN_NotifBoundary_0369
     * @tc.desc      notification boundary 368 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0369 begin`);
      logInfo("notification boundary 368");
      const actual: string = nextNotificationId(368) + '|' + badgeAfterAdd(368) + '|' + badgeAfterSet(368) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g368");
      logInfo('actual=' + String(actual) + ', expected=' + "369|369|368|1|0|0|g368");
      expect(actual).assertEqual("369|369|368|1|0|0|g368");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0369 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0370
     * @tc.name      VPN_NotifBoundary_0370
     * @tc.desc      notification boundary 369 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0370 begin`);
      logInfo("notification boundary 369");
      const actual: string = nextNotificationId(369) + '|' + badgeAfterAdd(369) + '|' + badgeAfterSet(369) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "370|370|369|1|0|1|");
      expect(actual).assertEqual("370|370|369|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0370 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0371
     * @tc.name      VPN_NotifBoundary_0371
     * @tc.desc      notification boundary 370 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0371 begin`);
      logInfo("notification boundary 370");
      const actual: string = nextNotificationId(370) + '|' + badgeAfterAdd(370) + '|' + badgeAfterSet(370) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g370");
      logInfo('actual=' + String(actual) + ', expected=' + "371|371|370|1|0|0|g370");
      expect(actual).assertEqual("371|371|370|1|0|0|g370");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0371 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0372
     * @tc.name      VPN_NotifBoundary_0372
     * @tc.desc      notification boundary 371 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0372 begin`);
      logInfo("notification boundary 371");
      const actual: string = nextNotificationId(371) + '|' + badgeAfterAdd(371) + '|' + badgeAfterSet(371) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g371");
      logInfo('actual=' + String(actual) + ', expected=' + "372|372|371|1|0|1|g371");
      expect(actual).assertEqual("372|372|371|1|0|1|g371");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0372 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0373
     * @tc.name      VPN_NotifBoundary_0373
     * @tc.desc      notification boundary 372 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0373 begin`);
      logInfo("notification boundary 372");
      const actual: string = nextNotificationId(372) + '|' + badgeAfterAdd(372) + '|' + badgeAfterSet(372) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "373|373|372|1|0|0|");
      expect(actual).assertEqual("373|373|372|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0373 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0374
     * @tc.name      VPN_NotifBoundary_0374
     * @tc.desc      notification boundary 373 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0374 begin`);
      logInfo("notification boundary 373");
      const actual: string = nextNotificationId(373) + '|' + badgeAfterAdd(373) + '|' + badgeAfterSet(373) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g373");
      logInfo('actual=' + String(actual) + ', expected=' + "374|374|373|1|0|1|g373");
      expect(actual).assertEqual("374|374|373|1|0|1|g373");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0374 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0375
     * @tc.name      VPN_NotifBoundary_0375
     * @tc.desc      notification boundary 374 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0375 begin`);
      logInfo("notification boundary 374");
      const actual: string = nextNotificationId(374) + '|' + badgeAfterAdd(374) + '|' + badgeAfterSet(374) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g374");
      logInfo('actual=' + String(actual) + ', expected=' + "375|375|374|1|0|0|g374");
      expect(actual).assertEqual("375|375|374|1|0|0|g374");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0375 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0376
     * @tc.name      VPN_NotifBoundary_0376
     * @tc.desc      notification boundary 375 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0376 begin`);
      logInfo("notification boundary 375");
      const actual: string = nextNotificationId(375) + '|' + badgeAfterAdd(375) + '|' + badgeAfterSet(375) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "376|376|375|1|0|1|");
      expect(actual).assertEqual("376|376|375|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0376 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0377
     * @tc.name      VPN_NotifBoundary_0377
     * @tc.desc      notification boundary 376 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0377 begin`);
      logInfo("notification boundary 376");
      const actual: string = nextNotificationId(376) + '|' + badgeAfterAdd(376) + '|' + badgeAfterSet(376) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g376");
      logInfo('actual=' + String(actual) + ', expected=' + "377|377|376|1|0|0|g376");
      expect(actual).assertEqual("377|377|376|1|0|0|g376");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0377 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0378
     * @tc.name      VPN_NotifBoundary_0378
     * @tc.desc      notification boundary 377 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0378 begin`);
      logInfo("notification boundary 377");
      const actual: string = nextNotificationId(377) + '|' + badgeAfterAdd(377) + '|' + badgeAfterSet(377) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g377");
      logInfo('actual=' + String(actual) + ', expected=' + "378|378|377|1|0|1|g377");
      expect(actual).assertEqual("378|378|377|1|0|1|g377");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0378 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0379
     * @tc.name      VPN_NotifBoundary_0379
     * @tc.desc      notification boundary 378 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0379 begin`);
      logInfo("notification boundary 378");
      const actual: string = nextNotificationId(378) + '|' + badgeAfterAdd(378) + '|' + badgeAfterSet(378) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "379|379|378|1|1|0|");
      expect(actual).assertEqual("379|379|378|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0379 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0380
     * @tc.name      VPN_NotifBoundary_0380
     * @tc.desc      notification boundary 379 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0380 begin`);
      logInfo("notification boundary 379");
      const actual: string = nextNotificationId(379) + '|' + badgeAfterAdd(379) + '|' + badgeAfterSet(379) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g379");
      logInfo('actual=' + String(actual) + ', expected=' + "380|380|379|1|1|1|g379");
      expect(actual).assertEqual("380|380|379|1|1|1|g379");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0380 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0381
     * @tc.name      VPN_NotifBoundary_0381
     * @tc.desc      notification boundary 380 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0381 begin`);
      logInfo("notification boundary 380");
      const actual: string = nextNotificationId(380) + '|' + badgeAfterAdd(380) + '|' + badgeAfterSet(380) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g380");
      logInfo('actual=' + String(actual) + ', expected=' + "381|381|380|1|1|0|g380");
      expect(actual).assertEqual("381|381|380|1|1|0|g380");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0381 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0382
     * @tc.name      VPN_NotifBoundary_0382
     * @tc.desc      notification boundary 381 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0382 begin`);
      logInfo("notification boundary 381");
      const actual: string = nextNotificationId(381) + '|' + badgeAfterAdd(381) + '|' + badgeAfterSet(381) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "382|382|381|1|1|1|");
      expect(actual).assertEqual("382|382|381|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0382 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0383
     * @tc.name      VPN_NotifBoundary_0383
     * @tc.desc      notification boundary 382 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0383 begin`);
      logInfo("notification boundary 382");
      const actual: string = nextNotificationId(382) + '|' + badgeAfterAdd(382) + '|' + badgeAfterSet(382) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g382");
      logInfo('actual=' + String(actual) + ', expected=' + "383|383|382|1|1|0|g382");
      expect(actual).assertEqual("383|383|382|1|1|0|g382");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0383 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0384
     * @tc.name      VPN_NotifBoundary_0384
     * @tc.desc      notification boundary 383 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0384 begin`);
      logInfo("notification boundary 383");
      const actual: string = nextNotificationId(383) + '|' + badgeAfterAdd(383) + '|' + badgeAfterSet(383) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g383");
      logInfo('actual=' + String(actual) + ', expected=' + "384|384|383|1|1|1|g383");
      expect(actual).assertEqual("384|384|383|1|1|1|g383");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0384 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0385
     * @tc.name      VPN_NotifBoundary_0385
     * @tc.desc      notification boundary 384 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0385 begin`);
      logInfo("notification boundary 384");
      const actual: string = nextNotificationId(384) + '|' + badgeAfterAdd(384) + '|' + badgeAfterSet(384) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "385|385|384|1|0|0|");
      expect(actual).assertEqual("385|385|384|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0385 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0386
     * @tc.name      VPN_NotifBoundary_0386
     * @tc.desc      notification boundary 385 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0386 begin`);
      logInfo("notification boundary 385");
      const actual: string = nextNotificationId(385) + '|' + badgeAfterAdd(385) + '|' + badgeAfterSet(385) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g385");
      logInfo('actual=' + String(actual) + ', expected=' + "386|386|385|1|0|1|g385");
      expect(actual).assertEqual("386|386|385|1|0|1|g385");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0386 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0387
     * @tc.name      VPN_NotifBoundary_0387
     * @tc.desc      notification boundary 386 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0387 begin`);
      logInfo("notification boundary 386");
      const actual: string = nextNotificationId(386) + '|' + badgeAfterAdd(386) + '|' + badgeAfterSet(386) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g386");
      logInfo('actual=' + String(actual) + ', expected=' + "387|387|386|1|0|0|g386");
      expect(actual).assertEqual("387|387|386|1|0|0|g386");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0387 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0388
     * @tc.name      VPN_NotifBoundary_0388
     * @tc.desc      notification boundary 387 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0388 begin`);
      logInfo("notification boundary 387");
      const actual: string = nextNotificationId(387) + '|' + badgeAfterAdd(387) + '|' + badgeAfterSet(387) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "388|388|387|1|0|1|");
      expect(actual).assertEqual("388|388|387|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0388 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0389
     * @tc.name      VPN_NotifBoundary_0389
     * @tc.desc      notification boundary 388 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0389 begin`);
      logInfo("notification boundary 388");
      const actual: string = nextNotificationId(388) + '|' + badgeAfterAdd(388) + '|' + badgeAfterSet(388) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g388");
      logInfo('actual=' + String(actual) + ', expected=' + "389|389|388|1|0|0|g388");
      expect(actual).assertEqual("389|389|388|1|0|0|g388");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0389 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0390
     * @tc.name      VPN_NotifBoundary_0390
     * @tc.desc      notification boundary 389 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0390 begin`);
      logInfo("notification boundary 389");
      const actual: string = nextNotificationId(389) + '|' + badgeAfterAdd(389) + '|' + badgeAfterSet(389) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g389");
      logInfo('actual=' + String(actual) + ', expected=' + "390|390|389|1|0|1|g389");
      expect(actual).assertEqual("390|390|389|1|0|1|g389");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0390 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0391
     * @tc.name      VPN_NotifBoundary_0391
     * @tc.desc      notification boundary 390 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0391 begin`);
      logInfo("notification boundary 390");
      const actual: string = nextNotificationId(390) + '|' + badgeAfterAdd(390) + '|' + badgeAfterSet(390) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "391|391|390|1|0|0|");
      expect(actual).assertEqual("391|391|390|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0391 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0392
     * @tc.name      VPN_NotifBoundary_0392
     * @tc.desc      notification boundary 391 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0392 begin`);
      logInfo("notification boundary 391");
      const actual: string = nextNotificationId(391) + '|' + badgeAfterAdd(391) + '|' + badgeAfterSet(391) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g391");
      logInfo('actual=' + String(actual) + ', expected=' + "392|392|391|1|0|1|g391");
      expect(actual).assertEqual("392|392|391|1|0|1|g391");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0392 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0393
     * @tc.name      VPN_NotifBoundary_0393
     * @tc.desc      notification boundary 392 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0393 begin`);
      logInfo("notification boundary 392");
      const actual: string = nextNotificationId(392) + '|' + badgeAfterAdd(392) + '|' + badgeAfterSet(392) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g392");
      logInfo('actual=' + String(actual) + ', expected=' + "393|393|392|1|0|0|g392");
      expect(actual).assertEqual("393|393|392|1|0|0|g392");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0393 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0394
     * @tc.name      VPN_NotifBoundary_0394
     * @tc.desc      notification boundary 393 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0394 begin`);
      logInfo("notification boundary 393");
      const actual: string = nextNotificationId(393) + '|' + badgeAfterAdd(393) + '|' + badgeAfterSet(393) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "394|394|393|1|0|1|");
      expect(actual).assertEqual("394|394|393|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0394 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0395
     * @tc.name      VPN_NotifBoundary_0395
     * @tc.desc      notification boundary 394 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0395 begin`);
      logInfo("notification boundary 394");
      const actual: string = nextNotificationId(394) + '|' + badgeAfterAdd(394) + '|' + badgeAfterSet(394) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g394");
      logInfo('actual=' + String(actual) + ', expected=' + "395|395|394|1|0|0|g394");
      expect(actual).assertEqual("395|395|394|1|0|0|g394");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0395 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0396
     * @tc.name      VPN_NotifBoundary_0396
     * @tc.desc      notification boundary 395 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0396 begin`);
      logInfo("notification boundary 395");
      const actual: string = nextNotificationId(395) + '|' + badgeAfterAdd(395) + '|' + badgeAfterSet(395) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g395");
      logInfo('actual=' + String(actual) + ', expected=' + "396|396|395|1|0|1|g395");
      expect(actual).assertEqual("396|396|395|1|0|1|g395");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0396 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0397
     * @tc.name      VPN_NotifBoundary_0397
     * @tc.desc      notification boundary 396 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0397 begin`);
      logInfo("notification boundary 396");
      const actual: string = nextNotificationId(396) + '|' + badgeAfterAdd(396) + '|' + badgeAfterSet(396) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "397|397|396|1|0|0|");
      expect(actual).assertEqual("397|397|396|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0397 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0398
     * @tc.name      VPN_NotifBoundary_0398
     * @tc.desc      notification boundary 397 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0398 begin`);
      logInfo("notification boundary 397");
      const actual: string = nextNotificationId(397) + '|' + badgeAfterAdd(397) + '|' + badgeAfterSet(397) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g397");
      logInfo('actual=' + String(actual) + ', expected=' + "398|398|397|1|0|1|g397");
      expect(actual).assertEqual("398|398|397|1|0|1|g397");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0398 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0399
     * @tc.name      VPN_NotifBoundary_0399
     * @tc.desc      notification boundary 398 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0399 begin`);
      logInfo("notification boundary 398");
      const actual: string = nextNotificationId(398) + '|' + badgeAfterAdd(398) + '|' + badgeAfterSet(398) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g398");
      logInfo('actual=' + String(actual) + ', expected=' + "399|399|398|1|0|0|g398");
      expect(actual).assertEqual("399|399|398|1|0|0|g398");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0399 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0400
     * @tc.name      VPN_NotifBoundary_0400
     * @tc.desc      notification boundary 399 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0400 begin`);
      logInfo("notification boundary 399");
      const actual: string = nextNotificationId(399) + '|' + badgeAfterAdd(399) + '|' + badgeAfterSet(399) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "400|400|399|1|0|1|");
      expect(actual).assertEqual("400|400|399|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0400 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0401
     * @tc.name      VPN_NotifBoundary_0401
     * @tc.desc      notification boundary 400 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0401 begin`);
      logInfo("notification boundary 400");
      const actual: string = nextNotificationId(400) + '|' + badgeAfterAdd(400) + '|' + badgeAfterSet(400) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g400");
      logInfo('actual=' + String(actual) + ', expected=' + "401|401|400|1|0|0|g400");
      expect(actual).assertEqual("401|401|400|1|0|0|g400");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0401 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0402
     * @tc.name      VPN_NotifBoundary_0402
     * @tc.desc      notification boundary 401 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0402 begin`);
      logInfo("notification boundary 401");
      const actual: string = nextNotificationId(401) + '|' + badgeAfterAdd(401) + '|' + badgeAfterSet(401) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g401");
      logInfo('actual=' + String(actual) + ', expected=' + "402|402|401|1|0|1|g401");
      expect(actual).assertEqual("402|402|401|1|0|1|g401");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0402 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0403
     * @tc.name      VPN_NotifBoundary_0403
     * @tc.desc      notification boundary 402 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0403 begin`);
      logInfo("notification boundary 402");
      const actual: string = nextNotificationId(402) + '|' + badgeAfterAdd(402) + '|' + badgeAfterSet(402) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "403|403|402|1|0|0|");
      expect(actual).assertEqual("403|403|402|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0403 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0404
     * @tc.name      VPN_NotifBoundary_0404
     * @tc.desc      notification boundary 403 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0404 begin`);
      logInfo("notification boundary 403");
      const actual: string = nextNotificationId(403) + '|' + badgeAfterAdd(403) + '|' + badgeAfterSet(403) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g403");
      logInfo('actual=' + String(actual) + ', expected=' + "404|404|403|1|0|1|g403");
      expect(actual).assertEqual("404|404|403|1|0|1|g403");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0404 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0405
     * @tc.name      VPN_NotifBoundary_0405
     * @tc.desc      notification boundary 404 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0405 begin`);
      logInfo("notification boundary 404");
      const actual: string = nextNotificationId(404) + '|' + badgeAfterAdd(404) + '|' + badgeAfterSet(404) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g404");
      logInfo('actual=' + String(actual) + ', expected=' + "405|405|404|1|0|0|g404");
      expect(actual).assertEqual("405|405|404|1|0|0|g404");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0405 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0406
     * @tc.name      VPN_NotifBoundary_0406
     * @tc.desc      notification boundary 405 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0406 begin`);
      logInfo("notification boundary 405");
      const actual: string = nextNotificationId(405) + '|' + badgeAfterAdd(405) + '|' + badgeAfterSet(405) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "406|406|405|1|0|1|");
      expect(actual).assertEqual("406|406|405|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0406 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0407
     * @tc.name      VPN_NotifBoundary_0407
     * @tc.desc      notification boundary 406 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0407 begin`);
      logInfo("notification boundary 406");
      const actual: string = nextNotificationId(406) + '|' + badgeAfterAdd(406) + '|' + badgeAfterSet(406) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g406");
      logInfo('actual=' + String(actual) + ', expected=' + "407|407|406|1|0|0|g406");
      expect(actual).assertEqual("407|407|406|1|0|0|g406");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0407 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0408
     * @tc.name      VPN_NotifBoundary_0408
     * @tc.desc      notification boundary 407 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0408 begin`);
      logInfo("notification boundary 407");
      const actual: string = nextNotificationId(407) + '|' + badgeAfterAdd(407) + '|' + badgeAfterSet(407) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g407");
      logInfo('actual=' + String(actual) + ', expected=' + "408|408|407|1|0|1|g407");
      expect(actual).assertEqual("408|408|407|1|0|1|g407");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0408 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0409
     * @tc.name      VPN_NotifBoundary_0409
     * @tc.desc      notification boundary 408 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0409 begin`);
      logInfo("notification boundary 408");
      const actual: string = nextNotificationId(408) + '|' + badgeAfterAdd(408) + '|' + badgeAfterSet(408) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "409|409|408|1|0|0|");
      expect(actual).assertEqual("409|409|408|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0409 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0410
     * @tc.name      VPN_NotifBoundary_0410
     * @tc.desc      notification boundary 409 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0410 begin`);
      logInfo("notification boundary 409");
      const actual: string = nextNotificationId(409) + '|' + badgeAfterAdd(409) + '|' + badgeAfterSet(409) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g409");
      logInfo('actual=' + String(actual) + ', expected=' + "410|410|409|1|0|1|g409");
      expect(actual).assertEqual("410|410|409|1|0|1|g409");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0410 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0411
     * @tc.name      VPN_NotifBoundary_0411
     * @tc.desc      notification boundary 410 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0411 begin`);
      logInfo("notification boundary 410");
      const actual: string = nextNotificationId(410) + '|' + badgeAfterAdd(410) + '|' + badgeAfterSet(410) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g410");
      logInfo('actual=' + String(actual) + ', expected=' + "411|411|410|1|0|0|g410");
      expect(actual).assertEqual("411|411|410|1|0|0|g410");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0411 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0412
     * @tc.name      VPN_NotifBoundary_0412
     * @tc.desc      notification boundary 411 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0412 begin`);
      logInfo("notification boundary 411");
      const actual: string = nextNotificationId(411) + '|' + badgeAfterAdd(411) + '|' + badgeAfterSet(411) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "412|412|411|1|0|1|");
      expect(actual).assertEqual("412|412|411|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0412 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0413
     * @tc.name      VPN_NotifBoundary_0413
     * @tc.desc      notification boundary 412 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0413 begin`);
      logInfo("notification boundary 412");
      const actual: string = nextNotificationId(412) + '|' + badgeAfterAdd(412) + '|' + badgeAfterSet(412) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g412");
      logInfo('actual=' + String(actual) + ', expected=' + "413|413|412|1|0|0|g412");
      expect(actual).assertEqual("413|413|412|1|0|0|g412");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0413 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0414
     * @tc.name      VPN_NotifBoundary_0414
     * @tc.desc      notification boundary 413 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0414 begin`);
      logInfo("notification boundary 413");
      const actual: string = nextNotificationId(413) + '|' + badgeAfterAdd(413) + '|' + badgeAfterSet(413) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g413");
      logInfo('actual=' + String(actual) + ', expected=' + "414|414|413|1|0|1|g413");
      expect(actual).assertEqual("414|414|413|1|0|1|g413");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0414 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0415
     * @tc.name      VPN_NotifBoundary_0415
     * @tc.desc      notification boundary 414 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0415 begin`);
      logInfo("notification boundary 414");
      const actual: string = nextNotificationId(414) + '|' + badgeAfterAdd(414) + '|' + badgeAfterSet(414) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "415|415|414|1|0|0|");
      expect(actual).assertEqual("415|415|414|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0415 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0416
     * @tc.name      VPN_NotifBoundary_0416
     * @tc.desc      notification boundary 415 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0416 begin`);
      logInfo("notification boundary 415");
      const actual: string = nextNotificationId(415) + '|' + badgeAfterAdd(415) + '|' + badgeAfterSet(415) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g415");
      logInfo('actual=' + String(actual) + ', expected=' + "416|416|415|1|0|1|g415");
      expect(actual).assertEqual("416|416|415|1|0|1|g415");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0416 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0417
     * @tc.name      VPN_NotifBoundary_0417
     * @tc.desc      notification boundary 416 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0417 begin`);
      logInfo("notification boundary 416");
      const actual: string = nextNotificationId(416) + '|' + badgeAfterAdd(416) + '|' + badgeAfterSet(416) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g416");
      logInfo('actual=' + String(actual) + ', expected=' + "417|417|416|1|0|0|g416");
      expect(actual).assertEqual("417|417|416|1|0|0|g416");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0417 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0418
     * @tc.name      VPN_NotifBoundary_0418
     * @tc.desc      notification boundary 417 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0418 begin`);
      logInfo("notification boundary 417");
      const actual: string = nextNotificationId(417) + '|' + badgeAfterAdd(417) + '|' + badgeAfterSet(417) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "418|418|417|1|0|1|");
      expect(actual).assertEqual("418|418|417|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0418 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0419
     * @tc.name      VPN_NotifBoundary_0419
     * @tc.desc      notification boundary 418 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0419 begin`);
      logInfo("notification boundary 418");
      const actual: string = nextNotificationId(418) + '|' + badgeAfterAdd(418) + '|' + badgeAfterSet(418) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g418");
      logInfo('actual=' + String(actual) + ', expected=' + "419|419|418|1|0|0|g418");
      expect(actual).assertEqual("419|419|418|1|0|0|g418");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0419 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0420
     * @tc.name      VPN_NotifBoundary_0420
     * @tc.desc      notification boundary 419 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0420 begin`);
      logInfo("notification boundary 419");
      const actual: string = nextNotificationId(419) + '|' + badgeAfterAdd(419) + '|' + badgeAfterSet(419) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g419");
      logInfo('actual=' + String(actual) + ', expected=' + "420|420|419|1|0|1|g419");
      expect(actual).assertEqual("420|420|419|1|0|1|g419");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0420 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0421
     * @tc.name      VPN_NotifBoundary_0421
     * @tc.desc      notification boundary 420 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0421 begin`);
      logInfo("notification boundary 420");
      const actual: string = nextNotificationId(420) + '|' + badgeAfterAdd(420) + '|' + badgeAfterSet(420) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "421|421|420|1|1|0|");
      expect(actual).assertEqual("421|421|420|1|1|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0421 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0422
     * @tc.name      VPN_NotifBoundary_0422
     * @tc.desc      notification boundary 421 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0422 begin`);
      logInfo("notification boundary 421");
      const actual: string = nextNotificationId(421) + '|' + badgeAfterAdd(421) + '|' + badgeAfterSet(421) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g421");
      logInfo('actual=' + String(actual) + ', expected=' + "422|422|421|1|1|1|g421");
      expect(actual).assertEqual("422|422|421|1|1|1|g421");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0422 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0423
     * @tc.name      VPN_NotifBoundary_0423
     * @tc.desc      notification boundary 422 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0423 begin`);
      logInfo("notification boundary 422");
      const actual: string = nextNotificationId(422) + '|' + badgeAfterAdd(422) + '|' + badgeAfterSet(422) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g422");
      logInfo('actual=' + String(actual) + ', expected=' + "423|423|422|1|1|0|g422");
      expect(actual).assertEqual("423|423|422|1|1|0|g422");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0423 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0424
     * @tc.name      VPN_NotifBoundary_0424
     * @tc.desc      notification boundary 423 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0424 begin`);
      logInfo("notification boundary 423");
      const actual: string = nextNotificationId(423) + '|' + badgeAfterAdd(423) + '|' + badgeAfterSet(423) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "424|424|423|1|1|1|");
      expect(actual).assertEqual("424|424|423|1|1|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0424 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0425
     * @tc.name      VPN_NotifBoundary_0425
     * @tc.desc      notification boundary 424 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0425 begin`);
      logInfo("notification boundary 424");
      const actual: string = nextNotificationId(424) + '|' + badgeAfterAdd(424) + '|' + badgeAfterSet(424) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g424");
      logInfo('actual=' + String(actual) + ', expected=' + "425|425|424|1|1|0|g424");
      expect(actual).assertEqual("425|425|424|1|1|0|g424");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0425 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0426
     * @tc.name      VPN_NotifBoundary_0426
     * @tc.desc      notification boundary 425 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_NotifBoundary_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NotifBoundary_0426 begin`);
      logInfo("notification boundary 425");
      const actual: string = nextNotificationId(425) + '|' + badgeAfterAdd(425) + '|' + badgeAfterSet(425) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 5) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g425");
      logInfo('actual=' + String(actual) + ', expected=' + "426|426|425|1|1|1|g425");
      expect(actual).assertEqual("426|426|425|1|1|1|g425");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0426 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0427
     * @tc.name      VPN_NotifBoundary_0427
     * @tc.desc      notification boundary 426 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0427 begin`);
      logInfo("notification boundary 426");
      const actual: string = nextNotificationId(426) + '|' + badgeAfterAdd(426) + '|' + badgeAfterSet(426) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 6) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "427|427|426|1|0|0|");
      expect(actual).assertEqual("427|427|426|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0427 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0428
     * @tc.name      VPN_NotifBoundary_0428
     * @tc.desc      notification boundary 427 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0428 begin`);
      logInfo("notification boundary 427");
      const actual: string = nextNotificationId(427) + '|' + badgeAfterAdd(427) + '|' + badgeAfterSet(427) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 0) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g427");
      logInfo('actual=' + String(actual) + ', expected=' + "428|428|427|1|0|1|g427");
      expect(actual).assertEqual("428|428|427|1|0|1|g427");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0428 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0429
     * @tc.name      VPN_NotifBoundary_0429
     * @tc.desc      notification boundary 428 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0429 begin`);
      logInfo("notification boundary 428");
      const actual: string = nextNotificationId(428) + '|' + badgeAfterAdd(428) + '|' + badgeAfterSet(428) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 1) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g428");
      logInfo('actual=' + String(actual) + ', expected=' + "429|429|428|1|0|0|g428");
      expect(actual).assertEqual("429|429|428|1|0|0|g428");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0429 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0430
     * @tc.name      VPN_NotifBoundary_0430
     * @tc.desc      notification boundary 429 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_NotifBoundary_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NotifBoundary_0430 begin`);
      logInfo("notification boundary 429");
      const actual: string = nextNotificationId(429) + '|' + badgeAfterAdd(429) + '|' + badgeAfterSet(429) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 2) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "430|430|429|1|0|1|");
      expect(actual).assertEqual("430|430|429|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0430 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0431
     * @tc.name      VPN_NotifBoundary_0431
     * @tc.desc      notification boundary 430 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0431 begin`);
      logInfo("notification boundary 430");
      const actual: string = nextNotificationId(430) + '|' + badgeAfterAdd(430) + '|' + badgeAfterSet(430) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 3) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g430");
      logInfo('actual=' + String(actual) + ', expected=' + "431|431|430|1|0|0|g430");
      expect(actual).assertEqual("431|431|430|1|0|0|g430");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0431 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0432
     * @tc.name      VPN_NotifBoundary_0432
     * @tc.desc      notification boundary 431 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0432 begin`);
      logInfo("notification boundary 431");
      const actual: string = nextNotificationId(431) + '|' + badgeAfterAdd(431) + '|' + badgeAfterSet(431) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 4) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g431");
      logInfo('actual=' + String(actual) + ', expected=' + "432|432|431|1|0|1|g431");
      expect(actual).assertEqual("432|432|431|1|0|1|g431");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0432 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0433
     * @tc.name      VPN_NotifBoundary_0433
     * @tc.desc      notification boundary 432 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0433 begin`);
      logInfo("notification boundary 432");
      const actual: string = nextNotificationId(432) + '|' + badgeAfterAdd(432) + '|' + badgeAfterSet(432) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 5) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "433|433|432|1|0|0|");
      expect(actual).assertEqual("433|433|432|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0433 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0434
     * @tc.name      VPN_NotifBoundary_0434
     * @tc.desc      notification boundary 433 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0434 begin`);
      logInfo("notification boundary 433");
      const actual: string = nextNotificationId(433) + '|' + badgeAfterAdd(433) + '|' + badgeAfterSet(433) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 1)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 1), 6) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g433");
      logInfo('actual=' + String(actual) + ', expected=' + "434|434|433|1|0|1|g433");
      expect(actual).assertEqual("434|434|433|1|0|1|g433");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0434 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0435
     * @tc.name      VPN_NotifBoundary_0435
     * @tc.desc      notification boundary 434 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0435 begin`);
      logInfo("notification boundary 434");
      const actual: string = nextNotificationId(434) + '|' + badgeAfterAdd(434) + '|' + badgeAfterSet(434) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 2)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 2), 0) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g434");
      logInfo('actual=' + String(actual) + ', expected=' + "435|435|434|1|0|0|g434");
      expect(actual).assertEqual("435|435|434|1|0|0|g434");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0435 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0436
     * @tc.name      VPN_NotifBoundary_0436
     * @tc.desc      notification boundary 435 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0436 begin`);
      logInfo("notification boundary 435");
      const actual: string = nextNotificationId(435) + '|' + badgeAfterAdd(435) + '|' + badgeAfterSet(435) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 3)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 3), 1) + '|' + wantAgentActionType(1) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "436|436|435|1|0|1|");
      expect(actual).assertEqual("436|436|435|1|0|1|");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0436 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0437
     * @tc.name      VPN_NotifBoundary_0437
     * @tc.desc      notification boundary 436 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0437 begin`);
      logInfo("notification boundary 436");
      const actual: string = nextNotificationId(436) + '|' + badgeAfterAdd(436) + '|' + badgeAfterSet(436) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 4)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 4), 2) + '|' + wantAgentActionType(0) + '|' + notificationGroup("g436");
      logInfo('actual=' + String(actual) + ', expected=' + "437|437|436|1|0|0|g436");
      expect(actual).assertEqual("437|437|436|1|0|0|g436");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0437 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0438
     * @tc.name      VPN_NotifBoundary_0438
     * @tc.desc      notification boundary 437 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0438 begin`);
      logInfo("notification boundary 437");
      const actual: string = nextNotificationId(437) + '|' + badgeAfterAdd(437) + '|' + badgeAfterSet(437) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 5)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 5), 3) + '|' + wantAgentActionType(1) + '|' + notificationGroup("g437");
      logInfo('actual=' + String(actual) + ', expected=' + "438|438|437|1|0|1|g437");
      expect(actual).assertEqual("438|438|437|1|0|1|g437");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}NotifBoundary_0438 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_NOTIF_BOUNDARY_0439
     * @tc.name      VPN_NotifBoundary_0439
     * @tc.desc      notification boundary 438 keeps id/badge/counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_NotifBoundary_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NotifBoundary_0439 begin`);
      logInfo("notification boundary 438");
      const actual: string = nextNotificationId(438) + '|' + badgeAfterAdd(438) + '|' + badgeAfterSet(438) + '|' + badgeTotal(countsByTypeIncrement(emptyNotificationCounts(), 0)) + '|' + notificationTypeCount(countsByTypeIncrement(emptyNotificationCounts(), 0), 4) + '|' + wantAgentActionType(0) + '|' + notificationGroup("");
      logInfo('actual=' + String(actual) + ', expected=' + "439|439|438|1|0|0|");
      expect(actual).assertEqual("439|439|438|1|0|0|");
      logInfo('typeof actual=' + typeof actual);
