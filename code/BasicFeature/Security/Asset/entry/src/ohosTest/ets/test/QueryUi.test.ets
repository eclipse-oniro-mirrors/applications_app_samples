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
  saveAssetSeed, clearQueryInputs } from './UiHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

const driver: Driver = Driver.create();

export default function queryUi() {
  describe('QueryUiTest', () => {
    beforeAll(async () => {
      await launchApp();
      await sleep(1500);
    });

    /**
     * @tc.number SUB_ASSET_UI_1051
     * @tc.name testQueryUi1051
     * @tc.desc 查询页关键组件一次定位全部存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1051 begin');
      await switchTab(driver, 3);
      const account: Component = await findId(driver, 'query_account_input');
      const label: Component = await findId(driver, 'query_label_input');
      const search: Component = await findId(driver, 'search');
      expect(account !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(search !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1051 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1052
     * @tc.name testQueryUi1052
     * @tc.desc 合法值：查询页账号输入框可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1052 begin');
      await switchTab(driver, 3);
      const account: Component = await findId(driver, 'query_account_input');
      const text: string = await account.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1052 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1053
     * @tc.name testQueryUi1053
     * @tc.desc 合法值：查询页标签输入框可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1053 begin');
      await switchTab(driver, 3);
      const label: Component = await findId(driver, 'query_label_input');
      const text: string = await label.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1053 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1054
     * @tc.name testQueryUi1054
     * @tc.desc 合法值：查询按钮可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1054 begin');
      await switchTab(driver, 3);
      const search: Component = await findId(driver, 'search');
      const text: string = await search.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1054 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1055
     * @tc.name testQueryUi1055
     * @tc.desc 合法值：查询页内容区存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1055 begin');
      await switchTab(driver, 3);
      const content: Component = await findId(driver, 'query_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1055 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1056
     * @tc.name testQueryUi1056
     * @tc.desc 合法值：空输入全量查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1056 begin');
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1056 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1057
     * @tc.name testQueryUi1057
     * @tc.desc 合法值：结果页返回按钮存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1057 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      const backButton: Component = await findId(driver, 'back_button');
      expect(backButton !== null).assertTrue();
      expect(backButton !== undefined).assertTrue();
      expect(typeof backButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1057 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1058
     * @tc.name testQueryUi1058
     * @tc.desc 状态值：点击返回后主页面可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1058 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1058 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1059
     * @tc.name testQueryUi1059
     * @tc.desc 状态值：返回后再次切换查询页可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1059 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await switchTab(driver, 0);
      await switchTab(driver, 3);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1059 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1060
     * @tc.name testQueryUi1060
     * @tc.desc 组合值：输入标签查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1060 begin');
      await saveAssetSeed(driver, 'uiQrySeedA', 'uiQrySeedA1', 'uiLabel');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', 'uiLabel');
      stopInput();
      await sleep(1200);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1060 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1061
     * @tc.name testQueryUi1061
     * @tc.desc 状态值：标签查询结果页返回不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1061 begin');
      await saveAssetSeed(driver, 'uiQrySeedB', 'uiQrySeedB1', 'uiLabel');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', 'uiLabel');
      stopInput();
      await sleep(1200);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      await backToQuery(driver);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1061 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1062
     * @tc.name testQueryUi1062
     * @tc.desc 降级覆盖：输入不存在账号后清空再查询不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1062 begin');
      await switchTab(driver, 3);
      await inputById(driver, 'query_account_input', 'noSuchAccountQry');
      stopInput();
      await sleep(800);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      // 账号非空点击查询会触发 preQuery：设备无 PIN 验证时 asset.preQuery 阻塞主线程 6s+
      // 触发 ANR（实测 THREAD_BLOCK_6S 且应用被系统关闭），故清空账号走全量查询分支
      await clearQueryInputs(driver);
      // clearText 会重新聚焦标签框弹出软键盘遮挡 search，收起键盘后再点击查询
      stopInput();
      await sleep(800);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1062 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1063
     * @tc.name testQueryUi1063
     * @tc.desc 状态值：连续两次查询不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1063 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1063 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1064
     * @tc.name testQueryUi1064
     * @tc.desc 组合值：查询返回后再次查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1064 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await searchAndWaitResult(driver);
      const backButton: Component = await findId(driver, 'back_button');
      expect(backButton !== null).assertTrue();
      expect(backButton !== undefined).assertTrue();
      expect(typeof backButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1064 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1065
     * @tc.name testQueryUi1065
     * @tc.desc 边界值：中文标签查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1065 begin');
      await saveAssetSeed(driver, 'uiQrySeedC', 'uiQrySeedC1', '中文标签');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', '中文标签');
      stopInput();
      await sleep(1200);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1065 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1066
     * @tc.name testQueryUi1066
     * @tc.desc 边界值：纯数字标签查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1066 begin');
      await saveAssetSeed(driver, 'uiQrySeedD', 'uiQrySeedD1', '123456');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', '123456');
      stopInput();
      await sleep(1200);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1066 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1067
     * @tc.name testQueryUi1067
     * @tc.desc 极值：长标签查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1067 begin');
      await saveAssetSeed(driver, 'uiQrySeedE', 'uiQrySeedE1', 'uiLongLbl123456');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', 'uiLongLbl123456');
      stopInput();
      await sleep(1200);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1067 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1068
     * @tc.name testQueryUi1068
     * @tc.desc 边界值：特殊字符标签查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1068 begin');
      await saveAssetSeed(driver, 'uiQrySeedF', 'uiQrySeedF1', 'l@b#e$l');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', 'l@b#e$l');
      stopInput();
      await sleep(1200);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1068 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1069
     * @tc.name testQueryUi1069
     * @tc.desc 组合值：覆盖输入标签后全量查询不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1069 begin');
      await saveAssetSeed(driver, 'uiQrySeedG', 'uiQrySeedG1', 'secondLabel');
      await switchTab(driver, 3);
      await inputById(driver, 'query_label_input', 'firstLabel');
      await sleep(500);
      await inputById(driver, 'query_label_input', 'secondLabel');
      stopInput();
      await sleep(1200);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1069 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1070
     * @tc.name testQueryUi1070
     * @tc.desc 状态值：结果列表滚动到底不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1070 begin');
      await switchTab(driver, 3);
      const resultList: Component = await searchAndWaitResult(driver);
      await resultList.scrollToBottom();
      await sleep(800);
      const backButton: Component = await findId(driver, 'back_button');
      expect(resultList !== null).assertTrue();
      expect(backButton !== null).assertTrue();
      expect(typeof backButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1070 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1071
     * @tc.name testQueryUi1071
     * @tc.desc 状态值：查询后切换保存页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1071 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1071 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1072
     * @tc.name testQueryUi1072
     * @tc.desc 组合值：保存后跨页查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1072 begin');
      await switchTab(driver, 0);
      await inputById(driver, 'account_input', 'uiCrossQry');
      await inputById(driver, 'secret_input', 'uiCrossQry1');
      await inputById(driver, 'label_input', 'uiCrossQryL');
      stopInput();
      await sleep(800);
      await clickId(driver, 'save');
      await sleep(800);
      await switchTab(driver, 3);
      await clickId(driver, 'search');
      await sleep(1500);
      const resultList: Component = await findId(driver, 'result_list');
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1072 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1073
     * @tc.name testQueryUi1073
     * @tc.desc 状态值：三次连续查询往返不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1073 begin');
      await switchTab(driver, 3);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      await searchAndWaitResult(driver);
      await backToQuery(driver);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(resultList !== undefined).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1073 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1074
     * @tc.name testQueryUi1074
     * @tc.desc 状态值：账号覆盖输入后清空再查询不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1074 begin');
      await switchTab(driver, 3);
      await inputById(driver, 'query_account_input', 'firstAcct');
      await sleep(500);
      await inputById(driver, 'query_account_input', 'secondAcct');
      stopInput();
      await sleep(800);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      // 账号非空点击查询会触发 preQuery（无 PIN 设备阻塞主线程触发 ANR），清空账号走全量查询分支
      await clearQueryInputs(driver);
      // clearText 会重新聚焦标签框弹出软键盘遮挡 search，收起键盘后再点击查询
      stopInput();
      await sleep(800);
      const resultList: Component = await searchAndWaitResult(driver);
      expect(resultList !== null).assertTrue();
      expect(typeof resultList.scrollToBottom === 'function').assertTrue();
      await backToQuery(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1074 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1075
     * @tc.name testQueryUi1075
     * @tc.desc 状态值：查询页停留后组件再次定位存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testQueryUi1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1075 begin');
      await switchTab(driver, 3);
      await sleep(2500);
      const account: Component = await findId(driver, 'query_account_input');
      const label: Component = await findId(driver, 'query_label_input');
      const search: Component = await findId(driver, 'search');
      expect(account !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(search !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryUi1075 end');
    });
  });
}


