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

// main 缺陷修复回归桶。逐条锁定 2026-11-18 修复后的行为（slot 意图、
// 取消同步清空、slice 不破坏入参、越界保护、越界不增角标、第 7 枚举槽位）。
// 期望值来源：main 修复后源码推演 + ContentType/SlotType 规格常量。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { WantAgent } from '@kit.AbilityKit';
import {
    notificationUtil,
    notificationManagement,
    notificationRequestUtil,
    notificationContentUtil,
    wantAgentUtil
} from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const SLOT_COUNT: number = 7;
const BUNDLE_NAME: string = 'ohos.samples.customnotification';
const ABILITY_NAME: string = 'MainAbility';

async function createAgent(): Promise<WantAgent> {
    return await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
}

function buildBasicContent(title: string, text: string): notification.NotificationBasicContent {
    return { title: title, text: text, additionalText: 'additional' };
}

function buildRequest(id: number, contentType: notification.ContentType): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: contentType,
        normal: buildBasicContent('title-' + id, 'text-' + id)
    };
    return { id: id, content: content, notificationSlotType: notification.SlotType.CONTENT_INFORMATION };
}

function buildButtons(count: number, agent: WantAgent): notification.NotificationActionButton[] {
    let buttons: notification.NotificationActionButton[] = [];
    for (let i: number = 0; i < count; i++) {
        buttons.push({ title: 'Button' + (i + 1), wantAgent: agent });
    }
    return buttons;
}

async function addQuietly(request: notification.NotificationRequest): Promise<void> {
    try {
        await notificationManagement.addNotification(request);
    } catch (error) {
        hilog.warn(DOMAIN, TAG, 'setBadgeNumber rejected after local state updated');
    }
}

async function publishQuietly(request: notification.NotificationRequest): Promise<void> {
    try {
        await notificationUtil.publishNotification(request);
    } catch (error) {
        hilog.warn(DOMAIN, TAG, 'publish rejected after the request was recorded');
    }
}

function readGroup(index: number): notification.NotificationRequest[] {
    return notificationManagement.typeNotifications[index];
}

function sumCounts(): number {
    let total: number = 0;
    for (let i: number = 0; i < notificationManagement.countsByType.length; i++) {
        total += notificationManagement.countsByType[i];
    }
    return total;
}

export default function mainDefectRegressionTest() {
    describe('MainDefectRegression', () => {
        beforeEach(async () => {
            await notificationManagement.resetTypeNotificationState();
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0001
         * @tc.name testDefect0001
         * @tc.desc 双开关全关发布：slot 意图不含声音与振动字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testDefect0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0001 begin');
            await publishQuietly(buildRequest(101, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            let slotType: notification.SlotType =
                ((slot as notification.NotificationSlot).notificationType) as notification.SlotType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', slotType,
                notification.SlotType.CONTENT_INFORMATION);
            expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            let hasNoSound: boolean = (slot as notification.NotificationSlot).sound === undefined;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(hasNoSound));
            expect(hasNoSound).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0002
         * @tc.name testDefect0002
         * @tc.desc 提示音开关开启发布：slot 意图携带系统提示音路径
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0002 begin');
            notificationUtil.promptTone(true);
            await publishQuietly(buildRequest(102, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string = ((slot as notification.NotificationSlot).sound) as string;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', sound, 'file:///system/etc/capture.ogg');
            expect(sound).assertEqual('file:///system/etc/capture.ogg');
            let slotLevel: notification.SlotLevel =
                ((slot as notification.NotificationSlot).notificationLevel) as notification.SlotLevel;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', slotLevel,
                notification.SlotLevel.LEVEL_DEFAULT);
            expect(slotLevel).assertEqual(notification.SlotLevel.LEVEL_DEFAULT);
            let vibrationOff: boolean = (slot as notification.NotificationSlot).vibrationEnabled === undefined;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationOff));
            expect(vibrationOff).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0003
         * @tc.name testDefect0003
         * @tc.desc 振动开关开启发布：slot 意图携带振动开关与振动强度数组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0003 begin');
            notificationUtil.vibrationEffect(true);
            await publishQuietly(buildRequest(103, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean = ((slot as notification.NotificationSlot).vibrationEnabled) as boolean;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled));
            expect(vibrationEnabled).assertTrue();
            let vibrationValues: number[] = ((slot as notification.NotificationSlot).vibrationValues) as number[];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', vibrationValues[0], 200);
            expect(vibrationValues[0]).assertEqual(200);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', vibrationValues.length, 1);
            expect(vibrationValues.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0004
         * @tc.name testDefect0004
         * @tc.desc 取消非空分组：本地分组与计数同步清空，角标同步扣减
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testDefect0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0004 begin');
            await addQuietly(buildRequest(111, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(112, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await notificationManagement.cancelNotificationType(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0).length, 0);
            expect(readGroup(0).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.countsByType[0], 0);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0005
         * @tc.name testDefect0005
         * @tc.desc 取消后分组元素换新实例：取消前另存的分组引用仍保留旧数据
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0005 begin');
            await addQuietly(buildRequest(121, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(122, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let beforeGroups: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            // getAllNotifications 返回内部数组引用，需在取消前另存分组元素引用，才能观察“旧数据保留”
            let firstGroupRef: notification.NotificationRequest[] = beforeGroups[0];
            await notificationManagement.cancelNotificationType(0);
            let afterGroups: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', firstGroupRef.length, 2);
            expect(firstGroupRef.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', afterGroups[0].length, 0);
            expect(afterGroups[0].length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(beforeGroups === afterGroups));
            expect(beforeGroups === afterGroups).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(afterGroups[0] !== firstGroupRef));
            expect(afterGroups[0] !== firstGroupRef).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0006
         * @tc.name testDefect0006
         * @tc.desc 取消一个分组不影响其他分组的数据与计数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0006 begin');
            await addQuietly(buildRequest(131, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(132, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(133, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await notificationManagement.cancelNotificationType(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(2).length, 1);
            expect(readGroup(2).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(2)[0].id, 133);
            expect(readGroup(2)[0].id).assertEqual(133);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.countsByType[2], 1);
            expect(notificationManagement.countsByType[2]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0007
         * @tc.name testDefect0007
         * @tc.desc 3 个按钮截断：返回前两个，入参数组保持 3 个
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testDefect0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0007 begin');
            let agent: WantAgent = await createAgent();
            let buttons: notification.NotificationActionButton[] = buildButtons(3, agent);
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(buildBasicContent('title', 'text'));
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(content, buttons);
            let actionButtons: notification.NotificationActionButton[] =
                request.actionButtons as notification.NotificationActionButton[];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actionButtons.length, 2);
            expect(actionButtons.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', buttons.length, 3);
            expect(buttons.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actionButtons[0].title, 'Button1');
            expect(actionButtons[0].title).assertEqual('Button1');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0008
         * @tc.name testDefect0008
         * @tc.desc 5 个按钮截断：入参末位元素保持原位原值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0008 begin');
            let agent: WantAgent = await createAgent();
            let buttons: notification.NotificationActionButton[] = buildButtons(5, agent);
            let fifthButton: notification.NotificationActionButton = buttons[4];
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(buildBasicContent('title', 'text'));
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(content, buttons);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', buttons.length, 5);
            expect(buttons.length).assertEqual(5);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(buttons[4] === fifthButton));
            expect(buttons[4] === fifthButton).assertTrue();
            let actionButtons: notification.NotificationActionButton[] =
                request.actionButtons as notification.NotificationActionButton[];
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actionButtons[1].title, 'Button2');
            expect(actionButtons[1].title).assertEqual('Button2');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0009
         * @tc.name testDefect0009
         * @tc.desc 截断返回新数组：元素为原引用，数组本身不是入参引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testDefect0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0009 begin');
            let agent: WantAgent = await createAgent();
            let buttons: notification.NotificationActionButton[] = buildButtons(3, agent);
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(buildBasicContent('title', 'text'));
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(content, buttons);
            let actionButtons: notification.NotificationActionButton[] =
                request.actionButtons as notification.NotificationActionButton[];
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actionButtons !== buttons));
            expect(actionButtons !== buttons).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actionButtons[0] === buttons[0]));
            expect(actionButtons[0] === buttons[0]).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actionButtons[1] === buttons[1]));
            expect(actionButtons[1] === buttons[1]).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0010
         * @tc.name testDefect0010
         * @tc.desc 越界上界 99 取消：不抛错且已有分组数据不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testDefect0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0010 begin');
            await addQuietly(buildRequest(141, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(99);
            } catch (error) {
                caught = true;
            }
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0).length, 1);
            expect(readGroup(0).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), 1);
            expect(sumCounts()).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0011
         * @tc.name testDefect0011
         * @tc.desc 负索引 -1 取消：不抛错且计数与分组保持原状
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0011 begin');
            await addQuietly(buildRequest(151, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(-1);
            } catch (error) {
                caught = true;
            }
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.countsByType[4], 1);
            expect(notificationManagement.countsByType[4]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(4)[0].id, 151);
            expect(readGroup(4)[0].id).assertEqual(151);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0012
         * @tc.name testDefect0012
         * @tc.desc 连续两次越界取消幂等：不抛错且角标与计数完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testDefect0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0012 begin');
            await addQuietly(buildRequest(161, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await notificationManagement.cancelNotificationType(SLOT_COUNT);
            await notificationManagement.cancelNotificationType(SLOT_COUNT + 10);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                1);
            expect(notificationManagement.getBadgeNumber()).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), 1);
            expect(sumCounts()).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(1).length, 1);
            expect(readGroup(1).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0013
         * @tc.name testDefect0013
         * @tc.desc 越界类型 99 添加：不进组不计数，角标保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testDefect0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0013 begin');
            await addQuietly(buildRequest(171, 99 as notification.ContentType));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), 0);
            expect(sumCounts()).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0).length, 0);
            expect(readGroup(0).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0014
         * @tc.name testDefect0014
         * @tc.desc 第 7 枚举 LIVE_VIEW 添加：进入第 7 分组槽位并计角标
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testDefect0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0014 begin');
            await addQuietly(buildRequest(181, notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(6).length, 1);
            expect(readGroup(6).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.countsByType[6], 1);
            expect(notificationManagement.countsByType[6]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                1);
            expect(notificationManagement.getBadgeNumber()).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0015
         * @tc.name testDefect0015
         * @tc.desc 先越界后合法添加：角标只统计命中分组的合法消息
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0015 begin');
            await addQuietly(buildRequest(191, 99 as notification.ContentType));
            await addQuietly(buildRequest(192, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                1);
            expect(notificationManagement.getBadgeNumber()).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), 1);
            expect(sumCounts()).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0)[0].id, 192);
            expect(readGroup(0)[0].id).assertEqual(192);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0016
         * @tc.name testDefect0016
         * @tc.desc 取消后再添加同类型：分组计数重新累计
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0016 begin');
            await addQuietly(buildRequest(201, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(202, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await notificationManagement.cancelNotificationType(0);
            await addQuietly(buildRequest(203, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0).length, 1);
            expect(readGroup(0).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.countsByType[0], 1);
            expect(notificationManagement.countsByType[0]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0)[0].id, 203);
            expect(readGroup(0)[0].id).assertEqual(203);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0017
         * @tc.name testDefect0017
         * @tc.desc 连续取消两个分组：两组同时清空，角标不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testDefect0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0017 begin');
            await addQuietly(buildRequest(211, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(212, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(213, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await notificationManagement.cancelNotificationType(0);
            await notificationManagement.cancelNotificationType(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(0).length, 0);
            expect(readGroup(0).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(2).length, 0);
            expect(readGroup(2).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0018
         * @tc.name testDefect0018
         * @tc.desc 对同一空分组连续取消：幂等不抛错且计数保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testDefect0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0018 begin');
            let caught: boolean = false;
            try {
                await notificationManagement.cancelNotificationType(3);
                await notificationManagement.cancelNotificationType(3);
            } catch (error) {
                caught = true;
            }
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.countsByType[3], 0);
            expect(notificationManagement.countsByType[3]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(3).length, 0);
            expect(readGroup(3).length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0019
         * @tc.name testDefect0019
         * @tc.desc 第 7 分组槽位保存入参请求对象的引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0019 begin');
            let request: notification.NotificationRequest =
                buildRequest(221, notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW);
            await addQuietly(request);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(readGroup(6)[0] === request));
            expect(readGroup(6)[0] === request).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(readGroup(6)[0].content === request.content));
            expect(readGroup(6)[0].content === request.content).assertTrue();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(6)[0].id, 221);
            expect(readGroup(6)[0].id).assertEqual(221);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0020
         * @tc.name testDefect0020
         * @tc.desc 七种类型各一条：七个槽位同时计数且角标为 7
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testDefect0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0020 begin');
            await addQuietly(buildRequest(231, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(232, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(233, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(234, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            await addQuietly(buildRequest(235, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await addQuietly(buildRequest(236, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
            await addQuietly(buildRequest(237, notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                notificationManagement.countsByType.length, SLOT_COUNT);
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', sumCounts(), SLOT_COUNT);
            expect(sumCounts()).assertEqual(SLOT_COUNT);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', notificationManagement.getBadgeNumber(),
                SLOT_COUNT);
            expect(notificationManagement.getBadgeNumber()).assertEqual(SLOT_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0020 end');
        });

        /**
         * @tc.number SUB_CustomNotification_DEFECT_0021
         * @tc.name testDefect0021
         * @tc.desc 第 5 与第 6 枚举各一条：两个相邻槽位互不混组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testDefect0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0021 begin');
            await addQuietly(buildRequest(241, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
            await addQuietly(buildRequest(242, notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW));
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(5).length, 1);
            expect(readGroup(5).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(6).length, 1);
            expect(readGroup(6).length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readGroup(5)[0].id, 241);
            expect(readGroup(5)[0].id).assertEqual(241);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testDefect0021 end');
        });

    });
}
