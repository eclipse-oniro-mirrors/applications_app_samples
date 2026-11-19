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

// 发布页开关与发布链的界面侧状态链。测试代码运行在 entry_test 进程，
// main 的 notificationUtil / notificationManagement 是各自进程内的单例，
// 因此所有观测量都取界面可见结果：Toggle 的勾选状态 + 消息页分组行。
// 只走 ON.id() / ON.text() 定位，无坐标点击；开关跨例复位由 beforeEach 负责。
import { describe, it, expect, beforeAll, beforeEach, afterEach, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getString } from '../util/ResourceUtil';
import {
    existsText,
    isCheckedId,
    tapId,
    launchApp,
    setChecked,
    countGroups,
    switchToPublishTab,
    switchToMessageTab,
    refreshMessageTabAndCheck,
    dismissDialogs
} from './helper/UiFlow';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const ID_TONE: string = 'promptTone';
const ID_VIBRATION: string = 'vibrationEffect';
const ID_PUBLISH_BASIC: string = 'publishBasic';
const ID_PUBLISH_WANTAGENT: string = 'publishWantAgent';
const ID_CANCEL_ALL: string = 'cancelAll';
// 基础文本通知的内容类型槽位为 0，对应消息页的 notificationGroup0
const SLOT_BASIC: number = 0;

export default function notificationUiStateTest() {
    describe('NotificationUiState', () => {
        beforeAll(async () => {
            await launchApp();
        });

        beforeEach(async () => {
            // 开关与分组状态都存在 main 进程，跨例复位只能走界面：
            // 先清空通知列表，再把两个开关点回关闭。
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            await switchToPublishTab(driver);
            await tapId(driver, ID_CANCEL_ALL);
            await setChecked(driver, ID_TONE, false);
            await setChecked(driver, ID_VIBRATION, false);
        });

        afterEach(async () => {
            let driver: Driver = Driver.create();
            await switchToMessageTab(driver);
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1021
         * @tc.name testUiState1021
         * @tc.desc 发布页两个开关可见且初始为关闭态
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUiState1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1021 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            let switched: boolean = await switchToPublishTab(driver);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(switched));
            expect(switched).assertTrue();
            let toneChecked: boolean = await isCheckedId(driver, ID_TONE);
            let vibrationChecked: boolean = await isCheckedId(driver, ID_VIBRATION);
            hilog.info(DOMAIN, TAG, 'toneChecked=%{public}s vibrationChecked=%{public}s, expected=false/false',
                String(toneChecked), String(vibrationChecked));
            expect(toneChecked).assertFalse();
            expect(vibrationChecked).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1021 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1022
         * @tc.name testUiState1022
         * @tc.desc 点击提示音开关：界面勾选状态翻转，再点一次恢复原状态
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUiState1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1022 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            expect(await switchToPublishTab(driver)).assertTrue();
            let before: boolean = await isCheckedId(driver, ID_TONE);
            let flipped: boolean = await setChecked(driver, ID_TONE, !before);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(flipped));
            expect(flipped).assertTrue();
            let on: boolean = await isCheckedId(driver, ID_TONE);
            hilog.info(DOMAIN, TAG, 'checked=%{public}s, expected=%{public}s', String(on), String(!before));
            expect(on).assertEqual(!before);
            let restored: boolean = await setChecked(driver, ID_TONE, before);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(restored));
            expect(restored).assertTrue();
            let back: boolean = await isCheckedId(driver, ID_TONE);
            hilog.info(DOMAIN, TAG, 'checked=%{public}s, expected=%{public}s', String(back), String(before));
            expect(back).assertEqual(before);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1022 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1023
         * @tc.name testUiState1023
         * @tc.desc 点击振动开关：仅该开关勾选状态翻转，提示音开关不受牵动
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUiState1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1023 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            expect(await switchToPublishTab(driver)).assertTrue();
            let toneBefore: boolean = await isCheckedId(driver, ID_TONE);
            let vibeBefore: boolean = await isCheckedId(driver, ID_VIBRATION);
            let flipped: boolean = await setChecked(driver, ID_VIBRATION, !vibeBefore);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(flipped));
            expect(flipped).assertTrue();
            let vibeAfter: boolean = await isCheckedId(driver, ID_VIBRATION);
            hilog.info(DOMAIN, TAG, 'checked=%{public}s, expected=%{public}s', String(vibeAfter), String(!vibeBefore));
            expect(vibeAfter).assertEqual(!vibeBefore);
            let toneAfter: boolean = await isCheckedId(driver, ID_TONE);
            hilog.info(DOMAIN, TAG, 'checked=%{public}s, expected=%{public}s', String(toneAfter), String(toneBefore));
            expect(toneAfter).assertEqual(toneBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1023 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1024
         * @tc.name testUiState1024
         * @tc.desc 两个开关依次打开后同时为勾选态，再依次关闭后同时取消勾选
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUiState1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1024 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            expect(await switchToPublishTab(driver)).assertTrue();
            expect(await setChecked(driver, ID_TONE, true)).assertTrue();
            expect(await setChecked(driver, ID_VIBRATION, true)).assertTrue();
            let toneOn: boolean = await isCheckedId(driver, ID_TONE);
            let vibrationOn: boolean = await isCheckedId(driver, ID_VIBRATION);
            hilog.info(DOMAIN, TAG, 'toneChecked=%{public}s vibrationChecked=%{public}s, expected=true/true',
                String(toneOn), String(vibrationOn));
            expect(toneOn).assertTrue();
            expect(vibrationOn).assertTrue();
            expect(await setChecked(driver, ID_TONE, false)).assertTrue();
            expect(await setChecked(driver, ID_VIBRATION, false)).assertTrue();
            let toneOff: boolean = await isCheckedId(driver, ID_TONE);
            let vibrationOff: boolean = await isCheckedId(driver, ID_VIBRATION);
            hilog.info(DOMAIN, TAG, 'toneChecked=%{public}s vibrationChecked=%{public}s, expected=false/false',
                String(toneOff), String(vibrationOff));
            expect(toneOff).assertFalse();
            expect(vibrationOff).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1024 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1025
         * @tc.name testUiState1025
         * @tc.desc 状态链贯通（提示音）：开关开启后点发布基础通知，消息页出现基础通知分组
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level0
         */
        it('testUiState1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1025 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            expect(await switchToPublishTab(driver)).assertTrue();
            expect(await tapId(driver, ID_CANCEL_ALL)).assertTrue();
            let emptyBefore: boolean = await refreshMessageTabAndCheck(driver, SLOT_BASIC, false);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(emptyBefore));
            expect(emptyBefore).assertTrue();
            expect(await switchToPublishTab(driver)).assertTrue();
            expect(await setChecked(driver, ID_TONE, true)).assertTrue();
            expect(await tapId(driver, ID_PUBLISH_BASIC)).assertTrue();
            let appeared: boolean = await refreshMessageTabAndCheck(driver, SLOT_BASIC, true);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(appeared));
            expect(appeared).assertTrue();
            let titleText: string = getString($r('app.string.basic_notification'));
            let titleShown: boolean = await existsText(driver, titleText);
            hilog.info(DOMAIN, TAG, 'title=%{public}s shown=%{public}s, expected=true',
                titleText, String(titleShown));
            expect(titleShown).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1025 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1026
         * @tc.name testUiState1026
         * @tc.desc 状态链贯通（默认关）：直接点发布跳转通知，消息页出现基础通知分组
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUiState1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1026 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            expect(await switchToPublishTab(driver)).assertTrue();
            expect(await tapId(driver, ID_CANCEL_ALL)).assertTrue();
            let emptyBefore: boolean = await refreshMessageTabAndCheck(driver, SLOT_BASIC, false);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(emptyBefore));
            expect(emptyBefore).assertTrue();
            expect(await switchToPublishTab(driver)).assertTrue();
            expect(await tapId(driver, ID_PUBLISH_WANTAGENT)).assertTrue();
            let appeared: boolean = await refreshMessageTabAndCheck(driver, SLOT_BASIC, true);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(appeared));
            expect(appeared).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1026 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1027
         * @tc.name testUiState1027
         * @tc.desc 点击取消全部按钮：已有分组从消息页消失，列表回到空态
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUiState1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1027 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            expect(await switchToPublishTab(driver)).assertTrue();
            expect(await tapId(driver, ID_PUBLISH_BASIC)).assertTrue();
            let appeared: boolean = await refreshMessageTabAndCheck(driver, SLOT_BASIC, true);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(appeared));
            expect(appeared).assertTrue();
            expect(await switchToPublishTab(driver)).assertTrue();
            expect(await tapId(driver, ID_CANCEL_ALL)).assertTrue();
            let cleared: boolean = await refreshMessageTabAndCheck(driver, SLOT_BASIC, false);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(cleared));
            expect(cleared).assertTrue();
            let remainGroups: number = await countGroups(driver);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', remainGroups, 0);
            expect(remainGroups).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1027 end');
        });

        /**
         * @tc.number SUB_CustomNotification_UI_1028
         * @tc.name testUiState1028
         * @tc.desc 组合链路：双开关开启后发布基础通知，分组出现且返回发布页两开关保持勾选
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUiState1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1028 begin');
            let driver: Driver = Driver.create();
            await dismissDialogs(driver);
            expect(await switchToPublishTab(driver)).assertTrue();
            expect(await setChecked(driver, ID_TONE, true)).assertTrue();
            expect(await setChecked(driver, ID_VIBRATION, true)).assertTrue();
            expect(await tapId(driver, ID_CANCEL_ALL)).assertTrue();
            expect(await tapId(driver, ID_PUBLISH_BASIC)).assertTrue();
            let appeared: boolean = await refreshMessageTabAndCheck(driver, SLOT_BASIC, true);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(appeared));
            expect(appeared).assertTrue();
            expect(await switchToPublishTab(driver)).assertTrue();
            let toneOn: boolean = await isCheckedId(driver, ID_TONE);
            let vibrationOn: boolean = await isCheckedId(driver, ID_VIBRATION);
            hilog.info(DOMAIN, TAG, 'toneChecked=%{public}s vibrationChecked=%{public}s, expected=true/true',
                String(toneOn), String(vibrationOn));
            expect(toneOn).assertTrue();
            expect(vibrationOn).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUiState1028 end');
        });
    });
}
