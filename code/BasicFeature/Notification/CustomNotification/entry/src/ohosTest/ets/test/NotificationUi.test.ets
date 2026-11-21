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

// Index 页面的双层页签、两个开关、6 个发布入口与取消全部。
// 只通过语义 id（P0b 已补 17 个）与文案定位，不使用固定坐标；
// 断言不做"通知出现在状态栏"这类跨窗口检查，只验证点击后界面自洽与控件可再交互。
import { describe, it, expect, beforeAll, afterEach, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
    existsId,
    existsText,
    tapId,
    launchApp,
    switchToPublishTab,
    switchToMessageTab,
    dismissDialogs,
    messageTabLabel
} from './helper/UiFlow';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const PUBLISH_IDS: string[] = [
    'publishBasic', 'publishLongText', 'publishMultiLine',
    'publishPicture', 'publishButtons', 'publishWantAgent'
];

export default function notificationUiTest() {
    describe('NotificationUi', () => {
        beforeAll(async () => {
            await launchApp();
        });

        afterEach(async () => {
            let driver: Driver = Driver.create();
            await switchToMessageTab(driver);
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1001
         * @tc.name testUi1001
         * @tc.desc 启动后两个页签均可见，消息页标题文案可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUi1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1001 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            let hasMessageTab: boolean = await existsId(driver, 'tabBar0');
            let hasPublishTab: boolean = await existsId(driver, 'tabBar1');
            let hasTitle: boolean = await existsText(driver, messageTabLabel());
            hilog.info(DOMAIN, TAG, 'tabBar0=%{public}s tabBar1=%{public}s title=%{public}s, expected=true/true/true',
                String(hasMessageTab), String(hasPublishTab), String(hasTitle));
            expect(hasMessageTab).assertTrue();
            expect(hasPublishTab).assertTrue();
            expect(hasTitle).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1002
         * @tc.name testUi1002
         * @tc.desc 默认停在消息页签：发布页的按钮与取消全部均不可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUi1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1002 begin');
            let driver: Driver = Driver.create();
            let hasPublishButton: boolean = await existsId(driver, 'publishBasic');
            let hasCancelAll: boolean = await existsId(driver, 'cancelAll');
            hilog.info(DOMAIN, TAG, 'publishBasic=%{public}s cancelAll=%{public}s, expected=false/false',
                String(hasPublishButton), String(hasCancelAll));
            expect(hasPublishButton).assertFalse();
            expect(hasCancelAll).assertFalse();
            expect(await existsId(driver, 'tabBar0')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1003
         * @tc.name testUi1003
         * @tc.desc 点击发布页签后进入发布页：基础通知按钮出现
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUi1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1003 begin');
            let driver: Driver = Driver.create();
            let tapped: boolean = await tapId(driver, 'tabBar1');
            let entered: boolean = await switchToPublishTab(driver);
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s entered=%{public}s, expected=true/true',
                String(tapped), String(entered));
            expect(tapped).assertTrue();
            expect(entered).assertTrue();
            expect(await existsId(driver, 'tabBar1')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1004
         * @tc.name testUi1004
         * @tc.desc 从发布页点回消息页签：发布按钮消失、页签仍可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1004 begin');
            let driver: Driver = Driver.create();
            let entered: boolean = await switchToPublishTab(driver);
            let back: boolean = await switchToMessageTab(driver);
            let hasPublishButton: boolean = await existsId(driver, 'publishBasic');
            hilog.info(DOMAIN, TAG, 'entered=%{public}s back=%{public}s publishBasic=%{public}s',
                String(entered), String(back), String(hasPublishButton));
            expect(entered).assertTrue();
            expect(back).assertTrue();
            expect(hasPublishButton).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1005
         * @tc.name testUi1005
         * @tc.desc 发布页 6 个发布入口全部存在（P0b 补的语义 id 全部可定位）
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUi1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1005 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            for (let i: number = 0; i < PUBLISH_IDS.length; i++) {
                let visible: boolean = await existsId(driver, PUBLISH_IDS[i]);
                hilog.info(DOMAIN, TAG, 'id=%{public}s visible=%{public}s, expected=true',
                    PUBLISH_IDS[i], String(visible));
                expect(visible).assertTrue();
            }
            expect(await existsId(driver, 'cancelAll')).assertTrue();
            expect(PUBLISH_IDS.length).assertEqual(6);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1006
         * @tc.name testUi1006
         * @tc.desc 发布页取消全部按钮存在且可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1006 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let hasCancelAll: boolean = await existsId(driver, 'cancelAll');
            hilog.info(DOMAIN, TAG, 'cancelAll=%{public}s, expected=true', String(hasCancelAll));
            expect(hasCancelAll).assertTrue();
            expect(await existsId(driver, 'publishBasic')).assertTrue();
            expect(await existsId(driver, 'tabBar1')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1007
         * @tc.name testUi1007
         * @tc.desc 两个开关（提示音 / 振动）在发布页可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUi1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1007 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let hasPromptTone: boolean = await existsId(driver, 'promptTone');
            let hasVibration: boolean = await existsId(driver, 'vibrationEffect');
            hilog.info(DOMAIN, TAG, 'promptTone=%{public}s vibrationEffect=%{public}s, expected=true/true',
                String(hasPromptTone), String(hasVibration));
            expect(hasPromptTone).assertTrue();
            expect(hasVibration).assertTrue();
            expect(await existsId(driver, 'publishBasic')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1008
         * @tc.name testUi1008
         * @tc.desc 点击基础通知入口后仍停留在发布页，页面可继续操作
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUi1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1008 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let tapped: boolean = await tapId(driver, 'publishBasic');
            let stillHere: boolean = await existsId(driver, 'publishBasic');
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s stillHere=%{public}s, expected=true/true',
                String(tapped), String(stillHere));
            expect(tapped).assertTrue();
            expect(stillHere).assertTrue();
            expect(await existsId(driver, 'cancelAll')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1009
         * @tc.name testUi1009
         * @tc.desc 点击长文本通知入口后本入口与相邻多行入口仍可定位
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1009 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let tapped: boolean = await tapId(driver, 'publishLongText');
            let sameButton: boolean = await existsId(driver, 'publishLongText');
            let siblingButton: boolean = await existsId(driver, 'publishMultiLine');
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s same=%{public}s sibling=%{public}s, expected=true/true/true',
                String(tapped), String(sameButton), String(siblingButton));
            expect(tapped).assertTrue();
            expect(sameButton).assertTrue();
            expect(siblingButton).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1010
         * @tc.name testUi1010
         * @tc.desc 点击多行文本通知入口后相邻图片入口与取消全部仍可定位
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1010 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let tapped: boolean = await tapId(driver, 'publishMultiLine');
            let sameButton: boolean = await existsId(driver, 'publishMultiLine');
            let pictureButton: boolean = await existsId(driver, 'publishPicture');
            let cancelAllButton: boolean = await existsId(driver, 'cancelAll');
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s same=%{public}s picture=%{public}s cancelAll=%{public}s',
                String(tapped), String(sameButton), String(pictureButton), String(cancelAllButton));
            expect(tapped).assertTrue();
            expect(sameButton).assertTrue();
            expect(pictureButton).assertTrue();
            expect(cancelAllButton).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1011
         * @tc.name testUi1011
         * @tc.desc 点击图片通知入口后相邻按钮入口与提示音开关仍可定位
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1011 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let tapped: boolean = await tapId(driver, 'publishPicture');
            let sameButton: boolean = await existsId(driver, 'publishPicture');
            let buttonsButton: boolean = await existsId(driver, 'publishButtons');
            let promptToneSwitch: boolean = await existsId(driver, 'promptTone');
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s same=%{public}s buttons=%{public}s promptTone=%{public}s',
                String(tapped), String(sameButton), String(buttonsButton), String(promptToneSwitch));
            expect(tapped).assertTrue();
            expect(sameButton).assertTrue();
            expect(buttonsButton).assertTrue();
            expect(promptToneSwitch).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1012
         * @tc.name testUi1012
         * @tc.desc 点击带按钮通知入口后相邻跳转入口与振动开关仍可定位
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1012 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let tapped: boolean = await tapId(driver, 'publishButtons');
            let sameButton: boolean = await existsId(driver, 'publishButtons');
            let wantAgentButton: boolean = await existsId(driver, 'publishWantAgent');
            let vibrationSwitch: boolean = await existsId(driver, 'vibrationEffect');
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s same=%{public}s wantAgent=%{public}s vibration=%{public}s',
                String(tapped), String(sameButton), String(wantAgentButton), String(vibrationSwitch));
            expect(tapped).assertTrue();
            expect(sameButton).assertTrue();
            expect(wantAgentButton).assertTrue();
            expect(vibrationSwitch).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1013
         * @tc.name testUi1013
         * @tc.desc 点击可跳转通知入口后仍可切回消息页且发布控件消失
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1013 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let tapped: boolean = await tapId(driver, 'publishWantAgent');
            let sameButton: boolean = await existsId(driver, 'publishWantAgent');
            let backToMessage: boolean = await switchToMessageTab(driver);
            let publishGone: boolean = await existsId(driver, 'publishBasic');
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s same=%{public}s back=%{public}s publishGone=%{public}s',
                String(tapped), String(sameButton), String(backToMessage), String(publishGone));
            expect(tapped).assertTrue();
            expect(sameButton).assertTrue();
            expect(backToMessage).assertTrue();
            expect(publishGone).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1014
         * @tc.name testUi1014
         * @tc.desc 依次点击 6 个发布入口后页面仍可交互
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1014 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            for (let i: number = 0; i < PUBLISH_IDS.length; i++) {
                let tapped: boolean = await tapId(driver, PUBLISH_IDS[i]);
                hilog.info(DOMAIN, TAG, 'tap %{public}s -> %{public}s, expected=true',
                    PUBLISH_IDS[i], String(tapped));
                expect(tapped).assertTrue();
            }
            expect(await existsId(driver, 'publishBasic')).assertTrue();
            expect(await existsId(driver, 'tabBar0')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1015
         * @tc.name testUi1015
         * @tc.desc 提示音开关连续切换两次后仍可定位（开关可反复操作）
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1015 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let first: boolean = await tapId(driver, 'promptTone');
            let second: boolean = await tapId(driver, 'promptTone');
            hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s, expected=true/true',
                String(first), String(second));
            expect(first).assertTrue();
            expect(second).assertTrue();
            expect(await existsId(driver, 'promptTone')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1016
         * @tc.name testUi1016
         * @tc.desc 振动开关连续切换三次后仍可定位（奇数次切回原状且可反复操作）
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1016 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let first: boolean = await tapId(driver, 'vibrationEffect');
            let second: boolean = await tapId(driver, 'vibrationEffect');
            let third: boolean = await tapId(driver, 'vibrationEffect');
            let switchVisible: boolean = await existsId(driver, 'vibrationEffect');
            hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s third=%{public}s visible=%{public}s',
                String(first), String(second), String(third), String(switchVisible));
            expect(first).assertTrue();
            expect(second).assertTrue();
            expect(third).assertTrue();
            expect(switchVisible).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1017
         * @tc.name testUi1017
         * @tc.desc 取消全部后切走再回发布页，控件仍全部可定位
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1017 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let tapped: boolean = await tapId(driver, 'cancelAll');
            let firstVisible: boolean = await existsId(driver, 'cancelAll');
            let reenteredMessages: boolean = await switchToMessageTab(driver);
            let backToPublish: boolean = await switchToPublishTab(driver);
            hilog.info(DOMAIN, TAG, 'tapped=%{public}s first=%{public}s messages=%{public}s publish=%{public}s',
                String(tapped), String(firstVisible), String(reenteredMessages), String(backToPublish));
            expect(tapped).assertTrue();
            expect(firstVisible).assertTrue();
            expect(reenteredMessages).assertTrue();
            expect(backToPublish).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1018
         * @tc.name testUi1018
         * @tc.desc 切到消息页签后列表标题可见，发布控件不可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1018 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let back: boolean = await switchToMessageTab(driver);
            let hasTitle: boolean = await existsText(driver, messageTabLabel());
            hilog.info(DOMAIN, TAG, 'back=%{public}s title=%{public}s, expected=true/true',
                String(back), String(hasTitle));
            expect(back).assertTrue();
            expect(hasTitle).assertTrue();
            expect(await existsId(driver, 'publishBasic')).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1019
         * @tc.name testUi1019
         * @tc.desc 页签往返 3 次后仍可交互（状态不残留）
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1019 begin');
            let driver: Driver = Driver.create();
            for (let i: number = 0; i < 3; i++) {
                let entered: boolean = await switchToPublishTab(driver);
                let back: boolean = await switchToMessageTab(driver);
                hilog.info(DOMAIN, TAG, 'round=%{public}d entered=%{public}s back=%{public}s',
                    i, String(entered), String(back));
                expect(entered).assertTrue();
                expect(back).assertTrue();
            }
            expect(await existsId(driver, 'tabBar0')).assertTrue();
            expect(await existsId(driver, 'tabBar1')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1020
         * @tc.name testUi1020
         * @tc.desc 结束态复位到消息页签，发布控件全部不可见
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1020 begin');
            let driver: Driver = Driver.create();
            await switchToPublishTab(driver);
            let back: boolean = await switchToMessageTab(driver);
            hilog.info(DOMAIN, TAG, 'back=%{public}s, expected=true', String(back));
            expect(back).assertTrue();
            expect(await existsId(driver, 'publishBasic')).assertFalse();
            expect(await existsId(driver, 'cancelAll')).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1020 end');
        });
    });
}
