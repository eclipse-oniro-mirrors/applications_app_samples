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

export default function contentVolume04Test() {
  describe('ContentVolume04Test', () => {

    /**
     * @tc.name   testContentVolume040001
     * @tc.number SUB_CNB_CONTENT_0224
     * @tc.desc   附加文本归一：additionalText 第 1 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040001 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: undefined },
        "L", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040001 end');
    })

    /**
     * @tc.name   testContentVolume040002
     * @tc.number SUB_CNB_CONTENT_0225
     * @tc.desc   附加文本归一：additionalText 第 1 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040002 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: undefined },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL", "brief",
          "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040002 end');
    })

    /**
     * @tc.name   testContentVolume040003
     * @tc.number SUB_CNB_CONTENT_0226
     * @tc.desc   附加文本归一：additionalText 第 1 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040003 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: undefined },
        "正文", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040003 end');
    })

    /**
     * @tc.name   testContentVolume040004
     * @tc.number SUB_CNB_CONTENT_0227
     * @tc.desc   附加文本归一：additionalText 第 1 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040004 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: undefined },
        "", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040004 end');
    })

    /**
     * @tc.name   testContentVolume040005
     * @tc.number SUB_CNB_CONTENT_0228
     * @tc.desc   附加文本归一：additionalText 第 1 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040005 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: undefined },
        "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040005 end');
    })

    /**
     * @tc.name   testContentVolume040006
     * @tc.number SUB_CNB_CONTENT_0229
     * @tc.desc   附加文本归一：additionalText 第 1 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040006 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: undefined },
        "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(''));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040006 end');
    })

    /**
     * @tc.name   testContentVolume040007
     * @tc.number SUB_CNB_CONTENT_0230
     * @tc.desc   附加文本归一：additionalText 第 2 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040007 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "A" }, "L",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("A"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("A");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040007 end');
    })

    /**
     * @tc.name   testContentVolume040008
     * @tc.number SUB_CNB_CONTENT_0231
     * @tc.desc   附加文本归一：additionalText 第 2 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040008 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "A" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL", "brief",
          "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("A"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("A");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040008 end');
    })

    /**
     * @tc.name   testContentVolume040009
     * @tc.number SUB_CNB_CONTENT_0232
     * @tc.desc   附加文本归一：additionalText 第 2 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040009 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "A" }, "正文",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("A"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("A");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040009 end');
    })

    /**
     * @tc.name   testContentVolume040010
     * @tc.number SUB_CNB_CONTENT_0233
     * @tc.desc   附加文本归一：additionalText 第 2 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040010 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("A"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("A");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040010 end');
    })

    /**
     * @tc.name   testContentVolume040011
     * @tc.number SUB_CNB_CONTENT_0234
     * @tc.desc   附加文本归一：additionalText 第 2 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040011 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "A" },
        "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("A"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("A");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040011 end');
    })

    /**
     * @tc.name   testContentVolume040012
     * @tc.number SUB_CNB_CONTENT_0235
     * @tc.desc   附加文本归一：additionalText 第 2 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040012 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "A" },
        "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("A"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("A");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040012 end');
    })

    /**
     * @tc.name   testContentVolume040013
     * @tc.number SUB_CNB_CONTENT_0236
     * @tc.desc   附加文本归一：additionalText 第 3 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040013 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "additional text" }, "L", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("additional text"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "additional text");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040013 end');
    })

    /**
     * @tc.name   testContentVolume040014
     * @tc.number SUB_CNB_CONTENT_0237
     * @tc.desc   附加文本归一：additionalText 第 3 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040014 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "additional text" }, "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLLLLLLL", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("additional text"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "additional text");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040014 end');
    })

    /**
     * @tc.name   testContentVolume040015
     * @tc.number SUB_CNB_CONTENT_0238
     * @tc.desc   附加文本归一：additionalText 第 3 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040015 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "additional text" }, "正文", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("additional text"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "additional text");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040015 end');
    })

    /**
     * @tc.name   testContentVolume040016
     * @tc.number SUB_CNB_CONTENT_0239
     * @tc.desc   附加文本归一：additionalText 第 3 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040016 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "additional text" }, "", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("additional text"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "additional text");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040016 end');
    })

    /**
     * @tc.name   testContentVolume040017
     * @tc.number SUB_CNB_CONTENT_0240
     * @tc.desc   附加文本归一：additionalText 第 3 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040017 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "additional text" }, "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("additional text"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "additional text");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040017 end');
    })

    /**
     * @tc.name   testContentVolume040018
     * @tc.number SUB_CNB_CONTENT_0241
     * @tc.desc   附加文本归一：additionalText 第 3 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040018 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "additional text" }, "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("additional text"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "additional text");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040018 end');
    })

    /**
     * @tc.name   testContentVolume040019
     * @tc.number SUB_CNB_CONTENT_0242
     * @tc.desc   附加文本归一：additionalText 第 4 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040019 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" }, "L", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040019 end');
    })

    /**
     * @tc.name   testContentVolume040020
     * @tc.number SUB_CNB_CONTENT_0243
     * @tc.desc   附加文本归一：additionalText 第 4 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040020 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" }, "LLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLL", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040020 end');
    })

    /**
     * @tc.name   testContentVolume040021
     * @tc.number SUB_CNB_CONTENT_0244
     * @tc.desc   附加文本归一：additionalText 第 4 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040021 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" +
          "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" }, "正文", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040021 end');
    })

    /**
     * @tc.name   testContentVolume040022
     * @tc.number SUB_CNB_CONTENT_0245
     * @tc.desc   附加文本归一：additionalText 第 4 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040022 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" }, "", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040022 end');
    })

    /**
     * @tc.name   testContentVolume040023
     * @tc.number SUB_CNB_CONTENT_0246
     * @tc.desc   附加文本归一：additionalText 第 4 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040023 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" +
          "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" }, "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040023 end');
    })

    /**
     * @tc.name   testContentVolume040024
     * @tc.number SUB_CNB_CONTENT_0247
     * @tc.desc   附加文本归一：additionalText 第 4 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040024 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" +
          "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" }, "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040024 end');
    })

    /**
     * @tc.name   testContentVolume040025
     * @tc.number SUB_CNB_CONTENT_0248
     * @tc.desc   附加文本归一：additionalText 第 5 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040025 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "附加" }, "L",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("附加"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("附加");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040025 end');
    })

    /**
     * @tc.name   testContentVolume040026
     * @tc.number SUB_CNB_CONTENT_0249
     * @tc.desc   附加文本归一：additionalText 第 5 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040026 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "附加" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL", "brief",
          "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("附加"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("附加");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040026 end');
    })

    /**
     * @tc.name   testContentVolume040027
     * @tc.number SUB_CNB_CONTENT_0250
     * @tc.desc   附加文本归一：additionalText 第 5 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040027 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "附加" },
        "正文", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("附加"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("附加");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040027 end');
    })

    /**
     * @tc.name   testContentVolume040028
     * @tc.number SUB_CNB_CONTENT_0251
     * @tc.desc   附加文本归一：additionalText 第 5 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040028 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "附加" }, "",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("附加"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("附加");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040028 end');
    })

    /**
     * @tc.name   testContentVolume040029
     * @tc.number SUB_CNB_CONTENT_0252
     * @tc.desc   附加文本归一：additionalText 第 5 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040029 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "附加" },
        "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("附加"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("附加");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040029 end');
    })

    /**
     * @tc.name   testContentVolume040030
     * @tc.number SUB_CNB_CONTENT_0253
     * @tc.desc   附加文本归一：additionalText 第 5 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040030 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "附加" },
        "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("附加"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("附加");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040030 end');
    })

    /**
     * @tc.name   testContentVolume040031
     * @tc.number SUB_CNB_CONTENT_0254
     * @tc.desc   附加文本归一：additionalText 第 6 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040031 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: " " }, "L",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(" "));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(" ");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040031 end');
    })

    /**
     * @tc.name   testContentVolume040032
     * @tc.number SUB_CNB_CONTENT_0255
     * @tc.desc   附加文本归一：additionalText 第 6 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040032 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: " " },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL", "brief",
          "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(" "));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(" ");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040032 end');
    })

    /**
     * @tc.name   testContentVolume040033
     * @tc.number SUB_CNB_CONTENT_0256
     * @tc.desc   附加文本归一：additionalText 第 6 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040033 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: " " }, "正文",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(" "));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(" ");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040033 end');
    })

    /**
     * @tc.name   testContentVolume040034
     * @tc.number SUB_CNB_CONTENT_0257
     * @tc.desc   附加文本归一：additionalText 第 6 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040034 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: " " }, "",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(" "));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(" ");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040034 end');
    })

    /**
     * @tc.name   testContentVolume040035
     * @tc.number SUB_CNB_CONTENT_0258
     * @tc.desc   附加文本归一：additionalText 第 6 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040035 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: " " },
        "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(" "));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(" ");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040035 end');
    })

    /**
     * @tc.name   testContentVolume040036
     * @tc.number SUB_CNB_CONTENT_0259
     * @tc.desc   附加文本归一：additionalText 第 6 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040036 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: " " },
        "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String(" "));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual(" ");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040036 end');
    })

    /**
     * @tc.name   testContentVolume040037
     * @tc.number SUB_CNB_CONTENT_0260
     * @tc.desc   附加文本归一：additionalText 第 7 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040037 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "\t" }, "L",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("\t"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("\t");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040037 end');
    })

    /**
     * @tc.name   testContentVolume040038
     * @tc.number SUB_CNB_CONTENT_0261
     * @tc.desc   附加文本归一：additionalText 第 7 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040038 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "\t" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL", "brief",
          "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("\t"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("\t");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040038 end');
    })

    /**
     * @tc.name   testContentVolume040039
     * @tc.number SUB_CNB_CONTENT_0262
     * @tc.desc   附加文本归一：additionalText 第 7 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040039 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "\t" },
        "正文", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("\t"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("\t");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040039 end');
    })

    /**
     * @tc.name   testContentVolume040040
     * @tc.number SUB_CNB_CONTENT_0263
     * @tc.desc   附加文本归一：additionalText 第 7 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040040 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "\t" }, "",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("\t"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("\t");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040040 end');
    })

    /**
     * @tc.name   testContentVolume040041
     * @tc.number SUB_CNB_CONTENT_0264
     * @tc.desc   附加文本归一：additionalText 第 7 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040041 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "\t" },
        "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("\t"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("\t");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040041 end');
    })

    /**
     * @tc.name   testContentVolume040042
     * @tc.number SUB_CNB_CONTENT_0265
     * @tc.desc   附加文本归一：additionalText 第 7 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040042 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "\t" },
        "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("\t"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("\t");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040042 end');
    })

    /**
     * @tc.name   testContentVolume040043
     * @tc.number SUB_CNB_CONTENT_0266
     * @tc.desc   附加文本归一：additionalText 第 8 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040043 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "0" }, "L",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("0"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("0");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040043 end');
    })

    /**
     * @tc.name   testContentVolume040044
     * @tc.number SUB_CNB_CONTENT_0267
     * @tc.desc   附加文本归一：additionalText 第 8 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040044 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "0" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL", "brief",
          "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("0"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("0");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040044 end');
    })

    /**
     * @tc.name   testContentVolume040045
     * @tc.number SUB_CNB_CONTENT_0268
     * @tc.desc   附加文本归一：additionalText 第 8 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040045 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "0" }, "正文",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("0"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("0");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040045 end');
    })

    /**
     * @tc.name   testContentVolume040046
     * @tc.number SUB_CNB_CONTENT_0269
     * @tc.desc   附加文本归一：additionalText 第 8 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040046 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "0" }, "",
        "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("0"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("0");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040046 end');
    })

    /**
     * @tc.name   testContentVolume040047
     * @tc.number SUB_CNB_CONTENT_0270
     * @tc.desc   附加文本归一：additionalText 第 8 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040047 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "0" },
        "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("0"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("0");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040047 end');
    })

    /**
     * @tc.name   testContentVolume040048
     * @tc.number SUB_CNB_CONTENT_0271
     * @tc.desc   附加文本归一：additionalText 第 8 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040048 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "0" },
        "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("0"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("0");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040048 end');
    })

    /**
     * @tc.name   testContentVolume040049
     * @tc.number SUB_CNB_CONTENT_0272
     * @tc.desc   附加文本归一：additionalText 第 9 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040049 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "null" },
        "L", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("null"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("null");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040049 end');
    })

    /**
     * @tc.name   testContentVolume040050
     * @tc.number SUB_CNB_CONTENT_0273
     * @tc.desc   附加文本归一：additionalText 第 9 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040050 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "null" },
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL", "brief",
          "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("null"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("null");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040050 end');
    })

    /**
     * @tc.name   testContentVolume040051
     * @tc.number SUB_CNB_CONTENT_0274
     * @tc.desc   附加文本归一：additionalText 第 9 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040051 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "null" },
        "正文", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("null"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("null");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040051 end');
    })

    /**
     * @tc.name   testContentVolume040052
     * @tc.number SUB_CNB_CONTENT_0275
     * @tc.desc   附加文本归一：additionalText 第 9 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040052 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "null" },
        "", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("null"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("null");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040052 end');
    })

    /**
     * @tc.name   testContentVolume040053
     * @tc.number SUB_CNB_CONTENT_0276
     * @tc.desc   附加文本归一：additionalText 第 9 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040053 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "null" },
        "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("null"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("null");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040053 end');
    })

    /**
     * @tc.name   testContentVolume040054
     * @tc.number SUB_CNB_CONTENT_0277
     * @tc.desc   附加文本归一：additionalText 第 9 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040054 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body", additionalText: "null" },
        "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText), String("null"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("null");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040054 end');
    })

    /**
     * @tc.name   testContentVolume040055
     * @tc.number SUB_CNB_CONTENT_0278
     * @tc.desc   附加文本归一：additionalText 第 10 组取值与 longText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040055 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "undefined" }, "L", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("undefined"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("undefined");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("L"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("L");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040055 end');
    })

    /**
     * @tc.name   testContentVolume040056
     * @tc.number SUB_CNB_CONTENT_0279
     * @tc.desc   附加文本归一：additionalText 第 10 组取值与 longText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040056 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "undefined" }, "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLLLLLLLLLLLLLLLLLL", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("undefined"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("undefined");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText),
        String("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual(
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040056 end');
    })

    /**
     * @tc.name   testContentVolume040057
     * @tc.number SUB_CNB_CONTENT_0280
     * @tc.desc   附加文本归一：additionalText 第 10 组取值与 longText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040057 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "undefined" }, "正文", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("undefined"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("undefined");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("正文"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("正文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040057 end');
    })

    /**
     * @tc.name   testContentVolume040058
     * @tc.number SUB_CNB_CONTENT_0281
     * @tc.desc   附加文本归一：additionalText 第 10 组取值与 longText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040058 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "undefined" }, "", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("undefined"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("undefined");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String(""));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040058 end');
    })

    /**
     * @tc.name   testContentVolume040059
     * @tc.number SUB_CNB_CONTENT_0282
     * @tc.desc   附加文本归一：additionalText 第 10 组取值与 longText 第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040059 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "undefined" }, "q'q", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("undefined"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("undefined");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("q'q"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("q'q");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040059 end');
    })

    /**
     * @tc.name   testContentVolume040060
     * @tc.number SUB_CNB_CONTENT_0283
     * @tc.desc   附加文本归一：additionalText 第 10 组取值与 longText 第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume040060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040060 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: "T", text: "Body",
        additionalText: "undefined" }, "x\ny", "brief", "Expanded");
      logActual(String(result.notificationContentType), String(1));
      expect(result.notificationContentType).assertEqual(1);
      logActual(String((result.longText as notification.NotificationLongTextContent).additionalText),
        String("undefined"));
      expect((result.longText as notification.NotificationLongTextContent).additionalText).assertEqual("undefined");
      logActual(String((result.longText as notification.NotificationLongTextContent).title), String("T"));
      expect((result.longText as notification.NotificationLongTextContent).title).assertEqual("T");
      logActual(String((result.longText as notification.NotificationLongTextContent).longText), String("x\ny"));
      expect((result.longText as notification.NotificationLongTextContent).longText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040060 end');
    })

    /**
     * @tc.name   testContentVolume040061
     * @tc.number SUB_CNB_CONTENT_0284
     * @tc.desc   缺失 additionalText 归一为空串，显式提供时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContentVolume040061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040061 begin');
      const missing: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: 'T', text: 'Body' }, 'L', 'brief', 'E');
      const provided: notification.NotificationContent =
        notificationContentUtil.initNotificationLongTextContent({ title: 'T', text: 'Body', additionalText: 'A' }, 'L',
        'brief', 'E');
      expect((missing.longText as notification.NotificationLongTextContent).additionalText).assertEqual('');
      expect((provided.longText as notification.NotificationLongTextContent).additionalText).assertEqual('A');
      expect((missing.longText as notification.NotificationLongTextContent).briefText).assertEqual('brief');
      expect((provided.longText as notification.NotificationLongTextContent).expandedTitle).assertEqual('E');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume040061 end');
    })

  })
}
