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

// notificationManagement 的扩展分支——多类型序列、返回对象引用语义、复位重建与越界保护。
// 期望值来源：ContentType 规格常量（0~5 共 6 个槽位）+ 源码分支推演
// （addNotification 有越界保护、cancelNotificationType 无越界保护、resetTypeNotificationState 重建数组实例）。
// 系统侧调用（cancel/setBadgeNumber）按计划只断言"不抛异常 + 本地状态一致"。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationManagement, GetAllNotificationsResultType } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const SLOT_COUNT: number = 7;
const OUT_OF_RANGE_TYPE: number = 99;

function buildRequest(id: number, contentType: notification.ContentType): notification.NotificationRequest {
    let content: notification.NotificationContent = { notificationContentType: contentType };
    return {
        id: id,
        content: content,
        notificationSlotType: notification.SlotType.CONTENT_INFORMATION
    };
}

function buildOutOfRangeRequest(id: number, typeId: number): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: typeId as notification.ContentType
    };
    return { id: id, content: content };
}

async function addQuietly(request: notification.NotificationRequest): Promise<void> {
    try {
        await notificationManagement.addNotification(request);
    } catch (error) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'addNotification rejected by system badge api');
    }
}

function sumCounts(): number {
    let total: number = 0;
    for (let i: number = 0; i < notificationManagement.countsByType.length; i++) {
        total += notificationManagement.countsByType[i];
    }
    return total;
}

function readGroup(typeId: number): notification.NotificationRequest[] {
    return notificationManagement.typeNotifications[typeId];
}

function groupIds(typeId: number): number[] {
    let result: number[] = [];
    let group: notification.NotificationRequest[] = readGroup(typeId);
    for (let i: number = 0; i < group.length; i++) {
        result.push(group[i].id as number);
    }
    return result;
}

export default function managementExtendedTest() {
    describe('ManagementExtended', () => {
        beforeEach(async () => {
            await notificationManagement.resetTypeNotificationState();
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0041
         * @tc.name testManagement0041
         * @tc.desc 同一类型连续添加 3 条：计数为 3，组内 id 顺序与添加顺序一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0041 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(3, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=3', readGroup(0).length);
            expect(readGroup(0).length).assertEqual(3);
            expect(notificationManagement.countsByType[0]).assertEqual(3);
            expect(groupIds(0)[0]).assertEqual(1);
            expect(groupIds(0)[2]).assertEqual(3);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0041 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0042
         * @tc.name testManagement0042
         * @tc.desc 同一类型连续添加 10 条：组长度与计数同步为 10，末条 id 为 10
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0042 begin');
            for (let i: number = 1; i <= 10; i++) {
                await addQuietly(buildRequest(i, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=10', readGroup(1).length);
            expect(readGroup(1).length).assertEqual(10);
            expect(notificationManagement.countsByType[1]).assertEqual(10);
            expect(groupIds(1)[9]).assertEqual(10);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0042 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0043
         * @tc.name testManagement0043
         * @tc.desc 6 种类型各添加 1 条：前 6 组各 1 条、第 7 组（LIVE_VIEW）为空、总计数 6
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0043 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(3, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(4, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            await addQuietly(buildRequest(5, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await addQuietly(buildRequest(6, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
            // 只写了 6 类（BASIC~SYSTEM_LIVE = 槽 0~5），槽 6（LIVE_VIEW）保持为空
            for (let i: number = 0; i < SLOT_COUNT - 1; i++) {
                hilog.info(DOMAIN, TAG, 'type=%{public}d actual=%{public}d, expected=1', i, readGroup(i).length);
                expect(readGroup(i).length).assertEqual(1);
            }
            hilog.info(DOMAIN, TAG, 'type=%{public}d actual=%{public}d, expected=0', SLOT_COUNT - 1,
                readGroup(SLOT_COUNT - 1).length);
            expect(readGroup(SLOT_COUNT - 1).length).assertEqual(0);
            expect(sumCounts()).assertEqual(6);
            expect(groupIds(5)[0]).assertEqual(6);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0043 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0044
         * @tc.name testManagement0044
         * @tc.desc 交错添加（0/1/0/2/0）：组 0 内 id 顺序保持 [1,3,5]，组 1 与组 2 各 1 条
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0044 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(3, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(4, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(5, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'group0=%{public}s, expected=[1,3,5]', JSON.stringify(groupIds(0)));
            expect(groupIds(0).length).assertEqual(3);
            expect(groupIds(0)[1]).assertEqual(3);
            expect(groupIds(1)[0]).assertEqual(2);
            expect(groupIds(2)[0]).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0044 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0045
         * @tc.name testManagement0045
         * @tc.desc 两类型交叉各 2 条：两组计数均为 2，且组内顺序与各自添加顺序一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0045 begin');
            await addQuietly(buildRequest(11, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await addQuietly(buildRequest(21, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(12, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await addQuietly(buildRequest(22, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'type4=%{public}d, expected=2', readGroup(4).length);
            expect(readGroup(4).length).assertEqual(2);
            expect(groupIds(4)[0]).assertEqual(11);
            expect(groupIds(4)[1]).assertEqual(12);
            expect(groupIds(0)[1]).assertEqual(22);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0045 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0046
         * @tc.name testManagement0046
         * @tc.desc 越界类型不参与计数：合法 2 条 + 越界 1 条后，counts 总和与角标均为 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0046 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildOutOfRangeRequest(3, OUT_OF_RANGE_TYPE));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=2', sumCounts());
            expect(sumCounts()).assertEqual(2);
            expect(readGroup(0).length).assertEqual(1);
            expect(readGroup(1).length).assertEqual(1);
            expect(notificationManagement.getBadgeNumber()).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0046 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0047
         * @tc.name testManagement0047
         * @tc.desc 越界类型（99）添加后 7 个分组长度全部保持 0，角标也保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0047 begin');
            await addQuietly(buildOutOfRangeRequest(99, OUT_OF_RANGE_TYPE));
            for (let i: number = 0; i < SLOT_COUNT; i++) {
                hilog.info(DOMAIN, TAG, 'type=%{public}d actual=%{public}d, expected=0', i, readGroup(i).length);
                expect(readGroup(i).length).assertEqual(0);
            }
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0047 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0048
         * @tc.name testManagement0048
         * @tc.desc 同 id 不同内容类型：两条进入各自分组，互不覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0048 begin');
            await addQuietly(buildRequest(7, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(7, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            hilog.info(DOMAIN, TAG, 'type0=%{public}d type2=%{public}d, expected=1/1',
                readGroup(0).length, readGroup(2).length);
            expect(readGroup(0).length).assertEqual(1);
            expect(readGroup(2).length).assertEqual(1);
            expect(sumCounts()).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0048 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0049
         * @tc.name testManagement0049
         * @tc.desc getAllNotifications 返回对象含两个字段，长度均为 6
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0049 begin');
            let result: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            hilog.info(DOMAIN, TAG, 'groups=%{public}d counts=%{public}d, expected=6/6',
                result.groupNotifications.length, result.countsByType.length);
            expect(result.groupNotifications.length).assertEqual(SLOT_COUNT);
            expect(result.countsByType.length).assertEqual(SLOT_COUNT);
            expect(result.groupNotifications[0].length + result.groupNotifications[1].length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0049 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0050
         * @tc.name testManagement0050
         * @tc.desc getAllNotifications 的 groupNotifications 与内部 typeNotifications 是同一引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0050 begin');
            await addQuietly(buildRequest(31, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            let result: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            let groups: notification.NotificationRequest[][] = result.groupNotifications;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=1', groups[3].length);
            expect(groups[3].length).assertEqual(1);
            expect(groups[3] === notificationManagement.typeNotifications[3]).assertTrue();
            expect(groups.length).assertEqual(SLOT_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0050 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0051
         * @tc.name testManagement0051
         * @tc.desc getAllNotifications 的 countsByType 与各组实际长度逐项相等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0051 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(3, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            let result: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            let counts: number[] = result.countsByType;
            let groups: notification.NotificationRequest[][] = result.groupNotifications;
            for (let i: number = 0; i < SLOT_COUNT; i++) {
                hilog.info(DOMAIN, TAG, 'type=%{public}d count=%{public}d group=%{public}d',
                    i, counts[i], groups[i].length);
                expect(counts[i]).assertEqual(groups[i].length);
            }
            expect(counts[0]).assertEqual(2);
            expect(counts[4]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0051 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0052
         * @tc.name testManagement0052
         * @tc.desc 空状态下 countsByType 全为 0 且长度仍为 6
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0052 begin');
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=6', notificationManagement.countsByType.length);
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.countsByType[5]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0052 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0053
         * @tc.name testManagement0053
         * @tc.desc getAllNotifications 不做拷贝：两次返回的分组数组是同一引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0053 begin');
            let first: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            let second: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            let firstGroups: notification.NotificationRequest[][] = first.groupNotifications;
            let secondGroups: notification.NotificationRequest[][] = second.groupNotifications;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=true', String(firstGroups === secondGroups));
            expect(firstGroups === secondGroups).assertTrue();
            expect(first.countsByType === second.countsByType).assertTrue();
            expect(firstGroups.length).assertEqual(SLOT_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0053 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0054
         * @tc.name testManagement0054
         * @tc.desc 复位后 6 个分组长度全部为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0054 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await notificationManagement.resetTypeNotificationState();
            for (let i: number = 0; i < SLOT_COUNT; i++) {
                hilog.info(DOMAIN, TAG, 'type=%{public}d actual=%{public}d, expected=0', i, readGroup(i).length);
                expect(readGroup(i).length).assertEqual(0);
            }
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0054 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0055
         * @tc.name testManagement0055
         * @tc.desc 复位重建数组实例：复位前后 typeNotifications[i] 不是同一引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0055 begin');
            let before: notification.NotificationRequest[] = readGroup(2);
            await notificationManagement.resetTypeNotificationState();
            let after: notification.NotificationRequest[] = readGroup(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(before === after));
            expect(before === after).assertFalse();
            expect(after.length).assertEqual(0);
            expect(readGroup(0) === readGroup(1)).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0055 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0056
         * @tc.name testManagement0056
         * @tc.desc 复位后角标归 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0056 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await notificationManagement.resetTypeNotificationState();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=0', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(sumCounts()).assertEqual(0);
            expect(readGroup(0).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0056 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0057
         * @tc.name testManagement0057
         * @tc.desc 复位后可继续添加：新通知进入干净分组，不残留旧数据
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0057 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await notificationManagement.resetTypeNotificationState();
            await addQuietly(buildRequest(9, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=1', readGroup(2).length);
            expect(readGroup(2).length).assertEqual(1);
            expect(groupIds(2)[0]).assertEqual(9);
            expect(notificationManagement.countsByType[2]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0057 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0058
         * @tc.name testManagement0058
         * @tc.desc 连续两次复位：计数仍全 0、长度仍 6、角标仍 0（幂等）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0058 begin');
            await notificationManagement.resetTypeNotificationState();
            await notificationManagement.resetTypeNotificationState();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=6', notificationManagement.countsByType.length);
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0058 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0059
         * @tc.name testManagement0059
         * @tc.desc 对空分组 0 调用取消：不抛异常，分组与计数保持为空
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0059 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(0);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancelNotificationType thrown on empty group');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            expect(readGroup(0).length).assertEqual(0);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0059 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0060
         * @tc.name testManagement0060
         * @tc.desc 对空分组 5 调用取消：不抛异常，计数保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0060 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(5);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancelNotificationType thrown on empty group');
            }
            expect(caught).assertFalse();
            expect(readGroup(5).length).assertEqual(0);
            expect(notificationManagement.countsByType[5]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0060 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0061
         * @tc.name testManagement0061
         * @tc.desc 越界索引（等于长度）调用取消：越界保护直接返回，不抛错不破坏状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0061 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(SLOT_COUNT);
            } catch (error) {
                caught = true;
                hilog.info(DOMAIN, TAG, '%{public}s', 'cancelNotificationType(SLOT_COUNT) unexpected throw');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            expect(readGroup(SLOT_COUNT - 1).length).assertEqual(0);
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0061 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0062
         * @tc.name testManagement0062
         * @tc.desc 负数索引 -1 调用取消：越界保护直接返回，不抛错且不破坏已有分组结构
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0062 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(-1);
            } catch (error) {
                caught = true;
                hilog.info(DOMAIN, TAG, '%{public}s', 'cancelNotificationType(-1) unexpected throw');
            }
            expect(caught).assertFalse();
            expect(readGroup(0).length).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0062 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0063
         * @tc.name testManagement0063
         * @tc.desc 对非空分组取消：本地分组与计数同步清空（修复后语义）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0063 begin');
            await addQuietly(buildRequest(41, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(0);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancelNotificationType thrown on non-empty group');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=0', readGroup(0).length);
            expect(caught).assertFalse();
            expect(readGroup(0).length).assertEqual(0);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0063 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0064
         * @tc.name testManagement0064
         * @tc.desc 复位后角标初值为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0064 begin');
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=0', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(notificationManagement.badgeNum).assertEqual(0);
            expect(sumCounts()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0064 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0065
         * @tc.name testManagement0065
         * @tc.desc setBadgeNumber(0) 后本地角标为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0065 begin');
            try {
                await notificationManagement.setBadgeNumber(0);
            } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s', 'setBadgeNumber rejected by system');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=0', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
            expect(notificationManagement.badgeNum).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0065 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0066
         * @tc.name testManagement0066
         * @tc.desc setBadgeNumber(7) 后本地角标为 7
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0066 begin');
            try {
                await notificationManagement.setBadgeNumber(7);
            } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s', 'setBadgeNumber rejected by system');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=7', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(7);
            expect(notificationManagement.badgeNum).assertEqual(7);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0066 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0067
         * @tc.name testManagement0067
         * @tc.desc 连续设置角标 3 再 9：本地值跟随最后一次设置
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0067 begin');
            try {
                await notificationManagement.setBadgeNumber(3);
                await notificationManagement.setBadgeNumber(9);
            } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s', 'setBadgeNumber rejected by system');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=9', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(9);
            expect(notificationManagement.getBadgeNumber() === 3).assertFalse();
            expect(notificationManagement.badgeNum).assertEqual(9);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0067 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0068
         * @tc.name testManagement0068
         * @tc.desc 设置角标不影响分组数据与计数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0068 begin');
            await addQuietly(buildRequest(51, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            try {
                await notificationManagement.setBadgeNumber(20);
            } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s', 'setBadgeNumber rejected by system');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=1', readGroup(4).length);
            expect(readGroup(4).length).assertEqual(1);
            expect(notificationManagement.countsByType[4]).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0068 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0069
         * @tc.name testManagement0069
         * @tc.desc 添加 1 条合法通知后角标与计数总和同时为 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0069 begin');
            await addQuietly(buildRequest(61, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            hilog.info(DOMAIN, TAG, 'badge=%{public}d sum=%{public}d, expected=1/1',
                notificationManagement.getBadgeNumber(), sumCounts());
            expect(notificationManagement.getBadgeNumber()).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
            expect(readGroup(3).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0069 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0070
         * @tc.name testManagement0070
         * @tc.desc 添加越界类型后角标与计数总和均为 0（越界既不分组也不加角标）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0070 begin');
            await addQuietly(buildOutOfRangeRequest(70, 12));
            hilog.info(DOMAIN, TAG, 'badge=%{public}d sum=%{public}d, expected=0/0',
                notificationManagement.getBadgeNumber(), sumCounts());
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(sumCounts()).assertEqual(0);
            expect(readGroup(0).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0070 end');
        });
    });
}
