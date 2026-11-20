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

export default function deleteUi() {
  describe('DeleteUiTest', () => {
    beforeAll(async () => {
      await launchApp();
      await sleep(1500);
    });

    /**
     * @tc.number SUB_ASSET_UI_1026
     * @tc.name testDeleteUi1026
     * @tc.desc 删除页关键组件一次定位全部存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1026 begin');
      await switchTab(driver, 1);
      const account: Component = await findId(driver, 'delete_account_input');
      const label: Component = await findId(driver, 'delete_label_input');
      const delButton: Component = await findId(driver, 'delete_button');
      expect(account !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(delButton !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1026 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1027
     * @tc.name testDeleteUi1027
     * @tc.desc 合法值：删除页账号输入框可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1027 begin');
      await switchTab(driver, 1);
      const account: Component = await findId(driver, 'delete_account_input');
      const text: string = await account.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1027 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1028
     * @tc.name testDeleteUi1028
     * @tc.desc 合法值：删除页标签输入框可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1028 begin');
      await switchTab(driver, 1);
      const label: Component = await findId(driver, 'delete_label_input');
      const text: string = await label.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1028 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1029
     * @tc.name testDeleteUi1029
     * @tc.desc 合法值：删除按钮可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1029 begin');
      await switchTab(driver, 1);
      const delButton: Component = await findId(driver, 'delete_button');
      const text: string = await delButton.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1029 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1030
     * @tc.name testDeleteUi1030
     * @tc.desc 合法值：删除页内容区存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1030 begin');
      await switchTab(driver, 1);
      const content: Component = await findId(driver, 'delete_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1030 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1031
     * @tc.name testDeleteUi1031
     * @tc.desc 合法值：英文账号输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1031 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'uiDelAcct');
      stopInput();
      await sleep(800);
      const account: Component = await findId(driver, 'delete_account_input');
      expect(account !== null).assertTrue();
      expect(account !== undefined).assertTrue();
      expect(typeof account.inputText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1031 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1032
     * @tc.name testDeleteUi1032
     * @tc.desc 合法值：英文标签输入后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1032 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_label_input', 'uiDelLabel');
      stopInput();
      await sleep(800);
      const label: Component = await findId(driver, 'delete_label_input');
      expect(label !== null).assertTrue();
      expect(label !== undefined).assertTrue();
      expect(typeof label.inputText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1032 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1033
     * @tc.name testDeleteUi1033
     * @tc.desc 组合值：输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1033 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'uiDelFull');
      await inputById(driver, 'delete_label_input', 'uiDelFullL');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1033 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1034
     * @tc.name testDeleteUi1034
     * @tc.desc 非法值：空输入点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1034 begin');
      await switchTab(driver, 1);
      await clickId(driver, 'delete_button');
      await sleep(800);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1034 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1035
     * @tc.name testDeleteUi1035
     * @tc.desc 边界值：中文账号输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1035 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', '中文删除账号');
      await inputById(driver, 'delete_label_input', '中文删除标签');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1035 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1036
     * @tc.name testDeleteUi1036
     * @tc.desc 极值：长账号输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1036 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' +
        '0123456789xx');
      await inputById(driver, 'delete_label_input', 'longLabel');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1036 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1037
     * @tc.name testDeleteUi1037
     * @tc.desc 边界值：纯数字账号输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1037 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', '9876543210');
      await inputById(driver, 'delete_label_input', 'digitLabel');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1037 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1038
     * @tc.name testDeleteUi1038
     * @tc.desc 边界值：特殊字符标签输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1038 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'specialAcct');
      await inputById(driver, 'delete_label_input', 'l@b#e$l');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1038 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1039
     * @tc.name testDeleteUi1039
     * @tc.desc 状态值：连续两次点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1039 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'uiTwiceDel');
      await inputById(driver, 'delete_label_input', 'uiTwiceDelL');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(800);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1039 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1040
     * @tc.name testDeleteUi1040
     * @tc.desc 状态值：删除后切换回保存页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1040 begin');
      await switchTab(driver, 1);
      await clickId(driver, 'delete_button');
      await sleep(800);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1040 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1041
     * @tc.name testDeleteUi1041
     * @tc.desc 状态值：删除后切换查询页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1041 begin');
      await switchTab(driver, 1);
      await clickId(driver, 'delete_button');
      await sleep(800);
      await switchTab(driver, 3);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1041 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1042
     * @tc.name testDeleteUi1042
     * @tc.desc 状态值：输入前删除按钮文案为字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1042 begin');
      await switchTab(driver, 1);
      const delButton: Component = await findId(driver, 'delete_button');
      const text: string = await delButton.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1042 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1043
     * @tc.name testDeleteUi1043
     * @tc.desc 状态值：覆盖输入两次后组件仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1043 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'firstValue');
      await sleep(500);
      await inputById(driver, 'delete_account_input', 'secondValue');
      stopInput();
      await sleep(800);
      const account: Component = await findId(driver, 'delete_account_input');
      expect(account !== null).assertTrue();
      expect(account !== undefined).assertTrue();
      expect(typeof account.getText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1043 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1044
     * @tc.name testDeleteUi1044
     * @tc.desc 边界值：空标签输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1044 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'uiEmptyLabel');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1044 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1045
     * @tc.name testDeleteUi1045
     * @tc.desc 极值：超长标签输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1045 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'uiLongLabelAcct');
      await inputById(driver, 'delete_label_input', 'labelabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0' +
        '123456789');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1045 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1046
     * @tc.name testDeleteUi1046
     * @tc.desc 状态值：删除后三个关键组件再次定位全部存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1046 begin');
      await switchTab(driver, 1);
      await clickId(driver, 'delete_button');
      await sleep(800);
      const account: Component = await findId(driver, 'delete_account_input');
      const label: Component = await findId(driver, 'delete_label_input');
      const delButton: Component = await findId(driver, 'delete_button');
      expect(account !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(delButton !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1046 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1047
     * @tc.name testDeleteUi1047
     * @tc.desc 非法值：删除不存在的账号不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1047 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'noSuchAccount');
      await inputById(driver, 'delete_label_input', 'noSuchLabel');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const account: Component = await findId(driver, 'delete_account_input');
      expect(account !== null).assertTrue();
      expect(account !== undefined).assertTrue();
      expect(typeof account.inputText === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1047 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1048
     * @tc.name testDeleteUi1048
     * @tc.desc 边界值：中英混合账号输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1048 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', '中文abc123');
      await inputById(driver, 'delete_label_input', '混合label');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1048 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1049
     * @tc.name testDeleteUi1049
     * @tc.desc 边界值：带空格标签输入后点击删除不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1049 begin');
      await switchTab(driver, 1);
      await inputById(driver, 'delete_account_input', 'spaceAcct');
      await inputById(driver, 'delete_label_input', 'label with space');
      stopInput();
      await sleep(800);
      await clickId(driver, 'delete_button');
      await sleep(1200);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1049 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1050
     * @tc.name testDeleteUi1050
     * @tc.desc 状态值：删除后返回保存页四组件定位（状态恢复）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testDeleteUi1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1050 begin');
      await switchTab(driver, 1);
      await clickId(driver, 'delete_button');
      await sleep(800);
      await switchTab(driver, 0);
      const account: Component = await findId(driver, 'account_input');
      const secret: Component = await findId(driver, 'secret_input');
      const label: Component = await findId(driver, 'label_input');
      const save: Component = await findId(driver, 'save');
      expect(account !== null).assertTrue();
      expect(secret !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteUi1050 end');
    });
  });
}


