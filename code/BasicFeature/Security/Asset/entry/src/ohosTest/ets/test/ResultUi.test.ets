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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, Component } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { sleep, findId, clickId, inputById, stopInput, switchTab, searchAndWaitResult, backToQuery, launchApp,
  saveAssetSeed } from './UiHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

const driver: Driver = Driver.create();

export default function resultUi() {
  describe('ResultUiTest', () => {
    beforeAll(async () => {
      await launchApp();
      await sleep(1500);
    });

    /**
     * @tc.number SUB_ASSET_UI_1101
     * @tc.name testResultUi1101
     * @tc.desc 查询进入结果页返回主页全链不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1101 begin');
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      const backButton: Component = await findId(driver, 'back_button');
      expect(backButton !== null).assertTrue();
      await backToQuery(driver);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1101 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1102
     * @tc.name testResultUi1102
     * @tc.desc 合法值：结果页列表组件存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1102 begin');
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1102 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1103
     * @tc.name testResultUi1103
     * @tc.desc 合法值：结果页返回按钮存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1103 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      const backButton: Component = await findId(driver, 'back_button');
      expect(backButton !== null).assertTrue();
      expect(backButton !== undefined).assertTrue();
      expect(typeof backButton.click === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1103 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1104
     * @tc.name testResultUi1104
     * @tc.desc 状态值：结果页返回按钮可交互
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1104 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      const backButton: Component = await findId(driver, 'back_button');
      await backToQuery(driver);
      const search: Component = await findId(driver, 'search');
      expect(backButton !== null).assertTrue();
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1104 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1105
     * @tc.name testResultUi1105
     * @tc.desc 状态值：返回后保存页可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1105 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1105 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1106
     * @tc.name testResultUi1106
     * @tc.desc 状态值：二次进入结果页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1106 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1106 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1107
     * @tc.name testResultUi1107
     * @tc.desc 状态值：二次返回主页面不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1107 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1107 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1108
     * @tc.name testResultUi1108
     * @tc.desc 组合值：三次查询往返不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1108 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1108 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1109
     * @tc.name testResultUi1109
     * @tc.desc 状态值：结果页内列表再次定位存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1109 begin');
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      await sleep(800);
      const again: Component = await findId(driver, 'result_list');
      expect(resultList !== null).assertTrue();
      expect(again !== null).assertTrue();
      expect(again !== undefined).assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1109 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1110
     * @tc.name testResultUi1110
     * @tc.desc 状态值：结果列表滚动到底不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1110 begin');
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      await resultList.scrollToBottom();
      await sleep(800);
      const backButton: Component = await findId(driver, 'back_button');
      expect(resultList !== null).assertTrue();
      expect(backButton !== null).assertTrue();
      expect(typeof backButton.click === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1110 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1111
     * @tc.name testResultUi1111
     * @tc.desc 状态值：结果页长停留后组件稳定
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1111 begin');
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      await sleep(2500);
      const backButton: Component = await findId(driver, 'back_button');
      expect(resultList !== null).assertTrue();
      expect(backButton !== null).assertTrue();
      expect(backButton !== undefined).assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1111 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1112
     * @tc.name testResultUi1112
     * @tc.desc 组合值：查询结果查询连续链不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1112 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1112 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1113
     * @tc.name testResultUi1113
     * @tc.desc 状态值：返回后查询按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1113 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1113 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1114
     * @tc.name testResultUi1114
     * @tc.desc 状态值：返回后保存页四组件定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1114 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await switchTab(driver, 0);
      const account: Component = await findId(driver, 'account_input');
      const secret: Component = await findId(driver, 'secret_input');
      const label: Component = await findId(driver, 'label_input');
      const save: Component = await findId(driver, 'save');
      expect(account !== null).assertTrue();
      expect(secret !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1114 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1115
     * @tc.name testResultUi1115
     * @tc.desc 组合值：输入标签后查询结果页出现
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1115 begin');
      await saveAssetSeed(driver, 'uiResSeedA', 'uiResSeedA1', 'uiLabel');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', 'uiLabel');
      stopInput();
      await sleep(1200);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1115 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1116
     * @tc.name testResultUi1116
     * @tc.desc 状态值：结果页返回后立即再进查询页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1116 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await switchTab(driver, 0);
      await switchTab(driver, 3);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1116 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1117
     * @tc.name testResultUi1117
     * @tc.desc 组合值：四次查询往返不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1117 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1117 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1118
     * @tc.name testResultUi1118
     * @tc.desc 状态值：结果页返回按钮连续点击两次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1118 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const backAfter: Component = await findId(driver, 'back_button');
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      expect(backAfter === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1118 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1119
     * @tc.name testResultUi1119
     * @tc.desc 状态值：结果页内驱动稳定可定位标签栏
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1119 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      const backButton: Component = await findId(driver, 'back_button');
      const resultList: Component = await findId(driver, 'result_list');
      expect(backButton !== null).assertTrue();
      expect(resultList !== null).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1119 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1120
     * @tc.name testResultUi1120
     * @tc.desc 边界值：空数据全量查询结果页容器存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1120 begin');
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1120 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1121
     * @tc.name testResultUi1121
     * @tc.desc 组合值：中文标签查询结果页出现
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1121 begin');
      await saveAssetSeed(driver, 'uiResSeedC', 'uiResSeedC1', '中文标签');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', '中文标签');
      stopInput();
      await sleep(1200);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1121 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1122
     * @tc.name testResultUi1122
     * @tc.desc 组合值：返回后保存页输入再查询结果出现
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1122 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await switchTab(driver, 0);
      await inputById(driver, 'account_input', 'uiResultSave');
      await inputById(driver, 'secret_input', 'uiResultSave1');
      await inputById(driver, 'label_input', 'uiResultSaveL');
      stopInput();
      await sleep(800);
      await clickId(driver, 'save');
      await sleep(800);
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1122 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1123
     * @tc.name testResultUi1123
     * @tc.desc 组合值：返回后切入删除页再回保存页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1123 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await switchTab(driver, 1);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1123 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1124
     * @tc.name testResultUi1124
     * @tc.desc 状态值：返回后驱动再次定位返回按钮不存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1124 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      const backBefore: Component = await findId(driver, 'back_button');
      await backToQuery(driver);
      const search: Component = await findId(driver, 'search');
      expect(backBefore !== null).assertTrue();
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1124 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1125
     * @tc.name testResultUi1125
     * @tc.desc 状态值：收尾保存页状态恢复四组件定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testResultUi1125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1125 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await switchTab(driver, 0);
      const account: Component = await findId(driver, 'account_input');
      const secret: Component = await findId(driver, 'secret_input');
      const label: Component = await findId(driver, 'label_input');
      const save: Component = await findId(driver, 'save');
      expect(account !== null).assertTrue();
      expect(secret !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResultUi1125 end');
    });
  });
}


