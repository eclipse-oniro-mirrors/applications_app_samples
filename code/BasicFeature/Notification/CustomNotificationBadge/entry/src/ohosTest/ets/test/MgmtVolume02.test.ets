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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManagement } from '@ohos/notification';
import { makeRequest } from './helper/NotificationFixtures';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomNotificationBadge]';

// 统一记录实际值与期望值，避免逐处重复书写日志格式串
function logActual(actual: string, expected: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, expected);
}

export default function mgmtVolume02Test() {
  describe('MgmtVolume02Test', () => {

    /**
     * @tc.name   testMgmtVolume020001
     * @tc.number SUB_CNB_MGMT_0102
     * @tc.desc   取消语义：取消类型 0 后类型 0 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020001 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(1, 201, "other"));
      notificationManagement.cancelNotificationType(0);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020001 end');
    })

    /**
     * @tc.name   testMgmtVolume020002
     * @tc.number SUB_CNB_MGMT_0103
     * @tc.desc   取消语义：取消类型 1 后类型 0 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020002 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(1, 201, "other"));
      notificationManagement.cancelNotificationType(1);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020002 end');
    })

    /**
     * @tc.name   testMgmtVolume020003
     * @tc.number SUB_CNB_MGMT_0104
     * @tc.desc   取消语义：取消类型 2 后类型 0 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020003 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(1, 201, "other"));
      notificationManagement.cancelNotificationType(2);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020003 end');
    })

    /**
     * @tc.name   testMgmtVolume020004
     * @tc.number SUB_CNB_MGMT_0105
     * @tc.desc   取消语义：取消类型 3 后类型 0 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020004 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(1, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020004 end');
    })

    /**
     * @tc.name   testMgmtVolume020005
     * @tc.number SUB_CNB_MGMT_0106
     * @tc.desc   取消语义：取消类型 4 后类型 0 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020005 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(1, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020005 end');
    })

    /**
     * @tc.name   testMgmtVolume020006
     * @tc.number SUB_CNB_MGMT_0107
     * @tc.desc   取消语义：取消类型 5 后类型 0 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020006 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(1, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020006 end');
    })

    /**
     * @tc.name   testMgmtVolume020007
     * @tc.number SUB_CNB_MGMT_0108
     * @tc.desc   取消语义：取消类型 6 后类型 0 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020007 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(1, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020007 end');
    })

    /**
     * @tc.name   testMgmtVolume020008
     * @tc.number SUB_CNB_MGMT_0109
     * @tc.desc   取消语义：取消类型 0 后类型 1 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020008 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(2, 201, "other"));
      notificationManagement.cancelNotificationType(0);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020008 end');
    })

    /**
     * @tc.name   testMgmtVolume020009
     * @tc.number SUB_CNB_MGMT_0110
     * @tc.desc   取消语义：取消类型 1 后类型 1 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020009 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(2, 201, "other"));
      notificationManagement.cancelNotificationType(1);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020009 end');
    })

    /**
     * @tc.name   testMgmtVolume020010
     * @tc.number SUB_CNB_MGMT_0111
     * @tc.desc   取消语义：取消类型 2 后类型 1 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020010 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(2, 201, "other"));
      notificationManagement.cancelNotificationType(2);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020010 end');
    })

    /**
     * @tc.name   testMgmtVolume020011
     * @tc.number SUB_CNB_MGMT_0112
     * @tc.desc   取消语义：取消类型 3 后类型 1 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020011 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(2, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020011 end');
    })

    /**
     * @tc.name   testMgmtVolume020012
     * @tc.number SUB_CNB_MGMT_0113
     * @tc.desc   取消语义：取消类型 4 后类型 1 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020012 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(2, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020012 end');
    })

    /**
     * @tc.name   testMgmtVolume020013
     * @tc.number SUB_CNB_MGMT_0114
     * @tc.desc   取消语义：取消类型 5 后类型 1 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020013 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(2, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020013 end');
    })

    /**
     * @tc.name   testMgmtVolume020014
     * @tc.number SUB_CNB_MGMT_0115
     * @tc.desc   取消语义：取消类型 6 后类型 1 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020014 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(2, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020014 end');
    })

    /**
     * @tc.name   testMgmtVolume020015
     * @tc.number SUB_CNB_MGMT_0116
     * @tc.desc   取消语义：取消类型 0 后类型 2 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020015 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(3, 201, "other"));
      notificationManagement.cancelNotificationType(0);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020015 end');
    })

    /**
     * @tc.name   testMgmtVolume020016
     * @tc.number SUB_CNB_MGMT_0117
     * @tc.desc   取消语义：取消类型 1 后类型 2 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020016 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(3, 201, "other"));
      notificationManagement.cancelNotificationType(1);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020016 end');
    })

    /**
     * @tc.name   testMgmtVolume020017
     * @tc.number SUB_CNB_MGMT_0118
     * @tc.desc   取消语义：取消类型 2 后类型 2 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020017 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(3, 201, "other"));
      notificationManagement.cancelNotificationType(2);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020017 end');
    })

    /**
     * @tc.name   testMgmtVolume020018
     * @tc.number SUB_CNB_MGMT_0119
     * @tc.desc   取消语义：取消类型 3 后类型 2 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020018 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(3, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020018 end');
    })

    /**
     * @tc.name   testMgmtVolume020019
     * @tc.number SUB_CNB_MGMT_0120
     * @tc.desc   取消语义：取消类型 4 后类型 2 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020019 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(3, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020019 end');
    })

    /**
     * @tc.name   testMgmtVolume020020
     * @tc.number SUB_CNB_MGMT_0121
     * @tc.desc   取消语义：取消类型 5 后类型 2 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020020 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(3, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020020 end');
    })

    /**
     * @tc.name   testMgmtVolume020021
     * @tc.number SUB_CNB_MGMT_0122
     * @tc.desc   取消语义：取消类型 6 后类型 2 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020021 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(3, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020021 end');
    })

    /**
     * @tc.name   testMgmtVolume020022
     * @tc.number SUB_CNB_MGMT_0123
     * @tc.desc   取消语义：取消类型 0 后类型 3 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020022 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(0);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020022 end');
    })

    /**
     * @tc.name   testMgmtVolume020023
     * @tc.number SUB_CNB_MGMT_0124
     * @tc.desc   取消语义：取消类型 1 后类型 3 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020023 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(1);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020023 end');
    })

    /**
     * @tc.name   testMgmtVolume020024
     * @tc.number SUB_CNB_MGMT_0125
     * @tc.desc   取消语义：取消类型 2 后类型 3 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020024 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(2);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020024 end');
    })

    /**
     * @tc.name   testMgmtVolume020025
     * @tc.number SUB_CNB_MGMT_0126
     * @tc.desc   取消语义：取消类型 3 后类型 3 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020025 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020025 end');
    })

    /**
     * @tc.name   testMgmtVolume020026
     * @tc.number SUB_CNB_MGMT_0127
     * @tc.desc   取消语义：取消类型 4 后类型 3 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020026 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020026 end');
    })

    /**
     * @tc.name   testMgmtVolume020027
     * @tc.number SUB_CNB_MGMT_0128
     * @tc.desc   取消语义：取消类型 5 后类型 3 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020027 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020027 end');
    })

    /**
     * @tc.name   testMgmtVolume020028
     * @tc.number SUB_CNB_MGMT_0129
     * @tc.desc   取消语义：取消类型 6 后类型 3 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020028 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020028 end');
    })

    /**
     * @tc.name   testMgmtVolume020029
     * @tc.number SUB_CNB_MGMT_0130
     * @tc.desc   取消语义：取消类型 0 后类型 4 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020029 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(0);
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020029 end');
    })

    /**
     * @tc.name   testMgmtVolume020030
     * @tc.number SUB_CNB_MGMT_0131
     * @tc.desc   取消语义：取消类型 1 后类型 4 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020030 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(1);
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020030 end');
    })

    /**
     * @tc.name   testMgmtVolume020031
     * @tc.number SUB_CNB_MGMT_0132
     * @tc.desc   取消语义：取消类型 2 后类型 4 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020031 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(2);
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020031 end');
    })

    /**
     * @tc.name   testMgmtVolume020032
     * @tc.number SUB_CNB_MGMT_0133
     * @tc.desc   取消语义：取消类型 3 后类型 4 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020032 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020032 end');
    })

    /**
     * @tc.name   testMgmtVolume020033
     * @tc.number SUB_CNB_MGMT_0134
     * @tc.desc   取消语义：取消类型 4 后类型 4 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020033 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020033 end');
    })

    /**
     * @tc.name   testMgmtVolume020034
     * @tc.number SUB_CNB_MGMT_0135
     * @tc.desc   取消语义：取消类型 5 后类型 4 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020034 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020034 end');
    })

    /**
     * @tc.name   testMgmtVolume020035
     * @tc.number SUB_CNB_MGMT_0136
     * @tc.desc   取消语义：取消类型 6 后类型 4 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020035 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020035 end');
    })

    /**
     * @tc.name   testMgmtVolume020036
     * @tc.number SUB_CNB_MGMT_0137
     * @tc.desc   取消语义：取消类型 0 后类型 5 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020036 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(0);
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020036 end');
    })

    /**
     * @tc.name   testMgmtVolume020037
     * @tc.number SUB_CNB_MGMT_0138
     * @tc.desc   取消语义：取消类型 1 后类型 5 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020037 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(1);
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020037 end');
    })

    /**
     * @tc.name   testMgmtVolume020038
     * @tc.number SUB_CNB_MGMT_0139
     * @tc.desc   取消语义：取消类型 2 后类型 5 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020038 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(2);
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020038 end');
    })

    /**
     * @tc.name   testMgmtVolume020039
     * @tc.number SUB_CNB_MGMT_0140
     * @tc.desc   取消语义：取消类型 3 后类型 5 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020039 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020039 end');
    })

    /**
     * @tc.name   testMgmtVolume020040
     * @tc.number SUB_CNB_MGMT_0141
     * @tc.desc   取消语义：取消类型 4 后类型 5 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020040 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020040 end');
    })

    /**
     * @tc.name   testMgmtVolume020041
     * @tc.number SUB_CNB_MGMT_0142
     * @tc.desc   取消语义：取消类型 5 后类型 5 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020041 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020041 end');
    })

    /**
     * @tc.name   testMgmtVolume020042
     * @tc.number SUB_CNB_MGMT_0143
     * @tc.desc   取消语义：取消类型 6 后类型 5 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020042 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020042 end');
    })

    /**
     * @tc.name   testMgmtVolume020043
     * @tc.number SUB_CNB_MGMT_0144
     * @tc.desc   取消语义：取消类型 0 后类型 6 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020043 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(0);
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020043 end');
    })

    /**
     * @tc.name   testMgmtVolume020044
     * @tc.number SUB_CNB_MGMT_0145
     * @tc.desc   取消语义：取消类型 1 后类型 6 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020044 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(1);
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020044 end');
    })

    /**
     * @tc.name   testMgmtVolume020045
     * @tc.number SUB_CNB_MGMT_0146
     * @tc.desc   取消语义：取消类型 2 后类型 6 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020045 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(2);
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020045 end');
    })

    /**
     * @tc.name   testMgmtVolume020046
     * @tc.number SUB_CNB_MGMT_0147
     * @tc.desc   取消语义：取消类型 3 后类型 6 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020046 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020046 end');
    })

    /**
     * @tc.name   testMgmtVolume020047
     * @tc.number SUB_CNB_MGMT_0148
     * @tc.desc   取消语义：取消类型 4 后类型 6 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020047 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020047 end');
    })

    /**
     * @tc.name   testMgmtVolume020048
     * @tc.number SUB_CNB_MGMT_0149
     * @tc.desc   取消语义：取消类型 5 后类型 6 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020048 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020048 end');
    })

    /**
     * @tc.name   testMgmtVolume020049
     * @tc.number SUB_CNB_MGMT_0150
     * @tc.desc   取消语义：取消类型 6 后类型 6 的本地计数仍为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020049 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020049 end');
    })

    /**
     * @tc.name   testMgmtVolume020050
     * @tc.number SUB_CNB_MGMT_0151
     * @tc.desc   取消语义：同类型两条记录取消类型 2 不影响类型 0 计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020050 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(2);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(2));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020050 end');
    })

    /**
     * @tc.name   testMgmtVolume020051
     * @tc.number SUB_CNB_MGMT_0152
     * @tc.desc   取消语义：同类型两条记录取消类型 3 不影响类型 1 计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020051 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(1, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(2));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020051 end');
    })

    /**
     * @tc.name   testMgmtVolume020052
     * @tc.number SUB_CNB_MGMT_0153
     * @tc.desc   取消语义：同类型两条记录取消类型 4 不影响类型 2 计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020052 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(2, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(2));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020052 end');
    })

    /**
     * @tc.name   testMgmtVolume020053
     * @tc.number SUB_CNB_MGMT_0154
     * @tc.desc   取消语义：同类型两条记录取消类型 5 不影响类型 3 计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020053 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(3, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(2));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020053 end');
    })

    /**
     * @tc.name   testMgmtVolume020054
     * @tc.number SUB_CNB_MGMT_0155
     * @tc.desc   取消语义：同类型两条记录取消类型 6 不影响类型 4 计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020054 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(2));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020054 end');
    })

    /**
     * @tc.name   testMgmtVolume020055
     * @tc.number SUB_CNB_MGMT_0156
     * @tc.desc   取消语义：同类型两条记录取消类型 0 不影响类型 5 计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020055 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(0);
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(2));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020055 end');
    })

    /**
     * @tc.name   testMgmtVolume020056
     * @tc.number SUB_CNB_MGMT_0157
     * @tc.desc   取消语义：同类型两条记录取消类型 1 不影响类型 6 计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020056 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(1);
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(2));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020056 end');
    })

    /**
     * @tc.name   testMgmtVolume020057
     * @tc.number SUB_CNB_MGMT_0158
     * @tc.desc   取消语义：类型 0 与 4 各一条，取消 3 后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020057 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 200, "keep"));
      notificationManagement.addNotification(makeRequest(4, 201, "other"));
      notificationManagement.cancelNotificationType(3);
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020057 end');
    })

    /**
     * @tc.name   testMgmtVolume020058
     * @tc.number SUB_CNB_MGMT_0159
     * @tc.desc   取消语义：类型 1 与 5 各一条，取消 4 后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020058 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 200, "keep"));
      notificationManagement.addNotification(makeRequest(5, 201, "other"));
      notificationManagement.cancelNotificationType(4);
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020058 end');
    })

    /**
     * @tc.name   testMgmtVolume020059
     * @tc.number SUB_CNB_MGMT_0160
     * @tc.desc   取消语义：类型 2 与 6 各一条，取消 5 后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020059 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 200, "keep"));
      notificationManagement.addNotification(makeRequest(6, 201, "other"));
      notificationManagement.cancelNotificationType(5);
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020059 end');
    })

    /**
     * @tc.name   testMgmtVolume020060
     * @tc.number SUB_CNB_MGMT_0161
     * @tc.desc   取消语义：类型 3 与 0 各一条，取消 6 后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume020060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020060 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 200, "keep"));
      notificationManagement.addNotification(makeRequest(0, 201, "other"));
      notificationManagement.cancelNotificationType(6);
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020060 end');
    })

    /**
     * @tc.name   testMgmtVolume020061
     * @tc.number SUB_CNB_MGMT_0162
     * @tc.desc   取消类型后本地分组计数与角标都不回退
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMgmtVolume020061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020061 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 902, 'keep'));
      const before: number = notificationManagement.countsByType[2];
      notificationManagement.cancelNotificationType(2);
      const after: number = notificationManagement.countsByType[2];
      expect(before).assertEqual(1);
      expect(after).assertEqual(1);
      expect(before - after).assertEqual(0);
      expect(notificationManagement.badgeNum).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume020061 end');
    })

  })
}
