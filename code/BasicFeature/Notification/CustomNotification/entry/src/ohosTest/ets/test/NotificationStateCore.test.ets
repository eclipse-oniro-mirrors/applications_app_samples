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

// notificationUtil 的两个开关状态机、publishNotification 的 id 覆盖分支与两个取消入口。
// 期望值来源：源码分支推演（`if (id && id > 0) { notificationRequest.id = id }`、默认参数
// `flag = this.isPromptTone`）+ 状态推演（每次赋值后回到当前值）。
// 系统侧投递（removeAllSlots/addSlot/publish/cancel）按计划只断言"不抛异常 + 对象被改写"，
// 跨进程副作用留给手工验证；通知管理器的分组状态在每个用例前复位，避免用例间串扰。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil, notificationManagement } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const SLOT_COUNT: number = 7;

function buildRequest(id: number): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT
    };
    return {
        id: id,
        content: content,
        notificationSlotType: notification.SlotType.CONTENT_INFORMATION
    };
}

async function publishQuietly(request: notification.NotificationRequest,
    id?: number): Promise<void> {
    try {
        await notificationUtil.publishNotification(request, id);
    } catch (error) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'publishNotification rejected');
    }
}

function sumCounts(): number {
    let total: number = 0;
    for (let i: number = 0; i < notificationManagement.countsByType.length; i++) {
        total += notificationManagement.countsByType[i];
    }
    return total;
}

export default function notificationStateCoreTest() {
    describe('NotificationStateCore', () => {
        beforeEach(async () => {
            await notificationManagement.resetTypeNotificationState();
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0001
         * @tc.name testState0001
         * @tc.desc promptTone 无参调用返回当前值，重复调用不改变状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0001 begin');
            let first: boolean = notificationUtil.promptTone();
            let second: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s, expected=equal/false',
                String(first), String(second));
            expect(first).assertFalse();
            expect(first === second).assertTrue();
            expect(notificationUtil.vibrationEffect()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0002
         * @tc.name testState0002
         * @tc.desc promptTone(true) 返回 true，随后无参读取仍为 true
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0002 begin');
            let setResult: boolean = notificationUtil.promptTone(true);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=true', String(setResult));
            expect(setResult).assertTrue();
            expect(notificationUtil.promptTone()).assertTrue();
            expect(notificationUtil.promptTone()).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0003
         * @tc.name testState0003
         * @tc.desc promptTone(false) 返回 false，随后无参读取仍为 false
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0003 begin');
            notificationUtil.promptTone(true);
            let setResult: boolean = notificationUtil.promptTone(false);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(setResult));
            expect(setResult).assertFalse();
            expect(notificationUtil.promptTone()).assertFalse();
            expect(notificationUtil.vibrationEffect()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0004
         * @tc.name testState0004
         * @tc.desc promptTone 序列 true→false→true：每一步返回值与设置值一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0004 begin');
            let step1: boolean = notificationUtil.promptTone(true);
            let step2: boolean = notificationUtil.promptTone(false);
            let step3: boolean = notificationUtil.promptTone(true);
            hilog.info(DOMAIN, TAG, 's1=%{public}s s2=%{public}s s3=%{public}s, expected=true/false/true',
                String(step1), String(step2), String(step3));
            expect(step1).assertTrue();
            expect(step2).assertFalse();
            expect(step3).assertTrue();
            expect(notificationUtil.promptTone()).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0005
         * @tc.name testState0005
         * @tc.desc promptTone 连续两次设 true：两次返回值相同（幂等）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0005 begin');
            let first: boolean = notificationUtil.promptTone(true);
            let second: boolean = notificationUtil.promptTone(true);
            hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s, expected=true/true',
                String(first), String(second));
            expect(first).assertTrue();
            expect(second).assertTrue();
            expect(first === second).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0006
         * @tc.name testState0006
         * @tc.desc 只打开 promptTone 时，vibrationEffect 保持 false（互不干扰）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0006 begin');
            notificationUtil.promptTone(true);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false',
                String(notificationUtil.vibrationEffect()));
            expect(notificationUtil.vibrationEffect()).assertFalse();
            expect(notificationUtil.promptTone()).assertTrue();
            expect(notificationUtil.promptTone() === notificationUtil.vibrationEffect()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0007
         * @tc.name testState0007
         * @tc.desc 只打开 vibrationEffect 时，promptTone 保持 false（互不干扰）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0007 begin');
            notificationUtil.vibrationEffect(true);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false',
                String(notificationUtil.promptTone()));
            expect(notificationUtil.promptTone()).assertFalse();
            expect(notificationUtil.vibrationEffect()).assertTrue();
            expect(notificationUtil.promptTone() === notificationUtil.vibrationEffect()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0008
         * @tc.name testState0008
         * @tc.desc 先开后关 promptTone：最终无参读取为 false
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0008 begin');
            notificationUtil.promptTone(true);
            let closed: boolean = notificationUtil.promptTone(false);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(closed));
            expect(closed).assertFalse();
            expect(notificationUtil.promptTone()).assertFalse();
            expect(notificationUtil.vibrationEffect()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0009
         * @tc.name testState0009
         * @tc.desc vibrationEffect(true) 返回 true，随后无参读取仍为 true
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0009 begin');
            let setResult: boolean = notificationUtil.vibrationEffect(true);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=true', String(setResult));
            expect(setResult).assertTrue();
            expect(notificationUtil.vibrationEffect()).assertTrue();
            expect(notificationUtil.promptTone()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0010
         * @tc.name testState0010
         * @tc.desc vibrationEffect(false) 返回 false，随后无参读取为 false
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0010 begin');
            notificationUtil.vibrationEffect(true);
            let setResult: boolean = notificationUtil.vibrationEffect(false);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(setResult));
            expect(setResult).assertFalse();
            expect(notificationUtil.vibrationEffect()).assertFalse();
            expect(notificationUtil.promptTone()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0011
         * @tc.name testState0011
         * @tc.desc vibrationEffect 序列 true→false→true：每一步返回值与设置值一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0011 begin');
            let step1: boolean = notificationUtil.vibrationEffect(true);
            let step2: boolean = notificationUtil.vibrationEffect(false);
            let step3: boolean = notificationUtil.vibrationEffect(true);
            hilog.info(DOMAIN, TAG, 's1=%{public}s s2=%{public}s s3=%{public}s, expected=true/false/true',
                String(step1), String(step2), String(step3));
            expect(step1).assertTrue();
            expect(step2).assertFalse();
            expect(step3).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0012
         * @tc.name testState0012
         * @tc.desc vibrationEffect 连续两次设 true：两次返回值相同（幂等）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0012 begin');
            let first: boolean = notificationUtil.vibrationEffect(true);
            let second: boolean = notificationUtil.vibrationEffect(true);
            hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s, expected=true/true',
                String(first), String(second));
            expect(first).assertTrue();
            expect(second).assertTrue();
            expect(first === second).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0013
         * @tc.name testState0013
         * @tc.desc vibrationEffect 无参读取不影响 promptTone
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0013 begin');
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect();
            notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=true', String(notificationUtil.promptTone()));
            expect(notificationUtil.promptTone()).assertTrue();
            expect(notificationUtil.vibrationEffect()).assertFalse();
            expect(notificationUtil.promptTone() === notificationUtil.vibrationEffect()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0014
         * @tc.name testState0014
         * @tc.desc 交替设置两个开关：各自独立保持最后一次设置值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0014 begin');
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            notificationUtil.promptTone(false);
            hilog.info(DOMAIN, TAG, 'tone=%{public}s vibration=%{public}s, expected=false/true',
                String(notificationUtil.promptTone()), String(notificationUtil.vibrationEffect()));
            expect(notificationUtil.promptTone()).assertFalse();
            expect(notificationUtil.vibrationEffect()).assertTrue();
            expect(notificationUtil.promptTone() === notificationUtil.vibrationEffect()).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0015
         * @tc.name testState0015
         * @tc.desc publishNotification 传入 id=5 时把请求 id 覆盖为 5
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0015 begin');
            let request: notification.NotificationRequest = buildRequest(0);
            let content: notification.NotificationContent = request.content;
            await publishQuietly(request, 5);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=5', request.id);
            expect(request.id).assertEqual(5);
            expect(request.content === content).assertTrue();
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0016
         * @tc.name testState0016
         * @tc.desc publishNotification 传入 id=0 时不覆盖请求原有 id
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0016 begin');
            let request: notification.NotificationRequest = buildRequest(42);
            await publishQuietly(request, 0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=42', request.id);
            expect(request.id).assertEqual(42);
            expect(request.id === 0).assertFalse();
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0017
         * @tc.name testState0017
         * @tc.desc publishNotification 传入负数 id 时不覆盖（id > 0 分支不命中）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0017 begin');
            let request: notification.NotificationRequest = buildRequest(42);
            await publishQuietly(request, -1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=42', request.id);
            expect(request.id).assertEqual(42);
            expect((request.id as number) > 0).assertTrue();
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0018
         * @tc.name testState0018
         * @tc.desc publishNotification 不传 id 参数时保持请求原有 id
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0018 begin');
            let request: notification.NotificationRequest = buildRequest(42);
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=42', request.id);
            expect(request.id).assertEqual(42);
            expect(request.id === 1).assertFalse();
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0019
         * @tc.name testState0019
         * @tc.desc publishNotification 传入大值 id=999 时覆盖成功
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0019 begin');
            let request: notification.NotificationRequest = buildRequest(1);
            await publishQuietly(request, 999);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=999', request.id);
            expect(request.id).assertEqual(999);
            expect((request.id as number) > 1).assertTrue();
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0020
         * @tc.name testState0020
         * @tc.desc 请求 id 与传入 id 相同时结果不变，内容字段不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0020 begin');
            let request: notification.NotificationRequest = buildRequest(1);
            await publishQuietly(request, 1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=1', request.id);
            expect(request.id).assertEqual(1);
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0020 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0021
         * @tc.name testState0021
         * @tc.desc id 覆盖只改 id 字段，请求其它字段保持调用前的值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0021 begin');
            let request: notification.NotificationRequest = buildRequest(3);
            let slotType: notification.SlotType = request.notificationSlotType as notification.SlotType;
            await publishQuietly(request, 7);
            hilog.info(DOMAIN, TAG, 'id=%{public}d slot=%{public}d, expected=7/3', request.id, slotType);
            expect(request.id).assertEqual(7);
            expect(request.notificationSlotType).assertEqual(slotType);
            expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0021 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0022
         * @tc.name testState0022
         * @tc.desc 两次发布不同请求：各自 id 被独立覆盖，互不串扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0022 begin');
            let first: notification.NotificationRequest = buildRequest(0);
            let second: notification.NotificationRequest = buildRequest(0);
            await publishQuietly(first, 11);
            await publishQuietly(second, 22);
            hilog.info(DOMAIN, TAG, 'first=%{public}d second=%{public}d, expected=11/22', first.id, second.id);
            expect(first.id).assertEqual(11);
            expect(second.id).assertEqual(22);
            expect(first.id === second.id).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0022 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0023
         * @tc.name testState0023
         * @tc.desc 先传 id 再传 0：第二次不覆盖，保留第一次写入的值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0023 begin');
            let request: notification.NotificationRequest = buildRequest(0);
            await publishQuietly(request, 5);
            await publishQuietly(request, 0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=5', request.id);
            expect(request.id).assertEqual(5);
            expect(request.id === 0).assertFalse();
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0023 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0024
         * @tc.name testState0024
         * @tc.desc cancelNotificationById(1) 不抛异常，且不改变本地分组状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0024 begin');
            let caught: boolean = false;
            try {
                await notificationUtil.cancelNotificationById(1);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancelNotificationById rejected');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0024 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0025
         * @tc.name testState0025
         * @tc.desc cancelNotificationById(0) 边界值不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0025 begin');
            let caught: boolean = false;
            try {
                await notificationUtil.cancelNotificationById(0);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancelNotificationById(0) rejected');
            }
            expect(caught).assertFalse();
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0025 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0026
         * @tc.name testState0026
         * @tc.desc cancelNotificationById(-5) 负数 id 不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0026 begin');
            let caught: boolean = false;
            try {
                await notificationUtil.cancelNotificationById(-5);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancelNotificationById(-5) rejected');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
            expect(sumCounts()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0026 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0027
         * @tc.name testState0027
         * @tc.desc cancelAllNotifications 不抛异常，本地计数保持为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0027 begin');
            let caught: boolean = false;
            try {
                await notificationUtil.cancelAllNotifications();
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancelAllNotifications rejected');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0027 end');
        });

        /**
         * @tc.number SUB_CustomNotification_STATE_0028
         * @tc.name testState0028
         * @tc.desc cancelAllNotifications 连续调用两次均正常返回（幂等）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0028 begin');
            let caught: boolean = false;
            try {
                await notificationUtil.cancelAllNotifications();
                await notificationUtil.cancelAllNotifications();
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancelAllNotifications rejected twice');
            }
            expect(caught).assertFalse();
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0028 end');
        });
    });
}
