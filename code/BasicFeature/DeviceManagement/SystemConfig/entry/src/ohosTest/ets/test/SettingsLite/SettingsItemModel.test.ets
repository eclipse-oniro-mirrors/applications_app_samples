/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SettingsItemModel,
  SettingsItemType,
  SettingsOperationStatus,
  ClickResult
} from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsItemModel 数据模型测试套件。
 * 验证设置项模型的构造、状态标记、查询判断、双击结果更新、
 * 状态描述、类型名称、序列化与重置等全部公开方法的行为正确性。
 */
export default function SettingsItemModelTest(): void {
  describe('SettingsItemModelTest', () => {

    // ========================================
    // 构造与默认值
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0100
     * @tc.name testSettingsItemModel0001
     * @tc.desc 正向用例：默认构造后各字段为初始值。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0001: start test');
      const model: SettingsItemModel = new SettingsItemModel();
      expect(model.itemType).assertEqual(SettingsItemType.PIN_SETTING);
      expect(model.title).assertEqual('');
      expect(model.description).assertEqual('');
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.clickResult).assertEqual(ClickResult.NOT_SELF);
      expect(model.lastOperationTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0200
     * @tc.name testSettingsItemModel0002
     * @tc.desc 正向用例：参数构造后各字段与传入值一致。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0002: start test');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.NFC_SETTING, 'NFC 设置', '打开 NFC 设置页面'
      );
      expect(model.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(model.title).assertEqual('NFC 设置');
      expect(model.description).assertEqual('打开 NFC 设置页面');
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
    });

    // ========================================
    // 状态标记方法
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0300
     * @tc.name testSettingsItemModel0003
     * @tc.desc 正向用例：调用 markOpening 后状态变为 OPENING，错误信息清空。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0003: start test');
      const model: SettingsItemModel = new SettingsItemModel();
      model.markFailed('prev error', 1);
      model.markOpening();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.OPENING);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0400
     * @tc.name testSettingsItemModel0004
     * @tc.desc 正向用例：调用 markQuerying 后状态变为 QUERYING。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0004: start test');
      const model: SettingsItemModel = new SettingsItemModel();
      model.markQuerying();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.QUERYING);
      expect(model.isQuerying()).assertTrue();
      expect(model.isOpening()).assertFalse();
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0500
     * @tc.name testSettingsItemModel0005
     * @tc.desc 正向用例：调用 markSuccess 后状态变为 SUCCESS，操作次数加一。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0005: start test');
      const model: SettingsItemModel = new SettingsItemModel();
      model.markSuccess('操作成功');
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.operationCount).assertEqual(1);
      expect(model.description).assertEqual('操作成功');
      expect(model.lastOperationTime).assertLarger(0);
      expect(model.isSuccess()).assertTrue();
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0600
     * @tc.name testSettingsItemModel0006
     * @tc.desc 正向用例：调用 markFailed 后状态变为 FAILED，错误信息正确记录。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0006: start test');
      const model: SettingsItemModel = new SettingsItemModel();
      model.markFailed('打开页面失败', 30001);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.FAILED);
      expect(model.errorMessage).assertEqual('打开页面失败');
      expect(model.errorCode).assertEqual(30001);
      expect(model.operationCount).assertEqual(1);
    });

    // ========================================
    // 更新与查询方法
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0700
     * @tc.name testSettingsItemModel0007
     * @tc.desc 正向用例：调用 updateClickResult 更新双击回调结果和时间戳。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0007: start test');
      const model: SettingsItemModel = new SettingsItemModel();
      expect(model.clickResult).assertEqual(ClickResult.NOT_SELF);
      model.updateClickResult(ClickResult.IS_SELF);
      expect(model.clickResult).assertEqual(ClickResult.IS_SELF);
      expect(model.lastOperationTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0800
     * @tc.name testSettingsItemModel0008
     * @tc.desc 正向用例：各状态下 getStatusDescription 返回正确的中文描述。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModel0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0008: start test');
      const model: SettingsItemModel = new SettingsItemModel();
      expect(model.getStatusDescription()).assertEqual('空闲');
      model.markOpening();
      expect(model.getStatusDescription()).assertEqual('打开页面中');
      model.markQuerying();
      expect(model.getStatusDescription()).assertEqual('查询中');
      model.markSuccess();
      expect(model.getStatusDescription()).assertEqual('操作成功');
      model.markFailed('err', 1);
      expect(model.getStatusDescription()).assertEqual('操作失败');
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0900
     * @tc.name testSettingsItemModel0009
     * @tc.desc 正向用例：各类型下 getTypeName 返回正确的中文名称。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModel0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0009: start test');
      const pinModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.PIN_SETTING);
      expect(pinModel.getTypeName()).assertEqual('PIN 码设置');
      const nfcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.NFC_SETTING);
      expect(nfcModel.getTypeName()).assertEqual('NFC 设置');
      const dcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(dcModel.getTypeName()).assertEqual('双击设置');
    });

    // ========================================
    // 重置方法
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_1000
     * @tc.name testSettingsItemModel0010
     * @tc.desc 正向用例：reset 后操作相关字段恢复为初始值，类型和标题保持不变。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0010: start test');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.DOUBLE_CLICK_SETTING, '双击设置', '描述'
      );
      model.markSuccess();
      model.updateClickResult(ClickResult.IS_SELF);
      model.reset();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.clickResult).assertEqual(ClickResult.NOT_SELF);
      expect(model.lastOperationTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.itemType).assertEqual(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(model.title).assertEqual('双击设置');
    });
  });
}
