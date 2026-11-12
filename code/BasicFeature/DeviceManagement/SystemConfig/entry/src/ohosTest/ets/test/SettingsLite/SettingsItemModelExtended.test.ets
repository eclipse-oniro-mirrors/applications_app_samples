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
import { TestRes } from '../Utils/TestRes';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsItemModel extended test suite.
 * Adds coverage for toJSON round-trip serialization / toString / full getTypeName coverage /
 * complete state-machine transitions / repeated operation accumulation, and similar scenarios.
 */
export default function SettingsItemModelExtendedTest(): void {
  describe('SettingsItemModelExtendedTest', () => {

    // ========================================
    // toJSON round-trip serialization tests
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0100
     * @tc.name testSettingsItemModelExtended0001
     * @tc.desc Verify toJSON keeps all fields complete and consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModelExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0001: begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.NFC_SETTING, TestRes.str('card_nfc_title'), '打开 NFC 设置页面'
      );
      model.markSuccess('操作完成');
      const json: SettingsItemModelJson = model.toJSON();
      expect(json.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(json.title).assertEqual(TestRes.str('card_nfc_title'));
      expect(json.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(json.operationCount).assertEqual(1);
      expect(json.lastOperationTime).assertLarger(0);
      expect(json.errorMessage).assertEqual('');
      expect(json.errorCode).assertEqual(0);
    });

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0200
     * @tc.name testSettingsItemModelExtended0002
     * @tc.desc Verify toJSON includes the error information in the FAILED state
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
    // toString tests
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0300
     * @tc.name testSettingsItemModelExtended0003
     * @tc.desc Verify toString output contains the key information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModelExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0003: begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.PIN_SETTING, TestRes.str('card_pin_title'), '描述'
      );
      model.markSuccess();
      const str: string = model.toString();
      expect(str.indexOf('SettingsItemModel')).assertLarger(-1);
      expect(str.indexOf('pinSetting')).assertLarger(-1);
      expect(str.indexOf(TestRes.str('card_pin_title'))).assertLarger(-1);
      expect(str.indexOf('success')).assertLarger(-1);
    });

    // ========================================
    // getTypeName full coverage tests
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0400
     * @tc.name testSettingsItemModelExtended0004
     * @tc.desc Verify all three types return the correct localized name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModelExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0004: begin');
      const pinModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.PIN_SETTING);
      const nfcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.NFC_SETTING);
      const dcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(pinModel.getTypeName()).assertEqual(TestRes.str('card_pin_title'));
      expect(nfcModel.getTypeName()).assertEqual(TestRes.str('card_nfc_title'));
      expect(dcModel.getTypeName()).assertEqual(TestRes.str('card_double_click_title'));
    });

    // ========================================
    // Complete state machine transition tests
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0500
     * @tc.name testSettingsItemModelExtended0005
     * @tc.desc Verify the full IDLE → OPENING → SUCCESS → reset → IDLE transition
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
     * @tc.desc Verify the IDLE → QUERYING → SUCCESS double-click query transition
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
    // Repeated operation accumulation tests
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0700
     * @tc.name testSettingsItemModelExtended0007
     * @tc.desc Verify operationCount accumulates after repeated markSuccess calls
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
    // getStatusDescription per-status tests
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0800
     * @tc.name testSettingsItemModelExtended0008
     * @tc.desc Verify getStatusDescription returns the correct description for each status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModelExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModelExtended0008: begin');
      const model: SettingsItemModel = new SettingsItemModel();
      expect(model.getStatusDescription()).assertEqual(TestRes.str('status_idle'));
      model.markOpening();
      expect(model.getStatusDescription()).assertEqual(TestRes.str('settings_status_opening'));
      model.markQuerying();
      expect(model.getStatusDescription()).assertEqual(TestRes.str('status_querying'));
      model.markSuccess();
      expect(model.getStatusDescription()).assertEqual(TestRes.str('settings_status_success'));
      model.markFailed('err', 1);
      expect(model.getStatusDescription()).assertEqual(TestRes.str('settings_status_failed'));
    });

    // ========================================
    // reset clearing all state tests
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_EXTENDED_0900
     * @tc.name testSettingsItemModelExtended0009
     * @tc.desc Verify all fields return to their initial values after reset
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
