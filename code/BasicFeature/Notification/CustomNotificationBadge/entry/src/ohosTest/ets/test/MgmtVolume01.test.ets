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

export default function mgmtVolume01Test() {
  describe('MgmtVolume01Test', () => {

    /**
     * @tc.name   testMgmtVolume010001
     * @tc.number SUB_CNB_MGMT_0041
     * @tc.desc   同类型累计：类型 0 连加两条后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010001 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(0, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(2));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010001 end');
    })

    /**
     * @tc.name   testMgmtVolume010002
     * @tc.number SUB_CNB_MGMT_0042
     * @tc.desc   同类型累计：类型 1 连加两条后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010002 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(1, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(2));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010002 end');
    })

    /**
     * @tc.name   testMgmtVolume010003
     * @tc.number SUB_CNB_MGMT_0043
     * @tc.desc   同类型累计：类型 2 连加两条后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010003 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(2, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(2));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010003 end');
    })

    /**
     * @tc.name   testMgmtVolume010004
     * @tc.number SUB_CNB_MGMT_0044
     * @tc.desc   同类型累计：类型 3 连加两条后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010004 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(3, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(2));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010004 end');
    })

    /**
     * @tc.name   testMgmtVolume010005
     * @tc.number SUB_CNB_MGMT_0045
     * @tc.desc   同类型累计：类型 4 连加两条后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010005 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 100, "first"));
      notificationManagement.addNotification(makeRequest(4, 101, "second"));
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(2));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010005 end');
    })

    /**
     * @tc.name   testMgmtVolume010006
     * @tc.number SUB_CNB_MGMT_0046
     * @tc.desc   同类型累计：类型 5 连加两条后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010006 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 100, "first"));
      notificationManagement.addNotification(makeRequest(5, 101, "second"));
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(2));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010006 end');
    })

    /**
     * @tc.name   testMgmtVolume010007
     * @tc.number SUB_CNB_MGMT_0047
     * @tc.desc   同类型累计：类型 6 连加两条后计数为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010007 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 100, "first"));
      notificationManagement.addNotification(makeRequest(6, 101, "second"));
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(2));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(2);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010007 end');
    })

    /**
     * @tc.name   testMgmtVolume010008
     * @tc.number SUB_CNB_MGMT_0048
     * @tc.desc   跨类型累计：类型 0 与 1 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010008 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(1, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010008 end');
    })

    /**
     * @tc.name   testMgmtVolume010009
     * @tc.number SUB_CNB_MGMT_0049
     * @tc.desc   跨类型累计：类型 0 与 2 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010009 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(2, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010009 end');
    })

    /**
     * @tc.name   testMgmtVolume010010
     * @tc.number SUB_CNB_MGMT_0050
     * @tc.desc   跨类型累计：类型 0 与 3 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010010 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(3, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010010 end');
    })

    /**
     * @tc.name   testMgmtVolume010011
     * @tc.number SUB_CNB_MGMT_0051
     * @tc.desc   跨类型累计：类型 0 与 4 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010011 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(4, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010011 end');
    })

    /**
     * @tc.name   testMgmtVolume010012
     * @tc.number SUB_CNB_MGMT_0052
     * @tc.desc   跨类型累计：类型 0 与 5 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010012 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(5, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010012 end');
    })

    /**
     * @tc.name   testMgmtVolume010013
     * @tc.number SUB_CNB_MGMT_0053
     * @tc.desc   跨类型累计：类型 1 与 2 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010013 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(2, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010013 end');
    })

    /**
     * @tc.name   testMgmtVolume010014
     * @tc.number SUB_CNB_MGMT_0054
     * @tc.desc   跨类型累计：类型 1 与 3 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010014 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(3, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010014 end');
    })

    /**
     * @tc.name   testMgmtVolume010015
     * @tc.number SUB_CNB_MGMT_0055
     * @tc.desc   跨类型累计：类型 1 与 4 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010015 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(4, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010015 end');
    })

    /**
     * @tc.name   testMgmtVolume010016
     * @tc.number SUB_CNB_MGMT_0056
     * @tc.desc   跨类型累计：类型 1 与 5 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010016 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(5, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010016 end');
    })

    /**
     * @tc.name   testMgmtVolume010017
     * @tc.number SUB_CNB_MGMT_0057
     * @tc.desc   跨类型累计：类型 1 与 6 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010017 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(6, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010017 end');
    })

    /**
     * @tc.name   testMgmtVolume010018
     * @tc.number SUB_CNB_MGMT_0058
     * @tc.desc   跨类型累计：类型 2 与 3 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010018 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(3, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010018 end');
    })

    /**
     * @tc.name   testMgmtVolume010019
     * @tc.number SUB_CNB_MGMT_0059
     * @tc.desc   跨类型累计：类型 2 与 4 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010019 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(4, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010019 end');
    })

    /**
     * @tc.name   testMgmtVolume010020
     * @tc.number SUB_CNB_MGMT_0060
     * @tc.desc   跨类型累计：类型 2 与 5 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010020 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(5, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010020 end');
    })

    /**
     * @tc.name   testMgmtVolume010021
     * @tc.number SUB_CNB_MGMT_0061
     * @tc.desc   跨类型累计：类型 2 与 6 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010021 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(6, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010021 end');
    })

    /**
     * @tc.name   testMgmtVolume010022
     * @tc.number SUB_CNB_MGMT_0062
     * @tc.desc   跨类型累计：类型 2 与 0 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010022 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(0, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010022 end');
    })

    /**
     * @tc.name   testMgmtVolume010023
     * @tc.number SUB_CNB_MGMT_0063
     * @tc.desc   跨类型累计：类型 3 与 4 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010023 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(4, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010023 end');
    })

    /**
     * @tc.name   testMgmtVolume010024
     * @tc.number SUB_CNB_MGMT_0064
     * @tc.desc   跨类型累计：类型 3 与 5 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010024 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(5, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010024 end');
    })

    /**
     * @tc.name   testMgmtVolume010025
     * @tc.number SUB_CNB_MGMT_0065
     * @tc.desc   跨类型累计：类型 3 与 6 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010025 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(6, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010025 end');
    })

    /**
     * @tc.name   testMgmtVolume010026
     * @tc.number SUB_CNB_MGMT_0066
     * @tc.desc   跨类型累计：类型 3 与 0 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010026 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(0, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010026 end');
    })

    /**
     * @tc.name   testMgmtVolume010027
     * @tc.number SUB_CNB_MGMT_0067
     * @tc.desc   跨类型累计：类型 3 与 1 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010027 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(1, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010027 end');
    })

    /**
     * @tc.name   testMgmtVolume010028
     * @tc.number SUB_CNB_MGMT_0068
     * @tc.desc   跨类型累计：类型 4 与 5 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010028 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 100, "first"));
      notificationManagement.addNotification(makeRequest(5, 101, "second"));
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010028 end');
    })

    /**
     * @tc.name   testMgmtVolume010029
     * @tc.number SUB_CNB_MGMT_0069
     * @tc.desc   跨类型累计：类型 4 与 6 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010029 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 100, "first"));
      notificationManagement.addNotification(makeRequest(6, 101, "second"));
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010029 end');
    })

    /**
     * @tc.name   testMgmtVolume010030
     * @tc.number SUB_CNB_MGMT_0070
     * @tc.desc   跨类型累计：类型 4 与 0 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010030 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 100, "first"));
      notificationManagement.addNotification(makeRequest(0, 101, "second"));
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010030 end');
    })

    /**
     * @tc.name   testMgmtVolume010031
     * @tc.number SUB_CNB_MGMT_0071
     * @tc.desc   跨类型累计：类型 4 与 1 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010031 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 100, "first"));
      notificationManagement.addNotification(makeRequest(1, 101, "second"));
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010031 end');
    })

    /**
     * @tc.name   testMgmtVolume010032
     * @tc.number SUB_CNB_MGMT_0072
     * @tc.desc   跨类型累计：类型 4 与 2 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010032 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 100, "first"));
      notificationManagement.addNotification(makeRequest(2, 101, "second"));
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010032 end');
    })

    /**
     * @tc.name   testMgmtVolume010033
     * @tc.number SUB_CNB_MGMT_0073
     * @tc.desc   跨类型累计：类型 5 与 6 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010033 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 100, "first"));
      notificationManagement.addNotification(makeRequest(6, 101, "second"));
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010033 end');
    })

    /**
     * @tc.name   testMgmtVolume010034
     * @tc.number SUB_CNB_MGMT_0074
     * @tc.desc   跨类型累计：类型 5 与 0 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010034 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 100, "first"));
      notificationManagement.addNotification(makeRequest(0, 101, "second"));
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010034 end');
    })

    /**
     * @tc.name   testMgmtVolume010035
     * @tc.number SUB_CNB_MGMT_0075
     * @tc.desc   跨类型累计：类型 5 与 1 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010035 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 100, "first"));
      notificationManagement.addNotification(makeRequest(1, 101, "second"));
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010035 end');
    })

    /**
     * @tc.name   testMgmtVolume010036
     * @tc.number SUB_CNB_MGMT_0076
     * @tc.desc   跨类型累计：类型 5 与 2 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010036 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 100, "first"));
      notificationManagement.addNotification(makeRequest(2, 101, "second"));
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010036 end');
    })

    /**
     * @tc.name   testMgmtVolume010037
     * @tc.number SUB_CNB_MGMT_0077
     * @tc.desc   跨类型累计：类型 5 与 3 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010037 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 100, "first"));
      notificationManagement.addNotification(makeRequest(3, 101, "second"));
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010037 end');
    })

    /**
     * @tc.name   testMgmtVolume010038
     * @tc.number SUB_CNB_MGMT_0078
     * @tc.desc   跨类型累计：类型 6 与 0 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010038 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 100, "first"));
      notificationManagement.addNotification(makeRequest(0, 101, "second"));
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010038 end');
    })

    /**
     * @tc.name   testMgmtVolume010039
     * @tc.number SUB_CNB_MGMT_0079
     * @tc.desc   跨类型累计：类型 6 与 1 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010039 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 100, "first"));
      notificationManagement.addNotification(makeRequest(1, 101, "second"));
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010039 end');
    })

    /**
     * @tc.name   testMgmtVolume010040
     * @tc.number SUB_CNB_MGMT_0080
     * @tc.desc   跨类型累计：类型 6 与 2 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010040 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 100, "first"));
      notificationManagement.addNotification(makeRequest(2, 101, "second"));
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010040 end');
    })

    /**
     * @tc.name   testMgmtVolume010041
     * @tc.number SUB_CNB_MGMT_0081
     * @tc.desc   跨类型累计：类型 6 与 3 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010041 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 100, "first"));
      notificationManagement.addNotification(makeRequest(3, 101, "second"));
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010041 end');
    })

    /**
     * @tc.name   testMgmtVolume010042
     * @tc.number SUB_CNB_MGMT_0082
     * @tc.desc   跨类型累计：类型 6 与 4 各一条后本组计数为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010042 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 100, "first"));
      notificationManagement.addNotification(makeRequest(4, 101, "second"));
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(2));
      expect(notificationManagement.badgeNum).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(2));
      expect(notificationManagement.getBadgeNumber()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010042 end');
    })

    /**
     * @tc.name   testMgmtVolume010043
     * @tc.number SUB_CNB_MGMT_0083
     * @tc.desc   越界跳过：第二条类型 7 被丢弃，有效类型 0 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010043 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(7, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010043 end');
    })

    /**
     * @tc.name   testMgmtVolume010044
     * @tc.number SUB_CNB_MGMT_0084
     * @tc.desc   越界跳过：第二条类型 7 被丢弃，有效类型 1 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010044 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(7, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010044 end');
    })

    /**
     * @tc.name   testMgmtVolume010045
     * @tc.number SUB_CNB_MGMT_0085
     * @tc.desc   越界跳过：第二条类型 7 被丢弃，有效类型 2 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010045 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(7, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010045 end');
    })

    /**
     * @tc.name   testMgmtVolume010046
     * @tc.number SUB_CNB_MGMT_0086
     * @tc.desc   越界跳过：第二条类型 7 被丢弃，有效类型 3 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010046 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(7, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010046 end');
    })

    /**
     * @tc.name   testMgmtVolume010047
     * @tc.number SUB_CNB_MGMT_0087
     * @tc.desc   越界跳过：第二条类型 99 被丢弃，有效类型 0 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010047 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(99, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010047 end');
    })

    /**
     * @tc.name   testMgmtVolume010048
     * @tc.number SUB_CNB_MGMT_0088
     * @tc.desc   越界跳过：第二条类型 99 被丢弃，有效类型 1 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010048 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(99, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010048 end');
    })

    /**
     * @tc.name   testMgmtVolume010049
     * @tc.number SUB_CNB_MGMT_0089
     * @tc.desc   越界跳过：第二条类型 99 被丢弃，有效类型 2 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010049 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(99, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010049 end');
    })

    /**
     * @tc.name   testMgmtVolume010050
     * @tc.number SUB_CNB_MGMT_0090
     * @tc.desc   越界跳过：第二条类型 99 被丢弃，有效类型 3 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010050 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(99, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010050 end');
    })

    /**
     * @tc.name   testMgmtVolume010051
     * @tc.number SUB_CNB_MGMT_0091
     * @tc.desc   越界跳过：第二条类型 99 被丢弃，有效类型 4 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010051 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 100, "first"));
      notificationManagement.addNotification(makeRequest(99, 101, "second"));
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010051 end');
    })

    /**
     * @tc.name   testMgmtVolume010052
     * @tc.number SUB_CNB_MGMT_0092
     * @tc.desc   越界跳过：第二条类型 99 被丢弃，有效类型 5 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010052 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 100, "first"));
      notificationManagement.addNotification(makeRequest(99, 101, "second"));
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010052 end');
    })

    /**
     * @tc.name   testMgmtVolume010053
     * @tc.number SUB_CNB_MGMT_0093
     * @tc.desc   越界跳过：第二条类型 99 被丢弃，有效类型 6 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010053 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 100, "first"));
      notificationManagement.addNotification(makeRequest(99, 101, "second"));
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010053 end');
    })

    /**
     * @tc.name   testMgmtVolume010054
     * @tc.number SUB_CNB_MGMT_0094
     * @tc.desc   越界跳过：第二条类型 -1 被丢弃，有效类型 0 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010054 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 100, "first"));
      notificationManagement.addNotification(makeRequest(-1, 101, "second"));
      const result: number = notificationManagement.countsByType[0];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010054 end');
    })

    /**
     * @tc.name   testMgmtVolume010055
     * @tc.number SUB_CNB_MGMT_0095
     * @tc.desc   越界跳过：第二条类型 -1 被丢弃，有效类型 1 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010055 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 100, "first"));
      notificationManagement.addNotification(makeRequest(-1, 101, "second"));
      const result: number = notificationManagement.countsByType[1];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010055 end');
    })

    /**
     * @tc.name   testMgmtVolume010056
     * @tc.number SUB_CNB_MGMT_0096
     * @tc.desc   越界跳过：第二条类型 -1 被丢弃，有效类型 2 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010056 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 100, "first"));
      notificationManagement.addNotification(makeRequest(-1, 101, "second"));
      const result: number = notificationManagement.countsByType[2];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010056 end');
    })

    /**
     * @tc.name   testMgmtVolume010057
     * @tc.number SUB_CNB_MGMT_0097
     * @tc.desc   越界跳过：第二条类型 -1 被丢弃，有效类型 3 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010057 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 100, "first"));
      notificationManagement.addNotification(makeRequest(-1, 101, "second"));
      const result: number = notificationManagement.countsByType[3];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010057 end');
    })

    /**
     * @tc.name   testMgmtVolume010058
     * @tc.number SUB_CNB_MGMT_0098
     * @tc.desc   越界跳过：第二条类型 -1 被丢弃，有效类型 4 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010058 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 100, "first"));
      notificationManagement.addNotification(makeRequest(-1, 101, "second"));
      const result: number = notificationManagement.countsByType[4];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010058 end');
    })

    /**
     * @tc.name   testMgmtVolume010059
     * @tc.number SUB_CNB_MGMT_0099
     * @tc.desc   越界跳过：第二条类型 -1 被丢弃，有效类型 5 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010059 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 100, "first"));
      notificationManagement.addNotification(makeRequest(-1, 101, "second"));
      const result: number = notificationManagement.countsByType[5];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010059 end');
    })

    /**
     * @tc.name   testMgmtVolume010060
     * @tc.number SUB_CNB_MGMT_0100
     * @tc.desc   越界跳过：第二条类型 -1 被丢弃，有效类型 6 计 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010060 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 100, "first"));
      notificationManagement.addNotification(makeRequest(-1, 101, "second"));
      const result: number = notificationManagement.countsByType[6];
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(notificationManagement.badgeNum), String(1));
      expect(notificationManagement.badgeNum).assertEqual(1);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      logActual(String(notificationManagement.getBadgeNumber()), String(1));
      expect(notificationManagement.getBadgeNumber()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010060 end');
    })

    /**
     * @tc.name   testMgmtVolume010061
     * @tc.number SUB_CNB_MGMT_0101
     * @tc.desc   越界类型 99 与 7 整条丢弃，计数与角标保持 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMgmtVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010061 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(99, 900, 'invalid'));
      notificationManagement.addNotification(makeRequest(7, 901, 'invalid'));
      let total: number = 0;
      for (let i = 0; i <= 6; i++) {
        total += notificationManagement.countsByType[i];
      }
      expect(total).assertEqual(0);
      expect(notificationManagement.badgeNum).assertEqual(0);
      expect(notificationManagement.getBadgeNumber()).assertEqual(0);
      expect(notificationManagement.typeNotifications[0].length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume010061 end');
    })

  })
}
