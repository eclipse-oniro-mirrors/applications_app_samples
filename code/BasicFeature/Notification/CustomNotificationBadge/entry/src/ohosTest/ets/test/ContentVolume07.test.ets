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
import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil } from '@ohos/notification';
import { createTestPixelMapSized } from './helper/TestPixelMap';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomNotificationBadge]';

// 统一记录实际值与期望值，避免逐处重复书写日志格式串
function logActual(actual: string, expected: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, expected);
}

export default function contentVolume07Test() {
  describe('ContentVolume07Test', () => {

    /**
     * @tc.name   testContentVolume070001
     * @tc.number SUB_CNB_CONTENT_0407
     * @tc.desc   图片档位：1x1 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070001 begin');
      const picture: image.PixelMap = createTestPixelMapSized(1, 1);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070001 end');
    })

    /**
     * @tc.name   testContentVolume070002
     * @tc.number SUB_CNB_CONTENT_0408
     * @tc.desc   图片档位：1x1 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070002 begin');
      const picture: image.PixelMap = createTestPixelMapSized(1, 1);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070002 end');
    })

    /**
     * @tc.name   testContentVolume070003
     * @tc.number SUB_CNB_CONTENT_0409
     * @tc.desc   图片档位：1x1 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070003 begin');
      const picture: image.PixelMap = createTestPixelMapSized(1, 1);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070003 end');
    })

    /**
     * @tc.name   testContentVolume070004
     * @tc.number SUB_CNB_CONTENT_0410
     * @tc.desc   图片档位：1x1 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070004 begin');
      const picture: image.PixelMap = createTestPixelMapSized(1, 1);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070004 end');
    })

    /**
     * @tc.name   testContentVolume070005
     * @tc.number SUB_CNB_CONTENT_0411
     * @tc.desc   图片档位：2x2 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070005 begin');
      const picture: image.PixelMap = createTestPixelMapSized(2, 2);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070005 end');
    })

    /**
     * @tc.name   testContentVolume070006
     * @tc.number SUB_CNB_CONTENT_0412
     * @tc.desc   图片档位：2x2 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070006 begin');
      const picture: image.PixelMap = createTestPixelMapSized(2, 2);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070006 end');
    })

    /**
     * @tc.name   testContentVolume070007
     * @tc.number SUB_CNB_CONTENT_0413
     * @tc.desc   图片档位：2x2 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070007 begin');
      const picture: image.PixelMap = createTestPixelMapSized(2, 2);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070007 end');
    })

    /**
     * @tc.name   testContentVolume070008
     * @tc.number SUB_CNB_CONTENT_0414
     * @tc.desc   图片档位：2x2 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070008 begin');
      const picture: image.PixelMap = createTestPixelMapSized(2, 2);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070008 end');
    })

    /**
     * @tc.name   testContentVolume070009
     * @tc.number SUB_CNB_CONTENT_0415
     * @tc.desc   图片档位：3x3 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070009 begin');
      const picture: image.PixelMap = createTestPixelMapSized(3, 3);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070009 end');
    })

    /**
     * @tc.name   testContentVolume070010
     * @tc.number SUB_CNB_CONTENT_0416
     * @tc.desc   图片档位：3x3 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070010 begin');
      const picture: image.PixelMap = createTestPixelMapSized(3, 3);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070010 end');
    })

    /**
     * @tc.name   testContentVolume070011
     * @tc.number SUB_CNB_CONTENT_0417
     * @tc.desc   图片档位：3x3 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070011 begin');
      const picture: image.PixelMap = createTestPixelMapSized(3, 3);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070011 end');
    })

    /**
     * @tc.name   testContentVolume070012
     * @tc.number SUB_CNB_CONTENT_0418
     * @tc.desc   图片档位：3x3 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070012 begin');
      const picture: image.PixelMap = createTestPixelMapSized(3, 3);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070012 end');
    })

    /**
     * @tc.name   testContentVolume070013
     * @tc.number SUB_CNB_CONTENT_0419
     * @tc.desc   图片档位：4x4 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070013 begin');
      const picture: image.PixelMap = createTestPixelMapSized(4, 4);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070013 end');
    })

    /**
     * @tc.name   testContentVolume070014
     * @tc.number SUB_CNB_CONTENT_0420
     * @tc.desc   图片档位：4x4 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070014 begin');
      const picture: image.PixelMap = createTestPixelMapSized(4, 4);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070014 end');
    })

    /**
     * @tc.name   testContentVolume070015
     * @tc.number SUB_CNB_CONTENT_0421
     * @tc.desc   图片档位：4x4 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070015 begin');
      const picture: image.PixelMap = createTestPixelMapSized(4, 4);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070015 end');
    })

    /**
     * @tc.name   testContentVolume070016
     * @tc.number SUB_CNB_CONTENT_0422
     * @tc.desc   图片档位：4x4 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070016 begin');
      const picture: image.PixelMap = createTestPixelMapSized(4, 4);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070016 end');
    })

    /**
     * @tc.name   testContentVolume070017
     * @tc.number SUB_CNB_CONTENT_0423
     * @tc.desc   图片档位：8x8 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070017 begin');
      const picture: image.PixelMap = createTestPixelMapSized(8, 8);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070017 end');
    })

    /**
     * @tc.name   testContentVolume070018
     * @tc.number SUB_CNB_CONTENT_0424
     * @tc.desc   图片档位：8x8 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070018 begin');
      const picture: image.PixelMap = createTestPixelMapSized(8, 8);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070018 end');
    })

    /**
     * @tc.name   testContentVolume070019
     * @tc.number SUB_CNB_CONTENT_0425
     * @tc.desc   图片档位：8x8 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070019 begin');
      const picture: image.PixelMap = createTestPixelMapSized(8, 8);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070019 end');
    })

    /**
     * @tc.name   testContentVolume070020
     * @tc.number SUB_CNB_CONTENT_0426
     * @tc.desc   图片档位：8x8 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070020 begin');
      const picture: image.PixelMap = createTestPixelMapSized(8, 8);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070020 end');
    })

    /**
     * @tc.name   testContentVolume070021
     * @tc.number SUB_CNB_CONTENT_0427
     * @tc.desc   图片档位：12x12 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070021 begin');
      const picture: image.PixelMap = createTestPixelMapSized(12, 12);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070021 end');
    })

    /**
     * @tc.name   testContentVolume070022
     * @tc.number SUB_CNB_CONTENT_0428
     * @tc.desc   图片档位：12x12 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070022 begin');
      const picture: image.PixelMap = createTestPixelMapSized(12, 12);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070022 end');
    })

    /**
     * @tc.name   testContentVolume070023
     * @tc.number SUB_CNB_CONTENT_0429
     * @tc.desc   图片档位：12x12 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070023 begin');
      const picture: image.PixelMap = createTestPixelMapSized(12, 12);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070023 end');
    })

    /**
     * @tc.name   testContentVolume070024
     * @tc.number SUB_CNB_CONTENT_0430
     * @tc.desc   图片档位：12x12 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070024 begin');
      const picture: image.PixelMap = createTestPixelMapSized(12, 12);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070024 end');
    })

    /**
     * @tc.name   testContentVolume070025
     * @tc.number SUB_CNB_CONTENT_0431
     * @tc.desc   图片档位：16x16 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070025 begin');
      const picture: image.PixelMap = createTestPixelMapSized(16, 16);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070025 end');
    })

    /**
     * @tc.name   testContentVolume070026
     * @tc.number SUB_CNB_CONTENT_0432
     * @tc.desc   图片档位：16x16 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070026 begin');
      const picture: image.PixelMap = createTestPixelMapSized(16, 16);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070026 end');
    })

    /**
     * @tc.name   testContentVolume070027
     * @tc.number SUB_CNB_CONTENT_0433
     * @tc.desc   图片档位：16x16 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070027 begin');
      const picture: image.PixelMap = createTestPixelMapSized(16, 16);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070027 end');
    })

    /**
     * @tc.name   testContentVolume070028
     * @tc.number SUB_CNB_CONTENT_0434
     * @tc.desc   图片档位：16x16 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070028 begin');
      const picture: image.PixelMap = createTestPixelMapSized(16, 16);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070028 end');
    })

    /**
     * @tc.name   testContentVolume070029
     * @tc.number SUB_CNB_CONTENT_0435
     * @tc.desc   图片档位：24x24 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070029 begin');
      const picture: image.PixelMap = createTestPixelMapSized(24, 24);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070029 end');
    })

    /**
     * @tc.name   testContentVolume070030
     * @tc.number SUB_CNB_CONTENT_0436
     * @tc.desc   图片档位：24x24 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070030 begin');
      const picture: image.PixelMap = createTestPixelMapSized(24, 24);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070030 end');
    })

    /**
     * @tc.name   testContentVolume070031
     * @tc.number SUB_CNB_CONTENT_0437
     * @tc.desc   图片档位：24x24 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070031 begin');
      const picture: image.PixelMap = createTestPixelMapSized(24, 24);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070031 end');
    })

    /**
     * @tc.name   testContentVolume070032
     * @tc.number SUB_CNB_CONTENT_0438
     * @tc.desc   图片档位：24x24 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070032 begin');
      const picture: image.PixelMap = createTestPixelMapSized(24, 24);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070032 end');
    })

    /**
     * @tc.name   testContentVolume070033
     * @tc.number SUB_CNB_CONTENT_0439
     * @tc.desc   图片档位：32x32 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070033 begin');
      const picture: image.PixelMap = createTestPixelMapSized(32, 32);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070033 end');
    })

    /**
     * @tc.name   testContentVolume070034
     * @tc.number SUB_CNB_CONTENT_0440
     * @tc.desc   图片档位：32x32 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070034 begin');
      const picture: image.PixelMap = createTestPixelMapSized(32, 32);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070034 end');
    })

    /**
     * @tc.name   testContentVolume070035
     * @tc.number SUB_CNB_CONTENT_0441
     * @tc.desc   图片档位：32x32 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070035 begin');
      const picture: image.PixelMap = createTestPixelMapSized(32, 32);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070035 end');
    })

    /**
     * @tc.name   testContentVolume070036
     * @tc.number SUB_CNB_CONTENT_0442
     * @tc.desc   图片档位：32x32 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070036 begin');
      const picture: image.PixelMap = createTestPixelMapSized(32, 32);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070036 end');
    })

    /**
     * @tc.name   testContentVolume070037
     * @tc.number SUB_CNB_CONTENT_0443
     * @tc.desc   图片档位：40x40 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070037 begin');
      const picture: image.PixelMap = createTestPixelMapSized(40, 40);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070037 end');
    })

    /**
     * @tc.name   testContentVolume070038
     * @tc.number SUB_CNB_CONTENT_0444
     * @tc.desc   图片档位：40x40 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070038 begin');
      const picture: image.PixelMap = createTestPixelMapSized(40, 40);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070038 end');
    })

    /**
     * @tc.name   testContentVolume070039
     * @tc.number SUB_CNB_CONTENT_0445
     * @tc.desc   图片档位：40x40 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070039 begin');
      const picture: image.PixelMap = createTestPixelMapSized(40, 40);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070039 end');
    })

    /**
     * @tc.name   testContentVolume070040
     * @tc.number SUB_CNB_CONTENT_0446
     * @tc.desc   图片档位：40x40 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070040 begin');
      const picture: image.PixelMap = createTestPixelMapSized(40, 40);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070040 end');
    })

    /**
     * @tc.name   testContentVolume070041
     * @tc.number SUB_CNB_CONTENT_0447
     * @tc.desc   图片档位：48x48 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070041 begin');
      const picture: image.PixelMap = createTestPixelMapSized(48, 48);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070041 end');
    })

    /**
     * @tc.name   testContentVolume070042
     * @tc.number SUB_CNB_CONTENT_0448
     * @tc.desc   图片档位：48x48 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070042 begin');
      const picture: image.PixelMap = createTestPixelMapSized(48, 48);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070042 end');
    })

    /**
     * @tc.name   testContentVolume070043
     * @tc.number SUB_CNB_CONTENT_0449
     * @tc.desc   图片档位：48x48 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070043 begin');
      const picture: image.PixelMap = createTestPixelMapSized(48, 48);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070043 end');
    })

    /**
     * @tc.name   testContentVolume070044
     * @tc.number SUB_CNB_CONTENT_0450
     * @tc.desc   图片档位：48x48 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070044 begin');
      const picture: image.PixelMap = createTestPixelMapSized(48, 48);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070044 end');
    })

    /**
     * @tc.name   testContentVolume070045
     * @tc.number SUB_CNB_CONTENT_0451
     * @tc.desc   图片档位：64x64 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070045 begin');
      const picture: image.PixelMap = createTestPixelMapSized(64, 64);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070045 end');
    })

    /**
     * @tc.name   testContentVolume070046
     * @tc.number SUB_CNB_CONTENT_0452
     * @tc.desc   图片档位：64x64 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070046 begin');
      const picture: image.PixelMap = createTestPixelMapSized(64, 64);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070046 end');
    })

    /**
     * @tc.name   testContentVolume070047
     * @tc.number SUB_CNB_CONTENT_0453
     * @tc.desc   图片档位：64x64 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070047 begin');
      const picture: image.PixelMap = createTestPixelMapSized(64, 64);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070047 end');
    })

    /**
     * @tc.name   testContentVolume070048
     * @tc.number SUB_CNB_CONTENT_0454
     * @tc.desc   图片档位：64x64 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070048 begin');
      const picture: image.PixelMap = createTestPixelMapSized(64, 64);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070048 end');
    })

    /**
     * @tc.name   testContentVolume070049
     * @tc.number SUB_CNB_CONTENT_0455
     * @tc.desc   图片档位：96x96 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070049 begin');
      const picture: image.PixelMap = createTestPixelMapSized(96, 96);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070049 end');
    })

    /**
     * @tc.name   testContentVolume070050
     * @tc.number SUB_CNB_CONTENT_0456
     * @tc.desc   图片档位：96x96 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070050 begin');
      const picture: image.PixelMap = createTestPixelMapSized(96, 96);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070050 end');
    })

    /**
     * @tc.name   testContentVolume070051
     * @tc.number SUB_CNB_CONTENT_0457
     * @tc.desc   图片档位：96x96 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070051 begin');
      const picture: image.PixelMap = createTestPixelMapSized(96, 96);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070051 end');
    })

    /**
     * @tc.name   testContentVolume070052
     * @tc.number SUB_CNB_CONTENT_0458
     * @tc.desc   图片档位：96x96 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070052 begin');
      const picture: image.PixelMap = createTestPixelMapSized(96, 96);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070052 end');
    })

    /**
     * @tc.name   testContentVolume070053
     * @tc.number SUB_CNB_CONTENT_0459
     * @tc.desc   图片档位：128x128 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070053 begin');
      const picture: image.PixelMap = createTestPixelMapSized(128, 128);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070053 end');
    })

    /**
     * @tc.name   testContentVolume070054
     * @tc.number SUB_CNB_CONTENT_0460
     * @tc.desc   图片档位：128x128 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070054 begin');
      const picture: image.PixelMap = createTestPixelMapSized(128, 128);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070054 end');
    })

    /**
     * @tc.name   testContentVolume070055
     * @tc.number SUB_CNB_CONTENT_0461
     * @tc.desc   图片档位：128x128 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070055 begin');
      const picture: image.PixelMap = createTestPixelMapSized(128, 128);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070055 end');
    })

    /**
     * @tc.name   testContentVolume070056
     * @tc.number SUB_CNB_CONTENT_0462
     * @tc.desc   图片档位：128x128 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070056 begin');
      const picture: image.PixelMap = createTestPixelMapSized(128, 128);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070056 end');
    })

    /**
     * @tc.name   testContentVolume070057
     * @tc.number SUB_CNB_CONTENT_0463
     * @tc.desc   图片档位：256x256 PixelMap 与 briefText 第 1 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070057 begin');
      const picture: image.PixelMap = createTestPixelMapSized(256, 256);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "brief", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("brief"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("brief");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070057 end');
    })

    /**
     * @tc.name   testContentVolume070058
     * @tc.number SUB_CNB_CONTENT_0464
     * @tc.desc   图片档位：256x256 PixelMap 与 briefText 第 2 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070058 begin');
      const picture: image.PixelMap = createTestPixelMapSized(256, 256);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String(""));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070058 end');
    })

    /**
     * @tc.name   testContentVolume070059
     * @tc.number SUB_CNB_CONTENT_0465
     * @tc.desc   图片档位：256x256 PixelMap 与 briefText 第 3 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070059 begin');
      const picture: image.PixelMap = createTestPixelMapSized(256, 256);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" },
        "Brief text", "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("Brief text"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("Brief text");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070059 end');
    })

    /**
     * @tc.name   testContentVolume070060
     * @tc.number SUB_CNB_CONTENT_0466
     * @tc.desc   图片档位：256x256 PixelMap 与 briefText 第 4 组组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume070060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070060 begin');
      const picture: image.PixelMap = createTestPixelMapSized(256, 256);
      const result: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: "T", text: "Body", additionalText: "A" }, "概 要",
        "Expanded title", picture);
      logActual(String(result.notificationContentType), String(2));
      expect(result.notificationContentType).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String((result.picture as notification.NotificationPictureContent).picture === picture));
      expect((result.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      logActual(String((result.picture as notification.NotificationPictureContent).briefText), String("概 要"));
      expect((result.picture as notification.NotificationPictureContent).briefText).assertEqual("概 要");
      logActual(String((result.picture as notification.NotificationPictureContent).expandedTitle),
        String("Expanded title"));
      expect((result.picture as notification.NotificationPictureContent).expandedTitle).assertEqual("Expanded title");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070060 end');
    })

    /**
     * @tc.name   testContentVolume070061
     * @tc.number SUB_CNB_CONTENT_0467
     * @tc.desc   256x256 PixelMap 以同一引用进入 picture 内容
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContentVolume070061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070061 begin');
      const picture: image.PixelMap = createTestPixelMapSized(256, 256);
      const content: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent({ title: 'T', text: 'B', additionalText: 'A' }, 'brief',
        'E', picture);
      expect(content.notificationContentType).assertEqual(2);
      expect((content.picture as notification.NotificationPictureContent).picture === picture).assertTrue();
      expect((content.picture as notification.NotificationPictureContent).briefText).assertEqual('brief');
      expect((content.picture as notification.NotificationPictureContent).expandedTitle).assertEqual('E');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume070061 end');
    })

  })
}
