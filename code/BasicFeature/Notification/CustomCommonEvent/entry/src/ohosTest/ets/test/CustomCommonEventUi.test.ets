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

import { describe, it, expect, beforeAll, afterEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Component } from '@ohos.UiTest';
import commonEventManager from '@ohos.commonEventManager';
import {
    UiFlow, DetailListState, ID_LAUNCH, ID_HISTORY, ID_SETTING, ID_ABOUT, ID_START, ID_NEXT_DETAIL, ID_COMMON_EVENT,
    ID_ONCE_TEXT, ID_DETAIL_LIST, ID_HISTORY_LIST, ID_MAIN_CURRENT_EVENT, ID_MAIN_DURATION,
    ID_MAIN_EVENT_COUNT, ID_ABOUT_VERSION, TXT_CURRENT_LISTEN, TXT_TOTAL_TIME, TXT_TOTAL_INTERRUPT, TXT_ONCE_TIPS,
    TXT_START_TIME, TXT_END_TIME, TXT_TOTAL_TIME_LABEL, TXT_TOTAL_INTERRUPT_LABEL, TXT_SAMPLE_VERSION,
    TXT_SAMPLE_DESC_PREFIX, TXT_COMMON_EVENT_TITLE, TXT_ENABLE_WIFI, TXT_ENABLE_OFF,
    TXT_ENABLE_ON, TXT_ENABLE_LOCKED, TXT_ENABLE_UNLOCKED, TXT_ALWAYS, TXT_ONCE, TXT_NEVER, REGEX_HHMMSS
} from './helper/UiFlow';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'CustomCommonEventUi_';
const WAIT_SHORT: number = 3000;
const WAIT_LONG: number = 15000;
const WIFI: string = commonEventManager.Support.COMMON_EVENT_WIFI_POWER_STATE;
const SCREEN_OFF_EVENT: string = commonEventManager.Support.COMMON_EVENT_SCREEN_OFF;
const SCREEN_ON_EVENT: string = commonEventManager.Support.COMMON_EVENT_SCREEN_ON;
const LOCKED_EVENT: string = commonEventManager.Support.COMMON_EVENT_SCREEN_LOCKED;
const UNLOCKED_EVENT: string = commonEventManager.Support.COMMON_EVENT_SCREEN_UNLOCKED;
const EVENT_GROUPS: Array<string> = [WIFI, SCREEN_OFF_EVENT, SCREEN_ON_EVENT, LOCKED_EVENT, UNLOCKED_EVENT];
const STATE_ALWAYS: number = 0;
const STATE_ONCE: number = 1;
const STATE_NEVER: number = 2;

function logBegin(tag: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, '%{public}s', 'case begin');
}

function logEnd(tag: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, '%{public}s', 'case end');
}

function logPair(tag: string, label: string, actual: string, expected: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, 'label=%{public}s actual=%{public}s expected=%{public}s',
        label, actual, expected);
}

async function countTexts(texts: Array<string>): Promise<number> {
    let matched: number = 0;
    for (let index = 0; index < texts.length; index++) {
        if (await UiFlow.findText(texts[index]) !== null) {
            matched++;
        }
    }
    return matched;
}

export default function customCommonEventUiTest(): void {
    describe('CustomCommonEventUiTest', () => {
        beforeAll(async () => {
            const ready: boolean = await UiFlow.ensureLaunchPage();
            hilog.info(DOMAIN, TAG_PREFIX + 'beforeAll', 'launch page ready=%{public}s', ready.toString());
        })

        afterEach(async () => {
            const reset: boolean = await UiFlow.resetToLaunchPage();
            hilog.info(DOMAIN, TAG_PREFIX + 'afterEach', 'reset to launch=%{public}s', reset.toString());
        })

        /**
         * @tc.number    SUB_CCE_UI_1001
         * @tc.name      testUiLaunchEntries1001
         * @tc.desc      首页四个功能入口都存在，可分别进入监控、历史、设置与关于
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiLaunchEntries1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiLaunchEntries1001';
            logBegin(tag);
            const ready: boolean = await UiFlow.ensureLaunchPage();
            logPair(tag, 'launchReady', ready.toString(), 'true');
            expect(ready).assertTrue();
            const hasStart: boolean = await UiFlow.findId(ID_LAUNCH) !== null;
            logPair(tag, 'jumpToStart', hasStart.toString(), 'true');
            expect(hasStart).assertTrue();
            const hasHistory: boolean = await UiFlow.findId(ID_HISTORY) !== null;
            logPair(tag, 'jumpToHistory', hasHistory.toString(), 'true');
            expect(hasHistory).assertTrue();
            const hasSetting: boolean = await UiFlow.findId(ID_SETTING) !== null;
            const hasAbout: boolean = await UiFlow.findId(ID_ABOUT) !== null;
            logPair(tag, 'settingAndAbout', hasSetting.toString() + ',' + hasAbout.toString(), 'true,true');
            expect(hasSetting && hasAbout).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1002
         * @tc.name      testUiEnterHistory1002
         * @tc.desc      点击历史入口进入历史页，首页入口消失，返回后入口重新出现
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiEnterHistory1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiEnterHistory1002';
            logBegin(tag);
            const opened: boolean = await UiFlow.openHistory();
            logPair(tag, 'historyOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const entryGone: boolean = await UiFlow.findId(ID_HISTORY) === null;
            logPair(tag, 'entryGone', entryGone.toString(), 'true');
            expect(entryGone).assertTrue();
            await UiFlow.back();
            const entryBack: boolean = await UiFlow.waitId(ID_HISTORY, WAIT_SHORT) !== null;
            logPair(tag, 'entryBack', entryBack.toString(), 'true');
            expect(entryBack).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1003
         * @tc.name      testUiEnterSetting1003
         * @tc.desc      点击设置入口进入设置页，订阅按钮与联网事件标题可见，首页入口消失
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiEnterSetting1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiEnterSetting1003';
            logBegin(tag);
            const opened: boolean = await UiFlow.openSetting();
            logPair(tag, 'settingOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const hasWifiTitle: boolean = await UiFlow.findText(TXT_ENABLE_WIFI) !== null;
            logPair(tag, 'wifiTitle', hasWifiTitle.toString(), 'true');
            expect(hasWifiTitle).assertTrue();
            const homeEntryGone: boolean = await UiFlow.findId(ID_SETTING) === null;
            logPair(tag, 'homeEntryGone', homeEntryGone.toString(), 'true');
            expect(homeEntryGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1004
         * @tc.name      testUiSettingFiveTitles1004
         * @tc.desc      设置页五个受管事件的标题文本全部呈现，数量为五
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiSettingFiveTitles1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiSettingFiveTitles1004';
            logBegin(tag);
            await UiFlow.openSetting();
            const titles: Array<string> = [TXT_ENABLE_WIFI, TXT_ENABLE_OFF, TXT_ENABLE_ON, TXT_ENABLE_LOCKED,
                TXT_ENABLE_UNLOCKED];
            const matched: number = await countTexts(titles);
            logPair(tag, 'matchedTitles', matched.toString(), '5');
            expect(matched).assertEqual(5);
            const offTitle: boolean = await UiFlow.findText(TXT_ENABLE_OFF) !== null;
            logPair(tag, 'screenOffTitle', offTitle.toString(), 'true');
            expect(offTitle).assertTrue();
            const unlockedTitle: boolean = await UiFlow.findText(TXT_ENABLE_UNLOCKED) !== null;
            logPair(tag, 'screenUnlockedTitle', unlockedTitle.toString(), 'true');
            expect(unlockedTitle).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1005
         * @tc.name      testUiSettingThreeStates1005
         * @tc.desc      设置页每个事件组都以「一直 / 仅本次 / 从不」三种文案呈现
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiSettingThreeStates1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiSettingThreeStates1005';
            logBegin(tag);
            await UiFlow.openSetting();
            const labels: Array<string> = [TXT_ALWAYS, TXT_ONCE, TXT_NEVER];
            const matched: number = await countTexts(labels);
            logPair(tag, 'matchedLabels', matched.toString(), '3');
            expect(matched).assertEqual(3);
            const always: boolean = await UiFlow.findText(TXT_ALWAYS) !== null;
            logPair(tag, 'alwaysLabel', always.toString(), 'true');
            expect(always).assertTrue();
            const never: boolean = await UiFlow.findText(TXT_NEVER) !== null;
            logPair(tag, 'neverLabel', never.toString(), 'true');
            expect(never).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1006
         * @tc.name      testUiEnterCommonEvent1006
         * @tc.desc      设置页订阅入口文案与资源逐字一致且可点击（点击拉起外部 CardEvent 示例）
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiEnterCommonEvent1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiEnterCommonEvent1006';
            logBegin(tag);
            const settingOpened: boolean = await UiFlow.openSetting();
            logPair(tag, 'settingOpened', settingOpened.toString(), 'true');
            expect(settingOpened).assertTrue();
            const entryText: string = await UiFlow.subscribeEntryText();
            logPair(tag, 'subscribeEntryText', entryText, TXT_COMMON_EVENT_TITLE);
            expect(entryText).assertEqual(TXT_COMMON_EVENT_TITLE);
            const clicked: boolean = await UiFlow.clickSubscribeEntry();
            logPair(tag, 'subscribeEntryClicked', clicked.toString(), 'true');
            expect(clicked).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1007
         * @tc.name      testUiBackFromCommonEvent1007
         * @tc.desc      订阅入口点击后按返回可复位到首页，设置入口恢复可见、订阅入口消失
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiBackFromCommonEvent1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiBackFromCommonEvent1007';
            logBegin(tag);
            const settingOpened: boolean = await UiFlow.openSetting();
            logPair(tag, 'settingOpened', settingOpened.toString(), 'true');
            expect(settingOpened).assertTrue();
            const clicked: boolean = await UiFlow.clickSubscribeEntry();
            logPair(tag, 'subscribeEntryClicked', clicked.toString(), 'true');
            expect(clicked).assertTrue();
            const backHome: boolean = await UiFlow.resetToLaunchPage();
            logPair(tag, 'backHome', backHome.toString(), 'true');
            expect(backHome).assertTrue();
            const settingEntry: boolean = await UiFlow.waitId(ID_SETTING, WAIT_SHORT) !== null;
            logPair(tag, 'settingEntryBack', settingEntry.toString(), 'true');
            expect(settingEntry).assertTrue();
            const subscribeGone: boolean = await UiFlow.findId(ID_COMMON_EVENT) === null;
            logPair(tag, 'subscribeEntryGone', subscribeGone.toString(), 'true');
            expect(subscribeGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1008
         * @tc.name      testUiBackFromSetting1008
         * @tc.desc      设置页返回首页后设置入口与历史入口同时可见，订阅按钮消失
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiBackFromSetting1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiBackFromSetting1008';
            logBegin(tag);
            await UiFlow.openSetting();
            await UiFlow.back();
            const settingEntry: boolean = await UiFlow.waitId(ID_SETTING, WAIT_LONG) !== null;
            logPair(tag, 'settingEntryBack', settingEntry.toString(), 'true');
            expect(settingEntry).assertTrue();
            const subscribeGone: boolean = await UiFlow.findId(ID_COMMON_EVENT) === null;
            logPair(tag, 'subscribeButtonGone', subscribeGone.toString(), 'true');
            expect(subscribeGone).assertTrue();
            const historyEntry: boolean = await UiFlow.findId(ID_HISTORY) !== null;
            logPair(tag, 'historyEntryBack', historyEntry.toString(), 'true');
            expect(historyEntry).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1009
         * @tc.name      testUiEnterAbout1009
         * @tc.desc      关于页展示版本号与示例说明文本，首页入口在跳转后消失
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiEnterAbout1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiEnterAbout1009';
            logBegin(tag);
            const opened: boolean = await UiFlow.openAbout();
            logPair(tag, 'aboutOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const version: Component | null = await UiFlow.waitText(TXT_SAMPLE_VERSION, WAIT_LONG);
            logPair(tag, 'versionVisible', (version !== null).toString(), 'true');
            expect(version !== null).assertTrue();
            const desc: Component | null = await UiFlow.waitText(TXT_SAMPLE_DESC_PREFIX, WAIT_LONG);
            logPair(tag, 'descVisible', (desc !== null).toString(), 'true');
            expect(desc !== null).assertTrue();
            const aboutEntryGone: boolean = await UiFlow.findId(ID_ABOUT) === null;
            logPair(tag, 'aboutEntryGone', aboutEntryGone.toString(), 'true');
            expect(aboutEntryGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1010
         * @tc.name      testUiBackFromAbout1010
         * @tc.desc      关于页返回首页后版本号文本消失，四个入口中至少三个可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiBackFromAbout1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiBackFromAbout1010';
            logBegin(tag);
            await UiFlow.openAbout();
            await UiFlow.back();
            const aboutEntry: boolean = await UiFlow.waitId(ID_ABOUT, WAIT_LONG) !== null;
            logPair(tag, 'aboutEntryBack', aboutEntry.toString(), 'true');
            expect(aboutEntry).assertTrue();
            const versionGone: boolean = await UiFlow.findText(TXT_SAMPLE_VERSION) === null;
            logPair(tag, 'versionGone', versionGone.toString(), 'true');
            expect(versionGone).assertTrue();
            const entries: number = await countTexts([TXT_ALWAYS]);
            logPair(tag, 'settingLabelsGone', entries.toString(), '0');
            expect(entries).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1011
         * @tc.name      testUiMonitorInitial1011
         * @tc.desc      进入监控界面后开始按钮可见；详情入口与本轮时长区同步显隐，且监听状态与详情入口互斥
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiMonitorInitial1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiMonitorInitial1011';
            logBegin(tag);
            const opened: boolean = await UiFlow.openMonitor();
            logPair(tag, 'monitorOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const hasButton: boolean = await UiFlow.findId(ID_START) !== null;
            logPair(tag, 'startButton', hasButton.toString(), 'true');
            expect(hasButton).assertTrue();
            const listening: boolean = await UiFlow.findText(TXT_CURRENT_LISTEN) !== null;
            const detailVisible: boolean = await UiFlow.findId(ID_NEXT_DETAIL) !== null;
            const durationVisible: boolean = await UiFlow.findText(TXT_TOTAL_TIME) !== null;
            logPair(tag, 'listeningState', listening.toString(), 'any');
            logPair(tag, 'detailEntry', detailVisible.toString(), 'any');
            logPair(tag, 'durationArea', durationVisible.toString(), 'sameAsDetailEntry');
            expect(detailVisible).assertEqual(durationVisible);
            logPair(tag, 'listeningWithDetail', (listening && detailVisible).toString(), 'false');
            expect(listening && detailVisible).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1012
         * @tc.name      testUiMonitorStartStop1012
         * @tc.desc      点击开始后出现监听状态文案，再点一次结束后出现监控时长
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiMonitorStartStop1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiMonitorStartStop1012';
            logBegin(tag);
            await UiFlow.openMonitor();
            const started: boolean = await UiFlow.startMonitor();
            logPair(tag, 'started', started.toString(), 'true');
            expect(started).assertTrue();
            const listening: boolean = await UiFlow.findText(TXT_CURRENT_LISTEN) !== null;
            logPair(tag, 'listeningVisible', listening.toString(), 'true');
            expect(listening).assertTrue();
            const totalTimeHidden: boolean = await UiFlow.findText(TXT_TOTAL_TIME) === null;
            logPair(tag, 'totalTimeHiddenWhileRunning', totalTimeHidden.toString(), 'true');
            expect(totalTimeHidden).assertTrue();
            const stopped: boolean = await UiFlow.stopMonitor();
            logPair(tag, 'stopped', stopped.toString(), 'true');
            expect(stopped).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1013
         * @tc.name      testUiMonitorRunningState1013
         * @tc.desc      监听进行中只显示当前监听状态，干扰次数与时长文案都不可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiMonitorRunningState1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiMonitorRunningState1013';
            logBegin(tag);
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            const interruptHidden: boolean = await UiFlow.findText(TXT_TOTAL_INTERRUPT) === null;
            logPair(tag, 'interruptHidden', interruptHidden.toString(), 'true');
            expect(interruptHidden).assertTrue();
            const detailHidden: boolean = await UiFlow.findId(ID_NEXT_DETAIL) === null;
            logPair(tag, 'detailHidden', detailHidden.toString(), 'true');
            expect(detailHidden).assertTrue();
            const buttonStillThere: boolean = await UiFlow.findId(ID_START) !== null;
            logPair(tag, 'toggleButtonReused', buttonStillThere.toString(), 'true');
            expect(buttonStillThere).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1014
         * @tc.name      testUiMonitorStoppedState1014
         * @tc.desc      结束监听后时长文案出现、监听状态文案消失、详情入口可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiMonitorStoppedState1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiMonitorStoppedState1014';
            logBegin(tag);
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const totalTime: boolean = await UiFlow.findText(TXT_TOTAL_TIME) !== null;
            logPair(tag, 'totalTimeVisible', totalTime.toString(), 'true');
            expect(totalTime).assertTrue();
            const listeningGone: boolean = await UiFlow.findText(TXT_CURRENT_LISTEN) === null;
            logPair(tag, 'listeningGone', listeningGone.toString(), 'true');
            expect(listeningGone).assertTrue();
            const detailVisible: boolean = await UiFlow.findId(ID_NEXT_DETAIL) !== null;
            logPair(tag, 'detailVisible', detailVisible.toString(), 'true');
            expect(detailVisible).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1015
         * @tc.name      testUiMonitorInterruptLabel1015
         * @tc.desc      结束监听后干扰次数文案出现，且时长文本为 HH:MM:SS 格式
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiMonitorInterruptLabel1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiMonitorInterruptLabel1015';
            logBegin(tag);
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const interruptLabel: Component | null = await UiFlow.waitText(TXT_TOTAL_INTERRUPT, WAIT_LONG);
            logPair(tag, 'interruptLabel', (interruptLabel !== null).toString(), 'true');
            expect(interruptLabel !== null).assertTrue();
            const timeComponent: Component | null = await UiFlow.waitTextRegex(REGEX_HHMMSS, WAIT_LONG);
            logPair(tag, 'timeFormatMatched', (timeComponent !== null).toString(), 'true');
            expect(timeComponent !== null).assertTrue();
            const totalTimeLabel: boolean = await UiFlow.findText(TXT_TOTAL_TIME) !== null;
            logPair(tag, 'totalTimeLabel', totalTimeLabel.toString(), 'true');
            expect(totalTimeLabel).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1016
         * @tc.name      testUiMonitorTimeFormat1016
         * @tc.desc      结束监听后的时长文本是定宽 HH:MM:SS，冒号位置固定
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiMonitorTimeFormat1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiMonitorTimeFormat1016';
            logBegin(tag);
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const timeComponent: Component | null = await UiFlow.waitTextRegex(REGEX_HHMMSS, WAIT_LONG);
            const timeText: string = timeComponent === null ? '' : await timeComponent.getText();
            logPair(tag, 'timeText', timeText, 'HH:MM:SS');
            expect(timeText.length).assertEqual(8);
            logPair(tag, 'firstColon', timeText.indexOf(':').toString(), '2');
            expect(timeText.indexOf(':')).assertEqual(2);
            logPair(tag, 'secondColon', timeText.charAt(5), ':');
            expect(timeText.charAt(5)).assertEqual(':');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1017
         * @tc.name      testUiMonitorTwoSessions1017
         * @tc.desc      同一界面连续两次开始与结束监听都能正常切换状态
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiMonitorTwoSessions1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiMonitorTwoSessions1017';
            logBegin(tag);
            await UiFlow.openMonitor();
            const firstStart: boolean = await UiFlow.startMonitor();
            const firstStop: boolean = await UiFlow.stopMonitor();
            logPair(tag, 'firstSession', firstStart.toString() + ',' + firstStop.toString(), 'true,true');
            expect(firstStart && firstStop).assertTrue();
            const secondStart: boolean = await UiFlow.startMonitor();
            logPair(tag, 'secondStart', secondStart.toString(), 'true');
            expect(secondStart).assertTrue();
            const listeningAgain: boolean = await UiFlow.findText(TXT_CURRENT_LISTEN) !== null;
            logPair(tag, 'listeningAgain', listeningAgain.toString(), 'true');
            expect(listeningAgain).assertTrue();
            const secondStop: boolean = await UiFlow.stopMonitor();
            logPair(tag, 'secondStop', secondStop.toString(), 'true');
            expect(secondStop).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1018
         * @tc.name      testUiDetailEntryVisibility1018
         * @tc.desc      同一轮监控中详情入口随状态迁移：监听进行中不可见，结束监听后可见且可点击进入
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailEntryVisibility1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailEntryVisibility1018';
            logBegin(tag);
            await UiFlow.openMonitor();
            const started: boolean = await UiFlow.startMonitor();
            logPair(tag, 'started', started.toString(), 'true');
            expect(started).assertTrue();
            const hiddenRunning: boolean = await UiFlow.findId(ID_NEXT_DETAIL) === null;
            logPair(tag, 'hiddenWhileRunning', hiddenRunning.toString(), 'true');
            expect(hiddenRunning).assertTrue();
            const stopped: boolean = await UiFlow.stopMonitor();
            logPair(tag, 'stopped', stopped.toString(), 'true');
            expect(stopped).assertTrue();
            const visibleAfter: boolean = await UiFlow.waitId(ID_NEXT_DETAIL, WAIT_LONG) !== null;
            logPair(tag, 'visibleAfter', visibleAfter.toString(), 'true');
            expect(visibleAfter).assertTrue();
            const detailOpened: boolean = await UiFlow.openDetail();
            logPair(tag, 'detailOpened', detailOpened.toString(), 'true');
            expect(detailOpened).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1019
         * @tc.name      testUiDetailPageStructure1019
         * @tc.desc      详情页一次性事件提示与文本区可见，记录列表容器与列表项数量一致
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailPageStructure1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailPageStructure1019';
            logBegin(tag);
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const detailOpened: boolean = await UiFlow.openDetail();
            logPair(tag, 'detailOpened', detailOpened.toString(), 'true');
            expect(detailOpened).assertTrue();
            const onceText: boolean = await UiFlow.findId(ID_ONCE_TEXT) !== null;
            logPair(tag, 'onceEventText', onceText.toString(), 'true');
            expect(onceText).assertTrue();
            const onceTips: boolean = await UiFlow.findText(TXT_ONCE_TIPS) !== null;
            logPair(tag, 'onceTips', onceTips.toString(), 'true');
            expect(onceTips).assertTrue();
            const state: DetailListState = await UiFlow.detailListState();
            logPair(tag, 'itemCount', state.itemCount.toString(), '>=0');
            logPair(tag, 'detailList', state.listShown.toString(), 'itemCount>0');
            expect(state.listShown).assertEqual(state.itemCount > 0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1020
         * @tc.name      testUiBackFromDetail1020
         * @tc.desc      详情页逐级返回：先回监控界面再回首页，详情页文案消失
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiBackFromDetail1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiBackFromDetail1020';
            logBegin(tag);
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            await UiFlow.openDetail();
            await UiFlow.back();
            const monitorBack: boolean = await UiFlow.waitId(ID_START, WAIT_LONG) !== null;
            logPair(tag, 'monitorBack', monitorBack.toString(), 'true');
            expect(monitorBack).assertTrue();
            await UiFlow.back();
            const launchBack: boolean = await UiFlow.waitId(ID_LAUNCH, WAIT_LONG) !== null;
            logPair(tag, 'launchBack', launchBack.toString(), 'true');
            expect(launchBack).assertTrue();
            const tipsGone: boolean = await UiFlow.findText(TXT_ONCE_TIPS) === null;
            logPair(tag, 'tipsGone', tipsGone.toString(), 'true');
            expect(tipsGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1021
         * @tc.name      testUiSettingWifiNever1021
         * @tc.desc      联网事件组选中“从不”后该组三态中只有从不被选中
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiSettingWifiNever1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiSettingWifiNever1021';
            logBegin(tag);
            await UiFlow.openSetting();
            const clicked: boolean = await UiFlow.clickRadio(WIFI, STATE_NEVER);
            logPair(tag, 'neverClicked', clicked.toString(), 'true');
            expect(clicked).assertTrue();
            const neverChecked: boolean = await UiFlow.isCheckedId(WIFI + STATE_NEVER.toString());
            logPair(tag, 'neverChecked', neverChecked.toString(), 'true');
            expect(neverChecked).assertTrue();
            const alwaysChecked: boolean = await UiFlow.isCheckedId(WIFI + STATE_ALWAYS.toString());
            logPair(tag, 'alwaysChecked', alwaysChecked.toString(), 'false');
            expect(alwaysChecked).assertFalse();
            const onceChecked: boolean = await UiFlow.isCheckedId(WIFI + STATE_ONCE.toString());
            logPair(tag, 'onceChecked', onceChecked.toString(), 'false');
            expect(onceChecked).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1022
         * @tc.name      testUiSettingWifiOnce1022
         * @tc.desc      联网事件组选中“仅本次”后该组只保留一个选中项，且落在仅本次
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiSettingWifiOnce1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiSettingWifiOnce1022';
            logBegin(tag);
            await UiFlow.openSetting();
            await UiFlow.clickRadio(WIFI, STATE_ONCE);
            const ids: Array<string> = [WIFI + STATE_ALWAYS.toString(), WIFI + STATE_ONCE.toString(),
            WIFI + STATE_NEVER.toString()];
            let checked: number = 0;
            for (let index = 0; index < ids.length; index++) {
                if (await UiFlow.isCheckedId(ids[index])) {
                    checked++;
                }
            }
            logPair(tag, 'checkedInGroup', checked.toString(), '1');
            expect(checked).assertEqual(1);
            const onceChecked: boolean = await UiFlow.isCheckedId(WIFI + STATE_ONCE.toString());
            logPair(tag, 'onceChecked', onceChecked.toString(), 'true');
            expect(onceChecked).assertTrue();
            const alwaysChecked: boolean = await UiFlow.isCheckedId(WIFI + STATE_ALWAYS.toString());
            logPair(tag, 'alwaysChecked', alwaysChecked.toString(), 'false');
            expect(alwaysChecked).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1023
         * @tc.name      testUiSettingSwitchToAlways1023
         * @tc.desc      同一事件组从“仅本次”切到“一直”后选中态随之迁移
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiSettingSwitchToAlways1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiSettingSwitchToAlways1023';
            logBegin(tag);
            await UiFlow.openSetting();
            await UiFlow.clickRadio(SCREEN_ON_EVENT, STATE_ONCE);
            await UiFlow.clickRadio(SCREEN_ON_EVENT, STATE_ALWAYS);
            const alwaysChecked: boolean = await UiFlow.isCheckedId(SCREEN_ON_EVENT + STATE_ALWAYS.toString());
            logPair(tag, 'alwaysChecked', alwaysChecked.toString(), 'true');
            expect(alwaysChecked).assertTrue();
            const onceChecked: boolean = await UiFlow.isCheckedId(SCREEN_ON_EVENT + STATE_ONCE.toString());
            logPair(tag, 'onceChecked', onceChecked.toString(), 'false');
            expect(onceChecked).assertFalse();
            const neverChecked: boolean = await UiFlow.isCheckedId(SCREEN_ON_EVENT + STATE_NEVER.toString());
            logPair(tag, 'neverChecked', neverChecked.toString(), 'false');
            expect(neverChecked).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1024
         * @tc.name      testUiSettingGroupIsolation1024
         * @tc.desc      不同事件组的单选互不影响，联网组与亮屏组各自保持自己的选中项
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiSettingGroupIsolation1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiSettingGroupIsolation1024';
            logBegin(tag);
            await UiFlow.openSetting();
            await UiFlow.clickRadio(WIFI, STATE_NEVER);
            await UiFlow.clickRadio(SCREEN_ON_EVENT, STATE_ONCE);
            const wifiNever: boolean = await UiFlow.isCheckedId(WIFI + STATE_NEVER.toString());
            logPair(tag, 'wifiNever', wifiNever.toString(), 'true');
            expect(wifiNever).assertTrue();
            const onNever: boolean = await UiFlow.isCheckedId(SCREEN_ON_EVENT + STATE_NEVER.toString());
            logPair(tag, 'screenOnNever', onNever.toString(), 'false');
            expect(onNever).assertFalse();
            const onOnce: boolean = await UiFlow.isCheckedId(SCREEN_ON_EVENT + STATE_ONCE.toString());
            logPair(tag, 'screenOnOnce', onOnce.toString(), 'true');
            expect(onOnce).assertTrue();
            const wifiOnce: boolean = await UiFlow.isCheckedId(WIFI + STATE_ONCE.toString());
            logPair(tag, 'wifiOnce', wifiOnce.toString(), 'false');
            expect(wifiOnce).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1025
         * @tc.name      testUiSettingAllNever1025
         * @tc.desc      五个事件组依次选中“从不”后每组从不单选都处于选中态
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiSettingAllNever1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiSettingAllNever1025';
            logBegin(tag);
            await UiFlow.openSetting();
            let clickedCount: number = 0;
            for (let index = 0; index < EVENT_GROUPS.length; index++) {
                const clicked: boolean = await UiFlow.clickRadio(EVENT_GROUPS[index], STATE_NEVER);
                if (clicked) {
                    clickedCount++;
                }
            }
            logPair(tag, 'clickedCount', clickedCount.toString(), '5');
            expect(clickedCount).assertEqual(5);
            let checkedCount: number = 0;
            for (let index = 0; index < EVENT_GROUPS.length; index++) {
                if (await UiFlow.isCheckedId(EVENT_GROUPS[index] + STATE_NEVER.toString())) {
                    checkedCount++;
                }
            }
            logPair(tag, 'checkedCount', checkedCount.toString(), '5');
            expect(checkedCount).assertEqual(5);
            const alwaysChecked: boolean = await UiFlow.isCheckedId(LOCKED_EVENT + STATE_ALWAYS.toString());
            logPair(tag, 'lockedAlways', alwaysChecked.toString(), 'false');
            expect(alwaysChecked).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1026
         * @tc.name      testUiSettingKeepAfterReenter1026
         * @tc.desc      设置页修改后返回再进入，选中态保持为“从不”且组内仍只有一个选中项
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiSettingKeepAfterReenter1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiSettingKeepAfterReenter1026';
            logBegin(tag);
            await UiFlow.openSetting();
            await UiFlow.clickRadio(UNLOCKED_EVENT, STATE_NEVER);
            await UiFlow.back();
            const entryBack: boolean = await UiFlow.waitId(ID_SETTING, WAIT_LONG) !== null;
            logPair(tag, 'entryBack', entryBack.toString(), 'true');
            expect(entryBack).assertTrue();
            const reopened: boolean = await UiFlow.openSetting();
            logPair(tag, 'reopened', reopened.toString(), 'true');
            expect(reopened).assertTrue();
            const neverChecked: boolean = await UiFlow.isCheckedId(UNLOCKED_EVENT + STATE_NEVER.toString());
            logPair(tag, 'unlockedNever', neverChecked.toString(), 'true');
            expect(neverChecked).assertTrue();
            const alwaysChecked: boolean = await UiFlow.isCheckedId(UNLOCKED_EVENT + STATE_ALWAYS.toString());
            logPair(tag, 'unlockedAlways', alwaysChecked.toString(), 'false');
            expect(alwaysChecked).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1027
         * @tc.name      testUiHistoryLabels1027
         * @tc.desc      完成一次监听后历史页展示开始于、结束于、总耗时与干扰次数四个字段（恰好触发十条滚动清理时补一轮会话）
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryLabels1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryLabels1027';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            const home: boolean = await UiFlow.resetToLaunchPage();
            logPair(tag, 'backHome', home.toString(), 'true');
            expect(home).assertTrue();
            const opened: boolean = await UiFlow.openHistory();
            logPair(tag, 'historyOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const itemCount: number = await UiFlow.ensureHistoryRecord();
            logPair(tag, 'itemCount', itemCount.toString(), '>= 1');
            expect(itemCount).assertLarger(0);
            const labels: Array<string> = [TXT_START_TIME, TXT_END_TIME, TXT_TOTAL_TIME_LABEL,
                TXT_TOTAL_INTERRUPT_LABEL];
            const matched: number = await countTexts(labels);
            logPair(tag, 'matchedLabels', matched.toString(), '4');
            expect(matched).assertEqual(4);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1028
         * @tc.name      testUiHistoryRecordCreated1028
         * @tc.desc      一次监听结束后历史列表至少新增一条记录，列表项可被定位
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryRecordCreated1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryRecordCreated1028';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            await UiFlow.resetToLaunchPage();
            await UiFlow.openHistory();
            const itemCount: number = await UiFlow.ensureHistoryRecord();
            logPair(tag, 'listItemCount', itemCount.toString(), '>= 1');
            expect(itemCount).assertLarger(0);
            const startLabel: boolean = await UiFlow.findText(TXT_START_TIME) !== null;
            logPair(tag, 'startLabel', startLabel.toString(), 'true');
            expect(startLabel).assertTrue();
            const interruptLabel: boolean = await UiFlow.findText(TXT_TOTAL_INTERRUPT_LABEL) !== null;
            logPair(tag, 'interruptLabel', interruptLabel.toString(), 'true');
            expect(interruptLabel).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1029
         * @tc.name      testUiHistoryTwoSessions1029
         * @tc.desc      连续两次监听后历史页仍能读到记录字段，列表项不少于一条
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryTwoSessions1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryTwoSessions1029';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const second: boolean = await UiFlow.startMonitor();
            logPair(tag, 'secondStart', second.toString(), 'true');
            expect(second).assertTrue();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            await UiFlow.resetToLaunchPage();
            const opened: boolean = await UiFlow.openHistory();
            logPair(tag, 'historyOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const totalTimeLabel: boolean = await UiFlow.findText(TXT_TOTAL_TIME_LABEL) !== null;
            logPair(tag, 'totalTimeLabel', totalTimeLabel.toString(), 'true');
            expect(totalTimeLabel).assertTrue();
            const itemCount: number = await UiFlow.ensureHistoryRecord();
            logPair(tag, 'listItemCount', itemCount.toString(), '>= 1');
            expect(itemCount).assertLarger(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1030
         * @tc.name      testUiHistoryBackToLaunch1030
         * @tc.desc      历史页返回首页后记录字段消失，历史入口重新可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryBackToLaunch1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryBackToLaunch1030';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            await UiFlow.resetToLaunchPage();
            await UiFlow.openHistory();
            const itemCount: number = await UiFlow.ensureHistoryRecord();
            logPair(tag, 'itemCount', itemCount.toString(), '>= 1');
            expect(itemCount).assertLarger(0);
            const startLabel: boolean = await UiFlow.findText(TXT_START_TIME) !== null;
            logPair(tag, 'startLabelBeforeBack', startLabel.toString(), 'true');
            expect(startLabel).assertTrue();
            await UiFlow.back();
            const entryBack: boolean = await UiFlow.waitId(ID_HISTORY, WAIT_LONG) !== null;
            logPair(tag, 'historyEntryBack', entryBack.toString(), 'true');
            expect(entryBack).assertTrue();
            const labelGone: boolean = await UiFlow.findText(TXT_START_TIME) === null;
            logPair(tag, 'labelGone', labelGone.toString(), 'true');
            expect(labelGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1031
         * @tc.name      testUiCurrentEventShownWhileMonitoring1031
         * @tc.desc      启动监听后当前监听事件文案可按语义 id 定位，监听提示标签同屏可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiCurrentEventShownWhileMonitoring1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiCurrentEventShownWhileMonitoring1031';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            const started: boolean = await UiFlow.startMonitor();
            logPair(tag, 'started', started.toString(), 'true');
            expect(started).assertTrue();
            const shown: boolean = await UiFlow.waitId(ID_MAIN_CURRENT_EVENT, WAIT_SHORT) !== null;
            logPair(tag, 'currentEventShown', shown.toString(), 'true');
            expect(shown).assertTrue();
            const listenLabel: boolean = await UiFlow.findText(TXT_CURRENT_LISTEN) !== null;
            logPair(tag, 'listenLabel', listenLabel.toString(), 'true');
            expect(listenLabel).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1032
         * @tc.name      testUiCurrentEventGoneAfterStop1032
         * @tc.desc      停止监听后当前监听事件 id 从界面消失，监控页回到未监听形态
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiCurrentEventGoneAfterStop1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiCurrentEventGoneAfterStop1032';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            const shown: boolean = await UiFlow.waitId(ID_MAIN_CURRENT_EVENT, WAIT_SHORT) !== null;
            logPair(tag, 'currentEventShown', shown.toString(), 'true');
            expect(shown).assertTrue();
            const stopped: boolean = await UiFlow.stopMonitor();
            logPair(tag, 'stopped', stopped.toString(), 'true');
            expect(stopped).assertTrue();
            const gone: boolean = await UiFlow.waitIdGone(ID_MAIN_CURRENT_EVENT, WAIT_SHORT);
            logPair(tag, 'currentEventGone', gone.toString(), 'true');
            expect(gone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1033
         * @tc.name      testUiDetailFieldsHiddenWhileMonitoring1033
         * @tc.desc      计时中只展示当前监听区，时长与次数两个 id 均不可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailFieldsHiddenWhileMonitoring1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailFieldsHiddenWhileMonitoring1033';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            const started: boolean = await UiFlow.startMonitor();
            logPair(tag, 'started', started.toString(), 'true');
            expect(started).assertTrue();
            const durationShown: boolean = await UiFlow.waitId(ID_MAIN_DURATION, WAIT_SHORT) !== null;
            logPair(tag, 'durationShown', durationShown.toString(), 'false');
            expect(durationShown).assertFalse();
            const countShown: boolean = await UiFlow.waitId(ID_MAIN_EVENT_COUNT, WAIT_SHORT) !== null;
            logPair(tag, 'countShown', countShown.toString(), 'false');
            expect(countShown).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1034
         * @tc.name      testUiDurationFormatAfterStop1034
         * @tc.desc      停止监听后时长按 id 读出，恒为两位补零的 HH:MM:SS 共 8 字符
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDurationFormatAfterStop1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDurationFormatAfterStop1034';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            const stopped: boolean = await UiFlow.stopMonitor();
            logPair(tag, 'stopped', stopped.toString(), 'true');
            expect(stopped).assertTrue();
            const formatOk: boolean = await UiFlow.textMatchesRegex(ID_MAIN_DURATION, REGEX_HHMMSS);
            logPair(tag, 'durationFormatOk', formatOk.toString(), 'true');
            expect(formatOk).assertTrue();
            const duration: string = await UiFlow.durationText();
            logPair(tag, 'durationLength', duration.length.toString(), '8');
            expect(duration.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1035
         * @tc.name      testUiEventCountDigitsAfterStop1035
         * @tc.desc      停止监听后干扰次数按 id 读出且为纯数字文本
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiEventCountDigitsAfterStop1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiEventCountDigitsAfterStop1035';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            const stopped: boolean = await UiFlow.stopMonitor();
            logPair(tag, 'stopped', stopped.toString(), 'true');
            expect(stopped).assertTrue();
            const digitsOk: boolean = await UiFlow.textMatchesRegex(ID_MAIN_EVENT_COUNT, '^\\d+$');
            logPair(tag, 'countDigitsOk', digitsOk.toString(), 'true');
            expect(digitsOk).assertTrue();
            const countText: string = await UiFlow.eventCountText();
            logPair(tag, 'countTextLength', countText.length.toString(), '<= 4');
            expect(countText.length <= 4).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1036
         * @tc.name      testUiDurationAndCountTogether1036
         * @tc.desc      停止监听后时长与次数两个 id 同时就位，格式各自正确
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDurationAndCountTogether1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDurationAndCountTogether1036';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const bothShown: boolean = await UiFlow.waitId(ID_MAIN_DURATION, WAIT_SHORT) !== null &&
                await UiFlow.waitId(ID_MAIN_EVENT_COUNT, WAIT_SHORT) !== null;
            logPair(tag, 'bothShown', bothShown.toString(), 'true');
            expect(bothShown).assertTrue();
            const formatOk: boolean = await UiFlow.textMatchesRegex(ID_MAIN_DURATION, REGEX_HHMMSS);
            logPair(tag, 'durationFormatOk', formatOk.toString(), 'true');
            expect(formatOk).assertTrue();
            const digitsOk: boolean = await UiFlow.textMatchesRegex(ID_MAIN_EVENT_COUNT, '^\\d+$');
            logPair(tag, 'countDigitsOk', digitsOk.toString(), 'true');
            expect(digitsOk).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1037
         * @tc.name      testUiTwoRoundsDurationFormat1037
         * @tc.desc      连续两轮监听后时长文案仍为 HH:MM:SS，不被上一轮文本残留污染
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiTwoRoundsDurationFormat1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiTwoRoundsDurationFormat1037';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            const first: boolean = await UiFlow.stopMonitor();
            logPair(tag, 'firstStopped', first.toString(), 'true');
            expect(first).assertTrue();
            const secondStart: boolean = await UiFlow.startMonitor();
            logPair(tag, 'secondStarted', secondStart.toString(), 'true');
            expect(secondStart).assertTrue();
            await UiFlow.stopMonitor();
            const formatOk: boolean = await UiFlow.textMatchesRegex(ID_MAIN_DURATION, REGEX_HHMMSS);
            logPair(tag, 'durationFormatOk', formatOk.toString(), 'true');
            expect(formatOk).assertTrue();
            const duration: string = await UiFlow.durationText();
            logPair(tag, 'durationLength', duration.length.toString(), '8');
            expect(duration.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1038
         * @tc.name      testUiDetailHiddenOnRestart1038
         * @tc.desc      停止后详情区出现，重新启动监听后时长 id 再次隐藏，状态互斥
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailHiddenOnRestart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailHiddenOnRestart1038';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const shownAfterStop: boolean = await UiFlow.waitId(ID_MAIN_DURATION, WAIT_SHORT) !== null;
            logPair(tag, 'durationShownAfterStop', shownAfterStop.toString(), 'true');
            expect(shownAfterStop).assertTrue();
            const restarted: boolean = await UiFlow.startMonitor();
            logPair(tag, 'restarted', restarted.toString(), 'true');
            expect(restarted).assertTrue();
            const goneOnRestart: boolean = await UiFlow.waitIdGone(ID_MAIN_DURATION, WAIT_SHORT);
            logPair(tag, 'durationGoneOnRestart', goneOnRestart.toString(), 'true');
            expect(goneOnRestart).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1039
         * @tc.name      testUiEventCountTextBounded1039
         * @tc.desc      干扰次数文本为纯数字且不含空白与单位，长度不超过 4
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiEventCountTextBounded1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiEventCountTextBounded1039';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const countText: string = await UiFlow.eventCountText();
            logPair(tag, 'noSpace', (countText.indexOf(' ') < 0).toString(), 'true');
            expect(countText.indexOf(' ') < 0).assertTrue();
            const digitsOk: boolean = await UiFlow.textMatchesRegex(ID_MAIN_EVENT_COUNT, '^\\d+$');
            logPair(tag, 'countDigitsOk', digitsOk.toString(), 'true');
            expect(digitsOk).assertTrue();
            logPair(tag, 'countTextLength', countText.length.toString(), '<= 4');
            expect(countText.length <= 4).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1040
         * @tc.name      testUiMonitorFieldsGoneOnHistory1040
         * @tc.desc      进入历史页后监控页的三个新 id 全部不可见，两页元素不互相污染
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiMonitorFieldsGoneOnHistory1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiMonitorFieldsGoneOnHistory1040';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            await UiFlow.resetToLaunchPage();
            const opened: boolean = await UiFlow.openHistory();
            logPair(tag, 'historyOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const currentGone: boolean = await UiFlow.waitIdGone(ID_MAIN_CURRENT_EVENT, WAIT_SHORT);
            logPair(tag, 'currentEventGone', currentGone.toString(), 'true');
            expect(currentGone).assertTrue();
            const durationGone: boolean = await UiFlow.waitIdGone(ID_MAIN_DURATION, WAIT_SHORT);
            logPair(tag, 'durationGone', durationGone.toString(), 'true');
            expect(durationGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1041
         * @tc.name      testUiHistoryListIdShown1041
         * @tc.desc      进入历史页后列表容器 id 就位，监控页启动按钮同时不可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryListIdShown1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryListIdShown1041';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            const opened: boolean = await UiFlow.openHistory();
            logPair(tag, 'historyOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const listReady: boolean = await UiFlow.historyListReady();
            logPair(tag, 'listReady', listReady.toString(), 'true');
            expect(listReady).assertTrue();
            const startGone: boolean = await UiFlow.waitIdGone(ID_START, WAIT_SHORT);
            logPair(tag, 'startButtonGone', startGone.toString(), 'true');
            expect(startGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1042
         * @tc.name      testUiHistoryListWithRecord1042
         * @tc.desc      一次监听后列表容器与列表项同时就位，容器内渲染出记录字段标签
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryListWithRecord1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryListWithRecord1042';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            await UiFlow.resetToLaunchPage();
            await UiFlow.openHistory();
            const itemCount: number = await UiFlow.ensureHistoryRecord();
            logPair(tag, 'itemCount', itemCount.toString(), '>= 1');
            expect(itemCount).assertLarger(0);
            const listReady: boolean = await UiFlow.historyListReady();
            logPair(tag, 'listReady', listReady.toString(), 'true');
            expect(listReady).assertTrue();
            const startLabel: boolean = await UiFlow.findText(TXT_START_TIME) !== null;
            logPair(tag, 'startLabel', startLabel.toString(), 'true');
            expect(startLabel).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1043
         * @tc.name      testUiHistoryListGoneAfterBack1043
         * @tc.desc      历史页返回首页后列表容器 id 消失，首页历史入口重新可选
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryListGoneAfterBack1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryListGoneAfterBack1043';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            await UiFlow.resetToLaunchPage();
            await UiFlow.openHistory();
            const listReady: boolean = await UiFlow.historyListReady();
            logPair(tag, 'listReadyBeforeBack', listReady.toString(), 'true');
            expect(listReady).assertTrue();
            await UiFlow.back();
            const entryBack: boolean = await UiFlow.waitId(ID_HISTORY, WAIT_LONG) !== null;
            logPair(tag, 'historyEntryBack', entryBack.toString(), 'true');
            expect(entryBack).assertTrue();
            const listGone: boolean = await UiFlow.waitIdGone(ID_HISTORY_LIST, WAIT_SHORT);
            logPair(tag, 'listGoneAfterBack', listGone.toString(), 'true');
            expect(listGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1044
         * @tc.name      testUiHistoryListTwoSessions1044
         * @tc.desc      连续两轮监听后列表容器仍在位，四个记录字段标签齐全
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryListTwoSessions1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryListTwoSessions1044';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            const secondStart: boolean = await UiFlow.startMonitor();
            logPair(tag, 'secondStarted', secondStart.toString(), 'true');
            expect(secondStart).assertTrue();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            await UiFlow.resetToLaunchPage();
            await UiFlow.openHistory();
            const listReady: boolean = await UiFlow.historyListReady();
            logPair(tag, 'listReady', listReady.toString(), 'true');
            expect(listReady).assertTrue();
            const itemCount: number = await UiFlow.ensureHistoryRecord();
            logPair(tag, 'itemCount', itemCount.toString(), '>= 1');
            expect(itemCount).assertLarger(0);
            const labels: Array<string> = [TXT_START_TIME, TXT_END_TIME, TXT_TOTAL_TIME_LABEL,
                TXT_TOTAL_INTERRUPT_LABEL];
            const matched: number = await countTexts(labels);
            logPair(tag, 'matchedLabels', matched.toString(), '4');
            expect(matched).assertEqual(4);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1045
         * @tc.name      testUiHistoryListWithoutDetailEntry1045
         * @tc.desc      历史页无详情入口与首页入口：列表容器在，nextDetail 与首页入口均不可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiHistoryListWithoutDetailEntry1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiHistoryListWithoutDetailEntry1045';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openMonitor();
            await UiFlow.startMonitor();
            await UiFlow.stopMonitor();
            await UiFlow.settleForRecordPersist();
            await UiFlow.resetToLaunchPage();
            await UiFlow.openHistory();
            const listReady: boolean = await UiFlow.historyListReady();
            logPair(tag, 'listReady', listReady.toString(), 'true');
            expect(listReady).assertTrue();
            const detailGone: boolean = await UiFlow.waitIdGone(ID_NEXT_DETAIL, WAIT_SHORT);
            logPair(tag, 'detailEntryGone', detailGone.toString(), 'true');
            expect(detailGone).assertTrue();
            const launchEntryGone: boolean = await UiFlow.waitIdGone(ID_LAUNCH, WAIT_SHORT);
            logPair(tag, 'launchEntryGone', launchEntryGone.toString(), 'true');
            expect(launchEntryGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1046
         * @tc.name      testUiAboutVersionIdShown1046
         * @tc.desc      关于页版本号 id 可定位，读出的文案与资源常量逐字一致
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiAboutVersionIdShown1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiAboutVersionIdShown1046';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            const opened: boolean = await UiFlow.openAbout();
            logPair(tag, 'aboutOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const versionShown: boolean = await UiFlow.waitId(ID_ABOUT_VERSION, WAIT_SHORT) !== null;
            logPair(tag, 'versionShown', versionShown.toString(), 'true');
            expect(versionShown).assertTrue();
            const versionText: string = await UiFlow.aboutVersionText();
            logPair(tag, 'versionText', versionText, TXT_SAMPLE_VERSION);
            expect(versionText).assertEqual(TXT_SAMPLE_VERSION);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1047
         * @tc.name      testUiAboutVersionText1047
         * @tc.desc      版本号文本长度与常量一致，且以 version 前缀开头，描述文案同屏可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiAboutVersionText1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiAboutVersionText1047';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            const opened: boolean = await UiFlow.openAbout();
            logPair(tag, 'aboutOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const versionText: string = await UiFlow.aboutVersionText();
            logPair(tag, 'versionLength', versionText.length.toString(), TXT_SAMPLE_VERSION.length.toString());
            expect(versionText.length).assertEqual(TXT_SAMPLE_VERSION.length);
            const prefixOk: boolean = versionText.indexOf('version') === 0;
            logPair(tag, 'versionPrefixOk', prefixOk.toString(), 'true');
            expect(prefixOk).assertTrue();
            const descShown: boolean = await UiFlow.findText(TXT_SAMPLE_DESC_PREFIX) !== null;
            logPair(tag, 'descShown', descShown.toString(), 'true');
            expect(descShown).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1048
         * @tc.name      testUiAboutVersionFormat1048
         * @tc.desc      版本号文本匹配 version 主版本.次版本.修订号 三段式格式
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiAboutVersionFormat1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiAboutVersionFormat1048';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            const opened: boolean = await UiFlow.openAbout();
            logPair(tag, 'aboutOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const formatOk: boolean = await UiFlow.textMatchesRegex(ID_ABOUT_VERSION,
                '^version \\d+\\.\\d+\\.\\d+$');
            logPair(tag, 'versionFormatOk', formatOk.toString(), 'true');
            expect(formatOk).assertTrue();
            const versionText: string = await UiFlow.aboutVersionText();
            const segments: number = versionText.split('.').length;
            logPair(tag, 'dotSegments', segments.toString(), '3');
            expect(segments).assertEqual(3);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1049
         * @tc.name      testUiAboutVersionGoneAfterBack1049
         * @tc.desc      关于页返回首页后版本号 id 消失，关于入口重新可选
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiAboutVersionGoneAfterBack1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiAboutVersionGoneAfterBack1049';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            await UiFlow.openAbout();
            const versionShown: boolean = await UiFlow.waitId(ID_ABOUT_VERSION, WAIT_SHORT) !== null;
            logPair(tag, 'versionShownBeforeBack', versionShown.toString(), 'true');
            expect(versionShown).assertTrue();
            await UiFlow.back();
            const entryBack: boolean = await UiFlow.waitId(ID_ABOUT, WAIT_LONG) !== null;
            logPair(tag, 'aboutEntryBack', entryBack.toString(), 'true');
            expect(entryBack).assertTrue();
            const versionGone: boolean = await UiFlow.waitIdGone(ID_ABOUT_VERSION, WAIT_SHORT);
            logPair(tag, 'versionGoneAfterBack', versionGone.toString(), 'true');
            expect(versionGone).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1050
         * @tc.name      testUiAboutVersionWithDesc1050
         * @tc.desc      关于页版本与描述同屏可见，首页关于入口与本页版本 id 互斥
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiAboutVersionWithDesc1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiAboutVersionWithDesc1050';
            logBegin(tag);
            await UiFlow.ensureLaunchPage();
            const opened: boolean = await UiFlow.openAbout();
            logPair(tag, 'aboutOpened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const versionShown: boolean = await UiFlow.waitId(ID_ABOUT_VERSION, WAIT_SHORT) !== null;
            logPair(tag, 'versionShown', versionShown.toString(), 'true');
            expect(versionShown).assertTrue();
            const descShown: boolean = await UiFlow.findText(TXT_SAMPLE_DESC_PREFIX) !== null;
            logPair(tag, 'descShown', descShown.toString(), 'true');
            expect(descShown).assertTrue();
            const aboutEntryGone: boolean = await UiFlow.waitIdGone(ID_ABOUT, WAIT_SHORT);
            logPair(tag, 'aboutEntryGone', aboutEntryGone.toString(), 'true');
            expect(aboutEntryGone).assertTrue();
            logEnd(tag);
        })
    })
}
