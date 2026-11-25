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
import { sleep, findId, clickId, inputById, stopInput, switchTab, launchApp } from './UiHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

const driver: Driver = Driver.create();

export default function saveUi() {
  describe('SaveUiTest', () => {
    beforeAll(async () => {
      await launchApp();
      await sleep(1500);
    });

    /**
     * @tc.number SUB_ASSET_UI_1001
     * @tc.name testSaveUi1001
     * @tc.desc 保存页关键组件一次定位全部存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1001 begin');
      const account: Component = await findId(driver, 'account_input');
      const secret: Component = await findId(driver, 'secret_input');
      const label: Component = await findId(driver, 'label_input');
      const save: Component = await findId(driver, 'save');
      expect(account !== null).assertTrue();
      expect(secret !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1001 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1002
     * @tc.name testSaveUi1002
     * @tc.desc 合法值：账号输入框可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1002 begin');
      const account: Component = await findId(driver, 'account_input');
      const text: string = await account.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1002 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1003
     * @tc.name testSaveUi1003
     * @tc.desc 合法值：密码输入框可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1003 begin');
      const secret: Component = await findId(driver, 'secret_input');
      const text: string = await secret.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1003 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1004
     * @tc.name testSaveUi1004
     * @tc.desc 合法值：标签输入框可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1004 begin');
      const label: Component = await findId(driver, 'label_input');
      const text: string = await label.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1004 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1005
     * @tc.name testSaveUi1005
     * @tc.desc 合法值：保存按钮可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1005 begin');
      const save: Component = await findId(driver, 'save');
      const text: string = await save.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1005 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1006
     * @tc.name testSaveUi1006
     * @tc.desc 合法值：标签标题组件可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1006 begin');
      const labelText: Component = await findId(driver, 'label');
      const text: string = await labelText.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1006 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1007
     * @tc.name testSaveUi1007
     * @tc.desc 合法值：英文账号输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1007 begin');
      await inputById(driver, 'account_input', 'uiAccount');
      stopInput();
      await sleep(800);
      const account: Component = await findId(driver, 'account_input');
      expect(account !== null).assertTrue();
      expect(account !== undefined).assertTrue();
      expect(typeof account.inputText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1007 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1008
     * @tc.name testSaveUi1008
     * @tc.desc 合法值：英文密码输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1008 begin');
      await inputById(driver, 'secret_input', 'uiSecret123');
      stopInput();
      await sleep(800);
      const secret: Component = await findId(driver, 'secret_input');
      expect(secret !== null).assertTrue();
      expect(secret !== undefined).assertTrue();
      expect(typeof secret.inputText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1008 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1009
     * @tc.name testSaveUi1009
     * @tc.desc 合法值：英文标签输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1009 begin');
      await inputById(driver, 'label_input', 'uiLabel');
      stopInput();
      await sleep(800);
      const label: Component = await findId(driver, 'label_input');
      expect(label !== null).assertTrue();
      expect(label !== undefined).assertTrue();
      expect(typeof label.inputText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1009 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1010
     * @tc.name testSaveUi1010
     * @tc.desc 组合值：完整输入后点击保存不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1010 begin');
      await inputById(driver, 'account_input', 'uiAcctFull');
      await inputById(driver, 'secret_input', 'uiSecretFull1');
      await inputById(driver, 'label_input', 'uiLabelFull');
      stopInput();
      await sleep(800);
      await clickId(driver, 'save');
      await sleep(1200);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1010 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1011
     * @tc.name testSaveUi1011
     * @tc.desc 边界值：中文账号输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1011 begin');
      await inputById(driver, 'account_input', '中文账号');
      stopInput();
      await sleep(800);
      const account: Component = await findId(driver, 'account_input');
      expect(account !== null).assertTrue();
      expect(account !== undefined).assertTrue();
      expect(typeof account.getText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1011 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1012
     * @tc.name testSaveUi1012
     * @tc.desc 边界值：中文标签输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1012 begin');
      await inputById(driver, 'label_input', '中文标签');
      stopInput();
      await sleep(800);
      const label: Component = await findId(driver, 'label_input');
      expect(label !== null).assertTrue();
      expect(label !== undefined).assertTrue();
      expect(typeof label.getText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1012 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1013
     * @tc.name testSaveUi1013
     * @tc.desc 极值：长账号输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1013 begin');
      await inputById(driver, 'account_input', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789xx');
      stopInput();
      await sleep(800);
      const account: Component = await findId(driver, 'account_input');
      expect(account !== null).assertTrue();
      expect(account !== undefined).assertTrue();
      expect(typeof account.inputText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1013 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1014
     * @tc.name testSaveUi1014
     * @tc.desc 极值：长标签输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1014 begin');
      await inputById(driver, 'label_input', 'labelabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789');
      stopInput();
      await sleep(800);
      const label: Component = await findId(driver, 'label_input');
      expect(label !== null).assertTrue();
      expect(label !== undefined).assertTrue();
      expect(typeof label.inputText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1014 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1015
     * @tc.name testSaveUi1015
     * @tc.desc 边界值：纯数字账号输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1015 begin');
      await inputById(driver, 'account_input', '1234567890');
      stopInput();
      await sleep(800);
      const account: Component = await findId(driver, 'account_input');
      expect(account !== null).assertTrue();
      expect(account !== undefined).assertTrue();
      expect(typeof account.getText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1015 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1016
     * @tc.name testSaveUi1016
     * @tc.desc 边界值：特殊字符标签输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1016 begin');
      await inputById(driver, 'label_input', 'l@b#e$l');
      stopInput();
      await sleep(800);
      const label: Component = await findId(driver, 'label_input');
      expect(label !== null).assertTrue();
      expect(label !== undefined).assertTrue();
      expect(typeof label.getText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1016 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1017
     * @tc.name testSaveUi1017
     * @tc.desc 非法值：空输入点击保存不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1017 begin');
      await clickId(driver, 'save');
      await sleep(800);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1017 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1018
     * @tc.name testSaveUi1018
     * @tc.desc 状态值：连续两次点击保存不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1018 begin');
      await inputById(driver, 'account_input', 'uiTwice');
      await inputById(driver, 'secret_input', 'uiTwice123');
      await inputById(driver, 'label_input', 'uiTwiceLabel');
      stopInput();
      await sleep(800);
      await clickId(driver, 'save');
      await sleep(800);
      await clickId(driver, 'save');
      await sleep(800);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1018 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1019
     * @tc.name testSaveUi1019
     * @tc.desc 状态值：输入后四个关键组件再次定位全部存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1019 begin');
      await inputById(driver, 'account_input', 'uiRelocate');
      await inputById(driver, 'secret_input', 'uiRelocate1');
      await inputById(driver, 'label_input', 'uiRelocateL');
      stopInput();
      await sleep(800);
      const account: Component = await findId(driver, 'account_input');
      const secret: Component = await findId(driver, 'secret_input');
      const label: Component = await findId(driver, 'label_input');
      const save: Component = await findId(driver, 'save');
      expect(account !== null).assertTrue();
      expect(secret !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1019 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1020
     * @tc.name testSaveUi1020
     * @tc.desc 组合值：保存后切换到查询页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1020 begin');
      await inputById(driver, 'account_input', 'uiSaveQuery');
      await inputById(driver, 'secret_input', 'uiSaveQuery1');
      await inputById(driver, 'label_input', 'uiSaveQueryL');
      stopInput();
      await sleep(800);
      await clickId(driver, 'save');
      await sleep(800);
      await switchTab(driver, 3);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1020 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1021
     * @tc.name testSaveUi1021
     * @tc.desc 组合值：保存后全量查询出现结果列表
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1021 begin');
      await switchTab(driver, 0);
      await inputById(driver, 'account_input', 'uiSaveThenQry');
      await inputById(driver, 'secret_input', 'uiSaveThenQry1');
      await inputById(driver, 'label_input', 'uiSaveThenQryL');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1021 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1022
     * @tc.name testSaveUi1022
     * @tc.desc 状态值：查询结果页返回后保存页可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1022 begin');
      await switchTab(driver, 3);
      await clickId(driver, 'search');
      await sleep(1500);
      await clickId(driver, 'back_button');
      await sleep(1500);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1022 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1023
     * @tc.name testSaveUi1023
     * @tc.desc 组合值：保存查询返回两轮循环不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1023 begin');
      await inputById(driver, 'account_input', 'uiLoopAcct');
      await inputById(driver, 'secret_input', 'uiLoop123');
      await inputById(driver, 'label_input', 'uiLoopLabel');
      stopInput();
      await sleep(800);
      await clickId(driver, 'save');
      await sleep(800);
      await switchTab(driver, 3);
      await clickId(driver, 'search');
      await sleep(1500);
      await clickId(driver, 'back_button');
      await sleep(1500);
      await switchTab(driver, 0);
      await clickId(driver, 'save');
      await sleep(800);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1023 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1024
     * @tc.name testSaveUi1024
     * @tc.desc 极值：六十四字符密码输入后点击保存不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1024 begin');
      await inputById(driver, 'account_input', 'uiLongPwd');
      await inputById(driver, 'secret_input', 'pwdabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789xx');
      await inputById(driver, 'label_input', 'uiLongPwdL');
      stopInput();
      await sleep(800);
      await clickId(driver, 'save');
      await sleep(1200);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1024 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1025
     * @tc.name testSaveUi1025
     * @tc.desc 状态值：输入前保存按钮文案为字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testSaveUi1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1025 begin');
      const save: Component = await findId(driver, 'save');
      const text: string = await save.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSaveUi1025 end');
    });
  });
}


