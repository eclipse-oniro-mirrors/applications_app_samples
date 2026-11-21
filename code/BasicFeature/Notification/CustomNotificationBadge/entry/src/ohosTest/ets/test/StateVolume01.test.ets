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
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil } from '@ohos/notification';
import { makeRequest } from './helper/NotificationFixtures';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomNotificationBadge]';

// 统一记录实际值与期望值，避免逐处重复书写日志格式串
function logActual(actual: string, expected: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, expected);
}

export default function stateVolume01Test() {
  describe('StateVolume01Test', () => {

    /**
     * @tc.name   testStateVolume010001
     * @tc.number SUB_CNB_STATE_0007
     * @tc.desc   发布序列：类型 0 连续两次发布使用第 1 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010001 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "G");
      notificationUtil.publishNotification(second, "G");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("G"));
      expect(second.groupName).assertEqual("G");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010001 end');
    })

    /**
     * @tc.name   testStateVolume010002
     * @tc.number SUB_CNB_STATE_0008
     * @tc.desc   发布序列：类型 0 连续两次发布使用第 2 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010002 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "state-group");
      notificationUtil.publishNotification(second, "state-group");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("state-group"));
      expect(second.groupName).assertEqual("state-group");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010002 end');
    })

    /**
     * @tc.name   testStateVolume010003
     * @tc.number SUB_CNB_STATE_0009
     * @tc.desc   发布序列：类型 0 连续两次发布使用第 3 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010003 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "STATE_1");
      notificationUtil.publishNotification(second, "STATE_1");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("STATE_1"));
      expect(second.groupName).assertEqual("STATE_1");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010003 end');
    })

    /**
     * @tc.name   testStateVolume010004
     * @tc.number SUB_CNB_STATE_0010
     * @tc.desc   发布序列：类型 0 连续两次发布使用第 4 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010004 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "组");
      notificationUtil.publishNotification(second, "组");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("组"));
      expect(second.groupName).assertEqual("组");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010004 end');
    })

    /**
     * @tc.name   testStateVolume010005
     * @tc.number SUB_CNB_STATE_0011
     * @tc.desc   发布序列：类型 0 连续两次发布使用第 5 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010005 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "a b c");
      notificationUtil.publishNotification(second, "a b c");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("a b c"));
      expect(second.groupName).assertEqual("a b c");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010005 end');
    })

    /**
     * @tc.name   testStateVolume010006
     * @tc.number SUB_CNB_STATE_0012
     * @tc.desc   发布序列：类型 0 连续两次发布使用第 6 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010006 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "0123456789");
      notificationUtil.publishNotification(second, "0123456789");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("0123456789"));
      expect(second.groupName).assertEqual("0123456789");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010006 end');
    })

    /**
     * @tc.name   testStateVolume010007
     * @tc.number SUB_CNB_STATE_0013
     * @tc.desc   发布序列：类型 0 连续两次发布使用第 7 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010007 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "gggggggggggggggggggggggggggggggggggggggg");
      notificationUtil.publishNotification(second, "gggggggggggggggggggggggggggggggggggggggg");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("gggggggggggggggggggggggggggggggggggggggg"));
      expect(second.groupName).assertEqual("gggggggggggggggggggggggggggggggggggggggg");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010007 end');
    })

    /**
     * @tc.name   testStateVolume010008
     * @tc.number SUB_CNB_STATE_0014
     * @tc.desc   发布序列：类型 0 连续两次发布使用第 8 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010008 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "-");
      notificationUtil.publishNotification(second, "-");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("-"));
      expect(second.groupName).assertEqual("-");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010008 end');
    })

    /**
     * @tc.name   testStateVolume010009
     * @tc.number SUB_CNB_STATE_0015
     * @tc.desc   发布序列：类型 1 连续两次发布使用第 1 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010009 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "G");
      notificationUtil.publishNotification(second, "G");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("G"));
      expect(second.groupName).assertEqual("G");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010009 end');
    })

    /**
     * @tc.name   testStateVolume010010
     * @tc.number SUB_CNB_STATE_0016
     * @tc.desc   发布序列：类型 1 连续两次发布使用第 2 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010010 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "state-group");
      notificationUtil.publishNotification(second, "state-group");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("state-group"));
      expect(second.groupName).assertEqual("state-group");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010010 end');
    })

    /**
     * @tc.name   testStateVolume010011
     * @tc.number SUB_CNB_STATE_0017
     * @tc.desc   发布序列：类型 1 连续两次发布使用第 3 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010011 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "STATE_1");
      notificationUtil.publishNotification(second, "STATE_1");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("STATE_1"));
      expect(second.groupName).assertEqual("STATE_1");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010011 end');
    })

    /**
     * @tc.name   testStateVolume010012
     * @tc.number SUB_CNB_STATE_0018
     * @tc.desc   发布序列：类型 1 连续两次发布使用第 4 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010012 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "组");
      notificationUtil.publishNotification(second, "组");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("组"));
      expect(second.groupName).assertEqual("组");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010012 end');
    })

    /**
     * @tc.name   testStateVolume010013
     * @tc.number SUB_CNB_STATE_0019
     * @tc.desc   发布序列：类型 1 连续两次发布使用第 5 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010013 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "a b c");
      notificationUtil.publishNotification(second, "a b c");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("a b c"));
      expect(second.groupName).assertEqual("a b c");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010013 end');
    })

    /**
     * @tc.name   testStateVolume010014
     * @tc.number SUB_CNB_STATE_0020
     * @tc.desc   发布序列：类型 1 连续两次发布使用第 6 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010014 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "0123456789");
      notificationUtil.publishNotification(second, "0123456789");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("0123456789"));
      expect(second.groupName).assertEqual("0123456789");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010014 end');
    })

    /**
     * @tc.name   testStateVolume010015
     * @tc.number SUB_CNB_STATE_0021
     * @tc.desc   发布序列：类型 1 连续两次发布使用第 7 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010015 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "gggggggggggggggggggggggggggggggggggggggg");
      notificationUtil.publishNotification(second, "gggggggggggggggggggggggggggggggggggggggg");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("gggggggggggggggggggggggggggggggggggggggg"));
      expect(second.groupName).assertEqual("gggggggggggggggggggggggggggggggggggggggg");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010015 end');
    })

    /**
     * @tc.name   testStateVolume010016
     * @tc.number SUB_CNB_STATE_0022
     * @tc.desc   发布序列：类型 1 连续两次发布使用第 8 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010016 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "-");
      notificationUtil.publishNotification(second, "-");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("-"));
      expect(second.groupName).assertEqual("-");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010016 end');
    })

    /**
     * @tc.name   testStateVolume010017
     * @tc.number SUB_CNB_STATE_0023
     * @tc.desc   发布序列：类型 2 连续两次发布使用第 1 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010017 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "G");
      notificationUtil.publishNotification(second, "G");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("G"));
      expect(second.groupName).assertEqual("G");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010017 end');
    })

    /**
     * @tc.name   testStateVolume010018
     * @tc.number SUB_CNB_STATE_0024
     * @tc.desc   发布序列：类型 2 连续两次发布使用第 2 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010018 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "state-group");
      notificationUtil.publishNotification(second, "state-group");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("state-group"));
      expect(second.groupName).assertEqual("state-group");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010018 end');
    })

    /**
     * @tc.name   testStateVolume010019
     * @tc.number SUB_CNB_STATE_0025
     * @tc.desc   发布序列：类型 2 连续两次发布使用第 3 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010019 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "STATE_1");
      notificationUtil.publishNotification(second, "STATE_1");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("STATE_1"));
      expect(second.groupName).assertEqual("STATE_1");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010019 end');
    })

    /**
     * @tc.name   testStateVolume010020
     * @tc.number SUB_CNB_STATE_0026
     * @tc.desc   发布序列：类型 2 连续两次发布使用第 4 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010020 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "组");
      notificationUtil.publishNotification(second, "组");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("组"));
      expect(second.groupName).assertEqual("组");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010020 end');
    })

    /**
     * @tc.name   testStateVolume010021
     * @tc.number SUB_CNB_STATE_0027
     * @tc.desc   发布序列：类型 2 连续两次发布使用第 5 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010021 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "a b c");
      notificationUtil.publishNotification(second, "a b c");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("a b c"));
      expect(second.groupName).assertEqual("a b c");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010021 end');
    })

    /**
     * @tc.name   testStateVolume010022
     * @tc.number SUB_CNB_STATE_0028
     * @tc.desc   发布序列：类型 2 连续两次发布使用第 6 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010022 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "0123456789");
      notificationUtil.publishNotification(second, "0123456789");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("0123456789"));
      expect(second.groupName).assertEqual("0123456789");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010022 end');
    })

    /**
     * @tc.name   testStateVolume010023
     * @tc.number SUB_CNB_STATE_0029
     * @tc.desc   发布序列：类型 2 连续两次发布使用第 7 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010023 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "gggggggggggggggggggggggggggggggggggggggg");
      notificationUtil.publishNotification(second, "gggggggggggggggggggggggggggggggggggggggg");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("gggggggggggggggggggggggggggggggggggggggg"));
      expect(second.groupName).assertEqual("gggggggggggggggggggggggggggggggggggggggg");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010023 end');
    })

    /**
     * @tc.name   testStateVolume010024
     * @tc.number SUB_CNB_STATE_0030
     * @tc.desc   发布序列：类型 2 连续两次发布使用第 8 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010024 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "-");
      notificationUtil.publishNotification(second, "-");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("-"));
      expect(second.groupName).assertEqual("-");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010024 end');
    })

    /**
     * @tc.name   testStateVolume010025
     * @tc.number SUB_CNB_STATE_0031
     * @tc.desc   发布序列：类型 3 连续两次发布使用第 1 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010025 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "G");
      notificationUtil.publishNotification(second, "G");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("G"));
      expect(second.groupName).assertEqual("G");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010025 end');
    })

    /**
     * @tc.name   testStateVolume010026
     * @tc.number SUB_CNB_STATE_0032
     * @tc.desc   发布序列：类型 3 连续两次发布使用第 2 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010026 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "state-group");
      notificationUtil.publishNotification(second, "state-group");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("state-group"));
      expect(second.groupName).assertEqual("state-group");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010026 end');
    })

    /**
     * @tc.name   testStateVolume010027
     * @tc.number SUB_CNB_STATE_0033
     * @tc.desc   发布序列：类型 3 连续两次发布使用第 3 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010027 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "STATE_1");
      notificationUtil.publishNotification(second, "STATE_1");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("STATE_1"));
      expect(second.groupName).assertEqual("STATE_1");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010027 end');
    })

    /**
     * @tc.name   testStateVolume010028
     * @tc.number SUB_CNB_STATE_0034
     * @tc.desc   发布序列：类型 3 连续两次发布使用第 4 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010028 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "组");
      notificationUtil.publishNotification(second, "组");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("组"));
      expect(second.groupName).assertEqual("组");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010028 end');
    })

    /**
     * @tc.name   testStateVolume010029
     * @tc.number SUB_CNB_STATE_0035
     * @tc.desc   发布序列：类型 3 连续两次发布使用第 5 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010029 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "a b c");
      notificationUtil.publishNotification(second, "a b c");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("a b c"));
      expect(second.groupName).assertEqual("a b c");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010029 end');
    })

    /**
     * @tc.name   testStateVolume010030
     * @tc.number SUB_CNB_STATE_0036
     * @tc.desc   发布序列：类型 3 连续两次发布使用第 6 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010030 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "0123456789");
      notificationUtil.publishNotification(second, "0123456789");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("0123456789"));
      expect(second.groupName).assertEqual("0123456789");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010030 end');
    })

    /**
     * @tc.name   testStateVolume010031
     * @tc.number SUB_CNB_STATE_0037
     * @tc.desc   发布序列：类型 3 连续两次发布使用第 7 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010031 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "gggggggggggggggggggggggggggggggggggggggg");
      notificationUtil.publishNotification(second, "gggggggggggggggggggggggggggggggggggggggg");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("gggggggggggggggggggggggggggggggggggggggg"));
      expect(second.groupName).assertEqual("gggggggggggggggggggggggggggggggggggggggg");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010031 end');
    })

    /**
     * @tc.name   testStateVolume010032
     * @tc.number SUB_CNB_STATE_0038
     * @tc.desc   发布序列：类型 3 连续两次发布使用第 8 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010032 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "-");
      notificationUtil.publishNotification(second, "-");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("-"));
      expect(second.groupName).assertEqual("-");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010032 end');
    })

    /**
     * @tc.name   testStateVolume010033
     * @tc.number SUB_CNB_STATE_0039
     * @tc.desc   发布序列：类型 4 连续两次发布使用第 1 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010033 begin');
      const first: notification.NotificationRequest = makeRequest(4, 11, "first");
      const second: notification.NotificationRequest = makeRequest(4, 12, "second");
      notificationUtil.publishNotification(first, "G");
      notificationUtil.publishNotification(second, "G");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("G"));
      expect(second.groupName).assertEqual("G");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(4));
      expect(second.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010033 end');
    })

    /**
     * @tc.name   testStateVolume010034
     * @tc.number SUB_CNB_STATE_0040
     * @tc.desc   发布序列：类型 4 连续两次发布使用第 2 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010034 begin');
      const first: notification.NotificationRequest = makeRequest(4, 11, "first");
      const second: notification.NotificationRequest = makeRequest(4, 12, "second");
      notificationUtil.publishNotification(first, "state-group");
      notificationUtil.publishNotification(second, "state-group");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("state-group"));
      expect(second.groupName).assertEqual("state-group");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(4));
      expect(second.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010034 end');
    })

    /**
     * @tc.name   testStateVolume010035
     * @tc.number SUB_CNB_STATE_0041
     * @tc.desc   发布序列：类型 4 连续两次发布使用第 3 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010035 begin');
      const first: notification.NotificationRequest = makeRequest(4, 11, "first");
      const second: notification.NotificationRequest = makeRequest(4, 12, "second");
      notificationUtil.publishNotification(first, "STATE_1");
      notificationUtil.publishNotification(second, "STATE_1");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("STATE_1"));
      expect(second.groupName).assertEqual("STATE_1");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(4));
      expect(second.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010035 end');
    })

    /**
     * @tc.name   testStateVolume010036
     * @tc.number SUB_CNB_STATE_0042
     * @tc.desc   发布序列：类型 4 连续两次发布使用第 4 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010036 begin');
      const first: notification.NotificationRequest = makeRequest(4, 11, "first");
      const second: notification.NotificationRequest = makeRequest(4, 12, "second");
      notificationUtil.publishNotification(first, "组");
      notificationUtil.publishNotification(second, "组");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("组"));
      expect(second.groupName).assertEqual("组");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(4));
      expect(second.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010036 end');
    })

    /**
     * @tc.name   testStateVolume010037
     * @tc.number SUB_CNB_STATE_0043
     * @tc.desc   发布序列：类型 4 连续两次发布使用第 5 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010037 begin');
      const first: notification.NotificationRequest = makeRequest(4, 11, "first");
      const second: notification.NotificationRequest = makeRequest(4, 12, "second");
      notificationUtil.publishNotification(first, "a b c");
      notificationUtil.publishNotification(second, "a b c");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("a b c"));
      expect(second.groupName).assertEqual("a b c");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(4));
      expect(second.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010037 end');
    })

    /**
     * @tc.name   testStateVolume010038
     * @tc.number SUB_CNB_STATE_0044
     * @tc.desc   发布序列：类型 4 连续两次发布使用第 6 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010038 begin');
      const first: notification.NotificationRequest = makeRequest(4, 11, "first");
      const second: notification.NotificationRequest = makeRequest(4, 12, "second");
      notificationUtil.publishNotification(first, "0123456789");
      notificationUtil.publishNotification(second, "0123456789");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("0123456789"));
      expect(second.groupName).assertEqual("0123456789");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(4));
      expect(second.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010038 end');
    })

    /**
     * @tc.name   testStateVolume010039
     * @tc.number SUB_CNB_STATE_0045
     * @tc.desc   发布序列：类型 4 连续两次发布使用第 7 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010039 begin');
      const first: notification.NotificationRequest = makeRequest(4, 11, "first");
      const second: notification.NotificationRequest = makeRequest(4, 12, "second");
      notificationUtil.publishNotification(first, "gggggggggggggggggggggggggggggggggggggggg");
      notificationUtil.publishNotification(second, "gggggggggggggggggggggggggggggggggggggggg");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("gggggggggggggggggggggggggggggggggggggggg"));
      expect(second.groupName).assertEqual("gggggggggggggggggggggggggggggggggggggggg");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(4));
      expect(second.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010039 end');
    })

    /**
     * @tc.name   testStateVolume010040
     * @tc.number SUB_CNB_STATE_0046
     * @tc.desc   发布序列：类型 4 连续两次发布使用第 8 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010040 begin');
      const first: notification.NotificationRequest = makeRequest(4, 11, "first");
      const second: notification.NotificationRequest = makeRequest(4, 12, "second");
      notificationUtil.publishNotification(first, "-");
      notificationUtil.publishNotification(second, "-");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("-"));
      expect(second.groupName).assertEqual("-");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(4));
      expect(second.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010040 end');
    })

    /**
     * @tc.name   testStateVolume010041
     * @tc.number SUB_CNB_STATE_0047
     * @tc.desc   发布序列：类型 5 连续两次发布使用第 1 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010041 begin');
      const first: notification.NotificationRequest = makeRequest(5, 11, "first");
      const second: notification.NotificationRequest = makeRequest(5, 12, "second");
      notificationUtil.publishNotification(first, "G");
      notificationUtil.publishNotification(second, "G");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("G"));
      expect(second.groupName).assertEqual("G");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(5));
      expect(second.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010041 end');
    })

    /**
     * @tc.name   testStateVolume010042
     * @tc.number SUB_CNB_STATE_0048
     * @tc.desc   发布序列：类型 5 连续两次发布使用第 2 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010042 begin');
      const first: notification.NotificationRequest = makeRequest(5, 11, "first");
      const second: notification.NotificationRequest = makeRequest(5, 12, "second");
      notificationUtil.publishNotification(first, "state-group");
      notificationUtil.publishNotification(second, "state-group");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("state-group"));
      expect(second.groupName).assertEqual("state-group");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(5));
      expect(second.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010042 end');
    })

    /**
     * @tc.name   testStateVolume010043
     * @tc.number SUB_CNB_STATE_0049
     * @tc.desc   发布序列：类型 5 连续两次发布使用第 3 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010043 begin');
      const first: notification.NotificationRequest = makeRequest(5, 11, "first");
      const second: notification.NotificationRequest = makeRequest(5, 12, "second");
      notificationUtil.publishNotification(first, "STATE_1");
      notificationUtil.publishNotification(second, "STATE_1");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("STATE_1"));
      expect(second.groupName).assertEqual("STATE_1");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(5));
      expect(second.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010043 end');
    })

    /**
     * @tc.name   testStateVolume010044
     * @tc.number SUB_CNB_STATE_0050
     * @tc.desc   发布序列：类型 5 连续两次发布使用第 4 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010044 begin');
      const first: notification.NotificationRequest = makeRequest(5, 11, "first");
      const second: notification.NotificationRequest = makeRequest(5, 12, "second");
      notificationUtil.publishNotification(first, "组");
      notificationUtil.publishNotification(second, "组");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("组"));
      expect(second.groupName).assertEqual("组");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(5));
      expect(second.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010044 end');
    })

    /**
     * @tc.name   testStateVolume010045
     * @tc.number SUB_CNB_STATE_0051
     * @tc.desc   发布序列：类型 5 连续两次发布使用第 5 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010045 begin');
      const first: notification.NotificationRequest = makeRequest(5, 11, "first");
      const second: notification.NotificationRequest = makeRequest(5, 12, "second");
      notificationUtil.publishNotification(first, "a b c");
      notificationUtil.publishNotification(second, "a b c");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("a b c"));
      expect(second.groupName).assertEqual("a b c");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(5));
      expect(second.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010045 end');
    })

    /**
     * @tc.name   testStateVolume010046
     * @tc.number SUB_CNB_STATE_0052
     * @tc.desc   发布序列：类型 5 连续两次发布使用第 6 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010046 begin');
      const first: notification.NotificationRequest = makeRequest(5, 11, "first");
      const second: notification.NotificationRequest = makeRequest(5, 12, "second");
      notificationUtil.publishNotification(first, "0123456789");
      notificationUtil.publishNotification(second, "0123456789");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("0123456789"));
      expect(second.groupName).assertEqual("0123456789");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(5));
      expect(second.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010046 end');
    })

    /**
     * @tc.name   testStateVolume010047
     * @tc.number SUB_CNB_STATE_0053
     * @tc.desc   发布序列：类型 5 连续两次发布使用第 7 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010047 begin');
      const first: notification.NotificationRequest = makeRequest(5, 11, "first");
      const second: notification.NotificationRequest = makeRequest(5, 12, "second");
      notificationUtil.publishNotification(first, "gggggggggggggggggggggggggggggggggggggggg");
      notificationUtil.publishNotification(second, "gggggggggggggggggggggggggggggggggggggggg");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("gggggggggggggggggggggggggggggggggggggggg"));
      expect(second.groupName).assertEqual("gggggggggggggggggggggggggggggggggggggggg");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(5));
      expect(second.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010047 end');
    })

    /**
     * @tc.name   testStateVolume010048
     * @tc.number SUB_CNB_STATE_0054
     * @tc.desc   发布序列：类型 5 连续两次发布使用第 8 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010048 begin');
      const first: notification.NotificationRequest = makeRequest(5, 11, "first");
      const second: notification.NotificationRequest = makeRequest(5, 12, "second");
      notificationUtil.publishNotification(first, "-");
      notificationUtil.publishNotification(second, "-");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("-"));
      expect(second.groupName).assertEqual("-");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(5));
      expect(second.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010048 end');
    })

    /**
     * @tc.name   testStateVolume010049
     * @tc.number SUB_CNB_STATE_0055
     * @tc.desc   发布序列：类型 6 连续两次发布使用第 1 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010049 begin');
      const first: notification.NotificationRequest = makeRequest(6, 11, "first");
      const second: notification.NotificationRequest = makeRequest(6, 12, "second");
      notificationUtil.publishNotification(first, "G");
      notificationUtil.publishNotification(second, "G");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("G"));
      expect(second.groupName).assertEqual("G");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(6));
      expect(second.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010049 end');
    })

    /**
     * @tc.name   testStateVolume010050
     * @tc.number SUB_CNB_STATE_0056
     * @tc.desc   发布序列：类型 6 连续两次发布使用第 2 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010050 begin');
      const first: notification.NotificationRequest = makeRequest(6, 11, "first");
      const second: notification.NotificationRequest = makeRequest(6, 12, "second");
      notificationUtil.publishNotification(first, "state-group");
      notificationUtil.publishNotification(second, "state-group");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("state-group"));
      expect(second.groupName).assertEqual("state-group");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(6));
      expect(second.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010050 end');
    })

    /**
     * @tc.name   testStateVolume010051
     * @tc.number SUB_CNB_STATE_0057
     * @tc.desc   发布序列：类型 6 连续两次发布使用第 3 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010051 begin');
      const first: notification.NotificationRequest = makeRequest(6, 11, "first");
      const second: notification.NotificationRequest = makeRequest(6, 12, "second");
      notificationUtil.publishNotification(first, "STATE_1");
      notificationUtil.publishNotification(second, "STATE_1");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("STATE_1"));
      expect(second.groupName).assertEqual("STATE_1");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(6));
      expect(second.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010051 end');
    })

    /**
     * @tc.name   testStateVolume010052
     * @tc.number SUB_CNB_STATE_0058
     * @tc.desc   发布序列：类型 6 连续两次发布使用第 4 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010052 begin');
      const first: notification.NotificationRequest = makeRequest(6, 11, "first");
      const second: notification.NotificationRequest = makeRequest(6, 12, "second");
      notificationUtil.publishNotification(first, "组");
      notificationUtil.publishNotification(second, "组");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("组"));
      expect(second.groupName).assertEqual("组");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(6));
      expect(second.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010052 end');
    })

    /**
     * @tc.name   testStateVolume010053
     * @tc.number SUB_CNB_STATE_0059
     * @tc.desc   发布序列：类型 6 连续两次发布使用第 5 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010053 begin');
      const first: notification.NotificationRequest = makeRequest(6, 11, "first");
      const second: notification.NotificationRequest = makeRequest(6, 12, "second");
      notificationUtil.publishNotification(first, "a b c");
      notificationUtil.publishNotification(second, "a b c");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("a b c"));
      expect(second.groupName).assertEqual("a b c");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(6));
      expect(second.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010053 end');
    })

    /**
     * @tc.name   testStateVolume010054
     * @tc.number SUB_CNB_STATE_0060
     * @tc.desc   发布序列：类型 6 连续两次发布使用第 6 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010054 begin');
      const first: notification.NotificationRequest = makeRequest(6, 11, "first");
      const second: notification.NotificationRequest = makeRequest(6, 12, "second");
      notificationUtil.publishNotification(first, "0123456789");
      notificationUtil.publishNotification(second, "0123456789");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("0123456789"));
      expect(second.groupName).assertEqual("0123456789");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(6));
      expect(second.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010054 end');
    })

    /**
     * @tc.name   testStateVolume010055
     * @tc.number SUB_CNB_STATE_0061
     * @tc.desc   发布序列：类型 6 连续两次发布使用第 7 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010055 begin');
      const first: notification.NotificationRequest = makeRequest(6, 11, "first");
      const second: notification.NotificationRequest = makeRequest(6, 12, "second");
      notificationUtil.publishNotification(first, "gggggggggggggggggggggggggggggggggggggggg");
      notificationUtil.publishNotification(second, "gggggggggggggggggggggggggggggggggggggggg");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("gggggggggggggggggggggggggggggggggggggggg"));
      expect(second.groupName).assertEqual("gggggggggggggggggggggggggggggggggggggggg");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(6));
      expect(second.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010055 end');
    })

    /**
     * @tc.name   testStateVolume010056
     * @tc.number SUB_CNB_STATE_0062
     * @tc.desc   发布序列：类型 6 连续两次发布使用第 8 组分组名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010056 begin');
      const first: notification.NotificationRequest = makeRequest(6, 11, "first");
      const second: notification.NotificationRequest = makeRequest(6, 12, "second");
      notificationUtil.publishNotification(first, "-");
      notificationUtil.publishNotification(second, "-");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("-"));
      expect(second.groupName).assertEqual("-");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(6));
      expect(second.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010056 end');
    })

    /**
     * @tc.name   testStateVolume010057
     * @tc.number SUB_CNB_STATE_0063
     * @tc.desc   发布序列：类型 0 使用短分组名 g0 时 id 仍逐次递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010057 begin');
      const first: notification.NotificationRequest = makeRequest(0, 11, "first");
      const second: notification.NotificationRequest = makeRequest(0, 12, "second");
      notificationUtil.publishNotification(first, "g0");
      notificationUtil.publishNotification(second, "g0");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("g0"));
      expect(second.groupName).assertEqual("g0");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(0));
      expect(second.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010057 end');
    })

    /**
     * @tc.name   testStateVolume010058
     * @tc.number SUB_CNB_STATE_0064
     * @tc.desc   发布序列：类型 1 使用短分组名 g1 时 id 仍逐次递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010058 begin');
      const first: notification.NotificationRequest = makeRequest(1, 11, "first");
      const second: notification.NotificationRequest = makeRequest(1, 12, "second");
      notificationUtil.publishNotification(first, "g1");
      notificationUtil.publishNotification(second, "g1");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("g1"));
      expect(second.groupName).assertEqual("g1");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(1));
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010058 end');
    })

    /**
     * @tc.name   testStateVolume010059
     * @tc.number SUB_CNB_STATE_0065
     * @tc.desc   发布序列：类型 2 使用短分组名 g2 时 id 仍逐次递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010059 begin');
      const first: notification.NotificationRequest = makeRequest(2, 11, "first");
      const second: notification.NotificationRequest = makeRequest(2, 12, "second");
      notificationUtil.publishNotification(first, "g2");
      notificationUtil.publishNotification(second, "g2");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("g2"));
      expect(second.groupName).assertEqual("g2");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(2));
      expect(second.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010059 end');
    })

    /**
     * @tc.name   testStateVolume010060
     * @tc.number SUB_CNB_STATE_0066
     * @tc.desc   发布序列：类型 3 使用短分组名 g3 时 id 仍逐次递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010060 begin');
      const first: notification.NotificationRequest = makeRequest(3, 11, "first");
      const second: notification.NotificationRequest = makeRequest(3, 12, "second");
      notificationUtil.publishNotification(first, "g3");
      notificationUtil.publishNotification(second, "g3");
      const result: number = (second.id as number) - (first.id as number);
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(second.groupName), String("g3"));
      expect(second.groupName).assertEqual("g3");
      logActual(String(second.notificationSlotType), String(3));
      expect(second.notificationSlotType).assertEqual(3);
      logActual(String(second.content.notificationContentType), String(3));
      expect(second.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010060 end');
    })

    /**
     * @tc.name   testStateVolume010061
     * @tc.number SUB_CNB_STATE_0067
     * @tc.desc   空分组名不写入 groupName，且 id 仍逐次递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010061 begin');
      const first: notification.NotificationRequest = makeRequest(1, 21, 'a');
      const second: notification.NotificationRequest = makeRequest(1, 22, 'b');
      notificationUtil.publishNotification(first, '');
      notificationUtil.publishNotification(second);
      expect((second.id as number) - (first.id as number)).assertEqual(1);
      expect(second.groupName !== undefined).assertFalse();
      expect(second.notificationSlotType).assertEqual(3);
      expect(second.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume010061 end');
    })

  })
}
