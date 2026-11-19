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

export default function contentVolume08Test() {
  describe('ContentVolume08Test', () => {

    /**
     * @tc.name   testContentVolume080001
     * @tc.number SUB_CNB_CONTENT_0468
     * @tc.desc   附加文本透传：additionalText 第 1 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080001 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body", additionalText: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080001 end');
    })

    /**
     * @tc.name   testContentVolume080002
     * @tc.number SUB_CNB_CONTENT_0469
     * @tc.desc   附加文本透传：additionalText 第 1 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080002 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body", additionalText: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080002 end');
    })

    /**
     * @tc.name   testContentVolume080003
     * @tc.number SUB_CNB_CONTENT_0470
     * @tc.desc   附加文本透传：additionalText 第 1 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080003 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body", additionalText: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080003 end');
    })

    /**
     * @tc.name   testContentVolume080004
     * @tc.number SUB_CNB_CONTENT_0471
     * @tc.desc   附加文本透传：additionalText 第 1 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080004 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080004 end');
    })

    /**
     * @tc.name   testContentVolume080005
     * @tc.number SUB_CNB_CONTENT_0472
     * @tc.desc   附加文本透传：additionalText 第 1 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080005 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body", additionalText: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080005 end');
    })

    /**
     * @tc.name   testContentVolume080006
     * @tc.number SUB_CNB_CONTENT_0473
     * @tc.desc   附加文本透传：additionalText 第 1 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080006 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: "" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080006 end');
    })

    /**
     * @tc.name   testContentVolume080007
     * @tc.number SUB_CNB_CONTENT_0474
     * @tc.desc   附加文本透传：additionalText 第 2 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080007 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body", additionalText: "A" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("A"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080007 end');
    })

    /**
     * @tc.name   testContentVolume080008
     * @tc.number SUB_CNB_CONTENT_0475
     * @tc.desc   附加文本透传：additionalText 第 2 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080008 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body", additionalText: "A" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("A"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080008 end');
    })

    /**
     * @tc.name   testContentVolume080009
     * @tc.number SUB_CNB_CONTENT_0476
     * @tc.desc   附加文本透传：additionalText 第 2 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080009 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body", additionalText: "A" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("A"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080009 end');
    })

    /**
     * @tc.name   testContentVolume080010
     * @tc.number SUB_CNB_CONTENT_0477
     * @tc.desc   附加文本透传：additionalText 第 2 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080010 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "A" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("A"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080010 end');
    })

    /**
     * @tc.name   testContentVolume080011
     * @tc.number SUB_CNB_CONTENT_0478
     * @tc.desc   附加文本透传：additionalText 第 2 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080011 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body", additionalText: "A" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("A"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080011 end');
    })

    /**
     * @tc.name   testContentVolume080012
     * @tc.number SUB_CNB_CONTENT_0479
     * @tc.desc   附加文本透传：additionalText 第 2 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080012 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: "A" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("A"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080012 end');
    })

    /**
     * @tc.name   testContentVolume080013
     * @tc.number SUB_CNB_CONTENT_0480
     * @tc.desc   附加文本透传：additionalText 第 3 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080013 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body",
        additionalText: "additional text" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("additional text"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional text");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080013 end');
    })

    /**
     * @tc.name   testContentVolume080014
     * @tc.number SUB_CNB_CONTENT_0481
     * @tc.desc   附加文本透传：additionalText 第 3 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080014 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body",
        additionalText: "additional text" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("additional text"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional text");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080014 end');
    })

    /**
     * @tc.name   testContentVolume080015
     * @tc.number SUB_CNB_CONTENT_0482
     * @tc.desc   附加文本透传：additionalText 第 3 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080015 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body",
        additionalText: "additional text" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("additional text"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional text");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080015 end');
    })

    /**
     * @tc.name   testContentVolume080016
     * @tc.number SUB_CNB_CONTENT_0483
     * @tc.desc   附加文本透传：additionalText 第 3 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080016 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "additional text" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("additional text"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional text");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080016 end');
    })

    /**
     * @tc.name   testContentVolume080017
     * @tc.number SUB_CNB_CONTENT_0484
     * @tc.desc   附加文本透传：additionalText 第 3 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080017 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body",
        additionalText: "additional text" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("additional text"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional text");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080017 end');
    })

    /**
     * @tc.name   testContentVolume080018
     * @tc.number SUB_CNB_CONTENT_0485
     * @tc.desc   附加文本透传：additionalText 第 3 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080018 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: "additional text" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("additional text"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional text");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080018 end');
    })

    /**
     * @tc.name   testContentVolume080019
     * @tc.number SUB_CNB_CONTENT_0486
     * @tc.desc   附加文本透传：additionalText 第 4 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080019 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080019 end');
    })

    /**
     * @tc.name   testContentVolume080020
     * @tc.number SUB_CNB_CONTENT_0487
     * @tc.desc   附加文本透传：additionalText 第 4 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080020 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080020 end');
    })

    /**
     * @tc.name   testContentVolume080021
     * @tc.number SUB_CNB_CONTENT_0488
     * @tc.desc   附加文本透传：additionalText 第 4 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080021 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080021 end');
    })

    /**
     * @tc.name   testContentVolume080022
     * @tc.number SUB_CNB_CONTENT_0489
     * @tc.desc   附加文本透传：additionalText 第 4 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080022 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080022 end');
    })

    /**
     * @tc.name   testContentVolume080023
     * @tc.number SUB_CNB_CONTENT_0490
     * @tc.desc   附加文本透传：additionalText 第 4 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080023 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body",
        additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080023 end');
    })

    /**
     * @tc.name   testContentVolume080024
     * @tc.number SUB_CNB_CONTENT_0491
     * @tc.desc   附加文本透传：additionalText 第 4 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080024 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body",
              additionalText: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText),
        String("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080024 end');
    })

    /**
     * @tc.name   testContentVolume080025
     * @tc.number SUB_CNB_CONTENT_0492
     * @tc.desc   附加文本透传：additionalText 第 5 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080025 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body", additionalText: "附加文本" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("附加文本"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("附加文本");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080025 end');
    })

    /**
     * @tc.name   testContentVolume080026
     * @tc.number SUB_CNB_CONTENT_0493
     * @tc.desc   附加文本透传：additionalText 第 5 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080026 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body", additionalText: "附加文本" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("附加文本"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("附加文本");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080026 end');
    })

    /**
     * @tc.name   testContentVolume080027
     * @tc.number SUB_CNB_CONTENT_0494
     * @tc.desc   附加文本透传：additionalText 第 5 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080027 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body", additionalText: "附加文本" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("附加文本"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("附加文本");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080027 end');
    })

    /**
     * @tc.name   testContentVolume080028
     * @tc.number SUB_CNB_CONTENT_0495
     * @tc.desc   附加文本透传：additionalText 第 5 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080028 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "附加文本" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("附加文本"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("附加文本");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080028 end');
    })

    /**
     * @tc.name   testContentVolume080029
     * @tc.number SUB_CNB_CONTENT_0496
     * @tc.desc   附加文本透传：additionalText 第 5 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080029 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body", additionalText: "附加文本" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("附加文本"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("附加文本");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080029 end');
    })

    /**
     * @tc.name   testContentVolume080030
     * @tc.number SUB_CNB_CONTENT_0497
     * @tc.desc   附加文本透传：additionalText 第 5 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080030 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: "附加文本" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("附加文本"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("附加文本");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080030 end');
    })

    /**
     * @tc.name   testContentVolume080031
     * @tc.number SUB_CNB_CONTENT_0498
     * @tc.desc   附加文本透传：additionalText 第 6 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080031 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body", additionalText: " " });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(" "));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080031 end');
    })

    /**
     * @tc.name   testContentVolume080032
     * @tc.number SUB_CNB_CONTENT_0499
     * @tc.desc   附加文本透传：additionalText 第 6 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080032 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body", additionalText: " " });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(" "));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080032 end');
    })

    /**
     * @tc.name   testContentVolume080033
     * @tc.number SUB_CNB_CONTENT_0500
     * @tc.desc   附加文本透传：additionalText 第 6 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080033 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body", additionalText: " " });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(" "));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080033 end');
    })

    /**
     * @tc.name   testContentVolume080034
     * @tc.number SUB_CNB_CONTENT_0501
     * @tc.desc   附加文本透传：additionalText 第 6 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080034 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: " " });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(" "));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080034 end');
    })

    /**
     * @tc.name   testContentVolume080035
     * @tc.number SUB_CNB_CONTENT_0502
     * @tc.desc   附加文本透传：additionalText 第 6 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080035 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body", additionalText: " " });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(" "));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080035 end');
    })

    /**
     * @tc.name   testContentVolume080036
     * @tc.number SUB_CNB_CONTENT_0503
     * @tc.desc   附加文本透传：additionalText 第 6 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080036 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: " " });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(" "));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080036 end');
    })

    /**
     * @tc.name   testContentVolume080037
     * @tc.number SUB_CNB_CONTENT_0504
     * @tc.desc   附加文本透传：additionalText 第 7 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080037 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body", additionalText: "\t" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("\t"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080037 end');
    })

    /**
     * @tc.name   testContentVolume080038
     * @tc.number SUB_CNB_CONTENT_0505
     * @tc.desc   附加文本透传：additionalText 第 7 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080038 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body", additionalText: "\t" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("\t"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080038 end');
    })

    /**
     * @tc.name   testContentVolume080039
     * @tc.number SUB_CNB_CONTENT_0506
     * @tc.desc   附加文本透传：additionalText 第 7 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080039 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body", additionalText: "\t" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("\t"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080039 end');
    })

    /**
     * @tc.name   testContentVolume080040
     * @tc.number SUB_CNB_CONTENT_0507
     * @tc.desc   附加文本透传：additionalText 第 7 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080040 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "\t" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("\t"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080040 end');
    })

    /**
     * @tc.name   testContentVolume080041
     * @tc.number SUB_CNB_CONTENT_0508
     * @tc.desc   附加文本透传：additionalText 第 7 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080041 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body", additionalText: "\t" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("\t"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080041 end');
    })

    /**
     * @tc.name   testContentVolume080042
     * @tc.number SUB_CNB_CONTENT_0509
     * @tc.desc   附加文本透传：additionalText 第 7 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080042 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: "\t" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("\t"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080042 end');
    })

    /**
     * @tc.name   testContentVolume080043
     * @tc.number SUB_CNB_CONTENT_0510
     * @tc.desc   附加文本透传：additionalText 第 8 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080043 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body", additionalText: "0" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("0"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080043 end');
    })

    /**
     * @tc.name   testContentVolume080044
     * @tc.number SUB_CNB_CONTENT_0511
     * @tc.desc   附加文本透传：additionalText 第 8 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080044 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body", additionalText: "0" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("0"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080044 end');
    })

    /**
     * @tc.name   testContentVolume080045
     * @tc.number SUB_CNB_CONTENT_0512
     * @tc.desc   附加文本透传：additionalText 第 8 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080045 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body", additionalText: "0" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("0"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080045 end');
    })

    /**
     * @tc.name   testContentVolume080046
     * @tc.number SUB_CNB_CONTENT_0513
     * @tc.desc   附加文本透传：additionalText 第 8 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080046 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "0" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("0"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080046 end');
    })

    /**
     * @tc.name   testContentVolume080047
     * @tc.number SUB_CNB_CONTENT_0514
     * @tc.desc   附加文本透传：additionalText 第 8 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080047 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body", additionalText: "0" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("0"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080047 end');
    })

    /**
     * @tc.name   testContentVolume080048
     * @tc.number SUB_CNB_CONTENT_0515
     * @tc.desc   附加文本透传：additionalText 第 8 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080048 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: "0" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("0"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080048 end');
    })

    /**
     * @tc.name   testContentVolume080049
     * @tc.number SUB_CNB_CONTENT_0516
     * @tc.desc   附加文本透传：additionalText 第 9 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080049 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body", additionalText: "null" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("null"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("null");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080049 end');
    })

    /**
     * @tc.name   testContentVolume080050
     * @tc.number SUB_CNB_CONTENT_0517
     * @tc.desc   附加文本透传：additionalText 第 9 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080050 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body", additionalText: "null" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("null"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("null");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080050 end');
    })

    /**
     * @tc.name   testContentVolume080051
     * @tc.number SUB_CNB_CONTENT_0518
     * @tc.desc   附加文本透传：additionalText 第 9 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080051 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body", additionalText: "null" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("null"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("null");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080051 end');
    })

    /**
     * @tc.name   testContentVolume080052
     * @tc.number SUB_CNB_CONTENT_0519
     * @tc.desc   附加文本透传：additionalText 第 9 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080052 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "null" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("null"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("null");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080052 end');
    })

    /**
     * @tc.name   testContentVolume080053
     * @tc.number SUB_CNB_CONTENT_0520
     * @tc.desc   附加文本透传：additionalText 第 9 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080053 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body", additionalText: "null" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("null"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("null");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080053 end');
    })

    /**
     * @tc.name   testContentVolume080054
     * @tc.number SUB_CNB_CONTENT_0521
     * @tc.desc   附加文本透传：additionalText 第 9 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080054 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: "null" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("null"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("null");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080054 end');
    })

    /**
     * @tc.name   testContentVolume080055
     * @tc.number SUB_CNB_CONTENT_0522
     * @tc.desc   附加文本透传：additionalText 第 10 组与标题第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080055 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "T", text: "Body", additionalText: "x\ny" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("T"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("T");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("x\ny"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080055 end');
    })

    /**
     * @tc.name   testContentVolume080056
     * @tc.number SUB_CNB_CONTENT_0523
     * @tc.desc   附加文本透传：additionalText 第 10 组与标题第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080056 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "标题", text: "Body", additionalText: "x\ny" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("标题");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("x\ny"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080056 end');
    })

    /**
     * @tc.name   testContentVolume080057
     * @tc.number SUB_CNB_CONTENT_0524
     * @tc.desc   附加文本透传：additionalText 第 10 组与标题第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080057 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "", text: "Body", additionalText: "x\ny" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("x\ny"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080057 end');
    })

    /**
     * @tc.name   testContentVolume080058
     * @tc.number SUB_CNB_CONTENT_0525
     * @tc.desc   附加文本透传：additionalText 第 10 组与标题第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080058 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: " long title ", text: "Body",
        additionalText: "x\ny" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(" long title "));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(" long title ");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("x\ny"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080058 end');
    })

    /**
     * @tc.name   testContentVolume080059
     * @tc.number SUB_CNB_CONTENT_0526
     * @tc.desc   附加文本透传：additionalText 第 10 组与标题第 5 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080059 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: "q'q", text: "Body", additionalText: "x\ny" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("x\ny"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080059 end');
    })

    /**
     * @tc.name   testContentVolume080060
     * @tc.number SUB_CNB_CONTENT_0527
     * @tc.desc   附加文本透传：additionalText 第 10 组与标题第 6 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume080060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080060 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
            "TTTTTTTTTTTTTTTTTTTTTTTT", text: "Body", additionalText: "x\ny" });
      logActual(String(result.notificationContentType), String(0));
      expect(result.notificationContentType).assertEqual(0);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
          "TTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" +
        "TTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("x\ny"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("x\ny");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080060 end');
    })

    /**
     * @tc.name   testContentVolume080061
     * @tc.number SUB_CNB_CONTENT_0528
     * @tc.desc   空串 additionalText 保留，缺失 additionalText 保持未定义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContentVolume080061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080061 begin');
      const withEmpty: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: 'T', text: 'B', additionalText: '' });
      const without: notification.NotificationContent =
        notificationContentUtil.initBasicNotificationContent({ title: 'T', text: 'B' });
      expect((withEmpty.normal as notification.NotificationBasicContent).additionalText).assertEqual('');
      expect((without.normal as notification.NotificationBasicContent).additionalText !== undefined).assertFalse();
      expect(withEmpty.notificationContentType).assertEqual(0);
      expect(withEmpty.normal === without.normal).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume080061 end');
    })

  })
}
