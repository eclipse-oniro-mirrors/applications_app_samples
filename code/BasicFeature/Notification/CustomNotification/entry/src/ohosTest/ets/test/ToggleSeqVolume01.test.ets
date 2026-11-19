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

// promptTone / vibrationEffect 的逐开关切换序列终态语义。
// 12 个序列（单值/翻转/三步/重复/交替 5 次）× 2 个开关正交；无参调用回读当前状态。
// 期望值来源：状态推演（setter 返回终态、无参回读终态、终态决定发布槽位 sound/vibrationEnabled）。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const BASE_ID: number = 9;

function buildPlainRequest(id: number): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: { title: 'title-' + id, text: 'text-' + id, additionalText: 'additional' }
    };
    return { id: id, content: content, notificationSlotType: notification.SlotType.CONTENT_INFORMATION };
}

function applyToneSequence(flags: boolean[]): boolean {
    let last: boolean = false;
    for (let i: number = 0; i < flags.length; i++) {
        last = notificationUtil.promptTone(flags[i]);
    }
    return last;
}

function applyVibrationSequence(flags: boolean[]): boolean {
    let last: boolean = false;
    for (let i: number = 0; i < flags.length; i++) {
        last = notificationUtil.vibrationEffect(flags[i]);
    }
    return last;
}

export default function toggleSeqVolume01Test() {
    describe('ToggleSeqVolume01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0001
         * @tc.name testVToggle0001
         * @tc.desc promptTone 无参回读默认 false，发布槽位不携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVToggle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0001 begin');
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let readBackAgain: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBackAgain), 'false');
            expect(readBackAgain).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(sound === undefined));
            expect(sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0002
         * @tc.name testVToggle0002
         * @tc.desc promptTone 单开序列 [true]：setter 返回 true、无参回读 true、发布槽位携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0002 begin');
            let lastReturn: boolean = applyToneSequence([true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(sound === 'file:///system/etc/capture.ogg'));
            expect(sound === 'file:///system/etc/capture.ogg').assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0003
         * @tc.name testVToggle0003
         * @tc.desc promptTone 单关序列 [false]：终态 false、无参回读 false、发布槽位不携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0003 begin');
            let lastReturn: boolean = applyToneSequence([false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(sound === undefined));
            expect(sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0004
         * @tc.name testVToggle0004
         * @tc.desc promptTone 开→关序列 [true,false]：终态 false、回读 false、发布槽位不携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0004 begin');
            let lastReturn: boolean = applyToneSequence([true, false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(sound === undefined));
            expect(sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0005
         * @tc.name testVToggle0005
         * @tc.desc promptTone 关→开序列 [false,true]：终态 true、回读 true、发布槽位携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0005 begin');
            let lastReturn: boolean = applyToneSequence([false, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(sound === 'file:///system/etc/capture.ogg'));
            expect(sound === 'file:///system/etc/capture.ogg').assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0006
         * @tc.name testVToggle0006
         * @tc.desc promptTone 开→关→开序列 [true,false,true]：终态 true、发布槽位携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0006 begin');
            let lastReturn: boolean = applyToneSequence([true, false, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(sound === 'file:///system/etc/capture.ogg'));
            expect(sound === 'file:///system/etc/capture.ogg').assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0007
         * @tc.name testVToggle0007
         * @tc.desc promptTone 关→开→关序列 [false,true,false]：终态 false、发布槽位不携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0007 begin');
            let lastReturn: boolean = applyToneSequence([false, true, false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(sound === undefined));
            expect(sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0008
         * @tc.name testVToggle0008
         * @tc.desc promptTone 重复开序列 [true,true]：终态仍 true、发布槽位携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0008 begin');
            let lastReturn: boolean = applyToneSequence([true, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(sound === 'file:///system/etc/capture.ogg'));
            expect(sound === 'file:///system/etc/capture.ogg').assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0009
         * @tc.name testVToggle0009
         * @tc.desc promptTone 重复关序列 [false,false]：终态仍 false、发布槽位不携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0009 begin');
            let lastReturn: boolean = applyToneSequence([false, false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(sound === undefined));
            expect(sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0010
         * @tc.name testVToggle0010
         * @tc.desc promptTone 交替 5 次序列 [true,false,true,false,true]：终态 true、发布槽位携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0010 begin');
            let lastReturn: boolean = applyToneSequence([true, false, true, false, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(sound === 'file:///system/etc/capture.ogg'));
            expect(sound === 'file:///system/etc/capture.ogg').assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0011
         * @tc.name testVToggle0011
         * @tc.desc promptTone 交替 5 次序列 [false,true,false,true,false]：终态 false、发布槽位不携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0011 begin');
            let lastReturn: boolean = applyToneSequence([false, true, false, true, false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(sound === undefined));
            expect(sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0012
         * @tc.name testVToggle0012
         * @tc.desc promptTone 三步序列 [false,true,true]：终态 true、发布槽位携声
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0012 begin');
            let lastReturn: boolean = applyToneSequence([false, true, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(sound === 'file:///system/etc/capture.ogg'));
            expect(sound === 'file:///system/etc/capture.ogg').assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0013
         * @tc.name testVToggle0013
         * @tc.desc vibrationEffect 无参回读默认 false，发布槽位不带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVToggle0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0013 begin');
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let readBackAgain: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBackAgain), 'false');
            expect(readBackAgain).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0014
         * @tc.name testVToggle0014
         * @tc.desc vibrationEffect 单开序列 [true]：setter 返回 true、无参回读 true、发布槽位带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0014 begin');
            let lastReturn: boolean = applyVibrationSequence([true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === true));
            expect(vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0015
         * @tc.name testVToggle0015
         * @tc.desc vibrationEffect 单关序列 [false]：终态 false、发布槽位不带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0015 begin');
            let lastReturn: boolean = applyVibrationSequence([false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0016
         * @tc.name testVToggle0016
         * @tc.desc vibrationEffect 开→关序列 [true,false]：终态 false、发布槽位不带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0016 begin');
            let lastReturn: boolean = applyVibrationSequence([true, false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0017
         * @tc.name testVToggle0017
         * @tc.desc vibrationEffect 关→开序列 [false,true]：终态 true、发布槽位带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0017 begin');
            let lastReturn: boolean = applyVibrationSequence([false, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === true));
            expect(vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0018
         * @tc.name testVToggle0018
         * @tc.desc vibrationEffect 开→关→开序列 [true,false,true]：终态 true、发布槽位带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0018 begin');
            let lastReturn: boolean = applyVibrationSequence([true, false, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === true));
            expect(vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0019
         * @tc.name testVToggle0019
         * @tc.desc vibrationEffect 关→开→关序列 [false,true,false]：终态 false、发布槽位不带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0019 begin');
            let lastReturn: boolean = applyVibrationSequence([false, true, false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0020
         * @tc.name testVToggle0020
         * @tc.desc vibrationEffect 重复开序列 [true,true]：终态仍 true、发布槽位带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0020 begin');
            let lastReturn: boolean = applyVibrationSequence([true, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === true));
            expect(vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0020 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0021
         * @tc.name testVToggle0021
         * @tc.desc vibrationEffect 重复关序列 [false,false]：终态仍 false、发布槽位不带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0021 begin');
            let lastReturn: boolean = applyVibrationSequence([false, false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0021 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0022
         * @tc.name testVToggle0022
         * @tc.desc vibrationEffect 交替 5 次序列 [true,false,true,false,true]：终态 true、发布槽位带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0022 begin');
            let lastReturn: boolean = applyVibrationSequence([true, false, true, false, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === true));
            expect(vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0022 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0023
         * @tc.name testVToggle0023
         * @tc.desc vibrationEffect 交替 5 次序列 [false,true,false,true,false]：终态 false、发布槽位不带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0023 begin');
            let lastReturn: boolean = applyVibrationSequence([false, true, false, true, false]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'false');
            expect(lastReturn).assertFalse();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'false');
            expect(readBack).assertFalse();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0023 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_0024
         * @tc.name testVToggle0024
         * @tc.desc vibrationEffect 三步序列 [false,true,true]：终态 true、发布槽位带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggle0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0024 begin');
            let lastReturn: boolean = applyVibrationSequence([false, true, true]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(lastReturn), 'true');
            expect(lastReturn).assertTrue();
            let readBack: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(readBack), 'true');
            expect(readBack).assertTrue();
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === true));
            expect(vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggle0024 end');
        });
    });
}
