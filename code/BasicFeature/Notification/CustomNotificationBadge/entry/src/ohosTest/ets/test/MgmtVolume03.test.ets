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

export default function mgmtVolume03Test() {
  describe('MgmtVolume03Test', () => {

    /**
     * @tc.name   testMgmtVolume030001
     * @tc.number SUB_CNB_MGMT_0163
     * @tc.desc   三条同类型：类型 0 三条后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030001 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(0, 301, "b"));
      notificationManagement.addNotification(makeRequest(0, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(3));
      expect(notificationManagement.countsByType[0]).assertEqual(3);
      logActual(String(notificationManagement.countsByType[0]), String(3));
      expect(notificationManagement.countsByType[0]).assertEqual(3);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[0].length), String(3));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030001 end');
    })

    /**
     * @tc.name   testMgmtVolume030002
     * @tc.number SUB_CNB_MGMT_0164
     * @tc.desc   三条同类型：类型 1 三条后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030002 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(1, 301, "b"));
      notificationManagement.addNotification(makeRequest(1, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(3));
      expect(notificationManagement.countsByType[1]).assertEqual(3);
      logActual(String(notificationManagement.countsByType[1]), String(3));
      expect(notificationManagement.countsByType[1]).assertEqual(3);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[1].length), String(3));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030002 end');
    })

    /**
     * @tc.name   testMgmtVolume030003
     * @tc.number SUB_CNB_MGMT_0165
     * @tc.desc   三条同类型：类型 2 三条后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030003 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(2, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(3));
      expect(notificationManagement.countsByType[2]).assertEqual(3);
      logActual(String(notificationManagement.countsByType[2]), String(3));
      expect(notificationManagement.countsByType[2]).assertEqual(3);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[2].length), String(3));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030003 end');
    })

    /**
     * @tc.name   testMgmtVolume030004
     * @tc.number SUB_CNB_MGMT_0166
     * @tc.desc   三条同类型：类型 3 三条后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030004 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 300, "a"));
      notificationManagement.addNotification(makeRequest(3, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[3]), String(3));
      expect(notificationManagement.countsByType[3]).assertEqual(3);
      logActual(String(notificationManagement.countsByType[3]), String(3));
      expect(notificationManagement.countsByType[3]).assertEqual(3);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[3].length), String(3));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030004 end');
    })

    /**
     * @tc.name   testMgmtVolume030005
     * @tc.number SUB_CNB_MGMT_0167
     * @tc.desc   三条同类型：类型 4 三条后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030005 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 300, "a"));
      notificationManagement.addNotification(makeRequest(4, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[4]), String(3));
      expect(notificationManagement.countsByType[4]).assertEqual(3);
      logActual(String(notificationManagement.countsByType[4]), String(3));
      expect(notificationManagement.countsByType[4]).assertEqual(3);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[4].length), String(3));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030005 end');
    })

    /**
     * @tc.name   testMgmtVolume030006
     * @tc.number SUB_CNB_MGMT_0168
     * @tc.desc   三条同类型：类型 5 三条后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030006 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 300, "a"));
      notificationManagement.addNotification(makeRequest(5, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[5]), String(3));
      expect(notificationManagement.countsByType[5]).assertEqual(3);
      logActual(String(notificationManagement.countsByType[5]), String(3));
      expect(notificationManagement.countsByType[5]).assertEqual(3);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[5].length), String(3));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030006 end');
    })

    /**
     * @tc.name   testMgmtVolume030007
     * @tc.number SUB_CNB_MGMT_0169
     * @tc.desc   三条同类型：类型 6 三条后计数为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030007 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 300, "a"));
      notificationManagement.addNotification(makeRequest(6, 301, "b"));
      notificationManagement.addNotification(makeRequest(6, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[6]), String(3));
      expect(notificationManagement.countsByType[6]).assertEqual(3);
      logActual(String(notificationManagement.countsByType[6]), String(3));
      expect(notificationManagement.countsByType[6]).assertEqual(3);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[6].length), String(3));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030007 end');
    })

    /**
     * @tc.name   testMgmtVolume030008
     * @tc.number SUB_CNB_MGMT_0170
     * @tc.desc   两同一异：类型 0 两条、类型 1 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030008 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(0, 301, "b"));
      notificationManagement.addNotification(makeRequest(1, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[1]), String(1));
      expect(notificationManagement.countsByType[1]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030008 end');
    })

    /**
     * @tc.name   testMgmtVolume030009
     * @tc.number SUB_CNB_MGMT_0171
     * @tc.desc   两同一异：类型 1 两条、类型 2 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030009 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(1, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[2]), String(1));
      expect(notificationManagement.countsByType[2]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030009 end');
    })

    /**
     * @tc.name   testMgmtVolume030010
     * @tc.number SUB_CNB_MGMT_0172
     * @tc.desc   两同一异：类型 2 两条、类型 3 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030010 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(2, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[3]), String(1));
      expect(notificationManagement.countsByType[3]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030010 end');
    })

    /**
     * @tc.name   testMgmtVolume030011
     * @tc.number SUB_CNB_MGMT_0173
     * @tc.desc   两同一异：类型 3 两条、类型 4 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030011 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 300, "a"));
      notificationManagement.addNotification(makeRequest(3, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[4]), String(1));
      expect(notificationManagement.countsByType[4]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030011 end');
    })

    /**
     * @tc.name   testMgmtVolume030012
     * @tc.number SUB_CNB_MGMT_0174
     * @tc.desc   两同一异：类型 4 两条、类型 5 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030012 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 300, "a"));
      notificationManagement.addNotification(makeRequest(4, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[5]), String(1));
      expect(notificationManagement.countsByType[5]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030012 end');
    })

    /**
     * @tc.name   testMgmtVolume030013
     * @tc.number SUB_CNB_MGMT_0175
     * @tc.desc   两同一异：类型 5 两条、类型 6 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030013 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 300, "a"));
      notificationManagement.addNotification(makeRequest(5, 301, "b"));
      notificationManagement.addNotification(makeRequest(6, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[6]), String(1));
      expect(notificationManagement.countsByType[6]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030013 end');
    })

    /**
     * @tc.name   testMgmtVolume030014
     * @tc.number SUB_CNB_MGMT_0176
     * @tc.desc   两同一异：类型 6 两条、类型 0 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030014 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 300, "a"));
      notificationManagement.addNotification(makeRequest(6, 301, "b"));
      notificationManagement.addNotification(makeRequest(0, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[0]), String(1));
      expect(notificationManagement.countsByType[0]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030014 end');
    })

    /**
     * @tc.name   testMgmtVolume030015
     * @tc.number SUB_CNB_MGMT_0177
     * @tc.desc   一异两同：类型 0 一条、类型 1 两条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030015 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(1, 301, "b"));
      notificationManagement.addNotification(makeRequest(1, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(1));
      expect(notificationManagement.countsByType[0]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[1].length), String(2));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030015 end');
    })

    /**
     * @tc.name   testMgmtVolume030016
     * @tc.number SUB_CNB_MGMT_0178
     * @tc.desc   一异两同：类型 1 一条、类型 2 两条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030016 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(2, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(1));
      expect(notificationManagement.countsByType[1]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[2].length), String(2));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030016 end');
    })

    /**
     * @tc.name   testMgmtVolume030017
     * @tc.number SUB_CNB_MGMT_0179
     * @tc.desc   一异两同：类型 2 一条、类型 3 两条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030017 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(3, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(1));
      expect(notificationManagement.countsByType[2]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[3].length), String(2));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030017 end');
    })

    /**
     * @tc.name   testMgmtVolume030018
     * @tc.number SUB_CNB_MGMT_0180
     * @tc.desc   一异两同：类型 3 一条、类型 4 两条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030018 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 300, "a"));
      notificationManagement.addNotification(makeRequest(4, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[3]), String(1));
      expect(notificationManagement.countsByType[3]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[4].length), String(2));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030018 end');
    })

    /**
     * @tc.name   testMgmtVolume030019
     * @tc.number SUB_CNB_MGMT_0181
     * @tc.desc   一异两同：类型 4 一条、类型 5 两条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030019 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 300, "a"));
      notificationManagement.addNotification(makeRequest(5, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[4]), String(1));
      expect(notificationManagement.countsByType[4]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[5].length), String(2));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030019 end');
    })

    /**
     * @tc.name   testMgmtVolume030020
     * @tc.number SUB_CNB_MGMT_0182
     * @tc.desc   一异两同：类型 5 一条、类型 6 两条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030020 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 300, "a"));
      notificationManagement.addNotification(makeRequest(6, 301, "b"));
      notificationManagement.addNotification(makeRequest(6, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[5]), String(1));
      expect(notificationManagement.countsByType[5]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[6].length), String(2));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030020 end');
    })

    /**
     * @tc.name   testMgmtVolume030021
     * @tc.number SUB_CNB_MGMT_0183
     * @tc.desc   一异两同：类型 6 一条、类型 0 两条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030021 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 300, "a"));
      notificationManagement.addNotification(makeRequest(0, 301, "b"));
      notificationManagement.addNotification(makeRequest(0, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[6]), String(1));
      expect(notificationManagement.countsByType[6]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[0].length), String(2));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030021 end');
    })

    /**
     * @tc.name   testMgmtVolume030022
     * @tc.number SUB_CNB_MGMT_0184
     * @tc.desc   三类型互异：0/2/4 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030022 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(2, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(1));
      expect(notificationManagement.countsByType[0]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[4]), String(1));
      expect(notificationManagement.countsByType[4]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030022 end');
    })

    /**
     * @tc.name   testMgmtVolume030023
     * @tc.number SUB_CNB_MGMT_0185
     * @tc.desc   三类型互异：1/3/5 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030023 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(3, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(1));
      expect(notificationManagement.countsByType[1]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[5]), String(1));
      expect(notificationManagement.countsByType[5]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030023 end');
    })

    /**
     * @tc.name   testMgmtVolume030024
     * @tc.number SUB_CNB_MGMT_0186
     * @tc.desc   三类型互异：2/4/6 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030024 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(4, 301, "b"));
      notificationManagement.addNotification(makeRequest(6, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(1));
      expect(notificationManagement.countsByType[2]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[6]), String(1));
      expect(notificationManagement.countsByType[6]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[6].length), String(1));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030024 end');
    })

    /**
     * @tc.name   testMgmtVolume030025
     * @tc.number SUB_CNB_MGMT_0187
     * @tc.desc   三类型互异：3/5/0 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030025 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 300, "a"));
      notificationManagement.addNotification(makeRequest(5, 301, "b"));
      notificationManagement.addNotification(makeRequest(0, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[3]), String(1));
      expect(notificationManagement.countsByType[3]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[0]), String(1));
      expect(notificationManagement.countsByType[0]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[0].length), String(1));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030025 end');
    })

    /**
     * @tc.name   testMgmtVolume030026
     * @tc.number SUB_CNB_MGMT_0188
     * @tc.desc   三类型互异：4/6/1 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030026 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 300, "a"));
      notificationManagement.addNotification(makeRequest(6, 301, "b"));
      notificationManagement.addNotification(makeRequest(1, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[4]), String(1));
      expect(notificationManagement.countsByType[4]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[1]), String(1));
      expect(notificationManagement.countsByType[1]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[1].length), String(1));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030026 end');
    })

    /**
     * @tc.name   testMgmtVolume030027
     * @tc.number SUB_CNB_MGMT_0189
     * @tc.desc   三类型互异：5/0/2 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030027 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 300, "a"));
      notificationManagement.addNotification(makeRequest(0, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[5]), String(1));
      expect(notificationManagement.countsByType[5]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[2]), String(1));
      expect(notificationManagement.countsByType[2]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030027 end');
    })

    /**
     * @tc.name   testMgmtVolume030028
     * @tc.number SUB_CNB_MGMT_0190
     * @tc.desc   三类型互异：6/1/3 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030028 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 300, "a"));
      notificationManagement.addNotification(makeRequest(1, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[6]), String(1));
      expect(notificationManagement.countsByType[6]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[3]), String(1));
      expect(notificationManagement.countsByType[3]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030028 end');
    })

    /**
     * @tc.name   testMgmtVolume030029
     * @tc.number SUB_CNB_MGMT_0191
     * @tc.desc   中间越界：第二条 99 被丢弃后类型 0 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030029 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(99, 301, "b"));
      notificationManagement.addNotification(makeRequest(0, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(2));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030029 end');
    })

    /**
     * @tc.name   testMgmtVolume030030
     * @tc.number SUB_CNB_MGMT_0192
     * @tc.desc   中间越界：第二条 99 被丢弃后类型 1 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030030 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(99, 301, "b"));
      notificationManagement.addNotification(makeRequest(1, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(2));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030030 end');
    })

    /**
     * @tc.name   testMgmtVolume030031
     * @tc.number SUB_CNB_MGMT_0193
     * @tc.desc   中间越界：第二条 99 被丢弃后类型 2 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030031 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(99, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(2));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030031 end');
    })

    /**
     * @tc.name   testMgmtVolume030032
     * @tc.number SUB_CNB_MGMT_0194
     * @tc.desc   中间越界：第二条 99 被丢弃后类型 3 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030032 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 300, "a"));
      notificationManagement.addNotification(makeRequest(99, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(2));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030032 end');
    })

    /**
     * @tc.name   testMgmtVolume030033
     * @tc.number SUB_CNB_MGMT_0195
     * @tc.desc   中间越界：第二条 99 被丢弃后类型 4 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030033 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 300, "a"));
      notificationManagement.addNotification(makeRequest(99, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(2));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030033 end');
    })

    /**
     * @tc.name   testMgmtVolume030034
     * @tc.number SUB_CNB_MGMT_0196
     * @tc.desc   中间越界：第二条 99 被丢弃后类型 5 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030034 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 300, "a"));
      notificationManagement.addNotification(makeRequest(99, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(2));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030034 end');
    })

    /**
     * @tc.name   testMgmtVolume030035
     * @tc.number SUB_CNB_MGMT_0197
     * @tc.desc   中间越界：第二条 99 被丢弃后类型 6 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030035 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 300, "a"));
      notificationManagement.addNotification(makeRequest(99, 301, "b"));
      notificationManagement.addNotification(makeRequest(6, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(2));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030035 end');
    })

    /**
     * @tc.name   testMgmtVolume030036
     * @tc.number SUB_CNB_MGMT_0198
     * @tc.desc   中间越界：第二条 -1 被丢弃后类型 0 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030036 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(-1, 301, "b"));
      notificationManagement.addNotification(makeRequest(0, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(2));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030036 end');
    })

    /**
     * @tc.name   testMgmtVolume030037
     * @tc.number SUB_CNB_MGMT_0199
     * @tc.desc   中间越界：第二条 -1 被丢弃后类型 1 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030037 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(-1, 301, "b"));
      notificationManagement.addNotification(makeRequest(1, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(2));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030037 end');
    })

    /**
     * @tc.name   testMgmtVolume030038
     * @tc.number SUB_CNB_MGMT_0200
     * @tc.desc   中间越界：第二条 -1 被丢弃后类型 2 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030038 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(-1, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(2));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030038 end');
    })

    /**
     * @tc.name   testMgmtVolume030039
     * @tc.number SUB_CNB_MGMT_0201
     * @tc.desc   中间越界：第二条 -1 被丢弃后类型 3 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030039 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 300, "a"));
      notificationManagement.addNotification(makeRequest(-1, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(2));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030039 end');
    })

    /**
     * @tc.name   testMgmtVolume030040
     * @tc.number SUB_CNB_MGMT_0202
     * @tc.desc   中间越界：第二条 -1 被丢弃后类型 4 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030040 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 300, "a"));
      notificationManagement.addNotification(makeRequest(-1, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(2));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030040 end');
    })

    /**
     * @tc.name   testMgmtVolume030041
     * @tc.number SUB_CNB_MGMT_0203
     * @tc.desc   中间越界：第二条 -1 被丢弃后类型 5 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030041 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 300, "a"));
      notificationManagement.addNotification(makeRequest(-1, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(2));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030041 end');
    })

    /**
     * @tc.name   testMgmtVolume030042
     * @tc.number SUB_CNB_MGMT_0204
     * @tc.desc   中间越界：第二条 -1 被丢弃后类型 6 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030042 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 300, "a"));
      notificationManagement.addNotification(makeRequest(-1, 301, "b"));
      notificationManagement.addNotification(makeRequest(6, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(2));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030042 end');
    })

    /**
     * @tc.name   testMgmtVolume030043
     * @tc.number SUB_CNB_MGMT_0205
     * @tc.desc   中间越界：第二条 7 被丢弃后类型 0 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030043 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(7, 301, "b"));
      notificationManagement.addNotification(makeRequest(0, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[0].length), String(2));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030043 end');
    })

    /**
     * @tc.name   testMgmtVolume030044
     * @tc.number SUB_CNB_MGMT_0206
     * @tc.desc   中间越界：第二条 7 被丢弃后类型 1 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030044 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(7, 301, "b"));
      notificationManagement.addNotification(makeRequest(1, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[1].length), String(2));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030044 end');
    })

    /**
     * @tc.name   testMgmtVolume030045
     * @tc.number SUB_CNB_MGMT_0207
     * @tc.desc   中间越界：第二条 7 被丢弃后类型 2 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030045 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(7, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[2].length), String(2));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030045 end');
    })

    /**
     * @tc.name   testMgmtVolume030046
     * @tc.number SUB_CNB_MGMT_0208
     * @tc.desc   中间越界：第二条 7 被丢弃后类型 3 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030046 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 300, "a"));
      notificationManagement.addNotification(makeRequest(7, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[3].length), String(2));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030046 end');
    })

    /**
     * @tc.name   testMgmtVolume030047
     * @tc.number SUB_CNB_MGMT_0209
     * @tc.desc   中间越界：第二条 7 被丢弃后类型 4 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030047 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 300, "a"));
      notificationManagement.addNotification(makeRequest(7, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[4].length), String(2));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030047 end');
    })

    /**
     * @tc.name   testMgmtVolume030048
     * @tc.number SUB_CNB_MGMT_0210
     * @tc.desc   中间越界：第二条 7 被丢弃后类型 5 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030048 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 300, "a"));
      notificationManagement.addNotification(makeRequest(7, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[5].length), String(2));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030048 end');
    })

    /**
     * @tc.name   testMgmtVolume030049
     * @tc.number SUB_CNB_MGMT_0211
     * @tc.desc   中间越界：第二条 7 被丢弃后类型 6 仍为 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030049 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 300, "a"));
      notificationManagement.addNotification(makeRequest(7, 301, "b"));
      notificationManagement.addNotification(makeRequest(6, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(notificationManagement.typeNotifications[6].length), String(2));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030049 end');
    })

    /**
     * @tc.name   testMgmtVolume030050
     * @tc.number SUB_CNB_MGMT_0212
     * @tc.desc   首尾同类型：类型 0 两条、中间 3 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030050 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(3, 301, "b"));
      notificationManagement.addNotification(makeRequest(0, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[0]), String(2));
      expect(notificationManagement.countsByType[0]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[0].length), String(2));
      expect(notificationManagement.typeNotifications[0].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030050 end');
    })

    /**
     * @tc.name   testMgmtVolume030051
     * @tc.number SUB_CNB_MGMT_0213
     * @tc.desc   首尾同类型：类型 1 两条、中间 4 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030051 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(4, 301, "b"));
      notificationManagement.addNotification(makeRequest(1, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[1]), String(2));
      expect(notificationManagement.countsByType[1]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[1].length), String(2));
      expect(notificationManagement.typeNotifications[1].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030051 end');
    })

    /**
     * @tc.name   testMgmtVolume030052
     * @tc.number SUB_CNB_MGMT_0214
     * @tc.desc   首尾同类型：类型 2 两条、中间 5 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030052 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(5, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[2]), String(2));
      expect(notificationManagement.countsByType[2]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[2].length), String(2));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030052 end');
    })

    /**
     * @tc.name   testMgmtVolume030053
     * @tc.number SUB_CNB_MGMT_0215
     * @tc.desc   首尾同类型：类型 3 两条、中间 6 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030053 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(3, 300, "a"));
      notificationManagement.addNotification(makeRequest(6, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[3]), String(2));
      expect(notificationManagement.countsByType[3]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[3].length), String(2));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030053 end');
    })

    /**
     * @tc.name   testMgmtVolume030054
     * @tc.number SUB_CNB_MGMT_0216
     * @tc.desc   首尾同类型：类型 4 两条、中间 0 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030054 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 300, "a"));
      notificationManagement.addNotification(makeRequest(0, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[4]), String(2));
      expect(notificationManagement.countsByType[4]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[4].length), String(2));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030054 end');
    })

    /**
     * @tc.name   testMgmtVolume030055
     * @tc.number SUB_CNB_MGMT_0217
     * @tc.desc   首尾同类型：类型 5 两条、中间 1 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030055 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(5, 300, "a"));
      notificationManagement.addNotification(makeRequest(1, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[5]), String(2));
      expect(notificationManagement.countsByType[5]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[5].length), String(2));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030055 end');
    })

    /**
     * @tc.name   testMgmtVolume030056
     * @tc.number SUB_CNB_MGMT_0218
     * @tc.desc   首尾同类型：类型 6 两条、中间 2 一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030056 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(6, 300, "a"));
      notificationManagement.addNotification(makeRequest(2, 301, "b"));
      notificationManagement.addNotification(makeRequest(6, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(notificationManagement.countsByType[6]), String(2));
      expect(notificationManagement.countsByType[6]).assertEqual(2);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[6].length), String(2));
      expect(notificationManagement.typeNotifications[6].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030056 end');
    })

    /**
     * @tc.name   testMgmtVolume030057
     * @tc.number SUB_CNB_MGMT_0219
     * @tc.desc   补齐组合：0/5/3 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030057 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(5, 301, "b"));
      notificationManagement.addNotification(makeRequest(3, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(1));
      expect(notificationManagement.countsByType[0]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[3]), String(1));
      expect(notificationManagement.countsByType[3]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[3].length), String(1));
      expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030057 end');
    })

    /**
     * @tc.name   testMgmtVolume030058
     * @tc.number SUB_CNB_MGMT_0220
     * @tc.desc   补齐组合：1/6/4 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030058 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(1, 300, "a"));
      notificationManagement.addNotification(makeRequest(6, 301, "b"));
      notificationManagement.addNotification(makeRequest(4, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[1]), String(1));
      expect(notificationManagement.countsByType[1]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[4]), String(1));
      expect(notificationManagement.countsByType[4]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[4].length), String(1));
      expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030058 end');
    })

    /**
     * @tc.name   testMgmtVolume030059
     * @tc.number SUB_CNB_MGMT_0221
     * @tc.desc   补齐组合：2/0/5 各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030059 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(2, 300, "a"));
      notificationManagement.addNotification(makeRequest(0, 301, "b"));
      notificationManagement.addNotification(makeRequest(5, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[2]), String(1));
      expect(notificationManagement.countsByType[2]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[5]), String(1));
      expect(notificationManagement.countsByType[5]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[5].length), String(1));
      expect(notificationManagement.typeNotifications[5].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030059 end');
    })

    /**
     * @tc.name   testMgmtVolume030060
     * @tc.number SUB_CNB_MGMT_0222
     * @tc.desc   补齐组合：0/1/2 三类型各一条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMgmtVolume030060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030060 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(0, 300, "a"));
      notificationManagement.addNotification(makeRequest(1, 301, "b"));
      notificationManagement.addNotification(makeRequest(2, 302, "c"));
      const result: number = notificationManagement.badgeNum;
      logActual(String(notificationManagement.countsByType[0]), String(1));
      expect(notificationManagement.countsByType[0]).assertEqual(1);
      logActual(String(notificationManagement.countsByType[2]), String(1));
      expect(notificationManagement.countsByType[2]).assertEqual(1);
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(notificationManagement.typeNotifications[2].length), String(1));
      expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030060 end');
    })

    /**
     * @tc.name   testMgmtVolume030061
     * @tc.number SUB_CNB_MGMT_0223
     * @tc.desc   三条同类型记录使分组计数与角标同时为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMgmtVolume030061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030061 begin');
      notificationManagement.resetLocalState();
      notificationManagement.addNotification(makeRequest(4, 903, 'a'));
      notificationManagement.addNotification(makeRequest(4, 904, 'b'));
      notificationManagement.addNotification(makeRequest(4, 905, 'c'));
      expect(notificationManagement.countsByType[4]).assertEqual(3);
      expect(notificationManagement.badgeNum).assertEqual(3);
      expect(notificationManagement.typeNotifications[4].length).assertEqual(3);
      expect(notificationManagement.getBadgeNumber()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMgmtVolume030061 end');
    })

  })
}
