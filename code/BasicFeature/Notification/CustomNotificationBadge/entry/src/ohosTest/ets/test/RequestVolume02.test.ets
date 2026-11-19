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
import { notificationRequestUtil } from '@ohos/notification';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomNotificationBadge]';

// 统一记录实际值与期望值，避免逐处重复书写日志格式串
function logActual(actual: string, expected: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, expected);
}

export default function requestVolume02Test() {
  describe('RequestVolume02Test', () => {

    /**
     * @tc.name   testRequestVolume020001
     * @tc.number SUB_CNB_REQUEST_0074
     * @tc.desc   引用透传：类型 0 与标题第 1 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020001 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0, normal: { title: "", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020001 end');
    })

    /**
     * @tc.name   testRequestVolume020002
     * @tc.number SUB_CNB_REQUEST_0075
     * @tc.desc   引用透传：类型 0 与标题第 2 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020002 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020002 end');
    })

    /**
     * @tc.name   testRequestVolume020003
     * @tc.number SUB_CNB_REQUEST_0076
     * @tc.desc   引用透传：类型 0 与标题第 3 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020003 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0, normal: { title: "Title 标题", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020003 end');
    })

    /**
     * @tc.name   testRequestVolume020004
     * @tc.number SUB_CNB_REQUEST_0077
     * @tc.desc   引用透传：类型 0 与标题第 4 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020004 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0, normal: { title: " leading", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020004 end');
    })

    /**
     * @tc.name   testRequestVolume020005
     * @tc.number SUB_CNB_REQUEST_0078
     * @tc.desc   引用透传：类型 0 与标题第 5 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020005 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0, normal: { title: "q'q", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020005 end');
    })

    /**
     * @tc.name   testRequestVolume020006
     * @tc.number SUB_CNB_REQUEST_0079
     * @tc.desc   引用透传：类型 0 与标题第 6 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020006 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0,
        normal: { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020006 end');
    })

    /**
     * @tc.name   testRequestVolume020007
     * @tc.number SUB_CNB_REQUEST_0080
     * @tc.desc   引用透传：类型 0 与标题第 7 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020007 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0, normal: { title: "0", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020007 end');
    })

    /**
     * @tc.name   testRequestVolume020008
     * @tc.number SUB_CNB_REQUEST_0081
     * @tc.desc   引用透传：类型 0 与标题第 8 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020008 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0, normal: { title: "null", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020008 end');
    })

    /**
     * @tc.name   testRequestVolume020009
     * @tc.number SUB_CNB_REQUEST_0082
     * @tc.desc   引用透传：类型 1 与标题第 1 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020009 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1, normal: { title: "", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020009 end');
    })

    /**
     * @tc.name   testRequestVolume020010
     * @tc.number SUB_CNB_REQUEST_0083
     * @tc.desc   引用透传：类型 1 与标题第 2 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020010 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020010 end');
    })

    /**
     * @tc.name   testRequestVolume020011
     * @tc.number SUB_CNB_REQUEST_0084
     * @tc.desc   引用透传：类型 1 与标题第 3 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020011 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1, normal: { title: "Title 标题", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020011 end');
    })

    /**
     * @tc.name   testRequestVolume020012
     * @tc.number SUB_CNB_REQUEST_0085
     * @tc.desc   引用透传：类型 1 与标题第 4 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020012 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1, normal: { title: " leading", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020012 end');
    })

    /**
     * @tc.name   testRequestVolume020013
     * @tc.number SUB_CNB_REQUEST_0086
     * @tc.desc   引用透传：类型 1 与标题第 5 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020013 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1, normal: { title: "q'q", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020013 end');
    })

    /**
     * @tc.name   testRequestVolume020014
     * @tc.number SUB_CNB_REQUEST_0087
     * @tc.desc   引用透传：类型 1 与标题第 6 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020014 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1,
        normal: { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020014 end');
    })

    /**
     * @tc.name   testRequestVolume020015
     * @tc.number SUB_CNB_REQUEST_0088
     * @tc.desc   引用透传：类型 1 与标题第 7 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020015 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1, normal: { title: "0", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020015 end');
    })

    /**
     * @tc.name   testRequestVolume020016
     * @tc.number SUB_CNB_REQUEST_0089
     * @tc.desc   引用透传：类型 1 与标题第 8 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020016 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1, normal: { title: "null", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020016 end');
    })

    /**
     * @tc.name   testRequestVolume020017
     * @tc.number SUB_CNB_REQUEST_0090
     * @tc.desc   引用透传：类型 2 与标题第 1 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020017 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2, normal: { title: "", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020017 end');
    })

    /**
     * @tc.name   testRequestVolume020018
     * @tc.number SUB_CNB_REQUEST_0091
     * @tc.desc   引用透传：类型 2 与标题第 2 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020018 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020018 end');
    })

    /**
     * @tc.name   testRequestVolume020019
     * @tc.number SUB_CNB_REQUEST_0092
     * @tc.desc   引用透传：类型 2 与标题第 3 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020019 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2, normal: { title: "Title 标题", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020019 end');
    })

    /**
     * @tc.name   testRequestVolume020020
     * @tc.number SUB_CNB_REQUEST_0093
     * @tc.desc   引用透传：类型 2 与标题第 4 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020020 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2, normal: { title: " leading", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020020 end');
    })

    /**
     * @tc.name   testRequestVolume020021
     * @tc.number SUB_CNB_REQUEST_0094
     * @tc.desc   引用透传：类型 2 与标题第 5 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020021 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2, normal: { title: "q'q", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020021 end');
    })

    /**
     * @tc.name   testRequestVolume020022
     * @tc.number SUB_CNB_REQUEST_0095
     * @tc.desc   引用透传：类型 2 与标题第 6 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020022 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2,
        normal: { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020022 end');
    })

    /**
     * @tc.name   testRequestVolume020023
     * @tc.number SUB_CNB_REQUEST_0096
     * @tc.desc   引用透传：类型 2 与标题第 7 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020023 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2, normal: { title: "0", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020023 end');
    })

    /**
     * @tc.name   testRequestVolume020024
     * @tc.number SUB_CNB_REQUEST_0097
     * @tc.desc   引用透传：类型 2 与标题第 8 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020024 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2, normal: { title: "null", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020024 end');
    })

    /**
     * @tc.name   testRequestVolume020025
     * @tc.number SUB_CNB_REQUEST_0098
     * @tc.desc   引用透传：类型 3 与标题第 1 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020025 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: "", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020025 end');
    })

    /**
     * @tc.name   testRequestVolume020026
     * @tc.number SUB_CNB_REQUEST_0099
     * @tc.desc   引用透传：类型 3 与标题第 2 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020026 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020026 end');
    })

    /**
     * @tc.name   testRequestVolume020027
     * @tc.number SUB_CNB_REQUEST_0100
     * @tc.desc   引用透传：类型 3 与标题第 3 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020027 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: "Title 标题", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020027 end');
    })

    /**
     * @tc.name   testRequestVolume020028
     * @tc.number SUB_CNB_REQUEST_0101
     * @tc.desc   引用透传：类型 3 与标题第 4 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020028 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: " leading", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020028 end');
    })

    /**
     * @tc.name   testRequestVolume020029
     * @tc.number SUB_CNB_REQUEST_0102
     * @tc.desc   引用透传：类型 3 与标题第 5 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020029 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: "q'q", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020029 end');
    })

    /**
     * @tc.name   testRequestVolume020030
     * @tc.number SUB_CNB_REQUEST_0103
     * @tc.desc   引用透传：类型 3 与标题第 6 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020030 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3,
        normal: { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020030 end');
    })

    /**
     * @tc.name   testRequestVolume020031
     * @tc.number SUB_CNB_REQUEST_0104
     * @tc.desc   引用透传：类型 3 与标题第 7 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020031 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: "0", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020031 end');
    })

    /**
     * @tc.name   testRequestVolume020032
     * @tc.number SUB_CNB_REQUEST_0105
     * @tc.desc   引用透传：类型 3 与标题第 8 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020032 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: "null", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020032 end');
    })

    /**
     * @tc.name   testRequestVolume020033
     * @tc.number SUB_CNB_REQUEST_0106
     * @tc.desc   引用透传：类型 4 与标题第 1 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020033 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 4, normal: { title: "", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020033 end');
    })

    /**
     * @tc.name   testRequestVolume020034
     * @tc.number SUB_CNB_REQUEST_0107
     * @tc.desc   引用透传：类型 4 与标题第 2 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020034 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 4, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020034 end');
    })

    /**
     * @tc.name   testRequestVolume020035
     * @tc.number SUB_CNB_REQUEST_0108
     * @tc.desc   引用透传：类型 4 与标题第 3 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020035 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 4, normal: { title: "Title 标题", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020035 end');
    })

    /**
     * @tc.name   testRequestVolume020036
     * @tc.number SUB_CNB_REQUEST_0109
     * @tc.desc   引用透传：类型 4 与标题第 4 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020036 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 4, normal: { title: " leading", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020036 end');
    })

    /**
     * @tc.name   testRequestVolume020037
     * @tc.number SUB_CNB_REQUEST_0110
     * @tc.desc   引用透传：类型 4 与标题第 5 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020037 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 4, normal: { title: "q'q", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020037 end');
    })

    /**
     * @tc.name   testRequestVolume020038
     * @tc.number SUB_CNB_REQUEST_0111
     * @tc.desc   引用透传：类型 4 与标题第 6 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020038 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 4,
        normal: { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020038 end');
    })

    /**
     * @tc.name   testRequestVolume020039
     * @tc.number SUB_CNB_REQUEST_0112
     * @tc.desc   引用透传：类型 4 与标题第 7 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020039 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 4, normal: { title: "0", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020039 end');
    })

    /**
     * @tc.name   testRequestVolume020040
     * @tc.number SUB_CNB_REQUEST_0113
     * @tc.desc   引用透传：类型 4 与标题第 8 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020040 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 4, normal: { title: "null", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020040 end');
    })

    /**
     * @tc.name   testRequestVolume020041
     * @tc.number SUB_CNB_REQUEST_0114
     * @tc.desc   引用透传：类型 5 与标题第 1 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020041 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 5, normal: { title: "", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020041 end');
    })

    /**
     * @tc.name   testRequestVolume020042
     * @tc.number SUB_CNB_REQUEST_0115
     * @tc.desc   引用透传：类型 5 与标题第 2 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020042 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 5, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020042 end');
    })

    /**
     * @tc.name   testRequestVolume020043
     * @tc.number SUB_CNB_REQUEST_0116
     * @tc.desc   引用透传：类型 5 与标题第 3 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020043 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 5, normal: { title: "Title 标题", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020043 end');
    })

    /**
     * @tc.name   testRequestVolume020044
     * @tc.number SUB_CNB_REQUEST_0117
     * @tc.desc   引用透传：类型 5 与标题第 4 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020044 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 5, normal: { title: " leading", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020044 end');
    })

    /**
     * @tc.name   testRequestVolume020045
     * @tc.number SUB_CNB_REQUEST_0118
     * @tc.desc   引用透传：类型 5 与标题第 5 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020045 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 5, normal: { title: "q'q", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020045 end');
    })

    /**
     * @tc.name   testRequestVolume020046
     * @tc.number SUB_CNB_REQUEST_0119
     * @tc.desc   引用透传：类型 5 与标题第 6 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020046 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 5,
        normal: { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020046 end');
    })

    /**
     * @tc.name   testRequestVolume020047
     * @tc.number SUB_CNB_REQUEST_0120
     * @tc.desc   引用透传：类型 5 与标题第 7 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020047 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 5, normal: { title: "0", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020047 end');
    })

    /**
     * @tc.name   testRequestVolume020048
     * @tc.number SUB_CNB_REQUEST_0121
     * @tc.desc   引用透传：类型 5 与标题第 8 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020048 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 5, normal: { title: "null", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020048 end');
    })

    /**
     * @tc.name   testRequestVolume020049
     * @tc.number SUB_CNB_REQUEST_0122
     * @tc.desc   引用透传：类型 6 与标题第 1 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020049 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 6, normal: { title: "", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020049 end');
    })

    /**
     * @tc.name   testRequestVolume020050
     * @tc.number SUB_CNB_REQUEST_0123
     * @tc.desc   引用透传：类型 6 与标题第 2 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020050 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 6, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020050 end');
    })

    /**
     * @tc.name   testRequestVolume020051
     * @tc.number SUB_CNB_REQUEST_0124
     * @tc.desc   引用透传：类型 6 与标题第 3 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020051 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 6, normal: { title: "Title 标题", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020051 end');
    })

    /**
     * @tc.name   testRequestVolume020052
     * @tc.number SUB_CNB_REQUEST_0125
     * @tc.desc   引用透传：类型 6 与标题第 4 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020052 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 6, normal: { title: " leading", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020052 end');
    })

    /**
     * @tc.name   testRequestVolume020053
     * @tc.number SUB_CNB_REQUEST_0126
     * @tc.desc   引用透传：类型 6 与标题第 5 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020053 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 6, normal: { title: "q'q", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020053 end');
    })

    /**
     * @tc.name   testRequestVolume020054
     * @tc.number SUB_CNB_REQUEST_0127
     * @tc.desc   引用透传：类型 6 与标题第 6 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020054 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 6,
        normal: { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020054 end');
    })

    /**
     * @tc.name   testRequestVolume020055
     * @tc.number SUB_CNB_REQUEST_0128
     * @tc.desc   引用透传：类型 6 与标题第 7 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020055 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 6, normal: { title: "0", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020055 end');
    })

    /**
     * @tc.name   testRequestVolume020056
     * @tc.number SUB_CNB_REQUEST_0129
     * @tc.desc   引用透传：类型 6 与标题第 8 组合后 content 仍是同一对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020056 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 6, normal: { title: "null", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020056 end');
    })

    /**
     * @tc.name   testRequestVolume020057
     * @tc.number SUB_CNB_REQUEST_0130
     * @tc.desc   引用透传：类型 0 携带第 1 组附加文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020057 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 0, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020057 end');
    })

    /**
     * @tc.name   testRequestVolume020058
     * @tc.number SUB_CNB_REQUEST_0131
     * @tc.desc   引用透传：类型 1 携带第 2 组附加文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020058 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 1, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020058 end');
    })

    /**
     * @tc.name   testRequestVolume020059
     * @tc.number SUB_CNB_REQUEST_0132
     * @tc.desc   引用透传：类型 2 携带第 3 组附加文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020059 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 2, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020059 end');
    })

    /**
     * @tc.name   testRequestVolume020060
     * @tc.number SUB_CNB_REQUEST_0133
     * @tc.desc   引用透传：类型 3 携带第 4 组附加文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume020060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020060 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: "T", text: "Body" } };
      const result: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.content === content));
      expect(result.content === content).assertTrue();
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020060 end');
    })

    /**
     * @tc.name   testRequestVolume020061
     * @tc.number SUB_CNB_REQUEST_0134
     * @tc.desc   content 以同一引用进入请求对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRequestVolume020061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020061 begin');
      const content: notification.NotificationContent =
        { notificationContentType: 3, normal: { title: 'T', text: 'B' } };
      const request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      expect(request.content === content).assertTrue();
      expect(request.id).assertEqual(1);
      expect(request.notificationSlotType).assertEqual(3);
      expect(request.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume020061 end');
    })

  })
}
