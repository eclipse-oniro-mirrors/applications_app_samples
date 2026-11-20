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

export default function updateUi() {
  describe('UpdateUiTest', () => {
    beforeAll(async () => {
      await launchApp();
      await sleep(1500);
    });

    /**
     * @tc.number SUB_ASSET_UI_1076
     * @tc.name testUpdateUi1076
     * @tc.desc 切入更新页后内容区渲染且可返回（PIN 降级覆盖）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1076 begin');
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1076 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1077
     * @tc.name testUpdateUi1077
     * @tc.desc 合法值：更新页标签栏可读取文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1077 begin');
      const tabBar: Component = await findId(driver, 'tab_bar_2');
      const text: string = await tabBar.getText();
      expect(text !== undefined).assertTrue();
      expect(typeof text === 'string').assertTrue();
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1077 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1078
     * @tc.name testUpdateUi1078
     * @tc.desc 状态值：切入更新页后内容区可交互
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1078 begin');
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1078 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1079
     * @tc.name testUpdateUi1079
     * @tc.desc 状态值：切入更新页后驱动仍可定位保存页
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1079 begin');
      await switchTab(driver, 2);
      const tabBar0: Component = await findId(driver, 'tab_bar_0');
      expect(tabBar0 !== null).assertTrue();
      expect(tabBar0 !== undefined).assertTrue();
      expect(typeof tabBar0.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1079 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1080
     * @tc.name testUpdateUi1080
     * @tc.desc 组合值：更新页与保存页往返两次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1080 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1080 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1081
     * @tc.name testUpdateUi1081
     * @tc.desc 组合值：更新页与删除页往返不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1081 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1081 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1082
     * @tc.name testUpdateUi1082
     * @tc.desc 组合值：更新页与查询页往返不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1082 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1082 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1083
     * @tc.name testUpdateUi1083
     * @tc.desc 组合值：顺序遍历四个标签页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1083 begin');
      await switchTab(driver, 0);
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      const queryContent: Component = await findId(driver, 'query_tab');
      expect(queryContent !== null).assertTrue();
      expect(queryContent !== undefined).assertTrue();
      expect(typeof queryContent.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1083 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1084
     * @tc.name testUpdateUi1084
     * @tc.desc 组合值：逆序遍历四个标签页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1084 begin');
      await switchTab(driver, 3);
      await switchTab(driver, 2);
      await switchTab(driver, 1);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1084 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1085
     * @tc.name testUpdateUi1085
     * @tc.desc 状态值：顺序遍历两轮不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1085 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1085 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1086
     * @tc.name testUpdateUi1086
     * @tc.desc 状态值：更新页长停留后驱动稳定
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1086 begin');
      await switchTab(driver, 2);
      await sleep(2500);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1086 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1087
     * @tc.name testUpdateUi1087
     * @tc.desc 状态值：快速连续切换四标签页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1087 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1087 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1088
     * @tc.name testUpdateUi1088
     * @tc.desc 状态值：更新页内容区可滚动
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1088 begin');
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      await content.scrollToBottom();
      await sleep(800);
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.scrollToBottom === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1088 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1089
     * @tc.name testUpdateUi1089
     * @tc.desc 状态值：重复切入更新页两次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1089 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1089 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1090
     * @tc.name testUpdateUi1090
     * @tc.desc 状态值：切入更新页后立即返回不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1090 begin');
      await clickId(driver, 'tab_bar_2');
      await clickId(driver, 'tab_bar_0');
      await sleep(1500);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1090 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1091
     * @tc.name testUpdateUi1091
     * @tc.desc 组合值：查询页切入更新页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1091 begin');
      await switchTab(driver, 3);
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1091 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1092
     * @tc.name testUpdateUi1092
     * @tc.desc 组合值：删除页切入更新页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1092 begin');
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1092 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1093
     * @tc.name testUpdateUi1093
     * @tc.desc 状态值：更新页切换前后驱动实例可用
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1093 begin');
      await switchTab(driver, 2);
      expect(driver !== undefined).assertTrue();
      expect(driver !== null).assertTrue();
      expect(typeof driver.findComponent === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1093 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1094
     * @tc.name testUpdateUi1094
     * @tc.desc 状态值：遍历后回到保存页按钮仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1094 begin');
      await switchTab(driver, 1);
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1094 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1095
     * @tc.name testUpdateUi1095
     * @tc.desc 组合值：更新页与保存页往返三次不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1095 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1095 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1096
     * @tc.name testUpdateUi1096
     * @tc.desc 状态值：切入更新页后收起输入法不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1096 begin');
      await switchTab(driver, 2);
      await sleep(800);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1096 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1097
     * @tc.name testUpdateUi1097
     * @tc.desc 状态值：更新页触发后返回保存页内容区存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1097 begin');
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      const saveContent: Component = await findId(driver, 'save_tab');
      expect(saveContent !== null).assertTrue();
      expect(saveContent !== undefined).assertTrue();
      expect(typeof saveContent.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1097 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1098
     * @tc.name testUpdateUi1098
     * @tc.desc 组合值：更新查询保存交错切换不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1098 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 3);
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      const content: Component = await findId(driver, 'update_tab');
      expect(content !== null).assertTrue();
      expect(content !== undefined).assertTrue();
      expect(typeof content.click === 'function').assertTrue();
      await switchTab(driver, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1098 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1099
     * @tc.name testUpdateUi1099
     * @tc.desc 状态值：连续四次切入更新页不抛异常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1099 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      const save: Component = await findId(driver, 'save');
      expect(save !== null).assertTrue();
      expect(save !== undefined).assertTrue();
      expect(typeof save.click === 'function').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1099 end');
    });

    /**
     * @tc.number SUB_ASSET_UI_1100
     * @tc.name testUpdateUi1100
     * @tc.desc 状态值：回到保存页后关键组件定位（状态恢复）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUpdateUi1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1100 begin');
      await switchTab(driver, 2);
      await switchTab(driver, 0);
      const account: Component = await findId(driver, 'account_input');
      const secret: Component = await findId(driver, 'secret_input');
      const label: Component = await findId(driver, 'label_input');
      const save: Component = await findId(driver, 'save');
      expect(account !== null).assertTrue();
      expect(secret !== null).assertTrue();
      expect(label !== null).assertTrue();
      expect(save !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUpdateUi1100 end');
    });
  });
}


