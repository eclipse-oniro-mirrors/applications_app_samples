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

// 分组管理的越界、引用语义与 reset 实例更替。
// 期望值来源：main 修复后语义（越界保护不抛错、越界不进组不改角标、取消同步清空）+ 引用推演。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

export default function mgmtReal01Test() {
  describe('MgmtReal01', () => {
    /**
     * @tc.number SUB_CustomNotification_VMGMT_REAL_0001
     * @tc.name testVMgmtReal0001
     * @tc.desc 第 7 枚举槽位（索引 6）合法：取消空槽不抛错且角标不变
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVMgmtReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0001 begin');
      await notificationManagement.resetTypeNotificationState();
      await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      let badgeBefore: number = notificationManagement.getBadgeNumber();
      let failed: boolean = false;
      try {
        await notificationManagement.cancelNotificationType(6);
      } catch (error) {
        failed = true;
      }
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(failed));
      expect(failed).assertFalse();
      let badgeAfter: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badgeAfter), String(badgeBefore));
      expect(badgeAfter).assertEqual(badgeBefore);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badgeBefore), String(1));
      expect(badgeBefore).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0001 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_REAL_0002
     * @tc.name testVMgmtReal0002
     * @tc.desc 越界类型 99 不进入任何分组，角标保持 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVMgmtReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0002 begin');
      await notificationManagement.resetTypeNotificationState();
      await addQuietly(buildRequest(2, 99 as notification.ContentType));
      let all: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
      let countSum: number = 0;
      for (let i: number = 0; i < all.countsByType.length; i++) {
        countSum += all.countsByType[i];
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(countSum), String(0));
      expect(countSum).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(all.countsByType.length), String(7));
      expect(all.countsByType.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0002 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_REAL_0003
     * @tc.name testVMgmtReal0003
     * @tc.desc 六种类型各 1 条：每类计数为 1、角标为 6
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVMgmtReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0003 begin');
      await notificationManagement.resetTypeNotificationState();
      await addQuietly(buildRequest(10, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      await addQuietly(buildRequest(11, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      await addQuietly(buildRequest(12, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      await addQuietly(buildRequest(13, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      await addQuietly(buildRequest(14, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      await addQuietly(buildRequest(15, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(counts.length), String(7));
      expect(counts.length).assertEqual(7);
      for (let i: number = 0; i < 6; i++) {
        hilog.info(DOMAIN, TAG, 'index=%{public}d count=%{public}d expected=1', i, counts[i]);
        expect(counts[i]).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, 'index=6 count=%{public}d expected=0', String(counts[6]));
      expect(counts[6]).assertEqual(0);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(6));
      expect(badge).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0003 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_REAL_0004
     * @tc.name testVMgmtReal0004
     * @tc.desc reset 后分组元素换新实例：先取的分组引用仍保留旧数据
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmtReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0004 begin');
      await notificationManagement.resetTypeNotificationState();
      await addQuietly(buildRequest(20, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      let oldGroups: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      // getAllNotifications 返回内部数组引用，需在 reset 前另存分组元素引用，才能观察“旧数据保留”
      let firstGroupRef: notification.NotificationRequest[] = oldGroups[0];
      await notificationManagement.resetTypeNotificationState();
      let newGroups: notification.NotificationRequest[][] =
          (await notificationManagement.getAllNotifications()).groupNotifications;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(firstGroupRef.length), String(1));
      expect(firstGroupRef.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(oldGroups[0].length), String(0));
      expect(oldGroups[0].length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(oldGroups === newGroups));
      expect(oldGroups === newGroups).assertTrue();
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(oldGroups[0] !== firstGroupRef));
      expect(oldGroups[0] !== firstGroupRef).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0004 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VMGMT_REAL_0005
     * @tc.name testVMgmtReal0005
     * @tc.desc getAllNotifications 返回内部引用：直接改计数不会同步角标
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVMgmtReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0005 begin');
      await notificationManagement.resetTypeNotificationState();
      let snapshot: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
      snapshot.countsByType[0] += 1;
      let reread: number[] = (await notificationManagement.getAllNotifications()).countsByType;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(reread[0]), String(1));
      expect(reread[0]).assertEqual(1);
      let badge: number = notificationManagement.getBadgeNumber();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(badge), String(0));
      expect(badge).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(snapshot.countsByType === reread));
      expect(snapshot.countsByType === reread).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtReal0005 end');
    });

  });
}
