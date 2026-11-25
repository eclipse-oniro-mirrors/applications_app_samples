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
import { sleep, findId, clickId, switchTab, launchApp } from './UiHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

const driver: Driver = Driver.create();

export default function tabUi() {
  describe('TabUiTest', () => {
    beforeAll(async () => {
      await launchApp();
      await sleep(1500);
    });

    /**
     * @tc.number SUB_ASSET_UI_1126
     * @tc.name testTabUi1126
     * @tc.desc 顺序遍历四标签页逐页断言内容区存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1126 begin');
      await switchTab(driver, 0);
      const saveContent: Component = await findId(driver, 'save_tab');
      await switchTab(driver, 1);
      const deleteContent: Component = await findId(driver, 'delete_tab');
      await switchTab(driver, 2);
      const updateContent: Component = await findId(driver, 'update_tab');
      await switchTab(driver, 3);
      const queryContent: Component = await findId(driver, 'query_tab');
      expect(saveContent !== null).assertTrue();
      expect(deleteContent !== null).assertTrue();
      expect(updateContent !== null).assertTrue();
      expect(queryContent !== null).assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1126 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1127
     * @tc.name testTabUi1127
     * @tc.desc 合法值：保存标签栏文本为字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1127 begin');
      const tabBar: Component = await findId(driver, 'tab_bar_0');
      const text: string = await tabBar.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1127 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1128
     * @tc.name testTabUi1128
     * @tc.desc 合法值：删除标签栏文本为字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1128 begin');
      const tabBar: Component = await findId(driver, 'tab_bar_1');
      const text: string = await tabBar.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1128 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1129
     * @tc.name testTabUi1129
     * @tc.desc 合法值：更新标签栏文本为字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1129 begin');
      const tabBar: Component = await findId(driver, 'tab_bar_2');
      const text: string = await tabBar.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1129 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1130
     * @tc.name testTabUi1130
     * @tc.desc 合法值：查询标签栏文本为字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1130 begin');
      const tabBar: Component = await findId(driver, 'tab_bar_3');
      const text: string = await tabBar.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1130 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1131
     * @tc.name testTabUi1131
     * @tc.desc 状态值：切入删除页后内容区存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1131 begin');
      await switchTab(driver, 1);
      const content: Component = await findId(driver, 'delete_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1131 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1132
     * @tc.name testTabUi1132
     * @tc.desc 状态值：切入更新页后内容区存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1132 begin');
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1132 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1133
     * @tc.name testTabUi1133
     * @tc.desc 状态值：切入查询页后内容区存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1133 begin');
      await switchTab(driver, 3);
      const content: Component = await findId(driver, 'query_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1133 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1134
     * @tc.name testTabUi1134
     * @tc.desc 状态值：切入保存页后内容区存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1134 begin');
      await switchTab(driver, 1);
      await switchTab(driver, 0);
      const content: Component = await findId(driver, 'save_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1134 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1135
     * @tc.name testTabUi1135
     * @tc.desc 组合值：保存删除往返两次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1135 begin');
      await switchTab(driver, 1);
      await switchTab(driver, 0);
      await switchTab(driver, 1);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1135 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1136
     * @tc.name testTabUi1136
     * @tc.desc 组合值：保存更新往返两次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1136 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1136 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1137
     * @tc.name testTabUi1137
     * @tc.desc 组合值：保存查询往返两次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1137 begin');
      await switchTab(driver, 3);
      await switchTab(driver, 0);
      await switchTab(driver, 3);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1137 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1138
     * @tc.name testTabUi1138
     * @tc.desc 状态值：顺序遍历两轮不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1138 begin');
      await switchTab(driver, 0);
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      await switchTab(driver, 0);
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      const queryContent: Component = await findId(driver, 'query_tab');
      expect(queryContent !== null).assertTrue();
      expect(queryContent !== undefined).assertTrue();
      expect(typeof queryContent.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1138 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1139
     * @tc.name testTabUi1139
     * @tc.desc 状态值：逆序遍历两轮不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1139 begin');
      await switchTab(driver, 3);
      await switchTab(driver, 2);
      await switchTab(driver, 1);
      await switchTab(driver, 0);
      await switchTab(driver, 3);
      await switchTab(driver, 2);
      await switchTab(driver, 1);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1139 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1140
     * @tc.name testTabUi1140
     * @tc.desc 状态值：快速连续切换四标签页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1140 begin');
      await clickId(driver, 'tab_bar_0');
      await clickId(driver, 'tab_bar_1');
      await clickId(driver, 'tab_bar_2');
      await clickId(driver, 'tab_bar_3');
      await sleep(1500);
      const queryContent: Component = await findId(driver, 'query_tab');
      expect(queryContent !== null).assertTrue();
      expect(queryContent !== undefined).assertTrue();
      expect(typeof queryContent.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1140 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1141
     * @tc.name testTabUi1141
     * @tc.desc 状态值：遍历后保存页四组件定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1141 begin');
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      await switchTab(driver, 0);
      const account: Component = await findId(driver, 'account_input');
      const secret: Component = await findId(driver, 'secret_input');
      const label: Component = await findId(driver, 'label_input');
      const save: Component = await findId(driver, 'save');
      expect(account !== null).assertTrue();
      expect(secret !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1141 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1142
     * @tc.name testTabUi1142
     * @tc.desc 状态值：遍历后查询按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1142 begin');
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      const search: Component = await findId(driver, 'search');
      expect(search !== null).assertTrue();
      expect(search !== undefined).assertTrue();
      expect(typeof search.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1142 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1143
     * @tc.name testTabUi1143
     * @tc.desc 状态值：遍历后删除按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1143 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      await switchTab(driver, 1);
      const delButton: Component = await findId(driver, 'delete_button');
      expect(delButton !== null).assertTrue();
      expect(delButton !== undefined).assertTrue();
      expect(typeof delButton.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1143 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1144
     * @tc.name testTabUi1144
     * @tc.desc 状态值：遍历后更新页内容区可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1144 begin');
      await switchTab(driver, 3);
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1144 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1145
     * @tc.name testTabUi1145
     * @tc.desc 状态值：重复切入删除页两次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1145 begin');
      await switchTab(driver, 1);
      await switchTab(driver, 1);
      const content: Component = await findId(driver, 'delete_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1145 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1146
     * @tc.name testTabUi1146
     * @tc.desc 状态值：重复切入查询页两次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1146 begin');
      await switchTab(driver, 3);
      await switchTab(driver, 3);
      const content: Component = await findId(driver, 'query_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1146 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1147
     * @tc.name testTabUi1147
     * @tc.desc 组合值：交错遍历保存更新删除查询不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1147 begin');
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      await switchTab(driver, 1);
      await switchTab(driver, 3);
      const queryContent: Component = await findId(driver, 'query_tab');
      expect(queryContent !== null).assertTrue();
      expect(queryContent !== undefined).assertTrue();
      expect(typeof queryContent.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1147 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1148
     * @tc.name testTabUi1148
     * @tc.desc 组合值：交错遍历查询删除更新保存不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1148 begin');
      await switchTab(driver, 3);
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1148 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1149
     * @tc.name testTabUi1149
     * @tc.desc 状态值：每页停留后完整遍历一轮不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1149 begin');
      await switchTab(driver, 0);
      await sleep(1000);
      await switchTab(driver, 1);
      await sleep(1000);
      await switchTab(driver, 2);
      await sleep(1000);
      await switchTab(driver, 3);
      await sleep(1000);
      const queryContent: Component = await findId(driver, 'query_tab');
      expect(queryContent !== null).assertTrue();
      expect(queryContent !== undefined).assertTrue();
      expect(typeof queryContent.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1149 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1150
     * @tc.name testTabUi1150
     * @tc.desc 状态值：收尾保存页与标签栏全组件定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testTabUi1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1150 begin');
      await switchTab(driver, 0);
      const tabBar0: Component = await findId(driver, 'tab_bar_0');
      const tabBar1: Component = await findId(driver, 'tab_bar_1');
      const tabBar2: Component = await findId(driver, 'tab_bar_2');
      const tabBar3: Component = await findId(driver, 'tab_bar_3');
      const save: Component = await findId(driver, 'save');
      expect(tabBar0 !== null).assertTrue();
      expect(tabBar1 !== null).assertTrue();
      expect(tabBar2 !== null).assertTrue();
      expect(tabBar3 !== null).assertTrue();
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTabUi1150 end');
    });
  });
}


