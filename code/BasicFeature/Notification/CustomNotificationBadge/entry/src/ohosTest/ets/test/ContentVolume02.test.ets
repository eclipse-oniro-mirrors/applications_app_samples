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
import { notificationContentUtil } from '@ohos/notification';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomNotificationBadge]';

// 统一记录实际值与期望值，避免逐处重复书写日志格式串
function logActual(actual: string, expected: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, expected);
}

export default function contentVolume02Test() {
  describe('ContentVolume02Test', () => {

    /**
     * @tc.name   testContentVolume020001
     * @tc.number SUB_CNB_CONTENT_0102
     * @tc.desc   文本透传：第 1 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020001 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020001 end');
    })

    /**
     * @tc.name   testContentVolume020002
     * @tc.number SUB_CNB_CONTENT_0103
     * @tc.desc   文本透传：第 1 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020002 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020002 end');
    })

    /**
     * @tc.name   testContentVolume020003
     * @tc.number SUB_CNB_CONTENT_0104
     * @tc.desc   文本透传：第 1 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020003 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020003 end');
    })

    /**
     * @tc.name   testContentVolume020004
     * @tc.number SUB_CNB_CONTENT_0105
     * @tc.desc   文本透传：第 1 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020004 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020004 end');
    })

    /**
     * @tc.name   testContentVolume020005
     * @tc.number SUB_CNB_CONTENT_0106
     * @tc.desc   文本透传：第 1 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020005 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020005 end');
    })

    /**
     * @tc.name   testContentVolume020006
     * @tc.number SUB_CNB_CONTENT_0107
     * @tc.desc   文本透传：第 1 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020006 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "",
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020006 end');
    })

    /**
     * @tc.name   testContentVolume020007
     * @tc.number SUB_CNB_CONTENT_0108
     * @tc.desc   文本透传：第 2 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020007 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "a", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020007 end');
    })

    /**
     * @tc.name   testContentVolume020008
     * @tc.number SUB_CNB_CONTENT_0109
     * @tc.desc   文本透传：第 2 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020008 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "a", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020008 end');
    })

    /**
     * @tc.name   testContentVolume020009
     * @tc.number SUB_CNB_CONTENT_0110
     * @tc.desc   文本透传：第 2 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020009 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "a", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020009 end');
    })

    /**
     * @tc.name   testContentVolume020010
     * @tc.number SUB_CNB_CONTENT_0111
     * @tc.desc   文本透传：第 2 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020010 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "a", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020010 end');
    })

    /**
     * @tc.name   testContentVolume020011
     * @tc.number SUB_CNB_CONTENT_0112
     * @tc.desc   文本透传：第 2 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020011 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "a", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020011 end');
    })

    /**
     * @tc.name   testContentVolume020012
     * @tc.number SUB_CNB_CONTENT_0113
     * @tc.desc   文本透传：第 2 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020012 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "a",
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020012 end');
    })

    /**
     * @tc.name   testContentVolume020013
     * @tc.number SUB_CNB_CONTENT_0114
     * @tc.desc   文本透传：第 3 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020013 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "Basic notification", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Basic notification"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Basic notification");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020013 end');
    })

    /**
     * @tc.name   testContentVolume020014
     * @tc.number SUB_CNB_CONTENT_0115
     * @tc.desc   文本透传：第 3 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020014 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "Basic notification", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Basic notification"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Basic notification");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020014 end');
    })

    /**
     * @tc.name   testContentVolume020015
     * @tc.number SUB_CNB_CONTENT_0116
     * @tc.desc   文本透传：第 3 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020015 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "Basic notification",
        text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Basic notification"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Basic notification");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020015 end');
    })

    /**
     * @tc.name   testContentVolume020016
     * @tc.number SUB_CNB_CONTENT_0117
     * @tc.desc   文本透传：第 3 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020016 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "Basic notification", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Basic notification"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Basic notification");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020016 end');
    })

    /**
     * @tc.name   testContentVolume020017
     * @tc.number SUB_CNB_CONTENT_0118
     * @tc.desc   文本透传：第 3 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020017 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "Basic notification", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Basic notification"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Basic notification");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020017 end');
    })

    /**
     * @tc.name   testContentVolume020018
     * @tc.number SUB_CNB_CONTENT_0119
     * @tc.desc   文本透传：第 3 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020018 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "Basic notification",
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Basic notification"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Basic notification");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020018 end');
    })

    /**
     * @tc.name   testContentVolume020019
     * @tc.number SUB_CNB_CONTENT_0120
     * @tc.desc   文本透传：第 4 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020019 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "1234567890", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("1234567890"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("1234567890");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020019 end');
    })

    /**
     * @tc.name   testContentVolume020020
     * @tc.number SUB_CNB_CONTENT_0121
     * @tc.desc   文本透传：第 4 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020020 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "1234567890", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("1234567890"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("1234567890");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020020 end');
    })

    /**
     * @tc.name   testContentVolume020021
     * @tc.number SUB_CNB_CONTENT_0122
     * @tc.desc   文本透传：第 4 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020021 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "1234567890", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("1234567890"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("1234567890");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020021 end');
    })

    /**
     * @tc.name   testContentVolume020022
     * @tc.number SUB_CNB_CONTENT_0123
     * @tc.desc   文本透传：第 4 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020022 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "1234567890", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("1234567890"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("1234567890");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020022 end');
    })

    /**
     * @tc.name   testContentVolume020023
     * @tc.number SUB_CNB_CONTENT_0124
     * @tc.desc   文本透传：第 4 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020023 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "1234567890", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("1234567890"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("1234567890");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020023 end');
    })

    /**
     * @tc.name   testContentVolume020024
     * @tc.number SUB_CNB_CONTENT_0125
     * @tc.desc   文本透传：第 4 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020024 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "1234567890",
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("1234567890"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("1234567890");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020024 end');
    })

    /**
     * @tc.name   testContentVolume020025
     * @tc.number SUB_CNB_CONTENT_0126
     * @tc.desc   文本透传：第 5 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020025 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "  leading", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  leading"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  leading");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020025 end');
    })

    /**
     * @tc.name   testContentVolume020026
     * @tc.number SUB_CNB_CONTENT_0127
     * @tc.desc   文本透传：第 5 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020026 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "  leading", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  leading"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  leading");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020026 end');
    })

    /**
     * @tc.name   testContentVolume020027
     * @tc.number SUB_CNB_CONTENT_0128
     * @tc.desc   文本透传：第 5 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020027 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "  leading", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  leading"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  leading");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020027 end');
    })

    /**
     * @tc.name   testContentVolume020028
     * @tc.number SUB_CNB_CONTENT_0129
     * @tc.desc   文本透传：第 5 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020028 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "  leading", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  leading"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  leading");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020028 end');
    })

    /**
     * @tc.name   testContentVolume020029
     * @tc.number SUB_CNB_CONTENT_0130
     * @tc.desc   文本透传：第 5 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020029 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "  leading", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  leading"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  leading");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020029 end');
    })

    /**
     * @tc.name   testContentVolume020030
     * @tc.number SUB_CNB_CONTENT_0131
     * @tc.desc   文本透传：第 5 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020030 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "  leading",
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  leading"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  leading");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020030 end');
    })

    /**
     * @tc.name   testContentVolume020031
     * @tc.number SUB_CNB_CONTENT_0132
     * @tc.desc   文本透传：第 6 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020031 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "quote's", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("quote's"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("quote's");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020031 end');
    })

    /**
     * @tc.name   testContentVolume020032
     * @tc.number SUB_CNB_CONTENT_0133
     * @tc.desc   文本透传：第 6 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020032 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "quote's", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("quote's"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("quote's");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020032 end');
    })

    /**
     * @tc.name   testContentVolume020033
     * @tc.number SUB_CNB_CONTENT_0134
     * @tc.desc   文本透传：第 6 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020033 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "quote's", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("quote's"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("quote's");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020033 end');
    })

    /**
     * @tc.name   testContentVolume020034
     * @tc.number SUB_CNB_CONTENT_0135
     * @tc.desc   文本透传：第 6 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020034 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "quote's", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("quote's"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("quote's");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020034 end');
    })

    /**
     * @tc.name   testContentVolume020035
     * @tc.number SUB_CNB_CONTENT_0136
     * @tc.desc   文本透传：第 6 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020035 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "quote's", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("quote's"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("quote's");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020035 end');
    })

    /**
     * @tc.name   testContentVolume020036
     * @tc.number SUB_CNB_CONTENT_0137
     * @tc.desc   文本透传：第 6 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020036 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "quote's",
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("quote's"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("quote's");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020036 end');
    })

    /**
     * @tc.name   testContentVolume020037
     * @tc.number SUB_CNB_CONTENT_0138
     * @tc.desc   文本透传：第 7 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020037 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "back\\slash", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020037 end');
    })

    /**
     * @tc.name   testContentVolume020038
     * @tc.number SUB_CNB_CONTENT_0139
     * @tc.desc   文本透传：第 7 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020038 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "back\\slash", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020038 end');
    })

    /**
     * @tc.name   testContentVolume020039
     * @tc.number SUB_CNB_CONTENT_0140
     * @tc.desc   文本透传：第 7 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020039 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "back\\slash", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020039 end');
    })

    /**
     * @tc.name   testContentVolume020040
     * @tc.number SUB_CNB_CONTENT_0141
     * @tc.desc   文本透传：第 7 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020040 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "back\\slash", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020040 end');
    })

    /**
     * @tc.name   testContentVolume020041
     * @tc.number SUB_CNB_CONTENT_0142
     * @tc.desc   文本透传：第 7 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020041 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "back\\slash", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020041 end');
    })

    /**
     * @tc.name   testContentVolume020042
     * @tc.number SUB_CNB_CONTENT_0143
     * @tc.desc   文本透传：第 7 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020042 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "back\\slash",
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020042 end');
    })

    /**
     * @tc.name   testContentVolume020043
     * @tc.number SUB_CNB_CONTENT_0144
     * @tc.desc   文本透传：第 8 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020043 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题中文", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题中文"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题中文");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020043 end');
    })

    /**
     * @tc.name   testContentVolume020044
     * @tc.number SUB_CNB_CONTENT_0145
     * @tc.desc   文本透传：第 8 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020044 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题中文", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题中文"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题中文");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020044 end');
    })

    /**
     * @tc.name   testContentVolume020045
     * @tc.number SUB_CNB_CONTENT_0146
     * @tc.desc   文本透传：第 8 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020045 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题中文", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题中文"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题中文");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020045 end');
    })

    /**
     * @tc.name   testContentVolume020046
     * @tc.number SUB_CNB_CONTENT_0147
     * @tc.desc   文本透传：第 8 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020046 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题中文", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题中文"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题中文");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020046 end');
    })

    /**
     * @tc.name   testContentVolume020047
     * @tc.number SUB_CNB_CONTENT_0148
     * @tc.desc   文本透传：第 8 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020047 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题中文", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题中文"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题中文");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020047 end');
    })

    /**
     * @tc.name   testContentVolume020048
     * @tc.number SUB_CNB_CONTENT_0149
     * @tc.desc   文本透传：第 8 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020048 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题中文",
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题中文"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题中文");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020048 end');
    })

    /**
     * @tc.name   testContentVolume020049
     * @tc.number SUB_CNB_CONTENT_0150
     * @tc.desc   文本透传：第 9 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020049 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020049 end');
    })

    /**
     * @tc.name   testContentVolume020050
     * @tc.number SUB_CNB_CONTENT_0151
     * @tc.desc   文本透传：第 9 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020050 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020050 end');
    })

    /**
     * @tc.name   testContentVolume020051
     * @tc.number SUB_CNB_CONTENT_0152
     * @tc.desc   文本透传：第 9 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020051 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020051 end');
    })

    /**
     * @tc.name   testContentVolume020052
     * @tc.number SUB_CNB_CONTENT_0153
     * @tc.desc   文本透传：第 9 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020052 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020052 end');
    })

    /**
     * @tc.name   testContentVolume020053
     * @tc.number SUB_CNB_CONTENT_0154
     * @tc.desc   文本透传：第 9 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020053 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020053 end');
    })

    /**
     * @tc.name   testContentVolume020054
     * @tc.number SUB_CNB_CONTENT_0155
     * @tc.desc   文本透传：第 9 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020054 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "BBBBBBBBBBBBBBBBBBBBBB" +
            "BBBBBBBBBBBBBBBBBBBBBB" +
            "BBBBBBBBBBBBBBBBBBBBBB" +
            "BBBBBBBBBBBBBBBBBBBBBB" +
            "BBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020054 end');
    })

    /**
     * @tc.name   testContentVolume020055
     * @tc.number SUB_CNB_CONTENT_0156
     * @tc.desc   文本透传：第 10 组标题与第 1 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020055 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020055 end');
    })

    /**
     * @tc.name   testContentVolume020056
     * @tc.number SUB_CNB_CONTENT_0157
     * @tc.desc   文本透传：第 10 组标题与第 2 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020056 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "b" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("b"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020056 end');
    })

    /**
     * @tc.name   testContentVolume020057
     * @tc.number SUB_CNB_CONTENT_0158
     * @tc.desc   文本透传：第 10 组标题与第 3 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020057 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "Notification content" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("Notification content"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("Notification content");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020057 end');
    })

    /**
     * @tc.name   testContentVolume020058
     * @tc.number SUB_CNB_CONTENT_0159
     * @tc.desc   文本透传：第 10 组标题与第 4 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020058 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "tab\there" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("tab\there"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("tab\there");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020058 end');
    })

    /**
     * @tc.name   testContentVolume020059
     * @tc.number SUB_CNB_CONTENT_0160
     * @tc.desc   文本透传：第 10 组标题与第 5 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020059 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "line\nbreak" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("line\nbreak"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("line\nbreak");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020059 end');
    })

    /**
     * @tc.name   testContentVolume020060
     * @tc.number SUB_CNB_CONTENT_0161
     * @tc.desc   文本透传：第 10 组标题与第 6 组正文原样进入 normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume020060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020060 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT",
              text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
                "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020060 end');
    })

    /**
     * @tc.name   testContentVolume020061
     * @tc.number SUB_CNB_CONTENT_0162
     * @tc.desc   空标题与空正文仍构造基本文本内容，normal 字段为空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContentVolume020061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020061 begin');
      const content: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: '', text: '' });
      expect(content.notificationContentType).assertEqual(0);
      expect((content.normal as notification.NotificationBasicContent).title).assertEqual('');
      expect((content.normal as notification.NotificationBasicContent).text).assertEqual('');
      expect((content.normal as notification.NotificationBasicContent).title.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume020061 end');
    })

  })
}
