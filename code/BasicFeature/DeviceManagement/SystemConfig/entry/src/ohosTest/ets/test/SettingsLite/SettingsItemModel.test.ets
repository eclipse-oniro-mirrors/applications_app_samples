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
import { TestRes } from '../Utils/TestRes';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsItemModel data model test suite.
 * Verifies the behavior of all public methods: model construction, status marking, query checks, double-click result updates,
 * status descriptions, type names, serialization, and reset.
 */
export default function SettingsItemModelTest(): void {
  describe('SettingsItemModelTest', () => {

    // ========================================
    // Construction and default values
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0100
     * @tc.name testSettingsItemModel0001
     * @tc.desc Verify each field holds its initial value after the default constructor
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
     * @tc.desc Verify each field matches the arguments passed to the parameterized constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0002: start test');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.NFC_SETTING, TestRes.str('card_nfc_title'), TestRes.str('settings_desc_open_nfc')
      );
      expect(model.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(model.title).assertEqual(TestRes.str('card_nfc_title'));
      expect(model.description).assertEqual(TestRes.str('settings_desc_open_nfc'));
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
    });

    // ========================================
    // Status marking methods
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0300
     * @tc.name testSettingsItemModel0003
     * @tc.desc Verify the status becomes OPENING and the error message is cleared after markOpening
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
     * @tc.desc Verify the status becomes QUERYING after markQuerying
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
     * @tc.desc Verify the status becomes SUCCESS and the operation count increments after markSuccess
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
     * @tc.desc Verify the status becomes FAILED and the error message is recorded after markFailed
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
    // Update and query methods
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0700
     * @tc.name testSettingsItemModel0007
     * @tc.desc Verify updateClickResult updates the double-click result and the timestamp
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
     * @tc.desc Verify getStatusDescription returns the correct localized description for each status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModel0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0008: start test');
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

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_0900
     * @tc.name testSettingsItemModel0009
     * @tc.desc Verify getTypeName returns the correct localized name for each type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsItemModel0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0009: start test');
      const pinModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.PIN_SETTING);
      expect(pinModel.getTypeName()).assertEqual(TestRes.str('card_pin_title'));
      const nfcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.NFC_SETTING);
      expect(nfcModel.getTypeName()).assertEqual(TestRes.str('card_nfc_title'));
      const dcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(dcModel.getTypeName()).assertEqual(TestRes.str('card_double_click_title'));
    });

    // ========================================
    // Reset method
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_ITEM_MODEL_1000
     * @tc.name testSettingsItemModel0010
     * @tc.desc Verify reset restores the operation fields to initial values while keeping type and title unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsItemModel0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsItemModel0010: start test');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.DOUBLE_CLICK_SETTING, TestRes.str('card_double_click_title'), '描述'
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
      expect(model.title).assertEqual(TestRes.str('card_double_click_title'));
    });
  });
}
