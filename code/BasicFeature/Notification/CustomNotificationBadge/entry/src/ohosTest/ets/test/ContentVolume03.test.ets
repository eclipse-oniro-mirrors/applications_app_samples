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

export default function contentVolume03Test() {
  describe('ContentVolume03Test', () => {

    /**
     * @tc.name   testContentVolume030001
     * @tc.number SUB_CNB_CONTENT_0163
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 1 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030001 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "", "", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030001 end');
    })

    /**
     * @tc.name   testContentVolume030002
     * @tc.number SUB_CNB_CONTENT_0164
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 1 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030002 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "", "", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030002 end');
    })

    /**
     * @tc.name   testContentVolume030003
     * @tc.number SUB_CNB_CONTENT_0165
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 2 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030003 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "", "brief", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030003 end');
    })

    /**
     * @tc.name   testContentVolume030004
     * @tc.number SUB_CNB_CONTENT_0166
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 2 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030004 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "", "brief",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030004 end');
    })

    /**
     * @tc.name   testContentVolume030005
     * @tc.number SUB_CNB_CONTENT_0167
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 3 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030005 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "",
        "Notification brief text", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030005 end');
    })

    /**
     * @tc.name   testContentVolume030006
     * @tc.number SUB_CNB_CONTENT_0168
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 3 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030006 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "",
        "Notification brief text", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030006 end');
    })

    /**
     * @tc.name   testContentVolume030007
     * @tc.number SUB_CNB_CONTENT_0169
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 4 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030007 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030007 end');
    })

    /**
     * @tc.name   testContentVolume030008
     * @tc.number SUB_CNB_CONTENT_0170
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 4 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030008 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030008 end');
    })

    /**
     * @tc.name   testContentVolume030009
     * @tc.number SUB_CNB_CONTENT_0171
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 5 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030009 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "", "概要", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030009 end');
    })

    /**
     * @tc.name   testContentVolume030010
     * @tc.number SUB_CNB_CONTENT_0172
     * @tc.desc   长文本字段：longText 第 1 组、briefText 第 5 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030010 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "", "概要",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030010 end');
    })

    /**
     * @tc.name   testContentVolume030011
     * @tc.number SUB_CNB_CONTENT_0173
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 1 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030011 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L", "", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030011 end');
    })

    /**
     * @tc.name   testContentVolume030012
     * @tc.number SUB_CNB_CONTENT_0174
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 1 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030012 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L", "",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030012 end');
    })

    /**
     * @tc.name   testContentVolume030013
     * @tc.number SUB_CNB_CONTENT_0175
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 2 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030013 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L", "brief", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030013 end');
    })

    /**
     * @tc.name   testContentVolume030014
     * @tc.number SUB_CNB_CONTENT_0176
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 2 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030014 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L", "brief",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030014 end');
    })

    /**
     * @tc.name   testContentVolume030015
     * @tc.number SUB_CNB_CONTENT_0177
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 3 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030015 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L",
        "Notification brief text", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030015 end');
    })

    /**
     * @tc.name   testContentVolume030016
     * @tc.number SUB_CNB_CONTENT_0178
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 3 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030016 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L",
        "Notification brief text", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030016 end');
    })

    /**
     * @tc.name   testContentVolume030017
     * @tc.number SUB_CNB_CONTENT_0179
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 4 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030017 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030017 end');
    })

    /**
     * @tc.name   testContentVolume030018
     * @tc.number SUB_CNB_CONTENT_0180
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 4 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030018 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030018 end');
    })

    /**
     * @tc.name   testContentVolume030019
     * @tc.number SUB_CNB_CONTENT_0181
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 5 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030019 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L", "概要", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030019 end');
    })

    /**
     * @tc.name   testContentVolume030020
     * @tc.number SUB_CNB_CONTENT_0182
     * @tc.desc   长文本字段：longText 第 2 组、briefText 第 5 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030020 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "L", "概要",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030020 end');
    })

    /**
     * @tc.name   testContentVolume030021
     * @tc.number SUB_CNB_CONTENT_0183
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 1 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030021 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body", "", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030021 end');
    })

    /**
     * @tc.name   testContentVolume030022
     * @tc.number SUB_CNB_CONTENT_0184
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 1 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030022 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body", "",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030022 end');
    })

    /**
     * @tc.name   testContentVolume030023
     * @tc.number SUB_CNB_CONTENT_0185
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 2 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030023 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body", "brief",
        "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030023 end');
    })

    /**
     * @tc.name   testContentVolume030024
     * @tc.number SUB_CNB_CONTENT_0186
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 2 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030024 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body", "brief",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030024 end');
    })

    /**
     * @tc.name   testContentVolume030025
     * @tc.number SUB_CNB_CONTENT_0187
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 3 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030025 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body",
        "Notification brief text", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030025 end');
    })

    /**
     * @tc.name   testContentVolume030026
     * @tc.number SUB_CNB_CONTENT_0188
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 3 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030026 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body",
        "Notification brief text", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030026 end');
    })

    /**
     * @tc.name   testContentVolume030027
     * @tc.number SUB_CNB_CONTENT_0189
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 4 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030027 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030027 end');
    })

    /**
     * @tc.name   testContentVolume030028
     * @tc.number SUB_CNB_CONTENT_0190
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 4 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030028 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030028 end');
    })

    /**
     * @tc.name   testContentVolume030029
     * @tc.number SUB_CNB_CONTENT_0191
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 5 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030029 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body", "概要",
        "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030029 end');
    })

    /**
     * @tc.name   testContentVolume030030
     * @tc.number SUB_CNB_CONTENT_0192
     * @tc.desc   长文本字段：longText 第 3 组、briefText 第 5 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030030 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "Long text body", "概要",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("Long text body"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("Long text body");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030030 end');
    })

    /**
     * @tc.name   testContentVolume030031
     * @tc.number SUB_CNB_CONTENT_0193
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 1 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030031 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030031 end');
    })

    /**
     * @tc.name   testContentVolume030032
     * @tc.number SUB_CNB_CONTENT_0194
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 1 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030032 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030032 end');
    })

    /**
     * @tc.name   testContentVolume030033
     * @tc.number SUB_CNB_CONTENT_0195
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 2 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030033 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "brief", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030033 end');
    })

    /**
     * @tc.name   testContentVolume030034
     * @tc.number SUB_CNB_CONTENT_0196
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 2 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030034 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "brief", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030034 end');
    })

    /**
     * @tc.name   testContentVolume030035
     * @tc.number SUB_CNB_CONTENT_0197
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 3 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030035 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "Notification brief text", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030035 end');
    })

    /**
     * @tc.name   testContentVolume030036
     * @tc.number SUB_CNB_CONTENT_0198
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 3 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030036 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "Notification brief text", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030036 end');
    })

    /**
     * @tc.name   testContentVolume030037
     * @tc.number SUB_CNB_CONTENT_0199
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 4 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030037 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030037 end');
    })

    /**
     * @tc.name   testContentVolume030038
     * @tc.number SUB_CNB_CONTENT_0200
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 4 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030038 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
            "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030038 end');
    })

    /**
     * @tc.name   testContentVolume030039
     * @tc.number SUB_CNB_CONTENT_0201
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 5 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030039 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "概要", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030039 end');
    })

    /**
     * @tc.name   testContentVolume030040
     * @tc.number SUB_CNB_CONTENT_0202
     * @tc.desc   长文本字段：longText 第 4 组、briefText 第 5 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030040 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL", "概要", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030040 end');
    })

    /**
     * @tc.name   testContentVolume030041
     * @tc.number SUB_CNB_CONTENT_0203
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 1 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030041 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本", "", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030041 end');
    })

    /**
     * @tc.name   testContentVolume030042
     * @tc.number SUB_CNB_CONTENT_0204
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 1 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030042 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本", "",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030042 end');
    })

    /**
     * @tc.name   testContentVolume030043
     * @tc.number SUB_CNB_CONTENT_0205
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 2 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030043 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本", "brief", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030043 end');
    })

    /**
     * @tc.name   testContentVolume030044
     * @tc.number SUB_CNB_CONTENT_0206
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 2 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030044 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本", "brief",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030044 end');
    })

    /**
     * @tc.name   testContentVolume030045
     * @tc.number SUB_CNB_CONTENT_0207
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 3 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030045 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本",
        "Notification brief text", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030045 end');
    })

    /**
     * @tc.name   testContentVolume030046
     * @tc.number SUB_CNB_CONTENT_0208
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 3 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030046 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本",
        "Notification brief text", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030046 end');
    })

    /**
     * @tc.name   testContentVolume030047
     * @tc.number SUB_CNB_CONTENT_0209
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 4 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030047 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030047 end');
    })

    /**
     * @tc.name   testContentVolume030048
     * @tc.number SUB_CNB_CONTENT_0210
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 4 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030048 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030048 end');
    })

    /**
     * @tc.name   testContentVolume030049
     * @tc.number SUB_CNB_CONTENT_0211
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 5 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030049 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本", "概要", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030049 end');
    })

    /**
     * @tc.name   testContentVolume030050
     * @tc.number SUB_CNB_CONTENT_0212
     * @tc.desc   长文本字段：longText 第 5 组、briefText 第 5 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030050 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "多行长文本", "概要",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("多行长文本"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("多行长文本");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030050 end');
    })

    /**
     * @tc.name   testContentVolume030051
     * @tc.number SUB_CNB_CONTENT_0213
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 1 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030051 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'", "", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030051 end');
    })

    /**
     * @tc.name   testContentVolume030052
     * @tc.number SUB_CNB_CONTENT_0214
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 1 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030052 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'", "",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030052 end');
    })

    /**
     * @tc.name   testContentVolume030053
     * @tc.number SUB_CNB_CONTENT_0215
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 2 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030053 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'", "brief",
        "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030053 end');
    })

    /**
     * @tc.name   testContentVolume030054
     * @tc.number SUB_CNB_CONTENT_0216
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 2 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030054 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'", "brief",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("brief"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("brief");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030054 end');
    })

    /**
     * @tc.name   testContentVolume030055
     * @tc.number SUB_CNB_CONTENT_0217
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 3 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030055 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'",
        "Notification brief text", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030055 end');
    })

    /**
     * @tc.name   testContentVolume030056
     * @tc.number SUB_CNB_CONTENT_0218
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 3 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030056 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'",
        "Notification brief text", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("Notification brief text"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "Notification brief text");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030056 end');
    })

    /**
     * @tc.name   testContentVolume030057
     * @tc.number SUB_CNB_CONTENT_0219
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 4 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030057 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030057 end');
    })

    /**
     * @tc.name   testContentVolume030058
     * @tc.number SUB_CNB_CONTENT_0220
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 4 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030058 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'",
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText),
        String("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual(
        "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030058 end');
    })

    /**
     * @tc.name   testContentVolume030059
     * @tc.number SUB_CNB_CONTENT_0221
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 5 组、expandedTitle 第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030059 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'", "概要", "");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle), String(""));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030059 end');
    })

    /**
     * @tc.name   testContentVolume030060
     * @tc.number SUB_CNB_CONTENT_0222
     * @tc.desc   长文本字段：longText 第 6 组、briefText 第 5 组、expandedTitle 第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume030060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030060 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body" }, "with 'quote'", "概要",
        "Expanded title");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("with 'quote'"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("with 'quote'");
      logActual(String((result.longText as notification.NotificationLongTextContent).briefText), String("概要"));
      expect((result.longText as notification.NotificationLongTextContent).briefText).assertEqual("概要");
      logActual(String((result.longText as notification.NotificationLongTextContent).expandedTitle),
        String("Expanded title"));
      expect((result.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual("Expanded title");
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030060 end');
    })

    /**
     * @tc.name   testContentVolume030061
     * @tc.number SUB_CNB_CONTENT_0223
     * @tc.desc   1024 字符长文本与空概要/空展开标题的边界组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContentVolume030061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030061 begin');
      let longText: string = '';
      for (let i = 0; i < 1024; i++) {
        longText += 'L';
      }
      const content: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: 'T', text: 'Body' }, longText, '', '');
      const body: notification.NotificationLongTextContent =
        content.longText as notification.NotificationLongTextContent;
      expect(content.notificationContentType).assertEqual(1);
      expect(body.longText.length).assertEqual(1024);
      expect(body.briefText).assertEqual('');
      expect(body.expandedTitle).assertEqual('');
      expect(body.additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume030061 end');
    })

  })
}
