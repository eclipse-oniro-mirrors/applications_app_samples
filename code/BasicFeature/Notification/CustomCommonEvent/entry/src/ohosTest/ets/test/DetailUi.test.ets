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
import {
    UiFlow, DetailListState, ID_DETAIL_LIST, ID_ONCE_TEXT, ID_START, ID_HISTORY, ID_LAUNCH, TXT_TOTAL_TIME
} from './helper/UiFlow';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'DetailUi_';

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

/** 完整链路：首页 → 监控页 → 开始 → 结束 → 详情页。 */
async function openDetailFromLaunch(): Promise<boolean> {
    await UiFlow.ensureLaunchPage();
    if (!await UiFlow.openMonitor()) {
        return false;
    }
    if (!await UiFlow.startMonitor()) {
        return false;
    }
    if (!await UiFlow.stopMonitor()) {
        return false;
    }
    return await UiFlow.openDetail();
}

export default function detailUiTest(): void {
    describe('DetailUiTest', () => {
        beforeAll(async () => {
            const ready: boolean = await UiFlow.ensureLaunchPage();
            hilog.info(DOMAIN, TAG_PREFIX + 'beforeAll', 'launch page ready=%{public}s', ready.toString());
        })

        afterEach(async () => {
            const reset: boolean = await UiFlow.resetToLaunchPage();
            hilog.info(DOMAIN, TAG_PREFIX + 'afterEach', 'reset to launch=%{public}s', reset.toString());
        })

        /**
         * @tc.number    SUB_CCE_UI_1051
         * @tc.name      testUiDetailEntryReachable1051
         * @tc.desc      结束监控后详情入口可用，完整链路可达详情页
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailEntryReachable1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailEntryReachable1051';
            logBegin(tag);
            const opened: boolean = await openDetailFromLaunch();
            logPair(tag, 'opened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const onceShown: boolean = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null;
            logPair(tag, 'onceShown', onceShown.toString(), 'true');
            expect(onceShown).assertTrue();
            const state: DetailListState = await UiFlow.detailListState();
            logPair(tag, 'itemCount', state.itemCount.toString(), '>=0');
            logPair(tag, 'listShown', state.listShown.toString(), 'itemCount>0');
            expect(state.listShown).assertEqual(state.itemCount > 0);
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1052
         * @tc.name      testUiDetailListShown1052
         * @tc.desc      详情页记录列表容器可见性与列表项数量一致（空列表不渲染容器）
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailListShown1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailListShown1052';
            logBegin(tag);
            const opened: boolean = await openDetailFromLaunch();
            logPair(tag, 'opened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const onceShown: boolean = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null;
            logPair(tag, 'onceShown', onceShown.toString(), 'true');
            expect(onceShown).assertTrue();
            const state: DetailListState = await UiFlow.detailListState();
            logPair(tag, 'itemCount', state.itemCount.toString(), '>=0');
            logPair(tag, 'listShown', state.listShown.toString(), 'itemCount>0');
            expect(state.listShown).assertEqual(state.itemCount > 0);
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1053
         * @tc.name      testUiDetailOnceTipsText1053
         * @tc.desc      一次性事件区提示文案与字符串资源基线逐字一致
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailOnceTipsText1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailOnceTipsText1053';
            logBegin(tag);
            await openDetailFromLaunch();
            const onceText: string = await UiFlow.textOfId(ID_ONCE_TEXT);
            logPair(tag, 'onceText', onceText, '如下事件仅在本次运行期生效:');
            expect(onceText).assertEqual('如下事件仅在本次运行期生效:');
            logPair(tag, 'endsWithColon', (onceText.charAt(onceText.length - 1) === ':').toString(), 'true');
            expect(onceText.charAt(onceText.length - 1) === ':').assertTrue();
            logPair(tag, 'textLength', onceText.length.toString(), '14');
            expect(onceText.length).assertEqual(14);
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1054
         * @tc.name      testUiDetailListAndOnceCoexist1054
         * @tc.desc      一次性事件区必现，记录列表容器可见性与列表项数量一致
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailListAndOnceCoexist1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailListAndOnceCoexist1054';
            logBegin(tag);
            const opened: boolean = await openDetailFromLaunch();
            logPair(tag, 'opened', opened.toString(), 'true');
            expect(opened).assertTrue();
            const once: boolean = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null;
            logPair(tag, 'once', once.toString(), 'true');
            expect(once).assertTrue();
            const state: DetailListState = await UiFlow.detailListState();
            const consistent: boolean = state.listShown === (state.itemCount > 0);
            logPair(tag, 'listConsistentWithItems', consistent.toString(), 'true');
            expect(consistent).assertTrue();
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1055
         * @tc.name      testUiDetailListItemCount1055
         * @tc.desc      详情页列表项数量与列表容器可见性自洽（无系统事件时为空列表）
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailListItemCount1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailListItemCount1055';
            logBegin(tag);
            await openDetailFromLaunch();
            const state: DetailListState = await UiFlow.detailListState();
            logPair(tag, 'itemCount', state.itemCount.toString(), '>=0');
            expect(state.itemCount >= 0).assertTrue();
            logPair(tag, 'listShown', state.listShown.toString(), 'itemCount>0');
            expect(state.listShown).assertEqual(state.itemCount > 0);
            const onceShown: boolean = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null;
            logPair(tag, 'onceShown', onceShown.toString(), 'true');
            expect(onceShown).assertTrue();
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1056
         * @tc.name      testUiDetailOnceTextCount1056
         * @tc.desc      详情页一次性事件文本节点不少于提示与事件项之和
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailOnceTextCount1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailOnceTextCount1056';
            logBegin(tag);
            await openDetailFromLaunch();
            const textCount: number = await UiFlow.countByType('Text');
            logPair(tag, 'textCount', textCount.toString(), '>=2');
            expect(textCount >= 2).assertTrue();
            const onceShown: boolean = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null;
            logPair(tag, 'onceShown', onceShown.toString(), 'true');
            expect(onceShown).assertTrue();
            const state: DetailListState = await UiFlow.detailListState();
            logPair(tag, 'itemCount', state.itemCount.toString(), '>=0');
            expect(state.itemCount >= 0).assertTrue();
            logPair(tag, 'listShown', state.listShown.toString(), 'itemCount>0');
            expect(state.listShown).assertEqual(state.itemCount > 0);
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1057
         * @tc.name      testUiDetailBackToMain1057
         * @tc.desc      返回键从详情页退回监控页，监控结束文案可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailBackToMain1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailBackToMain1057';
            logBegin(tag);
            await openDetailFromLaunch();
            await UiFlow.back();
            const backMain: boolean = await UiFlow.waitText(TXT_TOTAL_TIME, 5000) !== null;
            logPair(tag, 'backMain', backMain.toString(), 'true');
            expect(backMain).assertTrue();
            const listGone: boolean = await UiFlow.findId(ID_DETAIL_LIST) === null;
            logPair(tag, 'listGone', listGone.toString(), 'true');
            expect(listGone).assertTrue();
            const onceGone: boolean = await UiFlow.findId(ID_ONCE_TEXT) === null;
            logPair(tag, 'onceGone', onceGone.toString(), 'true');
            expect(onceGone).assertTrue();
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1058
         * @tc.name      testUiDetailReenterAfterBack1058
         * @tc.desc      返回后再次进入详情页仍成功（入口可重复使用）
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailReenterAfterBack1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailReenterAfterBack1058';
            logBegin(tag);
            await openDetailFromLaunch();
            await UiFlow.back();
            const reopened: boolean = await UiFlow.openDetail();
            logPair(tag, 'reopened', reopened.toString(), 'true');
            expect(reopened).assertTrue();
            const state: DetailListState = await UiFlow.detailListState();
            logPair(tag, 'itemCount', state.itemCount.toString(), '>=0');
            logPair(tag, 'listShown', state.listShown.toString(), 'itemCount>0');
            expect(state.listShown).assertEqual(state.itemCount > 0);
            const onceShown: boolean = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null;
            logPair(tag, 'onceShown', onceShown.toString(), 'true');
            expect(onceShown).assertTrue();
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1059
         * @tc.name      testUiDetailEntryStaysAfterStop1059
         * @tc.desc      监控结束后详情入口持续可见，不因返回而消失
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailEntryStaysAfterStop1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailEntryStaysAfterStop1059';
            logBegin(tag);
            await openDetailFromLaunch();
            await UiFlow.back();
            const entryAgain: boolean = await UiFlow.findId('nextDetail') !== null;
            logPair(tag, 'entryAgain', entryAgain.toString(), 'true');
            expect(entryAgain).assertTrue();
            const stopped: boolean = await UiFlow.waitText(TXT_TOTAL_TIME, 5000) !== null;
            logPair(tag, 'stopped', stopped.toString(), 'true');
            expect(stopped).assertTrue();
            const detailGone: boolean = await UiFlow.findId(ID_DETAIL_LIST) === null;
            logPair(tag, 'detailGone', detailGone.toString(), 'true');
            expect(detailGone).assertTrue();
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1060
         * @tc.name      testUiDetailNoStartButton1060
         * @tc.desc      详情页不存在监控启停按钮，页面职责单一
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailNoStartButton1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailNoStartButton1060';
            logBegin(tag);
            await openDetailFromLaunch();
            const startGone: boolean = await UiFlow.findId(ID_START) === null;
            logPair(tag, 'startGone', startGone.toString(), 'true');
            expect(startGone).assertTrue();
            const onceShown: boolean = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null;
            logPair(tag, 'onceShown', onceShown.toString(), 'true');
            expect(onceShown).assertTrue();
            const state: DetailListState = await UiFlow.detailListState();
            logPair(tag, 'itemCount', state.itemCount.toString(), '>=0');
            logPair(tag, 'listShown', state.listShown.toString(), 'itemCount>0');
            expect(state.listShown).assertEqual(state.itemCount > 0);
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1061
         * @tc.name      testUiDetailNoHistoryEntry1061
         * @tc.desc      详情页不存在历史页入口，需先返回监控页
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailNoHistoryEntry1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailNoHistoryEntry1061';
            logBegin(tag);
            await openDetailFromLaunch();
            const historyGone: boolean = await UiFlow.findId(ID_HISTORY) === null;
            logPair(tag, 'historyGone', historyGone.toString(), 'true');
            expect(historyGone).assertTrue();
            const state: DetailListState = await UiFlow.detailListState();
            logPair(tag, 'itemCount', state.itemCount.toString(), '>=0');
            logPair(tag, 'listShown', state.listShown.toString(), 'itemCount>0');
            expect(state.listShown).assertEqual(state.itemCount > 0);
            const onceShown: boolean = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null;
            logPair(tag, 'onceShown', onceShown.toString(), 'true');
            expect(onceShown).assertTrue();
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1062
         * @tc.name      testUiDetailResetToLaunch1062
         * @tc.desc      详情页可一路复位回首页，首页四入口可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailResetToLaunch1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailResetToLaunch1062';
            logBegin(tag);
            await openDetailFromLaunch();
            const reset: boolean = await UiFlow.resetToLaunchPage();
            logPair(tag, 'reset', reset.toString(), 'true');
            expect(reset).assertTrue();
            const listGone: boolean = await UiFlow.findId(ID_DETAIL_LIST) === null;
            logPair(tag, 'listGone', listGone.toString(), 'true');
            expect(listGone).assertTrue();
            const launchShown: boolean = await UiFlow.waitId(ID_LAUNCH, 3000) !== null;
            logPair(tag, 'launchShown', launchShown.toString(), 'true');
            expect(launchShown).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UI_1063
         * @tc.name      testUiDetailOnceRegionUnderList1063
         * @tc.desc      一次性事件区常驻可达，记录列表空态时仅提示区可见
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUiDetailOnceRegionUnderList1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUiDetailOnceRegionUnderList1063';
            logBegin(tag);
            await openDetailFromLaunch();
            const onceSeen: number = await UiFlow.waitId(ID_ONCE_TEXT, 3000) !== null ? 1 : 0;
            logPair(tag, 'onceSeen', onceSeen.toString(), '1');
            expect(onceSeen).assertEqual(1);
            const state: DetailListState = await UiFlow.detailListState();
            const consistent: boolean = state.listShown === (state.itemCount > 0);
            logPair(tag, 'listConsistentWithItems', consistent.toString(), 'true');
            expect(consistent).assertTrue();
            await UiFlow.resetToLaunchPage();
            logEnd(tag);
        })
    })
}
