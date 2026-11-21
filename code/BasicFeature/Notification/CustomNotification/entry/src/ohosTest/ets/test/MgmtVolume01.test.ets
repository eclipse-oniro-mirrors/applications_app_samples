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

// notificationManagement 的分组累加、索引复位与角标一致性。
// 期望值来源：状态推演（每次 add 使对应类型 +1 且 badge +1，reset 归零）。
// beforeEach 统一 reset，保证 48 例之间零依赖。
import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationManagement, GetAllNotificationsResultType } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

function buildRequest(id: number, contentType: notification.ContentType): notification.NotificationRequest {
    let content: notification.NotificationContent = { notificationContentType: contentType };
    return { id: id, content: content, notificationSlotType: notification.SlotType.CONTENT_INFORMATION };
}

async function addQuietly(request: notification.NotificationRequest): Promise<void> {
    try {
        await notificationManagement.addNotification(request);
    } catch (error) {
        hilog.warn(DOMAIN, TAG, 'setBadgeNumber rejected after local state updated');
    }
}

function sumCounts(counts: number[]): number {
    let total: number = 0;
    for (let i: number = 0; i < counts.length; i++) {
        total += counts[i];
    }
    return total;
}

function sumGroups(groups: notification.NotificationRequest[][]): number {
    let total: number = 0;
    for (let i: number = 0; i < groups.length; i++) {
        total += groups[i].length;
    }
    return total;
}

export default function mgmtVolume01Test() {
    describe('MgmtVolume01', () => {
        beforeEach(async () => {
            await notificationManagement.resetTypeNotificationState();
        });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0001
     * @tc.name testVMgmt0001
     * @tc.desc 1 条基本文本（最小档）计数与角标同步
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0001 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT;
      for (let i: number = 0; i < 1; i++) {
          await addQuietly(buildRequest(0 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[0]), String(1));
      expect(counts[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[0].length), String(1));
      expect(result[0].length).assertEqual(1);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(1));
      expect(badge).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0001 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0002
     * @tc.name testVMgmt0002
     * @tc.desc 基本文本 连加 2 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0002 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT;
      for (let i: number = 0; i < 2; i++) {
          await addQuietly(buildRequest(0 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[0]), String(2));
      expect(counts[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[0].length), String(2));
      expect(result[0].length).assertEqual(2);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(2));
      expect(badge).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0002 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0003
     * @tc.name testVMgmt0003
     * @tc.desc 基本文本 连加 3 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0003 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT;
      for (let i: number = 0; i < 3; i++) {
          await addQuietly(buildRequest(0 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[0]), String(3));
      expect(counts[0]).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[0].length), String(3));
      expect(result[0].length).assertEqual(3);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(3));
      expect(badge).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0003 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0004
     * @tc.name testVMgmt0004
     * @tc.desc 基本文本 连加 5 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0004 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT;
      for (let i: number = 0; i < 5; i++) {
          await addQuietly(buildRequest(0 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[0]), String(5));
      expect(counts[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[0].length), String(5));
      expect(result[0].length).assertEqual(5);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(5));
      expect(badge).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0004 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0005
     * @tc.name testVMgmt0005
     * @tc.desc 基本文本 连加 10 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0005 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT;
      for (let i: number = 0; i < 10; i++) {
          await addQuietly(buildRequest(0 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[0]), String(10));
      expect(counts[0]).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[0].length), String(10));
      expect(result[0].length).assertEqual(10);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(10));
      expect(badge).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0005 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0006
     * @tc.name testVMgmt0006
     * @tc.desc 长文本 连加 1 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0006 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT;
      for (let i: number = 0; i < 1; i++) {
          await addQuietly(buildRequest(100 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[1]), String(1));
      expect(counts[1]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[1].length), String(1));
      expect(result[1].length).assertEqual(1);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(1));
      expect(badge).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0006 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0007
     * @tc.name testVMgmt0007
     * @tc.desc 长文本 连加 2 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0007 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT;
      for (let i: number = 0; i < 2; i++) {
          await addQuietly(buildRequest(100 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[1]), String(2));
      expect(counts[1]).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[1].length), String(2));
      expect(result[1].length).assertEqual(2);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(2));
      expect(badge).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0007 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0008
     * @tc.name testVMgmt0008
     * @tc.desc 长文本 连加 3 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0008 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT;
      for (let i: number = 0; i < 3; i++) {
          await addQuietly(buildRequest(100 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[1]), String(3));
      expect(counts[1]).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[1].length), String(3));
      expect(result[1].length).assertEqual(3);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(3));
      expect(badge).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0008 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0009
     * @tc.name testVMgmt0009
     * @tc.desc 长文本 连加 5 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0009 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT;
      for (let i: number = 0; i < 5; i++) {
          await addQuietly(buildRequest(100 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[1]), String(5));
      expect(counts[1]).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[1].length), String(5));
      expect(result[1].length).assertEqual(5);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(5));
      expect(badge).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0009 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0010
     * @tc.name testVMgmt0010
     * @tc.desc 长文本 连加 10 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0010 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT;
      for (let i: number = 0; i < 10; i++) {
          await addQuietly(buildRequest(100 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[1]), String(10));
      expect(counts[1]).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[1].length), String(10));
      expect(result[1].length).assertEqual(10);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(10));
      expect(badge).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0010 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0011
     * @tc.name testVMgmt0011
     * @tc.desc 图片 连加 1 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0011 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_PICTURE;
      for (let i: number = 0; i < 1; i++) {
          await addQuietly(buildRequest(200 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[2]), String(1));
      expect(counts[2]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[2].length), String(1));
      expect(result[2].length).assertEqual(1);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(1));
      expect(badge).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0011 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0012
     * @tc.name testVMgmt0012
     * @tc.desc 图片 连加 2 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0012 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_PICTURE;
      for (let i: number = 0; i < 2; i++) {
          await addQuietly(buildRequest(200 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[2]), String(2));
      expect(counts[2]).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[2].length), String(2));
      expect(result[2].length).assertEqual(2);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(2));
      expect(badge).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0012 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0013
     * @tc.name testVMgmt0013
     * @tc.desc 图片 连加 3 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0013 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_PICTURE;
      for (let i: number = 0; i < 3; i++) {
          await addQuietly(buildRequest(200 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[2]), String(3));
      expect(counts[2]).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[2].length), String(3));
      expect(result[2].length).assertEqual(3);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(3));
      expect(badge).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0013 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0014
     * @tc.name testVMgmt0014
     * @tc.desc 图片 连加 5 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0014 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_PICTURE;
      for (let i: number = 0; i < 5; i++) {
          await addQuietly(buildRequest(200 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[2]), String(5));
      expect(counts[2]).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[2].length), String(5));
      expect(result[2].length).assertEqual(5);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(5));
      expect(badge).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0014 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0015
     * @tc.name testVMgmt0015
     * @tc.desc 图片 连加 10 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0015 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_PICTURE;
      for (let i: number = 0; i < 10; i++) {
          await addQuietly(buildRequest(200 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[2]), String(10));
      expect(counts[2]).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[2].length), String(10));
      expect(result[2].length).assertEqual(10);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(10));
      expect(badge).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0015 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0016
     * @tc.name testVMgmt0016
     * @tc.desc 会话 连加 1 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0016 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION;
      for (let i: number = 0; i < 1; i++) {
          await addQuietly(buildRequest(300 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[3]), String(1));
      expect(counts[3]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[3].length), String(1));
      expect(result[3].length).assertEqual(1);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(1));
      expect(badge).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0016 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0017
     * @tc.name testVMgmt0017
     * @tc.desc 会话 连加 2 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0017 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION;
      for (let i: number = 0; i < 2; i++) {
          await addQuietly(buildRequest(300 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[3]), String(2));
      expect(counts[3]).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[3].length), String(2));
      expect(result[3].length).assertEqual(2);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(2));
      expect(badge).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0017 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0018
     * @tc.name testVMgmt0018
     * @tc.desc 会话 连加 3 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0018 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION;
      for (let i: number = 0; i < 3; i++) {
          await addQuietly(buildRequest(300 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[3]), String(3));
      expect(counts[3]).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[3].length), String(3));
      expect(result[3].length).assertEqual(3);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(3));
      expect(badge).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0018 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0019
     * @tc.name testVMgmt0019
     * @tc.desc 会话 连加 5 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0019 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION;
      for (let i: number = 0; i < 5; i++) {
          await addQuietly(buildRequest(300 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[3]), String(5));
      expect(counts[3]).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[3].length), String(5));
      expect(result[3].length).assertEqual(5);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(5));
      expect(badge).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0019 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0020
     * @tc.name testVMgmt0020
     * @tc.desc 会话 连加 10 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0020 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION;
      for (let i: number = 0; i < 10; i++) {
          await addQuietly(buildRequest(300 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[3]), String(10));
      expect(counts[3]).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[3].length), String(10));
      expect(result[3].length).assertEqual(10);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(10));
      expect(badge).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0020 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0021
     * @tc.name testVMgmt0021
     * @tc.desc 多行文本 连加 1 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0021 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_MULTILINE;
      for (let i: number = 0; i < 1; i++) {
          await addQuietly(buildRequest(400 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[4]), String(1));
      expect(counts[4]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[4].length), String(1));
      expect(result[4].length).assertEqual(1);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(1));
      expect(badge).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0021 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0022
     * @tc.name testVMgmt0022
     * @tc.desc 多行文本 连加 2 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0022 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_MULTILINE;
      for (let i: number = 0; i < 2; i++) {
          await addQuietly(buildRequest(400 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[4]), String(2));
      expect(counts[4]).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[4].length), String(2));
      expect(result[4].length).assertEqual(2);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(2));
      expect(badge).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0022 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0023
     * @tc.name testVMgmt0023
     * @tc.desc 多行文本 连加 3 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0023 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_MULTILINE;
      for (let i: number = 0; i < 3; i++) {
          await addQuietly(buildRequest(400 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[4]), String(3));
      expect(counts[4]).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[4].length), String(3));
      expect(result[4].length).assertEqual(3);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(3));
      expect(badge).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0023 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0024
     * @tc.name testVMgmt0024
     * @tc.desc 多行文本 连加 5 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0024 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_MULTILINE;
      for (let i: number = 0; i < 5; i++) {
          await addQuietly(buildRequest(400 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[4]), String(5));
      expect(counts[4]).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[4].length), String(5));
      expect(result[4].length).assertEqual(5);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(5));
      expect(badge).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0024 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0025
     * @tc.name testVMgmt0025
     * @tc.desc 多行文本 连加 10 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0025 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_MULTILINE;
      for (let i: number = 0; i < 10; i++) {
          await addQuietly(buildRequest(400 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[4]), String(10));
      expect(counts[4]).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[4].length), String(10));
      expect(result[4].length).assertEqual(10);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(10));
      expect(badge).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0025 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0026
     * @tc.name testVMgmt0026
     * @tc.desc 实况窗 连加 1 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0026 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW;
      for (let i: number = 0; i < 1; i++) {
          await addQuietly(buildRequest(500 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[5]), String(1));
      expect(counts[5]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[5].length), String(1));
      expect(result[5].length).assertEqual(1);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(1));
      expect(badge).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0026 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0027
     * @tc.name testVMgmt0027
     * @tc.desc 实况窗 连加 2 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0027 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW;
      for (let i: number = 0; i < 2; i++) {
          await addQuietly(buildRequest(500 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[5]), String(2));
      expect(counts[5]).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[5].length), String(2));
      expect(result[5].length).assertEqual(2);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(2));
      expect(badge).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0027 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0028
     * @tc.name testVMgmt0028
     * @tc.desc 实况窗 连加 3 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0028 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW;
      for (let i: number = 0; i < 3; i++) {
          await addQuietly(buildRequest(500 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[5]), String(3));
      expect(counts[5]).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[5].length), String(3));
      expect(result[5].length).assertEqual(3);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(3));
      expect(badge).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0028 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0029
     * @tc.name testVMgmt0029
     * @tc.desc 实况窗 连加 5 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0029 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW;
      for (let i: number = 0; i < 5; i++) {
          await addQuietly(buildRequest(500 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[5]), String(5));
      expect(counts[5]).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[5].length), String(5));
      expect(result[5].length).assertEqual(5);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(5));
      expect(badge).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0029 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0030
     * @tc.name testVMgmt0030
     * @tc.desc 实况窗 连加 10 条：类型计数、分组长度与角标一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0030 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW;
      for (let i: number = 0; i < 10; i++) {
          await addQuietly(buildRequest(500 + i, contentType));
      }
      let result: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[5]), String(10));
      expect(counts[5]).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result[5].length), String(10));
      expect(result[5].length).assertEqual(10);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(10));
      expect(badge).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0030 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0031
     * @tc.name testVMgmt0031
     * @tc.desc 基本文本 索引 0：加 2 条后 reset 归零且角标清零
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0031 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT;
      await addQuietly(buildRequest(0, contentType));
      await addQuietly(buildRequest(1, contentType));
      await notificationManagement.resetTypeNotificationState();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[0]), String(0));
      expect(counts[0]).assertEqual(0);
      let groups: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groups[0].length), String(0));
      expect(groups[0].length).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0031 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0032
     * @tc.name testVMgmt0032
     * @tc.desc 基本文本 索引 0：空分组取消不抛错且计数保持 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0032 begin');
      let failed: boolean = false;
      try {
          await notificationManagement.cancelNotificationType(0);
      } catch (error) {
          failed = true;
      }
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(failed));
      expect(failed).assertFalse();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[0]), String(0));
      expect(counts[0]).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0032 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0033
     * @tc.name testVMgmt0033
     * @tc.desc 长文本 索引 1：加 2 条后 reset 归零且角标清零
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0033 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT;
      await addQuietly(buildRequest(100, contentType));
      await addQuietly(buildRequest(101, contentType));
      await notificationManagement.resetTypeNotificationState();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[1]), String(0));
      expect(counts[1]).assertEqual(0);
      let groups: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groups[1].length), String(0));
      expect(groups[1].length).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0033 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0034
     * @tc.name testVMgmt0034
     * @tc.desc 长文本 索引 1：空分组取消不抛错且计数保持 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0034 begin');
      let failed: boolean = false;
      try {
          await notificationManagement.cancelNotificationType(1);
      } catch (error) {
          failed = true;
      }
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(failed));
      expect(failed).assertFalse();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[1]), String(0));
      expect(counts[1]).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0034 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0035
     * @tc.name testVMgmt0035
     * @tc.desc 图片 索引 2：加 2 条后 reset 归零且角标清零
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0035 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_PICTURE;
      await addQuietly(buildRequest(200, contentType));
      await addQuietly(buildRequest(201, contentType));
      await notificationManagement.resetTypeNotificationState();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[2]), String(0));
      expect(counts[2]).assertEqual(0);
      let groups: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groups[2].length), String(0));
      expect(groups[2].length).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0035 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0036
     * @tc.name testVMgmt0036
     * @tc.desc 图片 索引 2：空分组取消不抛错且计数保持 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0036 begin');
      let failed: boolean = false;
      try {
          await notificationManagement.cancelNotificationType(2);
      } catch (error) {
          failed = true;
      }
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(failed));
      expect(failed).assertFalse();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[2]), String(0));
      expect(counts[2]).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0036 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0037
     * @tc.name testVMgmt0037
     * @tc.desc 会话 索引 3：加 2 条后 reset 归零且角标清零
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0037 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION;
      await addQuietly(buildRequest(300, contentType));
      await addQuietly(buildRequest(301, contentType));
      await notificationManagement.resetTypeNotificationState();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[3]), String(0));
      expect(counts[3]).assertEqual(0);
      let groups: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groups[3].length), String(0));
      expect(groups[3].length).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0037 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0038
     * @tc.name testVMgmt0038
     * @tc.desc 会话 索引 3：空分组取消不抛错且计数保持 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0038 begin');
      let failed: boolean = false;
      try {
          await notificationManagement.cancelNotificationType(3);
      } catch (error) {
          failed = true;
      }
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(failed));
      expect(failed).assertFalse();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[3]), String(0));
      expect(counts[3]).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0038 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0039
     * @tc.name testVMgmt0039
     * @tc.desc 多行文本 索引 4：加 2 条后 reset 归零且角标清零
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0039 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_MULTILINE;
      await addQuietly(buildRequest(400, contentType));
      await addQuietly(buildRequest(401, contentType));
      await notificationManagement.resetTypeNotificationState();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[4]), String(0));
      expect(counts[4]).assertEqual(0);
      let groups: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groups[4].length), String(0));
      expect(groups[4].length).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0039 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0040
     * @tc.name testVMgmt0040
     * @tc.desc 多行文本 索引 4：空分组取消不抛错且计数保持 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0040 begin');
      let failed: boolean = false;
      try {
          await notificationManagement.cancelNotificationType(4);
      } catch (error) {
          failed = true;
      }
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(failed));
      expect(failed).assertFalse();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[4]), String(0));
      expect(counts[4]).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0040 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0041
     * @tc.name testVMgmt0041
     * @tc.desc 实况窗 索引 5：加 2 条后 reset 归零且角标清零
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0041 begin');
      let contentType: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW;
      await addQuietly(buildRequest(500, contentType));
      await addQuietly(buildRequest(501, contentType));
      await notificationManagement.resetTypeNotificationState();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[5]), String(0));
      expect(counts[5]).assertEqual(0);
      let groups: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groups[5].length), String(0));
      expect(groups[5].length).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0041 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0042
     * @tc.name testVMgmt0042
     * @tc.desc 实况窗 索引 5：空分组取消不抛错且计数保持 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0042 begin');
      let failed: boolean = false;
      try {
          await notificationManagement.cancelNotificationType(5);
      } catch (error) {
          failed = true;
      }
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(failed));
      expect(failed).assertFalse();
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts[5]), String(0));
      expect(counts[5]).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0042 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0043
     * @tc.name testVMgmt0043
     * @tc.desc 六类型轮转共 1 条：类型计数之和、分组总数与角标相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0043 begin');
      let typeList: notification.ContentType[] = [
          notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
    notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
    notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
      ];
      for (let i: number = 0; i < 1; i++) {
          await addQuietly(buildRequest(300 + i, typeList[i % 6]));
      }
      let all: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
      let countSum: number = sumCounts(all.countsByType);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(countSum), String(1));
      expect(countSum).assertEqual(1);
      let groupSum: number = sumGroups(all.groupNotifications);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groupSum), String(1));
      expect(groupSum).assertEqual(1);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(1));
      expect(badge).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0043 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0044
     * @tc.name testVMgmt0044
     * @tc.desc 六类型轮转共 2 条：类型计数之和、分组总数与角标相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0044 begin');
      let typeList: notification.ContentType[] = [
          notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
    notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
    notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
      ];
      for (let i: number = 0; i < 2; i++) {
          await addQuietly(buildRequest(300 + i, typeList[i % 6]));
      }
      let all: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
      let countSum: number = sumCounts(all.countsByType);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(countSum), String(2));
      expect(countSum).assertEqual(2);
      let groupSum: number = sumGroups(all.groupNotifications);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groupSum), String(2));
      expect(groupSum).assertEqual(2);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(2));
      expect(badge).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0044 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0045
     * @tc.name testVMgmt0045
     * @tc.desc 六类型轮转共 3 条：类型计数之和、分组总数与角标相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0045 begin');
      let typeList: notification.ContentType[] = [
          notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
    notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
    notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
      ];
      for (let i: number = 0; i < 3; i++) {
          await addQuietly(buildRequest(300 + i, typeList[i % 6]));
      }
      let all: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
      let countSum: number = sumCounts(all.countsByType);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(countSum), String(3));
      expect(countSum).assertEqual(3);
      let groupSum: number = sumGroups(all.groupNotifications);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groupSum), String(3));
      expect(groupSum).assertEqual(3);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(3));
      expect(badge).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0045 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0046
     * @tc.name testVMgmt0046
     * @tc.desc 六类型轮转共 6 条：类型计数之和、分组总数与角标相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0046 begin');
      let typeList: notification.ContentType[] = [
          notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
    notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
    notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
      ];
      for (let i: number = 0; i < 6; i++) {
          await addQuietly(buildRequest(300 + i, typeList[i % 6]));
      }
      let all: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
      let countSum: number = sumCounts(all.countsByType);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(countSum), String(6));
      expect(countSum).assertEqual(6);
      let groupSum: number = sumGroups(all.groupNotifications);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groupSum), String(6));
      expect(groupSum).assertEqual(6);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(6));
      expect(badge).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0046 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0047
     * @tc.name testVMgmt0047
     * @tc.desc 六类型轮转共 12 条：类型计数之和、分组总数与角标相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0047 begin');
      let typeList: notification.ContentType[] = [
          notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
    notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
    notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
      ];
      for (let i: number = 0; i < 12; i++) {
          await addQuietly(buildRequest(300 + i, typeList[i % 6]));
      }
      let all: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
      let countSum: number = sumCounts(all.countsByType);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(countSum), String(12));
      expect(countSum).assertEqual(12);
      let groupSum: number = sumGroups(all.groupNotifications);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groupSum), String(12));
      expect(groupSum).assertEqual(12);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(12));
      expect(badge).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0047 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_0048
     * @tc.name testVMgmt0048
     * @tc.desc 六类型轮转共 30 条：类型计数之和、分组总数与角标相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0048 begin');
      let typeList: notification.ContentType[] = [
          notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
    notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
    notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
    notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
    notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
      ];
      for (let i: number = 0; i < 30; i++) {
          await addQuietly(buildRequest(300 + i, typeList[i % 6]));
      }
      let all: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
      let countSum: number = sumCounts(all.countsByType);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(countSum), String(30));
      expect(countSum).assertEqual(30);
      let groupSum: number = sumGroups(all.groupNotifications);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(groupSum), String(30));
      expect(groupSum).assertEqual(30);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(30));
      expect(badge).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmt0048 end');
    });

    });
}
