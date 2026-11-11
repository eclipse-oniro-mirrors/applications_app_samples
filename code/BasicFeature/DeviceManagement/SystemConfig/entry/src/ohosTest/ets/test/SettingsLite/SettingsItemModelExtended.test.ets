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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SettingsItemModel,
  SettingsItemType,
  SettingsOperationStatus,
  ClickResult
} from 'library';
import type { SettingsItemModelJson } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsItemModel 扩展测试套件。
 * 补充覆盖 toJSON 往返序列化 / toString / getTypeName 全覆盖 /
 * 状态机完整流转 / 多次操作累计 等场景。
 */
export default function SettingsItemModelExtendedTest(): void {
  describe('SettingsItemModelExtendedTest', () => {

    // ========================================
    // toJSON 往返序列化测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0100
     * @tc.name testSettingsItemModelExtended0001
     * @tc.desc 正向: toJSON 序列化后字段完整且值一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModelExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0001: begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.NFC_SETTING, 'NFC 设置', '打开 NFC 设置页面'
      );
      model.markSuccess('操作完成');
      const json: SettingsItemModelJson = model.toJSON();
      expect(json.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(json.title).assertEqual('NFC 设置');
      expect(json.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(json.operationCount).assertEqual(1);
      expect(json.lastOperationTime).assertLarger(0);
      expect(json.errorMessage).assertEqual('');
      expect(json.errorCode).assertEqual(0);
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0200
     * @tc.name testSettingsItemModelExtended0002
     * @tc.desc 正向: 失败状态下 toJSON 包含错误信息
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModelExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0002: begin');
      const model: SettingsItemModel = new SettingsItemModel();
      model.markFailed('打开失败', 30001);
      const json: SettingsItemModelJson = model.toJSON();
      expect(json.operationStatus).assertEqual(SettingsOperationStatus.FAILED);
      expect(json.errorMessage).assertEqual('打开失败');
      expect(json.errorCode).assertEqual(30001);
      expect(json.operationCount).assertEqual(1);
    });

    // ========================================
    // toString 测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0300
     * @tc.name testSettingsItemModelExtended0003
     * @tc.desc 正向: toString 输出包含关键信息
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModelExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0003: begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.PIN_SETTING, 'PIN 码设置', '描述'
      );
      model.markSuccess();
      const str: string = model.toString();
      expect(str.indexOf('SettingsItemModel')).assertLarger(-1);
      expect(str.indexOf('pinSetting')).assertLarger(-1);
      expect(str.indexOf('PIN 码设置')).assertLarger(-1);
      expect(str.indexOf('success')).assertLarger(-1);
    });

    // ========================================
    // getTypeName 全覆盖测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0400
     * @tc.name testSettingsItemModelExtended0004
     * @tc.desc 正向: 三种类型均返回正确中文名称
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModelExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0004: begin');
      const pinModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.PIN_SETTING);
      const nfcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.NFC_SETTING);
      const dcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(pinModel.getTypeName()).assertEqual('PIN 码设置');
      expect(nfcModel.getTypeName()).assertEqual('NFC 设置');
      expect(dcModel.getTypeName()).assertEqual('双击设置');
    });

    // ========================================
    // 状态机完整流转测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0500
     * @tc.name testSettingsItemModelExtended0005
     * @tc.desc 正向: IDLE → OPENING → SUCCESS → reset → IDLE 完整流转
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModelExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0005: begin');
      const model: SettingsItemModel = new SettingsItemModel();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.isOpening()).assertFalse();
      model.markOpening();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.OPENING);
      expect(model.isOpening()).assertTrue();
      expect(model.isSuccess()).assertFalse();
      model.markSuccess('页面已打开');
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.isSuccess()).assertTrue();
      expect(model.description).assertEqual('页面已打开');
      model.reset();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.isSuccess()).assertFalse();
      expect(model.isOpening()).assertFalse();
      expect(model.operationCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0600
     * @tc.name testSettingsItemModelExtended0006
     * @tc.desc 正向: IDLE → QUERYING → SUCCESS 双击查询流转
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModelExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0006: begin');
      const model: SettingsItemModel = new SettingsItemModel(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(model.isQuerying()).assertFalse();
      model.markQuerying();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.QUERYING);
      expect(model.isQuerying()).assertTrue();
      model.updateClickResult(ClickResult.IS_SELF);
      expect(model.clickResult).assertEqual(ClickResult.IS_SELF);
      model.markSuccess('查询完成');
      expect(model.isSuccess()).assertTrue();
      expect(model.operationCount).assertEqual(1);
    });

    // ========================================
    // 多次操作累计测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0700
     * @tc.name testSettingsItemModelExtended0007
     * @tc.desc 正向: 多次 markSuccess 后 operationCount 累加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModelExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0007: begin');
      const model: SettingsItemModel = new SettingsItemModel();
      expect(model.operationCount).assertEqual(0);
      model.markSuccess('op1');
      expect(model.operationCount).assertEqual(1);
      model.markOpening();
      model.markFailed('err', 1);
      expect(model.operationCount).assertEqual(2);
      model.markSuccess('op3');
      expect(model.operationCount).assertEqual(3);
      expect(model.lastOperationTime).assertLarger(0);
      expect(model.isSuccess()).assertTrue();
    });

    // ========================================
    // getStatusDescription 各状态测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0800
     * @tc.name testSettingsItemModelExtended0008
     * @tc.desc 正向: 各状态下 getStatusDescription 返回正确描述
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModelExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0008: begin');
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

    // ========================================
    // reset 清除所有状态测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0900
     * @tc.name testSettingsItemModelExtended0009
     * @tc.desc 正向: reset 后所有字段恢复初始值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModelExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0009: begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.NFC_SETTING, 'NFC', 'desc'
      );
      model.markSuccess('info');
      model.updateClickResult(ClickResult.IS_SELF);
      model.reset();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.clickResult).assertEqual(ClickResult.NOT_SELF);
      expect(model.lastOperationTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(model.title).assertEqual('NFC');
    });
  });
}
