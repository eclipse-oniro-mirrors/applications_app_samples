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
  SettingsLiteService,
  SettingsItemModel,
  SettingsItemType,
  SettingsOperationStatus,
  ClickResult
} from 'library';
import { TestRes } from '../Utils/TestRes';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsLiteService settings info service test suite.
 * Covers the initialize/reset/destroy lifecycle, isServiceInitialized,
 * getPinModel/getNfcModel/getDoubleClickModel/getAllModels
 * and SettingsItemModel state transitions.
 */
export default function SettingsLiteServiceTest(): void {
  describe('SettingsLiteServiceTest', () => {

    // ========================================
    // Lifecycle
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0100
     * @tc.name testSettingsLiteService0001
     * @tc.desc Verify isServiceInitialized returns true after initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0001 begin');
      const service: SettingsLiteService = new SettingsLiteService();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      const pinModel: SettingsItemModel = service.getPinModel();
      expect(pinModel.operationCount).assertEqual(0);
      expect(pinModel.lastOperationTime).assertEqual(0);
      expect(pinModel.errorCode).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0200
     * @tc.name testSettingsLiteService0002
     * @tc.desc Verify isServiceInitialized returns to false after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0002 begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.reset();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0300
     * @tc.name testSettingsLiteService0003
     * @tc.desc Verify the state is fully reset after destroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0003 begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    // ========================================
    // Model access
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0400
     * @tc.name testSettingsLiteService0004
     * @tc.desc Verify getPinModel returns a PIN type model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0004 begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const pinModel: SettingsItemModel = service.getPinModel();
      expect(pinModel.itemType).assertEqual(SettingsItemType.PIN_SETTING);
      expect(pinModel.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(pinModel.title).assertEqual(TestRes.str('card_pin_title'));
      expect(pinModel.getStatusDescription()).assertEqual(TestRes.str('status_idle'));
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0500
     * @tc.name testSettingsLiteService0005
     * @tc.desc Verify getNfcModel returns an NFC type model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0005 begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const nfcModel: SettingsItemModel = service.getNfcModel();
      expect(nfcModel.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(nfcModel.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(nfcModel.title).assertEqual(TestRes.str('card_nfc_title'));
      expect(nfcModel.description).assertEqual(TestRes.str('settings_desc_open_nfc'));
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0600
     * @tc.name testSettingsLiteService0006
     * @tc.desc Verify getDoubleClickModel returns a double-click type model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0006 begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const dcModel: SettingsItemModel = service.getDoubleClickModel();
      expect(dcModel.itemType).assertEqual(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(dcModel.clickResult).assertEqual(ClickResult.NOT_SELF);
      expect(dcModel.title).assertEqual(TestRes.str('card_double_click_title'));
      expect(dcModel.lastOperationTime).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0700
     * @tc.name testSettingsLiteService0007
     * @tc.desc Verify getAllModels returns 3 models
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0007 begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const models: SettingsItemModel[] = service.getAllModels();
      expect(models.length).assertEqual(3);
      expect(models[0].itemType).assertEqual(SettingsItemType.PIN_SETTING);
      expect(models[1].itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(models[2].itemType).assertEqual(SettingsItemType.DOUBLE_CLICK_SETTING);
      service.destroy();
    });

    // ========================================
    // SettingsItemModel state transitions
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0800
     * @tc.name testSettingsLiteService0008
     * @tc.desc Verify markOpening sets the status to OPENING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0008 begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.PIN_SETTING, 'PIN', 'desc'
      );
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.isOpening()).assertFalse();
      model.markOpening();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.OPENING);
      expect(model.isOpening()).assertTrue();
      expect(model.errorMessage).assertEqual('');
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_0900
     * @tc.name testSettingsLiteService0009
     * @tc.desc Verify markSuccess updates status and statistics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0009 begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.NFC_SETTING, 'NFC', 'desc'
      );
      model.markOpening();
      model.markSuccess('操作完成');
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.isSuccess()).assertTrue();
      expect(model.operationCount).assertEqual(1);
      expect(model.lastOperationTime).assertLarger(0);
      expect(model.description).assertEqual('操作完成');
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_1000
     * @tc.name testSettingsLiteService0010
     * @tc.desc Verify markFailed records the error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0010 begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.DOUBLE_CLICK_SETTING, '双击', 'desc'
      );
      model.markOpening();
      model.markFailed('权限不足', 403);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.FAILED);
      expect(model.isSuccess()).assertFalse();
      expect(model.errorMessage).assertEqual('权限不足');
      expect(model.errorCode).assertEqual(403);
      expect(model.operationCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_1100
     * @tc.name testSettingsLiteService0011
     * @tc.desc Verify the model returns to initial state after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0011 begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.PIN_SETTING, 'PIN', 'desc'
      );
      model.markSuccess('done');
      expect(model.operationCount).assertEqual(1);
      model.reset();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.clickResult).assertEqual(ClickResult.NOT_SELF);
      expect(model.operationCount).assertEqual(0);
      expect(model.lastOperationTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
    });

    // ========================================
    // SettingsItemModel serialization
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_1200
     * @tc.name testSettingsLiteService0012
     * @tc.desc Verify toJSON returns all fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0012 begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.PIN_SETTING, 'PIN', 'desc'
      );
      model.markSuccess('done');
      const json = model.toJSON();
      expect(json.itemType).assertEqual(SettingsItemType.PIN_SETTING);
      expect(json.title).assertEqual('PIN');
      expect(json.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(json.operationCount).assertEqual(1);
      expect(json.lastOperationTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_1300
     * @tc.name testSettingsLiteService0013
     * @tc.desc Verify toString returns a string containing the key fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteService0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0013 begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.NFC_SETTING, 'NFC', 'desc'
      );
      const str: string = model.toString();
      expect(str.indexOf('SettingsItemModel')).assertEqual(0);
      expect(str.indexOf('nfcSetting')).assertLarger(-1);
      expect(str.indexOf('NFC')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_1400
     * @tc.name testSettingsLiteService0014
     * @tc.desc Verify updateClickResult updates the double-click result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteService0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteService0014 begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.DOUBLE_CLICK_SETTING, '双击', 'desc'
      );
      expect(model.clickResult).assertEqual(ClickResult.NOT_SELF);
      model.updateClickResult(ClickResult.IS_SELF);
      expect(model.clickResult).assertEqual(ClickResult.IS_SELF);
      expect(model.lastOperationTime).assertLarger(0);
      model.updateClickResult(ClickResult.ERROR);
      expect(model.clickResult).assertEqual(ClickResult.ERROR);
    });
  });
}
