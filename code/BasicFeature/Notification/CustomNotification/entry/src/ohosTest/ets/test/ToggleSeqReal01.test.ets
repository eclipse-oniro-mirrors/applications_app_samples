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

// 开关序列域的边界、独立性与跨链路行为。
// 期望值来源：状态推演（默认参回读当前值、双开关互不牵动、终态决定发布槽位双字段）。
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

async function publishAndReadSlot(): Promise<notification.NotificationSlot | undefined> {
    let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
    await notificationUtil.publishNotification(request);
    return notificationUtil.getLastNotificationSlot();
}

export default function toggleSeqReal01Test() {
    describe('ToggleSeqReal01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_REAL_0001
         * @tc.name testVToggleReal0001
         * @tc.desc 双开关无参回读初值 false，发布槽位声与振动双缺省
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVToggleReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0001 begin');
            let tone: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(tone), 'false');
            expect(tone).assertFalse();
            let vibration: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(vibration), 'false');
            expect(vibration).assertFalse();
            let slot: notification.NotificationSlot | undefined = await publishAndReadSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(sound === undefined));
            expect(sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_REAL_0002
         * @tc.name testVToggleReal0002
         * @tc.desc 双开→发布：发布槽位同时携声与振动，双终态链路贯通（showcase）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggleReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0002 begin');
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            let slot: notification.NotificationSlot | undefined = await publishAndReadSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(sound === 'file:///system/etc/capture.ogg'));
            expect(sound === 'file:///system/etc/capture.ogg').assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === true));
            expect(vibrationEnabled === true).assertTrue();
            let vibrationValues: number[] | undefined =
                (slot as notification.NotificationSlot).vibrationValues;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationValues !== undefined));
            expect(vibrationValues !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_REAL_0003
         * @tc.name testVToggleReal0003
         * @tc.desc 双开关独立交替终态（tone 终 true、vibration 终 false）：槽位只携声不带振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggleReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0003 begin');
            notificationUtil.promptTone(true);
            notificationUtil.promptTone(false);
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            notificationUtil.vibrationEffect(false);
            let tone: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(tone), 'true');
            expect(tone).assertTrue();
            let vibration: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(vibration), 'false');
            expect(vibration).assertFalse();
            let slot: notification.NotificationSlot | undefined = await publishAndReadSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(sound === 'file:///system/etc/capture.ogg'));
            expect(sound === 'file:///system/etc/capture.ogg').assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_REAL_0004
         * @tc.name testVToggleReal0004
         * @tc.desc 负向牵动检查：tone 翻转 5 次期间 vibration 无参回读始终 false（互不牵动）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggleReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0004 begin');
            let observed: boolean[] = [];
            notificationUtil.promptTone(true);
            observed.push(notificationUtil.vibrationEffect());
            notificationUtil.promptTone(false);
            observed.push(notificationUtil.vibrationEffect());
            notificationUtil.promptTone(true);
            observed.push(notificationUtil.vibrationEffect());
            notificationUtil.promptTone(false);
            observed.push(notificationUtil.vibrationEffect());
            notificationUtil.promptTone(true);
            observed.push(notificationUtil.vibrationEffect());
            let untouchedCount: number = 0;
            for (let i: number = 0; i < observed.length; i++) {
                if (observed[i] === false) {
                    untouchedCount++;
                }
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', untouchedCount, 5);
            expect(untouchedCount).assertEqual(5);
            let vibration: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(vibration), 'false');
            expect(vibration).assertFalse();
            let slot: notification.NotificationSlot | undefined = await publishAndReadSlot();
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VTOGGLE_REAL_0005
         * @tc.name testVToggleReal0005
         * @tc.desc 双开关交替 5 次终态均 false：发布槽位双缺省，状态链重新收敛
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVToggleReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0005 begin');
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            let tone: boolean = notificationUtil.promptTone();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(tone), 'false');
            expect(tone).assertFalse();
            let vibration: boolean = notificationUtil.vibrationEffect();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(vibration), 'false');
            expect(vibration).assertFalse();
            let slot: notification.NotificationSlot | undefined = await publishAndReadSlot();
            let sound: string | undefined = (slot as notification.NotificationSlot).sound;
            let vibrationEnabled: boolean | undefined =
                (slot as notification.NotificationSlot).vibrationEnabled;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(sound === undefined));
            expect(sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(vibrationEnabled === undefined));
            expect(vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVToggleReal0005 end');
        });
    });
}
