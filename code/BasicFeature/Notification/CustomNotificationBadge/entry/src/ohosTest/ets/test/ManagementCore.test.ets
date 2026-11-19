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

// 契约层：notificationManagement 的分组、计数、角标与复位。
// 分组槽位按 ContentType（0~6，共 7 个，含 LIVE_VIEW）划分；越界类型不进组也不改角标。
// 期望值来自源码分支推演与 ContentType 规格常量；真实系统投递（publish/cancel/badge）
// 只断言"不抛异常 + 本地计数一致"，跨进程副作用留给手工验证。
import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationManagement, GetAllNotificationsResultType } from '@ohos/notification';
import { resetManagementState } from './helper/StateReset';
import { settleAsync } from './helper/TestContext';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';
const SLOT_COUNT: number = 7;
const OUT_OF_RANGE_LOW: number = -1;
const OUT_OF_RANGE_HIGH: number = 7;
const UNKNOWN_TYPE: number = 99;
const SCALE_TOTAL: number = 200;
const SCALE_PER_TYPE: number = 40;
const SCALE_TYPE_COUNT: number = 5;

function buildRequest(id: number, typeId: number): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: typeId as notification.ContentType
    };
    return {
        id: id,
        content: content,
        notificationSlotType: notification.SlotType.CONTENT_INFORMATION
    };
}

async function addQuietly(request: notification.NotificationRequest): Promise<void> {
    try {
        await notificationManagement.addNotification(request);
    } catch (err) {
        hilog.error(DOMAIN, TAG, 'addNotification rejected, error=%{public}s', JSON.stringify(err));
    }
}

function sumCounts(): number {
    let total: number = 0;
    for (let i = 0; i < notificationManagement.countsByType.length; i++) {
        total += notificationManagement.countsByType[i];
    }
    return total;
}

function countNonEmptyGroups(): number {
    let nonEmpty: number = 0;
    for (let i = 0; i < notificationManagement.typeNotifications.length; i++) {
        if (notificationManagement.typeNotifications[i].length > 0) {
            nonEmpty += 1;
        }
    }
    return nonEmpty;
}

function invokeCancel(typeId: number): string {
    try {
        notificationManagement.cancelNotificationType(typeId);
        return '';
    } catch (err) {
        return JSON.stringify(err);
    }
}

export default function managementCoreTest() {
    describe('ManagementCore', () => {
        beforeAll(async () => {
            // 等构造期的 getActiveNotifications 回调落地后再复位，避免异步回填污染用例
            await settleAsync(300);
            resetManagementState();
        });

        beforeEach(() => {
            resetManagementState();
        });

        /**
         * @tc.number SUB_CNB_MGMT_0001
         * @tc.name testManagement0001
         * @tc.desc 合法值：基本文本通知计入 0 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let actual: number = notificationManagement.countsByType[0];
            hilog.info(DOMAIN, TAG, 'counts0=%{public}d', actual);
            expect(actual).assertEqual(1);
            expect(notificationManagement.typeNotifications[0].length).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0002
         * @tc.name testManagement0002
         * @tc.desc 合法值：长文本通知计入 1 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            hilog.info(DOMAIN, TAG, 'counts1=%{public}d', notificationManagement.countsByType[1]);
            expect(notificationManagement.countsByType[1]).assertEqual(1);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
            expect(notificationManagement.typeNotifications[1].length).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0003
         * @tc.name testManagement0003
         * @tc.desc 合法值：图片通知计入 2 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            await addQuietly(buildRequest(3, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            hilog.info(DOMAIN, TAG, 'counts2=%{public}d', notificationManagement.countsByType[2]);
            expect(notificationManagement.countsByType[2]).assertEqual(1);
            expect(notificationManagement.typeNotifications[2].length).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0004
         * @tc.name testManagement0004
         * @tc.desc 合法值：社交通知计入 3 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            await addQuietly(buildRequest(4, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            hilog.info(DOMAIN, TAG, 'counts3=%{public}d', notificationManagement.countsByType[3]);
            expect(notificationManagement.countsByType[3]).assertEqual(1);
            expect(notificationManagement.countsByType[2]).assertEqual(0);
            expect(notificationManagement.typeNotifications[3].length).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0005
         * @tc.name testManagement0005
         * @tc.desc 合法值：多行文本通知计入 4 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            await addQuietly(buildRequest(5, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            hilog.info(DOMAIN, TAG, 'counts4=%{public}d', notificationManagement.countsByType[4]);
            expect(notificationManagement.countsByType[4]).assertEqual(1);
            expect(notificationManagement.typeNotifications[4].length).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0006
         * @tc.name testManagement0006
         * @tc.desc 边界值：同类型连续 3 条累计为 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            for (let i = 0; i < 3; i++) {
                await addQuietly(buildRequest(i + 1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            }
            hilog.info(DOMAIN, TAG, 'counts0=%{public}d', notificationManagement.countsByType[0]);
            expect(notificationManagement.countsByType[0]).assertEqual(3);
            expect(notificationManagement.typeNotifications[0].length).assertEqual(3);
            expect(notificationManagement.getBadgeNumber()).assertEqual(3);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0007
         * @tc.name testManagement0007
         * @tc.desc 组合：5 种内容类型各 1 条时计数分散且总数为 5
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            for (let typeId = 0; typeId < SCALE_TYPE_COUNT; typeId++) {
                await addQuietly(buildRequest(typeId + 1, typeId));
                expect(notificationManagement.countsByType[typeId]).assertEqual(1);
            }
            hilog.info(DOMAIN, TAG, 'sum=%{public}d', sumCounts());
            expect(sumCounts()).assertEqual(SCALE_TYPE_COUNT);
            expect(countNonEmptyGroups()).assertEqual(SCALE_TYPE_COUNT);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0008
         * @tc.name testManagement0008
         * @tc.desc 状态：入组对象与入参请求为同一引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest =
                buildRequest(8, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            await addQuietly(request);
            let stored: notification.NotificationRequest = notificationManagement.typeNotifications[0][0];
            hilog.info(DOMAIN, TAG, 'sameRef=%{public}s', String(stored === request));
            expect(stored === request).assertTrue();
            expect(stored.id).assertEqual(8);
            expect(stored.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0009
         * @tc.name testManagement0009
         * @tc.desc 初始状态：复位后 7 个计数槽全部为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let counts: number[] = notificationManagement.countsByType;
            let zeroed: number = 0;
            for (let i = 0; i < counts.length; i++) {
                if (counts[i] === 0) {
                    zeroed += 1;
                }
            }
            hilog.info(DOMAIN, TAG, 'length=%{public}d zeroed=%{public}d', counts.length, zeroed);
            expect(counts.length).assertEqual(SLOT_COUNT);
            expect(zeroed).assertEqual(SLOT_COUNT);
            expect(sumCounts()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0010
         * @tc.name testManagement0010
         * @tc.desc 初始状态：复位后 7 个分组都非空引用且互不相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let groups: notification.NotificationRequest[][] = notificationManagement.typeNotifications;
            hilog.info(DOMAIN, TAG, 'length=%{public}d', groups.length);
            expect(groups.length).assertEqual(SLOT_COUNT);
            expect(groups[0] === groups[1]).assertFalse();
            expect(groups[6] === groups[5]).assertFalse();
            expect(countNonEmptyGroups()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0011
         * @tc.name testManagement0011
         * @tc.desc 边界值：LIVE_VIEW（6）是最后一个合法槽位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(11, notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW));
            hilog.info(DOMAIN, TAG, 'counts6=%{public}d', notificationManagement.countsByType[6]);
            expect(notificationManagement.countsByType[6]).assertEqual(1);
            expect(notificationManagement.countsByType[SLOT_COUNT - 1]).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0012
         * @tc.name testManagement0012
         * @tc.desc 非法输入：类型 7 越过上界，不入组也不计数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(12, OUT_OF_RANGE_HIGH));
            hilog.info(DOMAIN, TAG, 'sum=%{public}d', sumCounts());
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(countNonEmptyGroups()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0013
         * @tc.name testManagement0013
         * @tc.desc 非法输入：类型 -1 越过下界，不入组也不计数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(13, OUT_OF_RANGE_LOW));
            hilog.info(DOMAIN, TAG, 'sum=%{public}d', sumCounts());
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0014
         * @tc.name testManagement0014
         * @tc.desc 非法输入：类型 99 远越上界，状态保持复位态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(14, UNKNOWN_TYPE));
            hilog.info(DOMAIN, TAG, 'sum=%{public}d nonEmpty=%{public}d', sumCounts(), countNonEmptyGroups());
            expect(sumCounts()).assertEqual(0);
            expect(countNonEmptyGroups()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0015
         * @tc.name testManagement0015
         * @tc.desc 状态：同一请求对象重复投递两次各计一次
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest =
                buildRequest(15, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            await addQuietly(request);
            await addQuietly(request);
            let group: notification.NotificationRequest[] = notificationManagement.typeNotifications[0];
            hilog.info(DOMAIN, TAG, 'groupLength=%{public}d', group.length);
            expect(group.length).assertEqual(2);
            expect(notificationManagement.countsByType[0]).assertEqual(2);
            expect(group[0] === group[1]).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_MGMT_0016
         * @tc.name testManagement0016
         * @tc.desc 非法输入：类型 8 不入组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(16, SLOT_COUNT + 1));
            hilog.info(DOMAIN, TAG, 'sum=%{public}d', sumCounts());
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.countsByType[SLOT_COUNT - 1]).assertEqual(0);
            expect(countNonEmptyGroups()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0017
         * @tc.name testManagement0017
         * @tc.desc 非法输入：类型 100 不入组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(17, 100));
            hilog.info(DOMAIN, TAG, 'badge=%{public}d', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(sumCounts()).assertEqual(0);
            expect(sumCounts() < SLOT_COUNT).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_MGMT_0018
         * @tc.name testManagement0018
         * @tc.desc 非法输入：类型 -100 不入组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(18, -100));
            hilog.info(DOMAIN, TAG, 'sum=%{public}d', sumCounts());
            expect(sumCounts()).assertEqual(0);
            expect(countNonEmptyGroups()).assertEqual(0);
            expect(notificationManagement.typeNotifications[0].length).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0019
         * @tc.name testManagement0019
         * @tc.desc 极值：类型为最大安全整数时不入组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(19, Number.MAX_SAFE_INTEGER));
            hilog.info(DOMAIN, TAG, 'sum=%{public}d', sumCounts());
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(countNonEmptyGroups()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0020
         * @tc.name testManagement0020
         * @tc.desc 极值：类型为 NaN 时比较恒假，不入组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(20, Number.NaN));
            hilog.info(DOMAIN, TAG, 'sum=%{public}d', sumCounts());
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(countNonEmptyGroups()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0021
         * @tc.name testManagement0021
         * @tc.desc 组合：同一轮内先投递合法 6 号类型再投递越界 7 号类型，只有前者计入
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(21, notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW));
            await addQuietly(buildRequest(22, SLOT_COUNT));
            hilog.info(DOMAIN, TAG, 'counts6=%{public}d sum=%{public}d',
                notificationManagement.countsByType[6], sumCounts());
            expect(notificationManagement.countsByType[6]).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
            expect(notificationManagement.getBadgeNumber()).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0022
         * @tc.name testManagement0022
         * @tc.desc 非法输入：越界投递不改变已有角标读数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(23, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(24, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let before: number = notificationManagement.getBadgeNumber();
            await addQuietly(buildRequest(25, UNKNOWN_TYPE));
            let after: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'before=%{public}d after=%{public}d', before, after);
            expect(before).assertEqual(2);
            expect(after).assertEqual(before);
            expect(after === 3).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_MGMT_0023
         * @tc.name testManagement0023
         * @tc.desc 状态：越界投递后复位态结构不变（计数全 0、分组全空）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(26, OUT_OF_RANGE_LOW));
            await addQuietly(buildRequest(27, OUT_OF_RANGE_HIGH));
            hilog.info(DOMAIN, TAG, 'sum=%{public}d nonEmpty=%{public}d', sumCounts(), countNonEmptyGroups());
            expect(sumCounts()).assertEqual(0);
            expect(countNonEmptyGroups()).assertEqual(0);
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0024
         * @tc.name testManagement0024
         * @tc.desc 初始状态：无消息时角标读数为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'badge=%{public}d', badge);
            expect(badge).assertEqual(0);
            expect(badge < 1).assertTrue();
            expect(badge === 1).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_MGMT_0025
         * @tc.name testManagement0025
         * @tc.desc 合法值：投递 1 条后角标读数为 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            await addQuietly(buildRequest(31, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'badge=%{public}d', badge);
            expect(badge).assertEqual(1);
            expect(badge).assertEqual(sumCounts());
            expect(badge > 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_MGMT_0026
         * @tc.name testManagement0026
         * @tc.desc 边界值：投递 3 条后角标读数为 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            for (let i = 0; i < 3; i++) {
                await addQuietly(buildRequest(32 + i, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            }
            hilog.info(DOMAIN, TAG, 'badge=%{public}d', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(3);
            expect(notificationManagement.getBadgeNumber()).assertEqual(sumCounts());
            expect(notificationManagement.countsByType[1]).assertEqual(3);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0027
         * @tc.name testManagement0027
         * @tc.desc 组合：5 种类型各 1 条时角标为 5
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            for (let typeId = 0; typeId < SCALE_TYPE_COUNT; typeId++) {
                await addQuietly(buildRequest(40 + typeId, typeId));
            }
            hilog.info(DOMAIN, TAG, 'badge=%{public}d', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(5);
            expect(notificationManagement.getBadgeNumber()).assertEqual(sumCounts());
            expect(countNonEmptyGroups()).assertEqual(SCALE_TYPE_COUNT);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0028
         * @tc.name testManagement0028
         * @tc.desc 状态：累计 2 条后复位，角标回到 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            await addQuietly(buildRequest(50, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(51, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            let beforeReset: number = notificationManagement.getBadgeNumber();
            resetManagementState();
            let afterReset: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'before=%{public}d after=%{public}d', beforeReset, afterReset);
            expect(beforeReset).assertEqual(2);
            expect(afterReset).assertEqual(0);
            expect(afterReset < beforeReset).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_MGMT_0029
         * @tc.name testManagement0029
         * @tc.desc 状态：复位后 7 个计数槽逐项为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(60, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await addQuietly(buildRequest(61, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            resetManagementState();
            let firstNonZero: number = -1;
            for (let i = 0; i < SLOT_COUNT; i++) {
                if (notificationManagement.countsByType[i] !== 0 && firstNonZero < 0) {
                    firstNonZero = i;
                }
            }
            hilog.info(DOMAIN, TAG, 'firstNonZero=%{public}d', firstNonZero);
            expect(firstNonZero).assertEqual(-1);
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.countsByType[4]).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0030
         * @tc.name testManagement0030
         * @tc.desc 状态：复位后 7 个分组逐项清空
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(70, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            resetManagementState();
            let totalStored: number = 0;
            for (let i = 0; i < SLOT_COUNT; i++) {
                totalStored += notificationManagement.typeNotifications[i].length;
            }
            hilog.info(DOMAIN, TAG, 'totalStored=%{public}d', totalStored);
            expect(totalStored).assertEqual(0);
            expect(notificationManagement.typeNotifications[0].length).assertEqual(0);
            expect(countNonEmptyGroups()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0031
         * @tc.name testManagement0031
         * @tc.desc 状态：角标读数始终等于各分组计数之和
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let typeSequence: number[] = [0, 2, 2, 6];
            for (let i = 0; i < typeSequence.length; i++) {
                await addQuietly(buildRequest(80 + i, typeSequence[i]));
            }
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'badge=%{public}d sum=%{public}d', badge, sumCounts());
            expect(badge).assertEqual(4);
            expect(badge).assertEqual(sumCounts());
            expect(notificationManagement.countsByType[2]).assertEqual(2);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0032
         * @tc.name testManagement0032
         * @tc.desc 状态：复位后重新累计从 1 开始，不继承历史值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            for (let i = 0; i < 4; i++) {
                await addQuietly(buildRequest(90 + i, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            }
            resetManagementState();
            await addQuietly(buildRequest(95, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'badge=%{public}d', notificationManagement.getBadgeNumber());
            expect(notificationManagement.getBadgeNumber()).assertEqual(1);
            expect(notificationManagement.countsByType[0]).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0033
         * @tc.name testManagement0033
         * @tc.desc 边界值：空分组上取消该类型通知不抛异常且状态不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let errorText: string = invokeCancel(0);
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s badge=%{public}d',
                errorText, notificationManagement.getBadgeNumber());
            expect(errorText).assertEqual('');
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0034
         * @tc.name testManagement0034
         * @tc.desc 非法输入：取消类型 7 越过上界，分组下标不存在而抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let errorText: string = invokeCancel(OUT_OF_RANGE_HIGH);
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s', errorText);
            expect(errorText === '').assertFalse();
            expect(errorText.length > 0).assertTrue();
            expect(sumCounts()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0035
         * @tc.name testManagement0035
         * @tc.desc 非法输入：取消类型 -1 越过下界，同样抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let errorText: string = invokeCancel(OUT_OF_RANGE_LOW);
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s', errorText);
            expect(errorText === '').assertFalse();
            expect(errorText.length > 0).assertTrue();
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0036
         * @tc.name testManagement0036
         * @tc.desc 状态：越界取消失败后不污染分组与角标
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(96, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            let before: number = notificationManagement.getBadgeNumber();
            let errorText: string = invokeCancel(UNKNOWN_TYPE);
            let after: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'caught=%{public}s before=%{public}d after=%{public}d',
                String(errorText.length > 0), before, after);
            expect(errorText === '').assertFalse();
            expect(after).assertEqual(before);
            expect(notificationManagement.countsByType[2]).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0037
         * @tc.name testManagement0037
         * @tc.desc 规模：200 条混合投递后每类各 40 条、总数为 200
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            for (let i = 0; i < SCALE_TOTAL; i++) {
                await addQuietly(buildRequest(100 + i, i % SCALE_TYPE_COUNT));
            }
            let matchedTypes: number = 0;
            for (let typeId = 0; typeId < SCALE_TYPE_COUNT; typeId++) {
                if (notificationManagement.countsByType[typeId] === SCALE_PER_TYPE) {
                    matchedTypes += 1;
                }
            }
            hilog.info(DOMAIN, TAG, 'sum=%{public}d matchedTypes=%{public}d', sumCounts(), matchedTypes);
            expect(sumCounts()).assertEqual(SCALE_TOTAL);
            expect(matchedTypes).assertEqual(SCALE_TYPE_COUNT);
            expect(notificationManagement.getBadgeNumber()).assertEqual(SCALE_TOTAL);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0038
         * @tc.name testManagement0038
         * @tc.desc 组合：投递 - 空分组取消 - 再投递，计数按 2 累计
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(400, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            let cancelError: string = invokeCancel(5);
            await addQuietly(buildRequest(401, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            hilog.info(DOMAIN, TAG, 'cancelError=%{public}s counts4=%{public}d',
                cancelError, notificationManagement.countsByType[4]);
            expect(cancelError).assertEqual('');
            expect(notificationManagement.countsByType[4]).assertEqual(2);
            expect(notificationManagement.getBadgeNumber()).assertEqual(2);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0039
         * @tc.name testManagement0039
         * @tc.desc 结构：getAllNotifications 返回内部数组引用而非副本
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await addQuietly(buildRequest(500, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            let result: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            hilog.info(DOMAIN, TAG, 'groups=%{public}d counts=%{public}d',
                result.groupNotifications.length, result.countsByType.length);
            expect(result.groupNotifications === notificationManagement.typeNotifications).assertTrue();
            expect(result.countsByType === notificationManagement.countsByType).assertTrue();
            expect(result.countsByType[1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_MGMT_0040
         * @tc.name testManagement0040
         * @tc.desc 状态：相同操作序列在复位后重放得到相同计数快照
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            let sequence: number[] = [0, 0, 3, 4, 4, 6];
            let firstRun: number[] = [];
            for (let i = 0; i < sequence.length; i++) {
                await addQuietly(buildRequest(600 + i, sequence[i]));
            }
            for (let i = 0; i < SLOT_COUNT; i++) {
                firstRun.push(notificationManagement.countsByType[i]);
            }
            resetManagementState();
            for (let i = 0; i < sequence.length; i++) {
                await addQuietly(buildRequest(700 + i, sequence[i]));
            }
            let equalSlots: number = 0;
            for (let i = 0; i < SLOT_COUNT; i++) {
                if (notificationManagement.countsByType[i] === firstRun[i]) {
                    equalSlots += 1;
                }
            }
            hilog.info(DOMAIN, TAG, 'equalSlots=%{public}d sum=%{public}d', equalSlots, sumCounts());
            expect(equalSlots).assertEqual(SLOT_COUNT);
            expect(sumCounts()).assertEqual(sequence.length);
            expect(notificationManagement.getBadgeNumber()).assertEqual(sequence.length);
        });
    });
}
