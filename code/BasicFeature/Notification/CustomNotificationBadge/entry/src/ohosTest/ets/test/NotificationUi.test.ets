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

// 页面层：消息列表页与通知发送页的页签切换、控件可见性与按钮文案。
// 只用语义 id（titleBar / tabBar0 / tabBar1 / notificationList / publish*）与资源串文案定位，
// 不写死坐标；每例结束后由 afterEach 复位到消息列表页，保证用例间零依赖。
// 页面文案基线在 beforeAll 里按资源名从 entry 模块资源表取值（跟随设备语言）：
// messages_list_title / notification_publish_title，四个按钮取 basic/long_text/picture/multiline 对应资源。
// beforeAll 先投递 2 条基本类型通知：列表为空时 List 高度为 0，Driver 找不到 notificationList。
import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver } from '@kit.TestKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil, notificationContentUtil, notificationRequestUtil } from '@ohos/notification';
import {
    existsById, existsByText, textOf, tap, log,
    launchApp, switchToPublishTab, switchToMessageTab, ensureMessageHome, delay
} from './helper/UiFlow';
import { entryString } from './helper/EntryResources';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';

const TITLE_ID: string = 'titleBar';
const MESSAGE_TAB_ID: string = 'tabBar0';
const PUBLISH_TAB_ID: string = 'tabBar1';
const LIST_ID: string = 'notificationList';
const BASIC_BUTTON_ID: string = 'publishBasic';
const LONG_TEXT_BUTTON_ID: string = 'publishLongText';
const PICTURE_BUTTON_ID: string = 'publishPicture';
const MULTILINE_BUTTON_ID: string = 'publishMultiLine';
const BUTTON_IDS: string[] = [BASIC_BUTTON_ID, LONG_TEXT_BUTTON_ID, PICTURE_BUTTON_ID, MULTILINE_BUTTON_ID];

// 文案基线在 beforeAll 里填充，避免把 base 目录英文写死后在中文设备上误判
let MESSAGE_TITLE: string = '';
let PUBLISH_TITLE: string = '';
let BASIC_LABEL: string = '';
let LONG_TEXT_LABEL: string = '';
let PICTURE_LABEL: string = '';
let MULTILINE_LABEL: string = '';
const SEED_COUNT: number = 2;

function initUiBaseline(): void {
    MESSAGE_TITLE = entryString('messages_list_title');
    PUBLISH_TITLE = entryString('notification_publish_title');
    BASIC_LABEL = entryString('basic_notification');
    LONG_TEXT_LABEL = entryString('long_text_notification');
    PICTURE_LABEL = entryString('picture_notification');
    MULTILINE_LABEL = entryString('multiline_notification');
}

// 列表为空时 List 高度为 0，Driver 拿不到 notificationList，先投递几条通知再启动页面
async function seedNotifications(): Promise<string> {
    try {
        for (let i = 0; i < SEED_COUNT; i++) {
            let basic: notification.NotificationBasicContent = {
                title: `Seed title ${i}`,
                text: `Seed body ${i}`,
                additionalText: ''
            };
            await notificationUtil.publishNotification(
                notificationRequestUtil.initBasicNotificationRequest(
                    notificationContentUtil.initBasicNotificationContent(basic)));
        }
        return '';
    } catch (err) {
        return JSON.stringify(err);
    }
}

export default function notificationUiTest() {
    describe('NotificationUi', () => {
        beforeAll(async () => {
            initUiBaseline();
            const seedError: string = await seedNotifications();
            hilog.info(DOMAIN, TAG, 'seedError=%{public}s', seedError);
            const launched: boolean = await launchApp();
            hilog.info(DOMAIN, TAG, 'launched=%{public}s', String(launched));
            expect(launched).assertTrue();
        });

        afterEach(async () => {
            const driver: Driver = Driver.create();
            const home: boolean = await ensureMessageHome(driver);
            hilog.info(DOMAIN, TAG, 'afterEach home=%{public}s', String(home));
            expect(home).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1001
         * @tc.name testNotificationUi1001
         * @tc.desc 启动后标题栏与两个底部页签均可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testNotificationUi1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            const driver: Driver = Driver.create();
            const titleVisible: boolean = await existsById(driver, TITLE_ID);
            const messageTabVisible: boolean = await existsById(driver, MESSAGE_TAB_ID);
            const publishTabVisible: boolean = await existsById(driver, PUBLISH_TAB_ID);
            hilog.info(DOMAIN, TAG, 'title=%{public}s messageTab=%{public}s publishTab=%{public}s',
                String(titleVisible), String(messageTabVisible), String(publishTabVisible));
            expect(titleVisible).assertTrue();
            expect(messageTabVisible).assertTrue();
            expect(publishTabVisible).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1002
         * @tc.name testNotificationUi1002
         * @tc.desc 默认停在消息列表页，列表容器可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testNotificationUi1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            const driver: Driver = Driver.create();
            const listVisible: boolean = await existsById(driver, LIST_ID);
            const basicHidden: boolean = !(await existsById(driver, BASIC_BUTTON_ID));
            const titleText: string = await textOf(driver, TITLE_ID);
            hilog.info(DOMAIN, TAG, 'list=%{public}s basicHidden=%{public}s title=%{public}s',
                String(listVisible), String(basicHidden), titleText);
            expect(listVisible).assertTrue();
            expect(basicHidden).assertTrue();
            expect(titleText).assertEqual(MESSAGE_TITLE);
        });

        /**
         * @tc.number SUB_CNB_UI_1003
         * @tc.name testNotificationUi1003
         * @tc.desc 消息页文案为 Messages List
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testNotificationUi1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            const driver: Driver = Driver.create();
            const messageTitleVisible: boolean = await existsByText(driver, MESSAGE_TITLE);
            const titleText: string = await textOf(driver, TITLE_ID);
            const publishTitleDifferent: boolean = MESSAGE_TITLE !== PUBLISH_TITLE;
            hilog.info(DOMAIN, TAG, 'messageTitle=%{public}s title=%{public}s',
                String(messageTitleVisible), titleText);
            expect(messageTitleVisible).assertTrue();
            expect(titleText).assertEqual(MESSAGE_TITLE);
            expect(publishTitleDifferent).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1004
         * @tc.name testNotificationUi1004
         * @tc.desc 消息页不展示四个发布按钮
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            let hiddenCount: number = 0;
            for (let i = 0; i < BUTTON_IDS.length; i++) {
                if (!(await existsById(driver, BUTTON_IDS[i]))) {
                    hiddenCount += 1;
                }
            }
            const listVisible: boolean = await existsById(driver, LIST_ID);
            hilog.info(DOMAIN, TAG, 'hiddenCount=%{public}d', hiddenCount);
            expect(hiddenCount).assertEqual(BUTTON_IDS.length);
            expect(hiddenCount).assertEqual(4);
            expect(listVisible).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1005
         * @tc.name testNotificationUi1005
         * @tc.desc 切到发送页后基本类型发布按钮出现
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testNotificationUi1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            const driver: Driver = Driver.create();
            const switched: boolean = await switchToPublishTab(driver);
            const basicVisible: boolean = await existsById(driver, BASIC_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'switched=%{public}s basic=%{public}s', String(switched), String(basicVisible));
            expect(switched).assertTrue();
            expect(basicVisible).assertTrue();
            expect(basicVisible === switched).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1006
         * @tc.name testNotificationUi1006
         * @tc.desc 发送页文案为 Notifications Publish
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testNotificationUi1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            const driver: Driver = Driver.create();
            const switched: boolean = await switchToPublishTab(driver);
            const publishTitleVisible: boolean = await existsByText(driver, PUBLISH_TITLE);
            const titleText: string = await textOf(driver, TITLE_ID);
            hilog.info(DOMAIN, TAG, 'switched=%{public}s publishTitle=%{public}s title=%{public}s',
                String(switched), String(publishTitleVisible), titleText);
            expect(switched).assertTrue();
            expect(publishTitleVisible).assertTrue();
            expect(titleText).assertEqual(PUBLISH_TITLE);
        });

        /**
         * @tc.number SUB_CNB_UI_1007
         * @tc.name testNotificationUi1007
         * @tc.desc 发送页四个发布按钮全部可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testNotificationUi1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let visibleCount: number = 0;
            for (let i = 0; i < BUTTON_IDS.length; i++) {
                if (await existsById(driver, BUTTON_IDS[i])) {
                    visibleCount += 1;
                }
            }
            hilog.info(DOMAIN, TAG, 'visibleCount=%{public}d', visibleCount);
            expect(visibleCount).assertEqual(BUTTON_IDS.length);
            expect(visibleCount).assertEqual(4);
            expect(visibleCount > 3).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1008
         * @tc.name testNotificationUi1008
         * @tc.desc 基本类型按钮文案为 Basic notification
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testNotificationUi1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const label: string = await textOf(driver, BASIC_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'label=%{public}s', label);
            expect(label).assertEqual(BASIC_LABEL);
            expect(label.length).assertEqual(BASIC_LABEL.length);
            expect(label === LONG_TEXT_LABEL).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_UI_1009
         * @tc.name testNotificationUi1009
         * @tc.desc 长文本按钮文案为 Long text notification
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const label: string = await textOf(driver, LONG_TEXT_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'label=%{public}s', label);
            expect(label).assertEqual(LONG_TEXT_LABEL);
            expect(label.length > 0).assertTrue();
            expect(label === BASIC_LABEL).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_UI_1010
         * @tc.name testNotificationUi1010
         * @tc.desc 图片按钮文案为 Picture notification
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const label: string = await textOf(driver, PICTURE_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'label=%{public}s', label);
            expect(label).assertEqual(PICTURE_LABEL);
            expect(label.length > 0).assertTrue();
            expect(label === MULTILINE_LABEL).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_UI_1011
         * @tc.name testNotificationUi1011
         * @tc.desc 多行文本按钮文案为 Multiline notification
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const label: string = await textOf(driver, MULTILINE_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'label=%{public}s', label);
            expect(label).assertEqual(MULTILINE_LABEL);
            expect(label.length > 0).assertTrue();
            expect(label === PICTURE_LABEL).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_UI_1012
         * @tc.name testNotificationUi1012
         * @tc.desc 发送页不展示消息列表容器
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const listHidden: boolean = !(await existsById(driver, LIST_ID));
            const basicVisible: boolean = await existsById(driver, BASIC_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'listHidden=%{public}s basic=%{public}s',
                String(listHidden), String(basicVisible));
            expect(listHidden).assertTrue();
            expect(basicVisible).assertTrue();
            expect(listHidden && basicVisible).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1013
         * @tc.name testNotificationUi1013
         * @tc.desc 从发送页切回消息页后列表容器恢复
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const back: boolean = await switchToMessageTab(driver);
            const listVisible: boolean = await existsById(driver, LIST_ID);
            const basicHidden: boolean = !(await existsById(driver, BASIC_BUTTON_ID));
            const titleText: string = await textOf(driver, TITLE_ID);
            hilog.info(DOMAIN, TAG, 'back=%{public}s list=%{public}s basicHidden=%{public}s title=%{public}s',
                String(back), String(listVisible), String(basicHidden), titleText);
            expect(back).assertTrue();
            expect(listVisible).assertTrue();
            expect(titleText).assertEqual(MESSAGE_TITLE);
        });

        /**
         * @tc.number SUB_CNB_UI_1014
         * @tc.name testNotificationUi1014
         * @tc.desc 页签往返两轮后仍停在消息页
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            let roundTrips: number = 0;
            for (let i = 0; i < 2; i++) {
                await switchToPublishTab(driver);
                if (await switchToMessageTab(driver)) {
                    roundTrips += 1;
                }
            }
            const listVisible: boolean = await existsById(driver, LIST_ID);
            hilog.info(DOMAIN, TAG, 'roundTrips=%{public}d list=%{public}s', roundTrips, String(listVisible));
            expect(roundTrips).assertEqual(2);
            expect(listVisible).assertTrue();
            expect(roundTrips > 1).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1015
         * @tc.name testNotificationUi1015
         * @tc.desc 点击基本类型按钮后应用仍存活
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const tapped: boolean = await tap(driver, BASIC_BUTTON_ID);
            await delay(400);
            const alive: boolean = await existsById(driver, TITLE_ID);
            const buttonStillThere: boolean = await existsById(driver, BASIC_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s alive=%{public}s', String(tapped), String(alive));
            expect(tapped).assertTrue();
            expect(alive).assertTrue();
            expect(buttonStillThere).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1016
         * @tc.name testNotificationUi1016
         * @tc.desc 点击长文本按钮后应用仍存活
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const tapped: boolean = await tap(driver, LONG_TEXT_BUTTON_ID);
            await delay(400);
            const alive: boolean = await existsById(driver, TITLE_ID);
            const buttonStillThere: boolean = await existsById(driver, LONG_TEXT_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s alive=%{public}s', String(tapped), String(alive));
            expect(tapped).assertTrue();
            expect(alive).assertTrue();
            expect(buttonStillThere).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1017
         * @tc.name testNotificationUi1017
         * @tc.desc 点击图片按钮后应用仍存活
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const tapped: boolean = await tap(driver, PICTURE_BUTTON_ID);
            await delay(600);
            const alive: boolean = await existsById(driver, TITLE_ID);
            const buttonStillThere: boolean = await existsById(driver, PICTURE_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s alive=%{public}s', String(tapped), String(alive));
            expect(tapped).assertTrue();
            expect(alive).assertTrue();
            expect(buttonStillThere).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1018
         * @tc.name testNotificationUi1018
         * @tc.desc 点击多行文本按钮后应用仍存活
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const tapped: boolean = await tap(driver, MULTILINE_BUTTON_ID);
            await delay(400);
            const alive: boolean = await existsById(driver, TITLE_ID);
            const buttonStillThere: boolean = await existsById(driver, MULTILINE_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s alive=%{public}s', String(tapped), String(alive));
            expect(tapped).assertTrue();
            expect(alive).assertTrue();
            expect(buttonStillThere).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1019
         * @tc.name testNotificationUi1019
         * @tc.desc 依次点击四个按钮后应用仍存活且可切页
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testNotificationUi1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let tappedCount: number = 0;
            for (let i = 0; i < BUTTON_IDS.length; i++) {
                if (await tap(driver, BUTTON_IDS[i])) {
                    tappedCount += 1;
                }
                await delay(200);
            }
            const alive: boolean = await existsById(driver, TITLE_ID);
            const backHome: boolean = await switchToMessageTab(driver);
            hilog.info(DOMAIN, TAG, 'tappedCount=%{public}d alive=%{public}s back=%{public}s',
                tappedCount, String(alive), String(backHome));
            expect(tappedCount).assertEqual(BUTTON_IDS.length);
            expect(alive).assertTrue();
            expect(backHome).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1020
         * @tc.name testNotificationUi1020
         * @tc.desc 发布后返回消息页，页签文案恢复为 Messages List
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            await tap(driver, BASIC_BUTTON_ID);
            await delay(400);
            const back: boolean = await switchToMessageTab(driver);
            const messageTitleVisible: boolean = await existsByText(driver, MESSAGE_TITLE);
            const titleText: string = await textOf(driver, TITLE_ID);
            hilog.info(DOMAIN, TAG, 'back=%{public}s messageTitle=%{public}s title=%{public}s',
                String(back), String(messageTitleVisible), titleText);
            expect(back).assertTrue();
            expect(messageTitleVisible).assertTrue();
            expect(titleText).assertEqual(MESSAGE_TITLE);
        });

        /**
         * @tc.number SUB_CNB_UI_1021
         * @tc.name testNotificationUi1021
         * @tc.desc 四个按钮文案两两不同
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const labels: string[] = [];
            for (let i = 0; i < BUTTON_IDS.length; i++) {
                labels.push(await textOf(driver, BUTTON_IDS[i]));
            }
            const unique: string[] = [];
            for (let i = 0; i < labels.length; i++) {
                if (labels[i].length > 0 && unique.indexOf(labels[i]) < 0) {
                    unique.push(labels[i]);
                }
            }
            hilog.info(DOMAIN, TAG, 'labelCount=%{public}d unique=%{public}d', labels.length, unique.length);
            expect(unique.length).assertEqual(labels.length);
            expect(unique.length).assertEqual(4);
            expect(labels.indexOf('')).assertEqual(-1);
        });

        /**
         * @tc.number SUB_CNB_UI_1022
         * @tc.name testNotificationUi1022
         * @tc.desc 页签切换三轮后按钮集合保持稳定
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testNotificationUi1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            const driver: Driver = Driver.create();
            let stableRounds: number = 0;
            for (let i = 0; i < 3; i++) {
                const entered: boolean = await switchToPublishTab(driver);
                let visible: number = 0;
                for (let j = 0; j < BUTTON_IDS.length; j++) {
                    if (await existsById(driver, BUTTON_IDS[j])) {
                        visible += 1;
                    }
                }
                if (entered && visible === BUTTON_IDS.length) {
                    stableRounds += 1;
                }
                await switchToMessageTab(driver);
            }
            hilog.info(DOMAIN, TAG, 'stableRounds=%{public}d', stableRounds);
            expect(stableRounds).assertEqual(3);
            expect(stableRounds > 2).assertTrue();
            expect(BUTTON_IDS.length).assertEqual(4);
        });

        /**
         * @tc.number SUB_CNB_UI_1023
         * @tc.name testNotificationUi1023
         * @tc.desc 发送页按钮文案全部非空且与 id 一一对应
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const basicLabel: string = await textOf(driver, BASIC_BUTTON_ID);
            const longTextLabel: string = await textOf(driver, LONG_TEXT_BUTTON_ID);
            const pictureLabel: string = await textOf(driver, PICTURE_BUTTON_ID);
            const multilineLabel: string = await textOf(driver, MULTILINE_BUTTON_ID);
            hilog.info(DOMAIN, TAG, 'labels=%{public}s|%{public}s|%{public}s|%{public}s',
                basicLabel, longTextLabel, pictureLabel, multilineLabel);
            expect(basicLabel === BASIC_LABEL).assertTrue();
            expect(longTextLabel === LONG_TEXT_LABEL).assertTrue();
            expect(pictureLabel === PICTURE_LABEL).assertTrue();
            expect(multilineLabel === MULTILINE_LABEL).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_UI_1024
         * @tc.name testNotificationUi1024
         * @tc.desc 用例结束前可复位到消息列表页并保持可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testNotificationUi1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            const home: boolean = await ensureMessageHome(driver);
            const listVisible: boolean = await existsById(driver, LIST_ID);
            const titleVisible: boolean = await existsById(driver, TITLE_ID);
            log(`resetHome=${home} list=${listVisible}`);
            expect(home).assertTrue();
            expect(listVisible).assertTrue();
            expect(titleVisible).assertTrue();
        });
    });
}
