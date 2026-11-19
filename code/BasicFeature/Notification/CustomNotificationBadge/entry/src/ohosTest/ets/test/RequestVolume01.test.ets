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

export default function requestVolume01Test() {
  describe('RequestVolume01Test', () => {

    /**
     * @tc.name   testRequestVolume010001
     * @tc.number SUB_CNB_REQUEST_0013
     * @tc.desc   请求内容：类型 0 搭配第 1 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010001 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010001 end');
    })

    /**
     * @tc.name   testRequestVolume010002
     * @tc.number SUB_CNB_REQUEST_0014
     * @tc.desc   请求内容：类型 0 搭配第 2 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010002 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0, normal: { title: "T",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010002 end');
    })

    /**
     * @tc.name   testRequestVolume010003
     * @tc.number SUB_CNB_REQUEST_0015
     * @tc.desc   请求内容：类型 0 搭配第 3 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010003 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0, normal: { title: "",
        text: "" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010003 end');
    })

    /**
     * @tc.name   testRequestVolume010004
     * @tc.number SUB_CNB_REQUEST_0016
     * @tc.desc   请求内容：类型 0 搭配第 4 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010004 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0, normal: { title: "T",
        text: "B", additionalText: "A" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010004 end');
    })

    /**
     * @tc.name   testRequestVolume010005
     * @tc.number SUB_CNB_REQUEST_0017
     * @tc.desc   请求内容：类型 0 搭配第 5 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010005 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0, longText: { title: "T",
        text: "B", additionalText: "A", longText: "L", briefText: "BR", expandedTitle: "E" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010005 end');
    })

    /**
     * @tc.name   testRequestVolume010006
     * @tc.number SUB_CNB_REQUEST_0018
     * @tc.desc   请求内容：类型 0 搭配第 6 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010006 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0, multiLine: { title: "T",
        text: "B", additionalText: "A", briefText: "BR", longTitle: "LT", lines: ["l0", "l1"] } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010006 end');
    })

    /**
     * @tc.name   testRequestVolume010007
     * @tc.number SUB_CNB_REQUEST_0019
     * @tc.desc   请求内容：类型 0 搭配第 7 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010007 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0, contentType: 0 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010007 end');
    })

    /**
     * @tc.name   testRequestVolume010008
     * @tc.number SUB_CNB_REQUEST_0020
     * @tc.desc   请求内容：类型 0 搭配第 8 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010008 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0,
        normal: { title: "Unicode 标题", text: "内容" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010008 end');
    })

    /**
     * @tc.name   testRequestVolume010009
     * @tc.number SUB_CNB_REQUEST_0021
     * @tc.desc   请求内容：类型 1 搭配第 1 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010009 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010009 end');
    })

    /**
     * @tc.name   testRequestVolume010010
     * @tc.number SUB_CNB_REQUEST_0022
     * @tc.desc   请求内容：类型 1 搭配第 2 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010010 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1, normal: { title: "T",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010010 end');
    })

    /**
     * @tc.name   testRequestVolume010011
     * @tc.number SUB_CNB_REQUEST_0023
     * @tc.desc   请求内容：类型 1 搭配第 3 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010011 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1, normal: { title: "",
        text: "" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010011 end');
    })

    /**
     * @tc.name   testRequestVolume010012
     * @tc.number SUB_CNB_REQUEST_0024
     * @tc.desc   请求内容：类型 1 搭配第 4 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010012 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1, normal: { title: "T",
        text: "B", additionalText: "A" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010012 end');
    })

    /**
     * @tc.name   testRequestVolume010013
     * @tc.number SUB_CNB_REQUEST_0025
     * @tc.desc   请求内容：类型 1 搭配第 5 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010013 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1, longText: { title: "T",
        text: "B", additionalText: "A", longText: "L", briefText: "BR", expandedTitle: "E" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010013 end');
    })

    /**
     * @tc.name   testRequestVolume010014
     * @tc.number SUB_CNB_REQUEST_0026
     * @tc.desc   请求内容：类型 1 搭配第 6 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010014 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1, multiLine: { title: "T",
        text: "B", additionalText: "A", briefText: "BR", longTitle: "LT", lines: ["l0", "l1"] } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010014 end');
    })

    /**
     * @tc.name   testRequestVolume010015
     * @tc.number SUB_CNB_REQUEST_0027
     * @tc.desc   请求内容：类型 1 搭配第 7 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010015 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1, contentType: 1 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010015 end');
    })

    /**
     * @tc.name   testRequestVolume010016
     * @tc.number SUB_CNB_REQUEST_0028
     * @tc.desc   请求内容：类型 1 搭配第 8 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010016 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1,
        normal: { title: "Unicode 标题", text: "内容" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010016 end');
    })

    /**
     * @tc.name   testRequestVolume010017
     * @tc.number SUB_CNB_REQUEST_0029
     * @tc.desc   请求内容：类型 2 搭配第 1 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010017 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010017 end');
    })

    /**
     * @tc.name   testRequestVolume010018
     * @tc.number SUB_CNB_REQUEST_0030
     * @tc.desc   请求内容：类型 2 搭配第 2 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010018 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2, normal: { title: "T",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010018 end');
    })

    /**
     * @tc.name   testRequestVolume010019
     * @tc.number SUB_CNB_REQUEST_0031
     * @tc.desc   请求内容：类型 2 搭配第 3 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010019 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2, normal: { title: "",
        text: "" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010019 end');
    })

    /**
     * @tc.name   testRequestVolume010020
     * @tc.number SUB_CNB_REQUEST_0032
     * @tc.desc   请求内容：类型 2 搭配第 4 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010020 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2, normal: { title: "T",
        text: "B", additionalText: "A" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010020 end');
    })

    /**
     * @tc.name   testRequestVolume010021
     * @tc.number SUB_CNB_REQUEST_0033
     * @tc.desc   请求内容：类型 2 搭配第 5 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010021 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2, longText: { title: "T",
        text: "B", additionalText: "A", longText: "L", briefText: "BR", expandedTitle: "E" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010021 end');
    })

    /**
     * @tc.name   testRequestVolume010022
     * @tc.number SUB_CNB_REQUEST_0034
     * @tc.desc   请求内容：类型 2 搭配第 6 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010022 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2, multiLine: { title: "T",
        text: "B", additionalText: "A", briefText: "BR", longTitle: "LT", lines: ["l0", "l1"] } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010022 end');
    })

    /**
     * @tc.name   testRequestVolume010023
     * @tc.number SUB_CNB_REQUEST_0035
     * @tc.desc   请求内容：类型 2 搭配第 7 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010023 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2, contentType: 2 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010023 end');
    })

    /**
     * @tc.name   testRequestVolume010024
     * @tc.number SUB_CNB_REQUEST_0036
     * @tc.desc   请求内容：类型 2 搭配第 8 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010024 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2,
        normal: { title: "Unicode 标题", text: "内容" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010024 end');
    })

    /**
     * @tc.name   testRequestVolume010025
     * @tc.number SUB_CNB_REQUEST_0037
     * @tc.desc   请求内容：类型 3 搭配第 1 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010025 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010025 end');
    })

    /**
     * @tc.name   testRequestVolume010026
     * @tc.number SUB_CNB_REQUEST_0038
     * @tc.desc   请求内容：类型 3 搭配第 2 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010026 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3, normal: { title: "T",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010026 end');
    })

    /**
     * @tc.name   testRequestVolume010027
     * @tc.number SUB_CNB_REQUEST_0039
     * @tc.desc   请求内容：类型 3 搭配第 3 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010027 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3, normal: { title: "",
        text: "" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010027 end');
    })

    /**
     * @tc.name   testRequestVolume010028
     * @tc.number SUB_CNB_REQUEST_0040
     * @tc.desc   请求内容：类型 3 搭配第 4 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010028 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3, normal: { title: "T",
        text: "B", additionalText: "A" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010028 end');
    })

    /**
     * @tc.name   testRequestVolume010029
     * @tc.number SUB_CNB_REQUEST_0041
     * @tc.desc   请求内容：类型 3 搭配第 5 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010029 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3, longText: { title: "T",
        text: "B", additionalText: "A", longText: "L", briefText: "BR", expandedTitle: "E" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010029 end');
    })

    /**
     * @tc.name   testRequestVolume010030
     * @tc.number SUB_CNB_REQUEST_0042
     * @tc.desc   请求内容：类型 3 搭配第 6 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010030 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3, multiLine: { title: "T",
        text: "B", additionalText: "A", briefText: "BR", longTitle: "LT", lines: ["l0", "l1"] } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010030 end');
    })

    /**
     * @tc.name   testRequestVolume010031
     * @tc.number SUB_CNB_REQUEST_0043
     * @tc.desc   请求内容：类型 3 搭配第 7 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010031 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3, contentType: 3 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010031 end');
    })

    /**
     * @tc.name   testRequestVolume010032
     * @tc.number SUB_CNB_REQUEST_0044
     * @tc.desc   请求内容：类型 3 搭配第 8 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010032 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3,
        normal: { title: "Unicode 标题", text: "内容" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010032 end');
    })

    /**
     * @tc.name   testRequestVolume010033
     * @tc.number SUB_CNB_REQUEST_0045
     * @tc.desc   请求内容：类型 4 搭配第 1 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010033 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 4 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010033 end');
    })

    /**
     * @tc.name   testRequestVolume010034
     * @tc.number SUB_CNB_REQUEST_0046
     * @tc.desc   请求内容：类型 4 搭配第 2 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010034 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 4, normal: { title: "T",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010034 end');
    })

    /**
     * @tc.name   testRequestVolume010035
     * @tc.number SUB_CNB_REQUEST_0047
     * @tc.desc   请求内容：类型 4 搭配第 3 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010035 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 4, normal: { title: "",
        text: "" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010035 end');
    })

    /**
     * @tc.name   testRequestVolume010036
     * @tc.number SUB_CNB_REQUEST_0048
     * @tc.desc   请求内容：类型 4 搭配第 4 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010036 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 4, normal: { title: "T",
        text: "B", additionalText: "A" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010036 end');
    })

    /**
     * @tc.name   testRequestVolume010037
     * @tc.number SUB_CNB_REQUEST_0049
     * @tc.desc   请求内容：类型 4 搭配第 5 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010037 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 4, longText: { title: "T",
        text: "B", additionalText: "A", longText: "L", briefText: "BR", expandedTitle: "E" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010037 end');
    })

    /**
     * @tc.name   testRequestVolume010038
     * @tc.number SUB_CNB_REQUEST_0050
     * @tc.desc   请求内容：类型 4 搭配第 6 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010038 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 4, multiLine: { title: "T",
        text: "B", additionalText: "A", briefText: "BR", longTitle: "LT", lines: ["l0", "l1"] } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010038 end');
    })

    /**
     * @tc.name   testRequestVolume010039
     * @tc.number SUB_CNB_REQUEST_0051
     * @tc.desc   请求内容：类型 4 搭配第 7 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010039 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 4, contentType: 4 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010039 end');
    })

    /**
     * @tc.name   testRequestVolume010040
     * @tc.number SUB_CNB_REQUEST_0052
     * @tc.desc   请求内容：类型 4 搭配第 8 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010040 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 4,
        normal: { title: "Unicode 标题", text: "内容" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(4));
      expect(result.content.notificationContentType).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010040 end');
    })

    /**
     * @tc.name   testRequestVolume010041
     * @tc.number SUB_CNB_REQUEST_0053
     * @tc.desc   请求内容：类型 5 搭配第 1 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010041 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 5 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010041 end');
    })

    /**
     * @tc.name   testRequestVolume010042
     * @tc.number SUB_CNB_REQUEST_0054
     * @tc.desc   请求内容：类型 5 搭配第 2 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010042 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 5, normal: { title: "T",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010042 end');
    })

    /**
     * @tc.name   testRequestVolume010043
     * @tc.number SUB_CNB_REQUEST_0055
     * @tc.desc   请求内容：类型 5 搭配第 3 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010043 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 5, normal: { title: "",
        text: "" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010043 end');
    })

    /**
     * @tc.name   testRequestVolume010044
     * @tc.number SUB_CNB_REQUEST_0056
     * @tc.desc   请求内容：类型 5 搭配第 4 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010044 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 5, normal: { title: "T",
        text: "B", additionalText: "A" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010044 end');
    })

    /**
     * @tc.name   testRequestVolume010045
     * @tc.number SUB_CNB_REQUEST_0057
     * @tc.desc   请求内容：类型 5 搭配第 5 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010045 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 5, longText: { title: "T",
        text: "B", additionalText: "A", longText: "L", briefText: "BR", expandedTitle: "E" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010045 end');
    })

    /**
     * @tc.name   testRequestVolume010046
     * @tc.number SUB_CNB_REQUEST_0058
     * @tc.desc   请求内容：类型 5 搭配第 6 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010046 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 5, multiLine: { title: "T",
        text: "B", additionalText: "A", briefText: "BR", longTitle: "LT", lines: ["l0", "l1"] } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010046 end');
    })

    /**
     * @tc.name   testRequestVolume010047
     * @tc.number SUB_CNB_REQUEST_0059
     * @tc.desc   请求内容：类型 5 搭配第 7 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010047 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 5, contentType: 5 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010047 end');
    })

    /**
     * @tc.name   testRequestVolume010048
     * @tc.number SUB_CNB_REQUEST_0060
     * @tc.desc   请求内容：类型 5 搭配第 8 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010048 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 5,
        normal: { title: "Unicode 标题", text: "内容" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(5));
      expect(result.content.notificationContentType).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010048 end');
    })

    /**
     * @tc.name   testRequestVolume010049
     * @tc.number SUB_CNB_REQUEST_0061
     * @tc.desc   请求内容：类型 6 搭配第 1 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010049 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 6 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010049 end');
    })

    /**
     * @tc.name   testRequestVolume010050
     * @tc.number SUB_CNB_REQUEST_0062
     * @tc.desc   请求内容：类型 6 搭配第 2 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010050 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 6, normal: { title: "T",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010050 end');
    })

    /**
     * @tc.name   testRequestVolume010051
     * @tc.number SUB_CNB_REQUEST_0063
     * @tc.desc   请求内容：类型 6 搭配第 3 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010051 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 6, normal: { title: "",
        text: "" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010051 end');
    })

    /**
     * @tc.name   testRequestVolume010052
     * @tc.number SUB_CNB_REQUEST_0064
     * @tc.desc   请求内容：类型 6 搭配第 4 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010052 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 6, normal: { title: "T",
        text: "B", additionalText: "A" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010052 end');
    })

    /**
     * @tc.name   testRequestVolume010053
     * @tc.number SUB_CNB_REQUEST_0065
     * @tc.desc   请求内容：类型 6 搭配第 5 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010053 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 6, longText: { title: "T",
        text: "B", additionalText: "A", longText: "L", briefText: "BR", expandedTitle: "E" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010053 end');
    })

    /**
     * @tc.name   testRequestVolume010054
     * @tc.number SUB_CNB_REQUEST_0066
     * @tc.desc   请求内容：类型 6 搭配第 6 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010054 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 6, multiLine: { title: "T",
        text: "B", additionalText: "A", briefText: "BR", longTitle: "LT", lines: ["l0", "l1"] } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010054 end');
    })

    /**
     * @tc.name   testRequestVolume010055
     * @tc.number SUB_CNB_REQUEST_0067
     * @tc.desc   请求内容：类型 6 搭配第 7 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010055 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 6, contentType: 6 });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010055 end');
    })

    /**
     * @tc.name   testRequestVolume010056
     * @tc.number SUB_CNB_REQUEST_0068
     * @tc.desc   请求内容：类型 6 搭配第 8 种内容负载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010056 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 6,
        normal: { title: "Unicode 标题", text: "内容" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(6));
      expect(result.content.notificationContentType).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010056 end');
    })

    /**
     * @tc.name   testRequestVolume010057
     * @tc.number SUB_CNB_REQUEST_0069
     * @tc.desc   请求内容：类型 0 携带第 1 组边界标题
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010057 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 0, normal: { title: "长标题 T",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(0));
      expect(result.content.notificationContentType).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010057 end');
    })

    /**
     * @tc.name   testRequestVolume010058
     * @tc.number SUB_CNB_REQUEST_0070
     * @tc.desc   请求内容：类型 1 携带第 2 组边界标题
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010058 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 1,
        normal: { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT", text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(1));
      expect(result.content.notificationContentType).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010058 end');
    })

    /**
     * @tc.name   testRequestVolume010059
     * @tc.number SUB_CNB_REQUEST_0071
     * @tc.desc   请求内容：类型 2 携带第 3 组边界标题
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010059 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 2, normal: { title: "  前后空格  ",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(2));
      expect(result.content.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010059 end');
    })

    /**
     * @tc.name   testRequestVolume010060
     * @tc.number SUB_CNB_REQUEST_0072
     * @tc.desc   请求内容：类型 3 携带第 4 组边界标题
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRequestVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010060 begin');
      const result: notification.NotificationRequest =
        notificationRequestUtil.initBasicNotificationRequest({ notificationContentType: 3, normal: { title: "0",
        text: "B" } });
      logActual(String(result.id), String(1));
      expect(result.id).assertEqual(1);
      logActual(String(result.notificationSlotType), String(3));
      expect(result.notificationSlotType).assertEqual(3);
      logActual(String(result.content.notificationContentType), String(3));
      expect(result.content.notificationContentType).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010060 end');
    })

    /**
     * @tc.name   testRequestVolume010061
     * @tc.number SUB_CNB_REQUEST_0073
     * @tc.desc   空内容对象仍固定 id=1、槽位 3，且不写 groupName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRequestVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010061 begin');
      const request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest({});
      expect(request.id).assertEqual(1);
      expect(request.notificationSlotType).assertEqual(3);
      expect(request.content !== undefined).assertTrue();
      expect(request.groupName !== undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRequestVolume010061 end');
    })

  })
}
