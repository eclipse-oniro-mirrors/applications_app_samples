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

// notificationManagement 的分组、计数、角标与复位。
// 分组槽位按 ContentType（0~6，共 7 个，含 LIVE_VIEW）划分；越界类型不进组也不改角标，
// 期望值来自源码分支推演与 ContentType 规格常量。系统侧投递（publish/cancel/badge）
// 按计划只断言"不抛异常 + 本地计数一致"，跨进程副作用留给手工验证。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationManagement, GetAllNotificationsResultType } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const SLOT_COUNT: number = 7;

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

export default function managementCoreTest() {
    describe('ManagementCore', () => {
        beforeEach(async () => {
            await notificationManagement.resetTypeNotificationState();
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0001
         * @tc.name testManagement0001
         * @tc.desc 初始状态：分组槽位固定为 6 个，且每组都是空数组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0001 begin');
            let groups: notification.NotificationRequest[][] = notificationManagement.typeNotifications;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', groups.length, SLOT_COUNT);
            expect(groups.length).assertEqual(SLOT_COUNT);
            expect(readGroup(0).length).assertEqual(0);
            expect(readGroup(5).length).assertEqual(0);
            expect(readGroup(5) === readGroup(4)).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0002
         * @tc.name testManagement0002
         * @tc.desc 初始状态：六个分组计数全部归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0002 begin');
            let counts: number[] = notificationManagement.countsByType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts.length, SLOT_COUNT);
            expect(counts.length).assertEqual(SLOT_COUNT);
            expect(counts[0]).assertEqual(0);
            expect(counts[3]).assertEqual(0);
            expect(sumCounts()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0003
         * @tc.name testManagement0003
         * @tc.desc 初始状态：角标读取器在无消息时返回 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0003 begin');
            let actual: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual, 0);
            expect(actual).assertEqual(0);
            expect(actual).assertEqual(notificationManagement.getBadgeNumber());
            expect(actual < 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0004
         * @tc.name testManagement0004
         * @tc.desc 结构：全量查询返回的分组与计数都是 6 项，且计数与内部分组一一对应
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0004 begin');
            let result: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d',
                result.groupNotifications.length, result.countsByType.length, SLOT_COUNT, SLOT_COUNT);
            expect(result.groupNotifications.length).assertEqual(SLOT_COUNT);
            expect(result.countsByType.length).assertEqual(SLOT_COUNT);
            expect(result.groupNotifications[2].length).assertEqual(result.countsByType[2]);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0005
         * @tc.name testManagement0005
         * @tc.desc 结构：全量查询返回的分组是内部维护数组的引用，而不是副本
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0005 begin');
            let result: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${result.groupNotifications === notificationManagement.typeNotifications}`, 'true');
            expect(result.groupNotifications === notificationManagement.typeNotifications).assertTrue();
            expect(result.countsByType === notificationManagement.countsByType).assertTrue();
            expect(result.groupNotifications[2] === readGroup(2)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0006
         * @tc.name testManagement0006
         * @tc.desc 状态：在干净状态下重复复位仍然保持全空，不引入额外数据
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0006 begin');
            await notificationManagement.resetTypeNotificationState();
            await notificationManagement.resetTypeNotificationState();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), 0);
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(readGroup(0).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0007
         * @tc.name testManagement0007
         * @tc.desc 合法值：基本文本通知落入 0 号分组并让该组计数为 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0007 begin');
            await addQuietly(buildRequest(11, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0).length, 1);
            expect(readGroup(0).length).assertEqual(1);
            expect(notificationManagement.countsByType[0]).assertEqual(1);
            expect(readGroup(0)[0].id).assertEqual(11);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0008
         * @tc.name testManagement0008
         * @tc.desc 合法值：长文本通知落入 1 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0008 begin');
            await addQuietly(buildRequest(12, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(1).length, 1);
            expect(readGroup(1).length).assertEqual(1);
            expect(notificationManagement.countsByType[1]).assertEqual(1);
            expect(readGroup(0).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0009
         * @tc.name testManagement0009
         * @tc.desc 合法值：图片通知落入 2 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0009 begin');
            await addQuietly(buildRequest(13, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(2).length, 1);
            expect(readGroup(2).length).assertEqual(1);
            expect(notificationManagement.countsByType[2]).assertEqual(1);
            expect(readGroup(2)[0].id).assertEqual(13);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0010
         * @tc.name testManagement0010
         * @tc.desc 边界值：应用未使用的会话类型仍按枚举值落入 3 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0010 begin');
            await addQuietly(buildRequest(14, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(3).length, 1);
            expect(readGroup(3).length).assertEqual(1);
            expect(notificationManagement.countsByType[3]).assertEqual(1);
            expect(notificationManagement.countsByType[4]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0011
         * @tc.name testManagement0011
         * @tc.desc 合法值：多行通知落入 4 号分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0011 begin');
            await addQuietly(buildRequest(15, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(4).length, 1);
            expect(readGroup(4).length).assertEqual(1);
            expect(notificationManagement.countsByType[4]).assertEqual(1);
            expect(readGroup(5).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0012
         * @tc.name testManagement0012
         * @tc.desc 边界值：实况窗类型落入第 6 个分组槽位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0012 begin');
            await addQuietly(buildRequest(16, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(5).length, 1);
            expect(readGroup(5).length).assertEqual(1);
            expect(notificationManagement.countsByType[5]).assertEqual(1);
            expect(notificationManagement.countsByType[5]).assertEqual(readGroup(5).length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0013
         * @tc.name testManagement0013
         * @tc.desc 非法值：内容对象缺省类型时按基本文本分组处理
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0013 begin');
            let request: notification.NotificationRequest = { id: 17, content: {} };
            await addQuietly(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0).length, 1);
            expect(readGroup(0).length).assertEqual(1);
            expect(readGroup(0)[0] === request).assertTrue();
            expect(notificationManagement.countsByType[0]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0014
         * @tc.name testManagement0014
         * @tc.desc 计数：单条消息只让所属分组计数为 1，其它分组保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testManagement0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0014 begin');
            await addQuietly(buildRequest(21, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), 1);
            expect(notificationManagement.countsByType[1]).assertEqual(1);
            expect(sumCounts()).assertEqual(1);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0015
         * @tc.name testManagement0015
         * @tc.desc 计数：同一分组连续三条消息后计数为 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0015 begin');
            await addQuietly(buildRequest(31, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(32, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(33, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.countsByType[0], 3);
            expect(readGroup(0).length).assertEqual(3);
            expect(notificationManagement.countsByType[0]).assertEqual(3);
            expect(sumCounts()).assertEqual(3);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0016
         * @tc.name testManagement0016
         * @tc.desc 组合值：七种类型各一条，七个分组计数同时为 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0016 begin');
            await addQuietly(buildRequest(41, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(42, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(43, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(44, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            await addQuietly(buildRequest(45, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await addQuietly(buildRequest(46, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
            await addQuietly(buildRequest(47, notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), SLOT_COUNT);
            expect(sumCounts()).assertEqual(SLOT_COUNT);
            expect(notificationManagement.countsByType[0]).assertEqual(1);
            expect(notificationManagement.countsByType[5]).assertEqual(1);
            expect(notificationManagement.countsByType[6]).assertEqual(1);
            expect(readGroup(3).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0017
         * @tc.name testManagement0017
         * @tc.desc 角标：每添加一条消息角标自增 1，与分组是否命中无关
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0017 begin');
            await addQuietly(buildRequest(51, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(52, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(53, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                3);
            expect(notificationManagement.getBadgeNumber()).assertEqual(3);
            expect(notificationManagement.getBadgeNumber()).assertEqual(sumCounts());
            expect(notificationManagement.getBadgeNumber() > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0018
         * @tc.name testManagement0018
         * @tc.desc 状态：添加后分组内保存的是入参请求对象的引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0018 begin');
            let request: notification.NotificationRequest =
                buildRequest(61, notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            await addQuietly(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${readGroup(2)[0] === request}`, 'true');
            expect(readGroup(2)[0] === request).assertTrue();
            expect(readGroup(2)[0].content === request.content).assertTrue();
            expect(readGroup(2)[0].id).assertEqual(61);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0019
         * @tc.name testManagement0019
         * @tc.desc 极值：类型值 99 超出分组上界，不进入任何分组，角标保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0019 begin');
            await addQuietly(buildOutOfRangeRequest(71, 99));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), 0);
            expect(sumCounts()).assertEqual(0);
            expect(readGroup(5).length).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0020
         * @tc.name testManagement0020
         * @tc.desc 极值：负类型值同样被越界保护拦截，角标保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0020 begin');
            await addQuietly(buildOutOfRangeRequest(72, -1));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(sumCounts()).assertEqual(0);
            expect(readGroup(0).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0020 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0021
         * @tc.name testManagement0021
         * @tc.desc 顺序：同类型多条消息按添加顺序保存在分组内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0021 begin');
            await addQuietly(buildRequest(81, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(82, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(83, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            let group: notification.NotificationRequest[] = readGroup(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d,%{public}d expected=%{public}d,%{public}d,%{public}d',
                group[0].id as number, group[1].id as number, group[2].id as number, 81, 82, 83);
            expect(group[0].id).assertEqual(81);
            expect(group[1].id).assertEqual(82);
            expect(group[2].id).assertEqual(83);
            expect(group.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0021 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0022
         * @tc.name testManagement0022
         * @tc.desc 顺序：不同类型交叉添加时，各分组独立维护自己的顺序
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0022 begin');
            await addQuietly(buildRequest(91, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(92, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(93, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d',
                readGroup(0)[1].id as number, readGroup(2)[0].id as number, 93, 92);
            expect(readGroup(0).length).assertEqual(2);
            expect(readGroup(0)[0].id).assertEqual(91);
            expect(readGroup(0)[1].id).assertEqual(93);
            expect(readGroup(2).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0022 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0023
         * @tc.name testManagement0023
         * @tc.desc 边界值：同一请求对象添加两次，分组中出现两个元素且都指向该对象
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0023 begin');
            let request: notification.NotificationRequest =
                buildRequest(101, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            await addQuietly(request);
            await addQuietly(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(4).length, 2);
            expect(readGroup(4).length).assertEqual(2);
            expect(readGroup(4)[0] === request).assertTrue();
            expect(readGroup(4)[1] === request).assertTrue();
            expect(notificationManagement.countsByType[4]).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0023 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0024
         * @tc.name testManagement0024
         * @tc.desc 边界值：不同 id 的消息都被保留，按 id 可区分
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0024 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(3).length, 2);
            expect(readGroup(3).length).assertEqual(2);
            expect(readGroup(3)[0].id).assertEqual(1);
            expect(readGroup(3)[0].id !== readGroup(3)[1].id).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0024 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0025
         * @tc.name testManagement0025
         * @tc.desc 一致性：添加消息后全量查询返回的计数与内部计数相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0025 begin');
            await addQuietly(buildRequest(111, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
            await addQuietly(buildRequest(112, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
            let result: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result.countsByType[5], 2);
            expect(result.countsByType[5]).assertEqual(2);
            expect(result.countsByType[5]).assertEqual(notificationManagement.countsByType[5]);
            expect(result.countsByType[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0025 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0026
         * @tc.name testManagement0026
         * @tc.desc 一致性：全量查询中每个分组的长度都等于对应分组的计数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0026 begin');
            await addQuietly(buildRequest(121, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(122, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(123, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            let result: GetAllNotificationsResultType = await notificationManagement.getAllNotifications();
            let matched: boolean = true;
            for (let i: number = 0; i < result.groupNotifications.length; i++) {
                if (result.groupNotifications[i].length !== result.countsByType[i]) {
                    matched = false;
                }
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', `${matched}`, 'true');
            expect(matched).assertTrue();
            expect(result.groupNotifications[1].length).assertEqual(2);
            expect(result.countsByType[2]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0026 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0027
         * @tc.name testManagement0027
         * @tc.desc 复位：复位后所有分组恢复为空数组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0027 begin');
            await addQuietly(buildRequest(131, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await notificationManagement.resetTypeNotificationState();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(2).length, 0);
            expect(readGroup(2).length).assertEqual(0);
            expect(readGroup(0).length).assertEqual(0);
            expect(readGroup(5).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0027 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0028
         * @tc.name testManagement0028
         * @tc.desc 复位：复位后六个分组的计数全部归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0028 begin');
            await addQuietly(buildRequest(141, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            await addQuietly(buildRequest(142, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            await notificationManagement.resetTypeNotificationState();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), 0);
            expect(notificationManagement.countsByType[3]).assertEqual(0);
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0028 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0029
         * @tc.name testManagement0029
         * @tc.desc 复位：复位把角标数量一并清零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0029 begin');
            await addQuietly(buildRequest(151, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await addQuietly(buildRequest(152, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await notificationManagement.resetTypeNotificationState();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber() < 1).assertTrue();
            expect(readGroup(4).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0029 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0030
         * @tc.name testManagement0030
         * @tc.desc 状态：复位为每个分组换成新数组，不复用旧数组实例
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0030 begin');
            let groupsBefore: notification.NotificationRequest[][] = notificationManagement.typeNotifications;
            let groupBefore: notification.NotificationRequest[] = readGroup(1);
            await notificationManagement.resetTypeNotificationState();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${readGroup(1) === groupBefore}`, 'false');
            expect(readGroup(1) === groupBefore).assertFalse();
            expect(notificationManagement.typeNotifications === groupsBefore).assertTrue();
            expect(readGroup(1).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0030 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0031
         * @tc.name testManagement0031
         * @tc.desc 状态：连续复位不抛异常，且状态仍为干净初始态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0031 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.resetTypeNotificationState();
                await notificationManagement.resetTypeNotificationState();
                await notificationManagement.resetTypeNotificationState();
            } catch (error) {
                caught = true;
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', `${caught}`, 'false');
            expect(caught).assertFalse();
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0031 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0032
         * @tc.name testManagement0032
         * @tc.desc 状态：复位后重新添加从零开始累计，不残留旧计数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0032 begin');
            await addQuietly(buildRequest(161, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(162, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await notificationManagement.resetTypeNotificationState();
            await addQuietly(buildRequest(163, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.countsByType[0], 1);
            expect(notificationManagement.countsByType[0]).assertEqual(1);
            expect(readGroup(0)[0].id).assertEqual(163);
            expect(notificationManagement.getBadgeNumber()).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0032 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0033
         * @tc.name testManagement0033
         * @tc.desc 边界值：对空分组执行取消不产生异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0033 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(0);
            } catch (error) {
                caught = true;
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', `${caught}`, 'false');
            expect(caught).assertFalse();
            expect(readGroup(0).length).assertEqual(0);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0033 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0034
         * @tc.name testManagement0034
         * @tc.desc 边界值：对最后一个空分组执行取消同样不产生异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0034 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(SLOT_COUNT - 1);
            } catch (error) {
                caught = true;
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', `${caught}`, 'false');
            expect(caught).assertFalse();
            expect(readGroup(5).length).assertEqual(0);
            expect(notificationManagement.countsByType[5]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0034 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0035
         * @tc.name testManagement0035
         * @tc.desc 组合值：取消 0 号空分组不影响已有其它分组的数据
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0035 begin');
            await addQuietly(buildRequest(171, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await notificationManagement.cancelNotificationType(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(2).length, 1);
            expect(readGroup(2).length).assertEqual(1);
            expect(readGroup(2)[0].id).assertEqual(171);
            expect(notificationManagement.countsByType[2]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0035 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0036
         * @tc.name testManagement0036
         * @tc.desc 状态：取消空分组不改变角标与总计数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0036 begin');
            await addQuietly(buildRequest(181, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(182, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await notificationManagement.cancelNotificationType(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                2);
            expect(notificationManagement.getBadgeNumber()).assertEqual(2);
            expect(sumCounts()).assertEqual(2);
            expect(readGroup(4).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0036 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0037
         * @tc.name testManagement0037
         * @tc.desc 合法值：设置角标为 0 不抛异常，读取器返回 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0037 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.setBadgeNumber(0);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'setBadgeNumber(0) rejected by system');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', `${caught}`, 'false');
            expect(caught).assertFalse();
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(sumCounts()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0037 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0038
         * @tc.name testManagement0038
         * @tc.desc 合法值：设置角标为指定值后读取器同步返回该值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testManagement0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0038 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.setBadgeNumber(4);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'setBadgeNumber(4) rejected by system');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                4);
            expect(caught).assertFalse();
            expect(notificationManagement.getBadgeNumber()).assertEqual(4);
            expect(notificationManagement.getBadgeNumber() > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0038 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0039
         * @tc.name testManagement0039
         * @tc.desc 状态：连续两次设置角标，后一次取值覆盖前一次
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0039 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.setBadgeNumber(2);
                await notificationManagement.setBadgeNumber(7);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'setBadgeNumber sequence rejected by system');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                7);
            expect(caught).assertFalse();
            expect(notificationManagement.getBadgeNumber()).assertEqual(7);
            expect(notificationManagement.getBadgeNumber() !== 2).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0039 end');
        });

        /**
         * @tc.number SUB_CustomNotification_MGMT_0040
         * @tc.name testManagement0040
         * @tc.desc 状态：设置角标不改变分组内容与分组计数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testManagement0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0040 begin');
            await addQuietly(buildRequest(191, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            try {
                await notificationManagement.setBadgeNumber(9);
            } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s', 'setBadgeNumber(9) rejected by system');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(4).length, 1);
            expect(readGroup(4).length).assertEqual(1);
            expect(notificationManagement.countsByType[4]).assertEqual(1);
            expect(readGroup(4)[0].id).assertEqual(191);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testManagement0040 end');
        });
    });
}
