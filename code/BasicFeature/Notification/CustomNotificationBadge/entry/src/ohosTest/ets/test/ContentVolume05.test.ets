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

export default function contentVolume05Test() {
  describe('ContentVolume05Test', () => {

    /**
     * @tc.name   testContentVolume050001
     * @tc.number SUB_CNB_CONTENT_0285
     * @tc.desc   行档位：ascii 风格下 0 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050001 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", []);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(0));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(0);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050001 end');
    })

    /**
     * @tc.name   testContentVolume050002
     * @tc.number SUB_CNB_CONTENT_0286
     * @tc.desc   行档位：unicode 风格下 0 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050002 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", []);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(0));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(0);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050002 end');
    })

    /**
     * @tc.name   testContentVolume050003
     * @tc.number SUB_CNB_CONTENT_0287
     * @tc.desc   行档位：long 风格下 0 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050003 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", []);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(0));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(0);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050003 end');
    })

    /**
     * @tc.name   testContentVolume050004
     * @tc.number SUB_CNB_CONTENT_0288
     * @tc.desc   行档位：numeric 风格下 0 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050004 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", []);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(0));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(0);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050004 end');
    })

    /**
     * @tc.name   testContentVolume050005
     * @tc.number SUB_CNB_CONTENT_0289
     * @tc.desc   行档位：word 风格下 0 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050005 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", []);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(0));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(0);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050005 end');
    })

    /**
     * @tc.name   testContentVolume050006
     * @tc.number SUB_CNB_CONTENT_0290
     * @tc.desc   行档位：ascii 风格下 1 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050006 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(1));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(1);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050006 end');
    })

    /**
     * @tc.name   testContentVolume050007
     * @tc.number SUB_CNB_CONTENT_0291
     * @tc.desc   行档位：unicode 风格下 1 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050007 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(1));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(1);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050007 end');
    })

    /**
     * @tc.name   testContentVolume050008
     * @tc.number SUB_CNB_CONTENT_0292
     * @tc.desc   行档位：long 风格下 1 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050008 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(1));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(1);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050008 end');
    })

    /**
     * @tc.name   testContentVolume050009
     * @tc.number SUB_CNB_CONTENT_0293
     * @tc.desc   行档位：numeric 风格下 1 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050009 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(1));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(1);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050009 end');
    })

    /**
     * @tc.name   testContentVolume050010
     * @tc.number SUB_CNB_CONTENT_0294
     * @tc.desc   行档位：word 风格下 1 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050010 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(1));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(1);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050010 end');
    })

    /**
     * @tc.name   testContentVolume050011
     * @tc.number SUB_CNB_CONTENT_0295
     * @tc.desc   行档位：ascii 风格下 2 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050011 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(2));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(2);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050011 end');
    })

    /**
     * @tc.name   testContentVolume050012
     * @tc.number SUB_CNB_CONTENT_0296
     * @tc.desc   行档位：unicode 风格下 2 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050012 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(2));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(2);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050012 end');
    })

    /**
     * @tc.name   testContentVolume050013
     * @tc.number SUB_CNB_CONTENT_0297
     * @tc.desc   行档位：long 风格下 2 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050013 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(2));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(2);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050013 end');
    })

    /**
     * @tc.name   testContentVolume050014
     * @tc.number SUB_CNB_CONTENT_0298
     * @tc.desc   行档位：numeric 风格下 2 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050014 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(2));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(2);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050014 end');
    })

    /**
     * @tc.name   testContentVolume050015
     * @tc.number SUB_CNB_CONTENT_0299
     * @tc.desc   行档位：word 风格下 2 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050015 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(2));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(2);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050015 end');
    })

    /**
     * @tc.name   testContentVolume050016
     * @tc.number SUB_CNB_CONTENT_0300
     * @tc.desc   行档位：ascii 风格下 3 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050016 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(3));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(3);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050016 end');
    })

    /**
     * @tc.name   testContentVolume050017
     * @tc.number SUB_CNB_CONTENT_0301
     * @tc.desc   行档位：unicode 风格下 3 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050017 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(3));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(3);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050017 end');
    })

    /**
     * @tc.name   testContentVolume050018
     * @tc.number SUB_CNB_CONTENT_0302
     * @tc.desc   行档位：long 风格下 3 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050018 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(3));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(3);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050018 end');
    })

    /**
     * @tc.name   testContentVolume050019
     * @tc.number SUB_CNB_CONTENT_0303
     * @tc.desc   行档位：numeric 风格下 3 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050019 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(3));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(3);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050019 end');
    })

    /**
     * @tc.name   testContentVolume050020
     * @tc.number SUB_CNB_CONTENT_0304
     * @tc.desc   行档位：word 风格下 3 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050020 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(3));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(3);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050020 end');
    })

    /**
     * @tc.name   testContentVolume050021
     * @tc.number SUB_CNB_CONTENT_0305
     * @tc.desc   行档位：ascii 风格下 4 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050021 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2","l3"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(4));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050021 end');
    })

    /**
     * @tc.name   testContentVolume050022
     * @tc.number SUB_CNB_CONTENT_0306
     * @tc.desc   行档位：unicode 风格下 4 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050022 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2","行3"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(4));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050022 end');
    })

    /**
     * @tc.name   testContentVolume050023
     * @tc.number SUB_CNB_CONTENT_0307
     * @tc.desc   行档位：long 风格下 4 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050023 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(4));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050023 end');
    })

    /**
     * @tc.name   testContentVolume050024
     * @tc.number SUB_CNB_CONTENT_0308
     * @tc.desc   行档位：numeric 风格下 4 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050024 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2","3"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(4));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050024 end');
    })

    /**
     * @tc.name   testContentVolume050025
     * @tc.number SUB_CNB_CONTENT_0309
     * @tc.desc   行档位：word 风格下 4 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050025 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2","line 3"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(4));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050025 end');
    })

    /**
     * @tc.name   testContentVolume050026
     * @tc.number SUB_CNB_CONTENT_0310
     * @tc.desc   行档位：ascii 风格下 5 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050026 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2","l3","l4"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(5));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(5);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050026 end');
    })

    /**
     * @tc.name   testContentVolume050027
     * @tc.number SUB_CNB_CONTENT_0311
     * @tc.desc   行档位：unicode 风格下 5 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050027 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2","行3","行4"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(5));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(5);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050027 end');
    })

    /**
     * @tc.name   testContentVolume050028
     * @tc.number SUB_CNB_CONTENT_0312
     * @tc.desc   行档位：long 风格下 5 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050028 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(5));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(5);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050028 end');
    })

    /**
     * @tc.name   testContentVolume050029
     * @tc.number SUB_CNB_CONTENT_0313
     * @tc.desc   行档位：numeric 风格下 5 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050029 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2","3","4"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(5));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(5);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050029 end');
    })

    /**
     * @tc.name   testContentVolume050030
     * @tc.number SUB_CNB_CONTENT_0314
     * @tc.desc   行档位：word 风格下 5 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050030 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2","line 3","line 4"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(5));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(5);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050030 end');
    })

    /**
     * @tc.name   testContentVolume050031
     * @tc.number SUB_CNB_CONTENT_0315
     * @tc.desc   行档位：ascii 风格下 6 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050031 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2","l3","l4","l5"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(6));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(6);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050031 end');
    })

    /**
     * @tc.name   testContentVolume050032
     * @tc.number SUB_CNB_CONTENT_0316
     * @tc.desc   行档位：unicode 风格下 6 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050032 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2","行3","行4","行5"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(6));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(6);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050032 end');
    })

    /**
     * @tc.name   testContentVolume050033
     * @tc.number SUB_CNB_CONTENT_0317
     * @tc.desc   行档位：long 风格下 6 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050033 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(6));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(6);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050033 end');
    })

    /**
     * @tc.name   testContentVolume050034
     * @tc.number SUB_CNB_CONTENT_0318
     * @tc.desc   行档位：numeric 风格下 6 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050034 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2","3","4","5"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(6));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(6);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050034 end');
    })

    /**
     * @tc.name   testContentVolume050035
     * @tc.number SUB_CNB_CONTENT_0319
     * @tc.desc   行档位：word 风格下 6 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050035 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2","line 3","line 4","line 5"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(6));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(6);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050035 end');
    })

    /**
     * @tc.name   testContentVolume050036
     * @tc.number SUB_CNB_CONTENT_0320
     * @tc.desc   行档位：ascii 风格下 8 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050036 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2","l3","l4","l5","l6","l7"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(8));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(8);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050036 end');
    })

    /**
     * @tc.name   testContentVolume050037
     * @tc.number SUB_CNB_CONTENT_0321
     * @tc.desc   行档位：unicode 风格下 8 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050037 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2","行3","行4","行5","行6","行7"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(8));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(8);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050037 end');
    })

    /**
     * @tc.name   testContentVolume050038
     * @tc.number SUB_CNB_CONTENT_0322
     * @tc.desc   行档位：long 风格下 8 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050038 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(8));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(8);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050038 end');
    })

    /**
     * @tc.name   testContentVolume050039
     * @tc.number SUB_CNB_CONTENT_0323
     * @tc.desc   行档位：numeric 风格下 8 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050039 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2","3","4","5","6","7"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(8));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(8);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050039 end');
    })

    /**
     * @tc.name   testContentVolume050040
     * @tc.number SUB_CNB_CONTENT_0324
     * @tc.desc   行档位：word 风格下 8 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050040 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2","line 3","line 4","line 5","line 6","line 7"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(8));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(8);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050040 end');
    })

    /**
     * @tc.name   testContentVolume050041
     * @tc.number SUB_CNB_CONTENT_0325
     * @tc.desc   行档位：ascii 风格下 10 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050041 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2","l3","l4","l5","l6","l7","l8","l9"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(10));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(10);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050041 end');
    })

    /**
     * @tc.name   testContentVolume050042
     * @tc.number SUB_CNB_CONTENT_0326
     * @tc.desc   行档位：unicode 风格下 10 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050042 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2","行3","行4","行5","行6","行7","行8","行9"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(10));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(10);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050042 end');
    })

    /**
     * @tc.name   testContentVolume050043
     * @tc.number SUB_CNB_CONTENT_0327
     * @tc.desc   行档位：long 风格下 10 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050043 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L8xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(10));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(10);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050043 end');
    })

    /**
     * @tc.name   testContentVolume050044
     * @tc.number SUB_CNB_CONTENT_0328
     * @tc.desc   行档位：numeric 风格下 10 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050044 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2","3","4","5","6","7","8","9"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(10));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(10);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050044 end');
    })

    /**
     * @tc.name   testContentVolume050045
     * @tc.number SUB_CNB_CONTENT_0329
     * @tc.desc   行档位：word 风格下 10 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050045 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2","line 3","line 4","line 5","line 6","line 7","line 8",
        "line 9"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(10));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(10);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050045 end');
    })

    /**
     * @tc.name   testContentVolume050046
     * @tc.number SUB_CNB_CONTENT_0330
     * @tc.desc   行档位：ascii 风格下 12 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050046 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2","l3","l4","l5","l6","l7","l8","l9","l10","l11"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(12));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(12);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050046 end');
    })

    /**
     * @tc.name   testContentVolume050047
     * @tc.number SUB_CNB_CONTENT_0331
     * @tc.desc   行档位：unicode 风格下 12 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050047 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2","行3","行4","行5","行6","行7","行8","行9","行10","行11"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(12));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(12);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050047 end');
    })

    /**
     * @tc.name   testContentVolume050048
     * @tc.number SUB_CNB_CONTENT_0332
     * @tc.desc   行档位：long 风格下 12 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050048 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L8xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L10xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L11xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(12));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(12);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050048 end');
    })

    /**
     * @tc.name   testContentVolume050049
     * @tc.number SUB_CNB_CONTENT_0333
     * @tc.desc   行档位：numeric 风格下 12 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050049 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2","3","4","5","6","7","8","9","10","11"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(12));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(12);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050049 end');
    })

    /**
     * @tc.name   testContentVolume050050
     * @tc.number SUB_CNB_CONTENT_0334
     * @tc.desc   行档位：word 风格下 12 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050050 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2","line 3","line 4","line 5","line 6","line 7","line 8",
        "line 9","line 10","line 11"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(12));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(12);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050050 end');
    })

    /**
     * @tc.name   testContentVolume050051
     * @tc.number SUB_CNB_CONTENT_0335
     * @tc.desc   行档位：ascii 风格下 15 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050051 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2","l3","l4","l5","l6","l7","l8","l9","l10","l11","l12","l13","l14"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(15));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(15);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050051 end');
    })

    /**
     * @tc.name   testContentVolume050052
     * @tc.number SUB_CNB_CONTENT_0336
     * @tc.desc   行档位：unicode 风格下 15 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050052 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2","行3","行4","行5","行6","行7","行8","行9","行10","行11","行12","行13","行14"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(15));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(15);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050052 end');
    })

    /**
     * @tc.name   testContentVolume050053
     * @tc.number SUB_CNB_CONTENT_0337
     * @tc.desc   行档位：long 风格下 15 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050053 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L8xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L10xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L11xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L12xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L13xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L14xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(15));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(15);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050053 end');
    })

    /**
     * @tc.name   testContentVolume050054
     * @tc.number SUB_CNB_CONTENT_0338
     * @tc.desc   行档位：numeric 风格下 15 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050054 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(15));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(15);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050054 end');
    })

    /**
     * @tc.name   testContentVolume050055
     * @tc.number SUB_CNB_CONTENT_0339
     * @tc.desc   行档位：word 风格下 15 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050055 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2","line 3","line 4","line 5","line 6","line 7","line 8",
        "line 9","line 10","line 11","line 12","line 13","line 14"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(15));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(15);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050055 end');
    })

    /**
     * @tc.name   testContentVolume050056
     * @tc.number SUB_CNB_CONTENT_0340
     * @tc.desc   行档位：ascii 风格下 20 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050056 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["l0","l1","l2","l3","l4","l5","l6","l7","l8","l9","l10","l11","l12","l13","l14","l15",
        "l16","l17","l18","l19"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(20));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(20);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050056 end');
    })

    /**
     * @tc.name   testContentVolume050057
     * @tc.number SUB_CNB_CONTENT_0341
     * @tc.desc   行档位：unicode 风格下 20 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050057 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["行0","行1","行2","行3","行4","行5","行6","行7","行8","行9","行10","行11","行12","行13","行14","行15",
        "行16","行17","行18","行19"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(20));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(20);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050057 end');
    })

    /**
     * @tc.name   testContentVolume050058
     * @tc.number SUB_CNB_CONTENT_0342
     * @tc.desc   行档位：long 风格下 20 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050058 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["L0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "L1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L8xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L10xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L11xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L12xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L13xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L14xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L15xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L16xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L17xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","L18xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "L19xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(20));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(20);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050058 end');
    })

    /**
     * @tc.name   testContentVolume050059
     * @tc.number SUB_CNB_CONTENT_0343
     * @tc.desc   行档位：numeric 风格下 20 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050059 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18",
        "19"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(20));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(20);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050059 end');
    })

    /**
     * @tc.name   testContentVolume050060
     * @tc.number SUB_CNB_CONTENT_0344
     * @tc.desc   行档位：word 风格下 20 行文本进入 multiLine.lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume050060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050060 begin');
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Long title", ["line 0","line 1","line 2","line 3","line 4","line 5","line 6","line 7","line 8",
        "line 9","line 10","line 11","line 12","line 13","line 14","line 15","line 16","line 17","line 18","line 19"]);
      logActual(String(result.notificationContentType), String(4));
      expect(result.notificationContentType).assertEqual(4);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).lines.length), String(20));
      expect((result.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(20);
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).briefText), String("brief"));
      expect((result.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual("brief");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).longTitle),
        String("Long title"));
      expect((result.multiLine as notification.NotificationMultiLineContent).longTitle).assertEqual("Long title");
      logActual(String((result.multiLine as notification.NotificationMultiLineContent).additionalText), String("A"));
      expect((result.multiLine as notification.NotificationMultiLineContent).additionalText).assertEqual("A");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050060 end');
    })

    /**
     * @tc.name   testContentVolume050061
     * @tc.number SUB_CNB_CONTENT_0345
     * @tc.desc   空行数组与 20 行数组的上下边界
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContentVolume050061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050061 begin');
      const empty: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: 'T', text: 'B', additionalText: 'A' },
        'brief', 'LT', []);
      const bigLines: string[] = [];
      for (let i = 0; i < 20; i++) {
        bigLines.push('line ' + i);
      }
      const big: notification.NotificationContent =
        notificationContentUtil.initNotificationMultiLineContent({ title: 'T', text: 'B', additionalText: 'A' },
        'brief', 'LT', bigLines);
      expect((empty.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(0);
      expect((big.multiLine as notification.NotificationMultiLineContent).lines.length).assertEqual(20);
      expect((big.multiLine as notification.NotificationMultiLineContent).lines[19]).assertEqual('line 19');
      expect((big.multiLine as notification.NotificationMultiLineContent).briefText).assertEqual('brief');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume050061 end');
    })

  })
}
