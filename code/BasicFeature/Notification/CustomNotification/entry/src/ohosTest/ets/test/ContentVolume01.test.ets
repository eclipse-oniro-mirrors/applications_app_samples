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

// notificationContentUtil 的内容类型解析与 4 个内容构造器。
// 期望值来源：SDK 规格常量（NotificationContent 字段可选性、ContentType 取值）+ 输入回读，
// 不复制被测实现的判断过程。边界用例见 ContentReal01。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

function buildRepeatedText(count: number): string {
    let result: string = '';
    for (let i: number = 0; i < count; i++) {
        result += 'L';
    }
    return result;
}

function buildLines(count: number): string[] {
    let result: string[] = [];
    for (let i: number = 0; i < count; i++) {
        result.push('line-' + i);
    }
    return result;
}

function createPixelMap(width: number, height: number): image.PixelMap {
    return image.createPixelMapSync({ size: { width: width, height: height } });
}

export default function contentVolume01Test() {
    describe('ContentVolume01', () => {
    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0001
     * @tc.name testVContent0001
     * @tc.desc 仅新版字段为基本文本（枚举最小合法值）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVContent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0001 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0001 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0002
     * @tc.name testVContent0002
     * @tc.desc 仅新版字段为长文本
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0002 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0002 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0003
     * @tc.name testVContent0003
     * @tc.desc 仅新版字段为图片
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0003 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0003 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0004
     * @tc.name testVContent0004
     * @tc.desc 仅新版字段为会话
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0004 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0004 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0005
     * @tc.name testVContent0005
     * @tc.desc 仅新版字段为多行文本
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0005 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0005 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0006
     * @tc.name testVContent0006
     * @tc.desc 仅新版字段为系统实况窗
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0006 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0006 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0007
     * @tc.name testVContent0007
     * @tc.desc 越界上界 7 原样透传（未做取值校验）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0007 begin');
      let content: notification.NotificationContent = {
          notificationContentType: 7
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(7));
      expect(actual).assertEqual(7);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual), String(7));
      expect(repeatActual).assertEqual(7);
      let copied: notification.NotificationContent = {
          notificationContentType: 7
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual), String(7));
      expect(copyActual).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0007 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0008
     * @tc.name testVContent0008
     * @tc.desc 越界下界 -1 原样透传
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0008 begin');
      let content: notification.NotificationContent = {
          notificationContentType: -1
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(-1));
      expect(actual).assertEqual(-1);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual), String(-1));
      expect(repeatActual).assertEqual(-1);
      let copied: notification.NotificationContent = {
          notificationContentType: -1
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual), String(-1));
      expect(copyActual).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0008 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0009
     * @tc.name testVContent0009
     * @tc.desc 越界大值 100 原样透传
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0009 begin');
      let content: notification.NotificationContent = {
          notificationContentType: 100
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(100));
      expect(actual).assertEqual(100);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual), String(100));
      expect(repeatActual).assertEqual(100);
      let copied: notification.NotificationContent = {
          notificationContentType: 100
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual), String(100));
      expect(copyActual).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0009 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0010
     * @tc.name testVContent0010
     * @tc.desc 越界小值 -100 原样透传
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0010 begin');
      let content: notification.NotificationContent = {
          notificationContentType: -100
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(-100));
      expect(actual).assertEqual(-100);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual), String(-100));
      expect(repeatActual).assertEqual(-100);
      let copied: notification.NotificationContent = {
          notificationContentType: -100
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual), String(-100));
      expect(copyActual).assertEqual(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0010 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0011
     * @tc.name testVContent0011
     * @tc.desc 双字段冲突：新版长文本优先于旧版基本文本
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0011 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
    contentType: 0
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
    contentType: 0
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0011 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0012
     * @tc.name testVContent0012
     * @tc.desc 双字段冲突：新版多行优先于旧版长文本
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0012 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    contentType: 1
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    contentType: 1
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0012 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0013
     * @tc.name testVContent0013
     * @tc.desc 双字段冲突：新版图片优先于旧版多行
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0013 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
    contentType: 4
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
    contentType: 4
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0013 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0014
     * @tc.name testVContent0014
     * @tc.desc 双字段冲突：新版会话优先于旧版图片
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0014 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
    contentType: 2
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
    contentType: 2
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0014 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0015
     * @tc.name testVContent0015
     * @tc.desc 双字段冲突：新版实况窗优先于旧版会话
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0015 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    contentType: 3
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    contentType: 3
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0015 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0016
     * @tc.name testVContent0016
     * @tc.desc 双字段冲突：新版基本文本优先于旧版实况窗
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0016 begin');
      let content: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    contentType: 6
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let copied: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    contentType: 6
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0016 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0017
     * @tc.name testVContent0017
     * @tc.desc 两字段均缺省：回落基本文本
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0017 begin');
      let content: notification.NotificationContent = {
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(repeatActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let copied: notification.NotificationContent = {
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(copyActual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0017 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0018
     * @tc.name testVContent0018
     * @tc.desc 仅旧版字段：按旧版值返回（兼容分支）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0018 begin');
      let content: notification.NotificationContent = {
          contentType: 4
      };
      let actual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(4));
      expect(actual).assertEqual(4);
      let repeatActual: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(repeatActual), String(4));
      expect(repeatActual).assertEqual(4);
      let copied: notification.NotificationContent = {
          contentType: 4
      };
      let copyActual: number = notificationContentUtil.getContentTypeId(copied);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(copyActual), String(4));
      expect(copyActual).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0018 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0019
     * @tc.name testVContent0019
     * @tc.desc initBasicNotificationContent 标题长度 0 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0019 begin');
      let title: string = buildRepeatedText(0);
      let basic: notification.NotificationBasicContent = { title: title, text: 'body' };
      let content: notification.NotificationContent = notificationContentUtil.initBasicNotificationContent(basic);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let actualTitle: string = (content.normal as notification.NotificationBasicContent).title;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualTitle.length), String(0));
      expect(actualTitle.length).assertEqual(0);
      let actualText: string = (content.normal as notification.NotificationBasicContent).text;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualText), String('body'));
      expect(actualText).assertEqual('body');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0019 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0020
     * @tc.name testVContent0020
     * @tc.desc initBasicNotificationContent 标题长度 1 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0020 begin');
      let title: string = buildRepeatedText(1);
      let basic: notification.NotificationBasicContent = { title: title, text: 'body' };
      let content: notification.NotificationContent = notificationContentUtil.initBasicNotificationContent(basic);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let actualTitle: string = (content.normal as notification.NotificationBasicContent).title;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualTitle.length), String(1));
      expect(actualTitle.length).assertEqual(1);
      let actualText: string = (content.normal as notification.NotificationBasicContent).text;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualText), String('body'));
      expect(actualText).assertEqual('body');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0020 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0021
     * @tc.name testVContent0021
     * @tc.desc initBasicNotificationContent 标题长度 255 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0021 begin');
      let title: string = buildRepeatedText(255);
      let basic: notification.NotificationBasicContent = { title: title, text: 'body' };
      let content: notification.NotificationContent = notificationContentUtil.initBasicNotificationContent(basic);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let actualTitle: string = (content.normal as notification.NotificationBasicContent).title;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualTitle.length), String(255));
      expect(actualTitle.length).assertEqual(255);
      let actualText: string = (content.normal as notification.NotificationBasicContent).text;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualText), String('body'));
      expect(actualText).assertEqual('body');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0021 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0022
     * @tc.name testVContent0022
     * @tc.desc initBasicNotificationContent 标题长度 4096 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0022 begin');
      let title: string = buildRepeatedText(4096);
      let basic: notification.NotificationBasicContent = { title: title, text: 'body' };
      let content: notification.NotificationContent = notificationContentUtil.initBasicNotificationContent(basic);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let actualTitle: string = (content.normal as notification.NotificationBasicContent).title;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualTitle.length), String(4096));
      expect(actualTitle.length).assertEqual(4096);
      let actualText: string = (content.normal as notification.NotificationBasicContent).text;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualText), String('body'));
      expect(actualText).assertEqual('body');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0022 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0023
     * @tc.name testVContent0023
     * @tc.desc initNotificationLongTextContent 长文本长度 0 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0023 begin');
      let longTextValue: string = buildRepeatedText(0);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationLongTextContent(basic, longTextValue, 'brief', 'expanded');
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let actualLongText: string = (content.longText as notification.NotificationLongTextContent).longText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualLongText.length), String(0));
      expect(actualLongText.length).assertEqual(0);
      let actualBrief: string = (content.longText as notification.NotificationLongTextContent).briefText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualBrief), String('brief'));
      expect(actualBrief).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0023 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0024
     * @tc.name testVContent0024
     * @tc.desc initNotificationLongTextContent 长文本长度 1 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0024 begin');
      let longTextValue: string = buildRepeatedText(1);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationLongTextContent(basic, longTextValue, 'brief', 'expanded');
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let actualLongText: string = (content.longText as notification.NotificationLongTextContent).longText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualLongText.length), String(1));
      expect(actualLongText.length).assertEqual(1);
      let actualBrief: string = (content.longText as notification.NotificationLongTextContent).briefText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualBrief), String('brief'));
      expect(actualBrief).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0024 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0025
     * @tc.name testVContent0025
     * @tc.desc initNotificationLongTextContent 长文本长度 64 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0025 begin');
      let longTextValue: string = buildRepeatedText(64);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationLongTextContent(basic, longTextValue, 'brief', 'expanded');
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let actualLongText: string = (content.longText as notification.NotificationLongTextContent).longText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualLongText.length), String(64));
      expect(actualLongText.length).assertEqual(64);
      let actualBrief: string = (content.longText as notification.NotificationLongTextContent).briefText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualBrief), String('brief'));
      expect(actualBrief).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0025 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0026
     * @tc.name testVContent0026
     * @tc.desc initNotificationLongTextContent 长文本长度 255 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0026 begin');
      let longTextValue: string = buildRepeatedText(255);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationLongTextContent(basic, longTextValue, 'brief', 'expanded');
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let actualLongText: string = (content.longText as notification.NotificationLongTextContent).longText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualLongText.length), String(255));
      expect(actualLongText.length).assertEqual(255);
      let actualBrief: string = (content.longText as notification.NotificationLongTextContent).briefText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualBrief), String('brief'));
      expect(actualBrief).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0026 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0027
     * @tc.name testVContent0027
     * @tc.desc initNotificationLongTextContent 长文本长度 1024 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0027 begin');
      let longTextValue: string = buildRepeatedText(1024);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationLongTextContent(basic, longTextValue, 'brief', 'expanded');
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let actualLongText: string = (content.longText as notification.NotificationLongTextContent).longText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualLongText.length), String(1024));
      expect(actualLongText.length).assertEqual(1024);
      let actualBrief: string = (content.longText as notification.NotificationLongTextContent).briefText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualBrief), String('brief'));
      expect(actualBrief).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0027 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0028
     * @tc.name testVContent0028
     * @tc.desc initNotificationLongTextContent 长文本长度 4096 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0028 begin');
      let longTextValue: string = buildRepeatedText(4096);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationLongTextContent(basic, longTextValue, 'brief', 'expanded');
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let actualLongText: string = (content.longText as notification.NotificationLongTextContent).longText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualLongText.length), String(4096));
      expect(actualLongText.length).assertEqual(4096);
      let actualBrief: string = (content.longText as notification.NotificationLongTextContent).briefText;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualBrief), String('brief'));
      expect(actualBrief).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0028 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0029
     * @tc.name testVContent0029
     * @tc.desc initNotificationMultiLineContent 概要长度 0 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0029 begin');
      let brief: string = buildRepeatedText(0);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, brief, 'longTitle', buildLines(2));
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText.length), String(0));
      expect(multiLine.briefText.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(2));
      expect(multiLine.lines.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0029 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0030
     * @tc.name testVContent0030
     * @tc.desc initNotificationMultiLineContent 概要长度 1 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0030 begin');
      let brief: string = buildRepeatedText(1);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, brief, 'longTitle', buildLines(2));
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText.length), String(1));
      expect(multiLine.briefText.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(2));
      expect(multiLine.lines.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0030 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0031
     * @tc.name testVContent0031
     * @tc.desc initNotificationMultiLineContent 概要长度 64 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0031 begin');
      let brief: string = buildRepeatedText(64);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, brief, 'longTitle', buildLines(2));
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText.length), String(64));
      expect(multiLine.briefText.length).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(2));
      expect(multiLine.lines.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0031 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0032
     * @tc.name testVContent0032
     * @tc.desc initNotificationMultiLineContent 概要长度 255 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0032 begin');
      let brief: string = buildRepeatedText(255);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, brief, 'longTitle', buildLines(2));
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText.length), String(255));
      expect(multiLine.briefText.length).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(2));
      expect(multiLine.lines.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0032 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0033
     * @tc.name testVContent0033
     * @tc.desc initNotificationMultiLineContent 概要长度 1024 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0033 begin');
      let brief: string = buildRepeatedText(1024);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, brief, 'longTitle', buildLines(2));
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText.length),
          String(1024));
      expect(multiLine.briefText.length).assertEqual(1024);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(2));
      expect(multiLine.lines.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0033 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0034
     * @tc.name testVContent0034
     * @tc.desc initNotificationPictureContent 展开标题长度 0 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0034 begin');
      let expanded: string = buildRepeatedText(0);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let pixelMap: image.PixelMap = createPixelMap(1, 1);
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', expanded, pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle.length), String(0));
      expect(picture.expandedTitle.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.briefText), String('brief'));
      expect(picture.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0034 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0035
     * @tc.name testVContent0035
     * @tc.desc initNotificationPictureContent 展开标题长度 1 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0035 begin');
      let expanded: string = buildRepeatedText(1);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let pixelMap: image.PixelMap = createPixelMap(1, 1);
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', expanded, pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle.length), String(1));
      expect(picture.expandedTitle.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.briefText), String('brief'));
      expect(picture.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0035 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0036
     * @tc.name testVContent0036
     * @tc.desc initNotificationPictureContent 展开标题长度 64 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0036 begin');
      let expanded: string = buildRepeatedText(64);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let pixelMap: image.PixelMap = createPixelMap(1, 1);
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', expanded, pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle.length),
          String(64));
      expect(picture.expandedTitle.length).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.briefText), String('brief'));
      expect(picture.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0036 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0037
     * @tc.name testVContent0037
     * @tc.desc initNotificationPictureContent 展开标题长度 255 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0037 begin');
      let expanded: string = buildRepeatedText(255);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let pixelMap: image.PixelMap = createPixelMap(1, 1);
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', expanded, pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle.length),
          String(255));
      expect(picture.expandedTitle.length).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.briefText), String('brief'));
      expect(picture.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0037 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0038
     * @tc.name testVContent0038
     * @tc.desc initNotificationPictureContent 展开标题长度 1024 档原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0038 begin');
      let expanded: string = buildRepeatedText(1024);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let pixelMap: image.PixelMap = createPixelMap(1, 1);
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', expanded, pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle.length),
          String(1024));
      expect(picture.expandedTitle.length).assertEqual(1024);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.briefText), String('brief'));
      expect(picture.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0038 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0039
     * @tc.name testVContent0039
     * @tc.desc initNotificationMultiLineContent 多行条目 0 条档全部保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0039 begin');
      let lines: string[] = buildLines(0);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', lines);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(0));
      expect(multiLine.lines.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText), String('brief'));
      expect(multiLine.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0039 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0040
     * @tc.name testVContent0040
     * @tc.desc initNotificationMultiLineContent 多行条目 1 条档全部保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0040 begin');
      let lines: string[] = buildLines(1);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', lines);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(1));
      expect(multiLine.lines.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText), String('brief'));
      expect(multiLine.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0040 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0041
     * @tc.name testVContent0041
     * @tc.desc initNotificationMultiLineContent 多行条目 2 条档全部保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0041 begin');
      let lines: string[] = buildLines(2);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', lines);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(2));
      expect(multiLine.lines.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText), String('brief'));
      expect(multiLine.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0041 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0042
     * @tc.name testVContent0042
     * @tc.desc initNotificationMultiLineContent 多行条目 3 条档全部保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0042 begin');
      let lines: string[] = buildLines(3);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', lines);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(3));
      expect(multiLine.lines.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText), String('brief'));
      expect(multiLine.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0042 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0043
     * @tc.name testVContent0043
     * @tc.desc initNotificationMultiLineContent 多行条目 10 条档全部保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0043 begin');
      let lines: string[] = buildLines(10);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', lines);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(10));
      expect(multiLine.lines.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText), String('brief'));
      expect(multiLine.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0043 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0044
     * @tc.name testVContent0044
     * @tc.desc initNotificationMultiLineContent 多行条目 100 条档全部保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0044 begin');
      let lines: string[] = buildLines(100);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', lines);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(100));
      expect(multiLine.lines.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText), String('brief'));
      expect(multiLine.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0044 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0045
     * @tc.name testVContent0045
     * @tc.desc initNotificationMultiLineContent 多行条目 1000 条档全部保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0045 begin');
      let lines: string[] = buildLines(1000);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', lines);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(1000));
      expect(multiLine.lines.length).assertEqual(1000);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.briefText), String('brief'));
      expect(multiLine.briefText).assertEqual('brief');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0045 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0046
     * @tc.name testVContent0046
     * @tc.desc initNotificationPictureContent 图片 1x1 档引用原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0046 begin');
      let pixelMap: image.PixelMap = createPixelMap(1, 1);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', 'expanded', pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(picture.picture === pixelMap));
      expect(picture.picture === pixelMap).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle),
          String('expanded'));
      expect(picture.expandedTitle).assertEqual('expanded');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0046 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0047
     * @tc.name testVContent0047
     * @tc.desc initNotificationPictureContent 图片 8x8 档引用原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0047 begin');
      let pixelMap: image.PixelMap = createPixelMap(8, 8);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', 'expanded', pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(picture.picture === pixelMap));
      expect(picture.picture === pixelMap).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle),
          String('expanded'));
      expect(picture.expandedTitle).assertEqual('expanded');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0047 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0048
     * @tc.name testVContent0048
     * @tc.desc initNotificationPictureContent 图片 64x64 档引用原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0048 begin');
      let pixelMap: image.PixelMap = createPixelMap(64, 64);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', 'expanded', pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(picture.picture === pixelMap));
      expect(picture.picture === pixelMap).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle),
          String('expanded'));
      expect(picture.expandedTitle).assertEqual('expanded');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0048 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_0049
     * @tc.name testVContent0049
     * @tc.desc initNotificationPictureContent 图片 256x256 档引用原样保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContent0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0049 begin');
      let pixelMap: image.PixelMap = createPixelMap(256, 256);
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', 'expanded', pixelMap);
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let picture: notification.NotificationPictureContent = content.picture as notification.NotificationPictureContent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(picture.picture === pixelMap));
      expect(picture.picture === pixelMap).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(picture.expandedTitle),
          String('expanded'));
      expect(picture.expandedTitle).assertEqual('expanded');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContent0049 end');
    });

    });
}
