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

export default function contentVolume06Test() {
  describe('ContentVolume06Test', () => {

    /**
     * @tc.name   testContentVolume060001
     * @tc.number SUB_CNB_CONTENT_0346
     * @tc.desc   会话内容：标题第 1 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060001 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "", text: "", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060001 end');
    })

    /**
     * @tc.name   testContentVolume060002
     * @tc.number SUB_CNB_CONTENT_0347
     * @tc.desc   会话内容：标题第 1 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060002 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060002 end');
    })

    /**
     * @tc.name   testContentVolume060003
     * @tc.number SUB_CNB_CONTENT_0348
     * @tc.desc   会话内容：标题第 1 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060003 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "", text: "body", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060003 end');
    })

    /**
     * @tc.name   testContentVolume060004
     * @tc.number SUB_CNB_CONTENT_0349
     * @tc.desc   会话内容：标题第 1 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060004 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060004 end');
    })

    /**
     * @tc.name   testContentVolume060005
     * @tc.number SUB_CNB_CONTENT_0350
     * @tc.desc   会话内容：标题第 1 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060005 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "", text: "会话内容", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060005 end');
    })

    /**
     * @tc.name   testContentVolume060006
     * @tc.number SUB_CNB_CONTENT_0351
     * @tc.desc   会话内容：标题第 1 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060006 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String(""));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060006 end');
    })

    /**
     * @tc.name   testContentVolume060007
     * @tc.number SUB_CNB_CONTENT_0352
     * @tc.desc   会话内容：标题第 2 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060007 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "a", text: "", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060007 end');
    })

    /**
     * @tc.name   testContentVolume060008
     * @tc.number SUB_CNB_CONTENT_0353
     * @tc.desc   会话内容：标题第 2 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060008 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "a", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060008 end');
    })

    /**
     * @tc.name   testContentVolume060009
     * @tc.number SUB_CNB_CONTENT_0354
     * @tc.desc   会话内容：标题第 2 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060009 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "a", text: "body", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060009 end');
    })

    /**
     * @tc.name   testContentVolume060010
     * @tc.number SUB_CNB_CONTENT_0355
     * @tc.desc   会话内容：标题第 2 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060010 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "a", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060010 end');
    })

    /**
     * @tc.name   testContentVolume060011
     * @tc.number SUB_CNB_CONTENT_0356
     * @tc.desc   会话内容：标题第 2 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060011 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "a", text: "会话内容", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060011 end');
    })

    /**
     * @tc.name   testContentVolume060012
     * @tc.number SUB_CNB_CONTENT_0357
     * @tc.desc   会话内容：标题第 2 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060012 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "a", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("a"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("a");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060012 end');
    })

    /**
     * @tc.name   testContentVolume060013
     * @tc.number SUB_CNB_CONTENT_0358
     * @tc.desc   会话内容：标题第 3 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060013 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "Conversation", text: "",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Conversation"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Conversation");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060013 end');
    })

    /**
     * @tc.name   testContentVolume060014
     * @tc.number SUB_CNB_CONTENT_0359
     * @tc.desc   会话内容：标题第 3 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060014 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "Conversation", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Conversation"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Conversation");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060014 end');
    })

    /**
     * @tc.name   testContentVolume060015
     * @tc.number SUB_CNB_CONTENT_0360
     * @tc.desc   会话内容：标题第 3 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060015 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "Conversation", text: "body",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Conversation"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Conversation");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060015 end');
    })

    /**
     * @tc.name   testContentVolume060016
     * @tc.number SUB_CNB_CONTENT_0361
     * @tc.desc   会话内容：标题第 3 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060016 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "Conversation", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Conversation"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Conversation");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060016 end');
    })

    /**
     * @tc.name   testContentVolume060017
     * @tc.number SUB_CNB_CONTENT_0362
     * @tc.desc   会话内容：标题第 3 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060017 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "Conversation", text: "会话内容",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Conversation"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Conversation");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060017 end');
    })

    /**
     * @tc.name   testContentVolume060018
     * @tc.number SUB_CNB_CONTENT_0363
     * @tc.desc   会话内容：标题第 3 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060018 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "Conversation", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("Conversation"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("Conversation");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060018 end');
    })

    /**
     * @tc.name   testContentVolume060019
     * @tc.number SUB_CNB_CONTENT_0364
     * @tc.desc   会话内容：标题第 4 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060019 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "会话标题", text: "", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("会话标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("会话标题");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060019 end');
    })

    /**
     * @tc.name   testContentVolume060020
     * @tc.number SUB_CNB_CONTENT_0365
     * @tc.desc   会话内容：标题第 4 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060020 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "会话标题", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("会话标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("会话标题");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060020 end');
    })

    /**
     * @tc.name   testContentVolume060021
     * @tc.number SUB_CNB_CONTENT_0366
     * @tc.desc   会话内容：标题第 4 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060021 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "会话标题", text: "body",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("会话标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("会话标题");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060021 end');
    })

    /**
     * @tc.name   testContentVolume060022
     * @tc.number SUB_CNB_CONTENT_0367
     * @tc.desc   会话内容：标题第 4 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060022 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "会话标题", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("会话标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("会话标题");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060022 end');
    })

    /**
     * @tc.name   testContentVolume060023
     * @tc.number SUB_CNB_CONTENT_0368
     * @tc.desc   会话内容：标题第 4 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060023 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "会话标题", text: "会话内容",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("会话标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("会话标题");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060023 end');
    })

    /**
     * @tc.name   testContentVolume060024
     * @tc.number SUB_CNB_CONTENT_0369
     * @tc.desc   会话内容：标题第 4 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060024 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "会话标题", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("会话标题"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("会话标题");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060024 end');
    })

    /**
     * @tc.name   testContentVolume060025
     * @tc.number SUB_CNB_CONTENT_0370
     * @tc.desc   会话内容：标题第 5 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060025 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "  lead", text: "", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  lead"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  lead");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060025 end');
    })

    /**
     * @tc.name   testContentVolume060026
     * @tc.number SUB_CNB_CONTENT_0371
     * @tc.desc   会话内容：标题第 5 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060026 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "  lead", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  lead"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  lead");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060026 end');
    })

    /**
     * @tc.name   testContentVolume060027
     * @tc.number SUB_CNB_CONTENT_0372
     * @tc.desc   会话内容：标题第 5 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060027 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "  lead", text: "body",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  lead"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  lead");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060027 end');
    })

    /**
     * @tc.name   testContentVolume060028
     * @tc.number SUB_CNB_CONTENT_0373
     * @tc.desc   会话内容：标题第 5 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060028 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "  lead", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  lead"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  lead");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060028 end');
    })

    /**
     * @tc.name   testContentVolume060029
     * @tc.number SUB_CNB_CONTENT_0374
     * @tc.desc   会话内容：标题第 5 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060029 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "  lead", text: "会话内容",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  lead"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  lead");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060029 end');
    })

    /**
     * @tc.name   testContentVolume060030
     * @tc.number SUB_CNB_CONTENT_0375
     * @tc.desc   会话内容：标题第 5 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060030 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "  lead", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("  lead"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("  lead");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060030 end');
    })

    /**
     * @tc.name   testContentVolume060031
     * @tc.number SUB_CNB_CONTENT_0376
     * @tc.desc   会话内容：标题第 6 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060031 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "q'q", text: "", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060031 end');
    })

    /**
     * @tc.name   testContentVolume060032
     * @tc.number SUB_CNB_CONTENT_0377
     * @tc.desc   会话内容：标题第 6 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060032 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "q'q", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060032 end');
    })

    /**
     * @tc.name   testContentVolume060033
     * @tc.number SUB_CNB_CONTENT_0378
     * @tc.desc   会话内容：标题第 6 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060033 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "q'q", text: "body", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060033 end');
    })

    /**
     * @tc.name   testContentVolume060034
     * @tc.number SUB_CNB_CONTENT_0379
     * @tc.desc   会话内容：标题第 6 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060034 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "q'q", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060034 end');
    })

    /**
     * @tc.name   testContentVolume060035
     * @tc.number SUB_CNB_CONTENT_0380
     * @tc.desc   会话内容：标题第 6 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060035 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "q'q", text: "会话内容", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060035 end');
    })

    /**
     * @tc.name   testContentVolume060036
     * @tc.number SUB_CNB_CONTENT_0381
     * @tc.desc   会话内容：标题第 6 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060036 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "q'q", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("q'q"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("q'q");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060036 end');
    })

    /**
     * @tc.name   testContentVolume060037
     * @tc.number SUB_CNB_CONTENT_0382
     * @tc.desc   会话内容：标题第 7 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060037 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "back\\slash", text: "",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060037 end');
    })

    /**
     * @tc.name   testContentVolume060038
     * @tc.number SUB_CNB_CONTENT_0383
     * @tc.desc   会话内容：标题第 7 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060038 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "back\\slash", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060038 end');
    })

    /**
     * @tc.name   testContentVolume060039
     * @tc.number SUB_CNB_CONTENT_0384
     * @tc.desc   会话内容：标题第 7 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060039 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "back\\slash", text: "body",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060039 end');
    })

    /**
     * @tc.name   testContentVolume060040
     * @tc.number SUB_CNB_CONTENT_0385
     * @tc.desc   会话内容：标题第 7 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060040 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "back\\slash", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060040 end');
    })

    /**
     * @tc.name   testContentVolume060041
     * @tc.number SUB_CNB_CONTENT_0386
     * @tc.desc   会话内容：标题第 7 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060041 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "back\\slash", text: "会话内容",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060041 end');
    })

    /**
     * @tc.name   testContentVolume060042
     * @tc.number SUB_CNB_CONTENT_0387
     * @tc.desc   会话内容：标题第 7 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060042 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "back\\slash", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("back\\slash"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("back\\slash");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060042 end');
    })

    /**
     * @tc.name   testContentVolume060043
     * @tc.number SUB_CNB_CONTENT_0388
     * @tc.desc   会话内容：标题第 8 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060043 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "",
            additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060043 end');
    })

    /**
     * @tc.name   testContentVolume060044
     * @tc.number SUB_CNB_CONTENT_0389
     * @tc.desc   会话内容：标题第 8 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060044 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "",
            additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060044 end');
    })

    /**
     * @tc.name   testContentVolume060045
     * @tc.number SUB_CNB_CONTENT_0390
     * @tc.desc   会话内容：标题第 8 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060045 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "body",
            additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060045 end');
    })

    /**
     * @tc.name   testContentVolume060046
     * @tc.number SUB_CNB_CONTENT_0391
     * @tc.desc   会话内容：标题第 8 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060046 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "body",
            additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060046 end');
    })

    /**
     * @tc.name   testContentVolume060047
     * @tc.number SUB_CNB_CONTENT_0392
     * @tc.desc   会话内容：标题第 8 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060047 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "会话内容",
            additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060047 end');
    })

    /**
     * @tc.name   testContentVolume060048
     * @tc.number SUB_CNB_CONTENT_0393
     * @tc.desc   会话内容：标题第 8 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060048 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent(
          { title: "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT", text: "会话内容",
            additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title),
        String("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual(
        "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060048 end');
    })

    /**
     * @tc.name   testContentVolume060049
     * @tc.number SUB_CNB_CONTENT_0394
     * @tc.desc   会话内容：标题第 9 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060049 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "0", text: "", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("0"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("0");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060049 end');
    })

    /**
     * @tc.name   testContentVolume060050
     * @tc.number SUB_CNB_CONTENT_0395
     * @tc.desc   会话内容：标题第 9 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060050 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "0", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("0"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("0");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060050 end');
    })

    /**
     * @tc.name   testContentVolume060051
     * @tc.number SUB_CNB_CONTENT_0396
     * @tc.desc   会话内容：标题第 9 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060051 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "0", text: "body", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("0"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("0");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060051 end');
    })

    /**
     * @tc.name   testContentVolume060052
     * @tc.number SUB_CNB_CONTENT_0397
     * @tc.desc   会话内容：标题第 9 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060052 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "0", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("0"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("0");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060052 end');
    })

    /**
     * @tc.name   testContentVolume060053
     * @tc.number SUB_CNB_CONTENT_0398
     * @tc.desc   会话内容：标题第 9 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060053 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "0", text: "会话内容", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("0"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("0");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060053 end');
    })

    /**
     * @tc.name   testContentVolume060054
     * @tc.number SUB_CNB_CONTENT_0399
     * @tc.desc   会话内容：标题第 9 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060054 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "0", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("0"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("0");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060054 end');
    })

    /**
     * @tc.name   testContentVolume060055
     * @tc.number SUB_CNB_CONTENT_0400
     * @tc.desc   会话内容：标题第 10 组、正文第 1 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060055 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "null", text: "", additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("null"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("null");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060055 end');
    })

    /**
     * @tc.name   testContentVolume060056
     * @tc.number SUB_CNB_CONTENT_0401
     * @tc.desc   会话内容：标题第 10 组、正文第 1 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060056 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "null", text: "",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("null"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("null");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String(""));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060056 end');
    })

    /**
     * @tc.name   testContentVolume060057
     * @tc.number SUB_CNB_CONTENT_0402
     * @tc.desc   会话内容：标题第 10 组、正文第 2 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060057 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "null", text: "body",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("null"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("null");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060057 end');
    })

    /**
     * @tc.name   testContentVolume060058
     * @tc.number SUB_CNB_CONTENT_0403
     * @tc.desc   会话内容：标题第 10 组、正文第 2 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060058 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "null", text: "body",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("null"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("null");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("body"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("body");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060058 end');
    })

    /**
     * @tc.name   testContentVolume060059
     * @tc.number SUB_CNB_CONTENT_0404
     * @tc.desc   会话内容：标题第 10 组、正文第 3 组、附加第 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060059 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "null", text: "会话内容",
        additionalText: "" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("null"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("null");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String(""));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060059 end');
    })

    /**
     * @tc.name   testContentVolume060060
     * @tc.number SUB_CNB_CONTENT_0405
     * @tc.desc   会话内容：标题第 10 组、正文第 3 组、附加第 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume060060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060060 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: "null", text: "会话内容",
        additionalText: "additional" });
      logActual(String(result.notificationContentType), String(3));
      expect(result.notificationContentType).assertEqual(3);
      logActual(String((result.normal as notification.NotificationBasicContent).title), String("null"));
      expect((result.normal as notification.NotificationBasicContent).title).assertEqual("null");
      logActual(String((result.normal as notification.NotificationBasicContent).text), String("会话内容"));
      expect((result.normal as notification.NotificationBasicContent).text).assertEqual("会话内容");
      logActual(String((result.normal as notification.NotificationBasicContent).additionalText), String("additional"));
      expect((result.normal as notification.NotificationBasicContent).additionalText).assertEqual("additional");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060060 end');
    })

    /**
     * @tc.name   testContentVolume060061
     * @tc.number SUB_CNB_CONTENT_0406
     * @tc.desc   会话内容三字段同时为空串时仍固定类型 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContentVolume060061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060061 begin');
      const content: notification.NotificationContent =
        notificationContentUtil.initNotificationConversationContent({ title: '', text: '', additionalText: '' });
      expect(content.notificationContentType).assertEqual(3);
      expect((content.normal as notification.NotificationBasicContent).title).assertEqual('');
      expect((content.normal as notification.NotificationBasicContent).text).assertEqual('');
      expect((content.normal as notification.NotificationBasicContent).additionalText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume060061 end');
    })

  })
}
