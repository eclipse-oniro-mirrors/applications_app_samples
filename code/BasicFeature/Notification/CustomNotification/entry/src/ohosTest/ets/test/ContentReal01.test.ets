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

// 内容域边界、引用语义与负向行为。
// 期望值来源：字段优先级规格 + 引用传递推演（构造器不拷贝入参对象）。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

function buildLines(count: number): string[] {
    let result: string[] = [];
    for (let i: number = 0; i < count; i++) {
        result.push('line-' + i);
    }
    return result;
}

export default function contentReal01Test() {
    describe('ContentReal01', () => {
    /**
     * @tc.number SUB_CustomNotification_VCONTENT_REAL_0001
     * @tc.name testVContentReal0001
     * @tc.desc 新版与旧版字段冲突取新版，去掉新版后回落到旧版
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVContentReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0001 begin');
      let conflict: notification.NotificationContent = {
          notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          contentType: 0
      };
      let conflictId: number = notificationContentUtil.getContentTypeId(conflict);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(conflictId),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(conflictId).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let legacyOnly: notification.NotificationContent = { contentType: 0 };
      let legacyId: number = notificationContentUtil.getContentTypeId(legacyOnly);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(legacyId),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(legacyId).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(conflictId !== legacyId));
      expect(conflictId !== legacyId).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0001 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_REAL_0002
     * @tc.name testVContentReal0002
     * @tc.desc 越界值 99 与 -1 均原样返回，不被夹到合法区间
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVContentReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0002 begin');
      let outOfRange: notification.NotificationContent = { notificationContentType: 99 };
      let outId: number = notificationContentUtil.getContentTypeId(outOfRange);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(outId), String(99));
      expect(outId).assertEqual(99);
      let negative: notification.NotificationContent = { notificationContentType: -1 };
      let negativeId: number = notificationContentUtil.getContentTypeId(negative);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(negativeId), String(-1));
      expect(negativeId).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(outId === negativeId));
      expect(outId === negativeId).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0002 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_REAL_0003
     * @tc.name testVContentReal0003
     * @tc.desc 四个内容构造器分别产出一致的类型标记
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVContentReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0003 begin');
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let basicContent: notification.NotificationContent = notificationContentUtil.initBasicNotificationContent(basic);
      let basicId: number = notificationContentUtil.getContentTypeId(basicContent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(basicId),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(basicId).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let longContent: notification.NotificationContent =
          notificationContentUtil.initNotificationLongTextContent(basic, 'long', 'brief', 'expanded');
      let longId: number = notificationContentUtil.getContentTypeId(longContent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(longId),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(longId).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let multiContent: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', buildLines(2));
      let multiId: number = notificationContentUtil.getContentTypeId(multiContent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiId),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(multiId).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let pictureContent: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(basic, 'brief', 'expanded',
              image.createPixelMapSync({ size: { width: 1, height: 1 } }));
      let pictureId: number = notificationContentUtil.getContentTypeId(pictureContent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(pictureId),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(pictureId).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0003 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_REAL_0004
     * @tc.name testVContentReal0004
     * @tc.desc 构造后修改入参 basicContent，产物同步可见（未拷贝入参）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContentReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0004 begin');
      let basic: notification.NotificationBasicContent = { title: 'before', text: 'text' };
      let content: notification.NotificationContent = notificationContentUtil.initBasicNotificationContent(basic);
      basic.title = 'after';
      let actualTitle: string = (content.normal as notification.NotificationBasicContent).title;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualTitle), String('after'));
      expect(actualTitle).assertEqual('after');
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
          String((content.normal as notification.NotificationBasicContent) === basic));
      expect((content.normal as notification.NotificationBasicContent) === basic).assertTrue();
      let actualType: number = notificationContentUtil.getContentTypeId(content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0004 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VCONTENT_REAL_0005
     * @tc.name testVContentReal0005
     * @tc.desc 空 lines 入参得到 0 条多行内容，且产物与入参数组同引用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVContentReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0005 begin');
      let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
      let lines: string[] = buildLines(0);
      let content: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', lines);
      let multiLine: notification.NotificationMultiLineContent =
          content.multiLine as notification.NotificationMultiLineContent;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(0));
      expect(multiLine.lines.length).assertEqual(0);
      lines.push('late');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(multiLine.lines.length), String(1));
      expect(multiLine.lines.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(multiLine.lines === lines));
      expect(multiLine.lines === lines).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVContentReal0005 end');
    });

    });
}
