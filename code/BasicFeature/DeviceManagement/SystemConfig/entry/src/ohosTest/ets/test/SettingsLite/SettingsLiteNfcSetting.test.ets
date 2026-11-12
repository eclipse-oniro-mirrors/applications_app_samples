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
import { SettingsLiteService, SettingsItemModel, SettingsItemType, SettingsOperationStatus } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsLiteService NFC setting test suite.
 */
export default function SettingsLiteNfcSettingTest(): void {
  describe('SettingsLiteNfcSettingTest', () => {

    /**
     * @tc.number SUB_SETTINGS_LITE_NFC_SETTING_0100
     * @tc.name testSettingsLiteNfcSetting0001
     * @tc.desc Verify getNfcModel returns a model of type NFC_SETTING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteNfcSetting0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteNfcSetting0001: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const model: SettingsItemModel = service.getNfcModel();
      expect(model.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.title.length).assertLarger(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_NFC_SETTING_0200
     * @tc.name testSettingsLiteNfcSetting0002
     * @tc.desc Verify the NFC model's getTypeName returns a non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteNfcSetting0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteNfcSetting0002: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const model: SettingsItemModel = service.getNfcModel();
      const typeName: string = model.getTypeName();
      expect(typeName.length).assertLarger(0);
      expect(typeName).assertEqual('NFC 设置');
      expect(model.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_NFC_SETTING_0300
     * @tc.name testSettingsLiteNfcSetting0003
     * @tc.desc Verify getAllModels returns 3 models
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteNfcSetting0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteNfcSetting0003: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const models: SettingsItemModel[] = service.getAllModels();
      expect(models.length).assertEqual(3);
      expect(models[0].itemType).assertEqual(SettingsItemType.PIN_SETTING);
      expect(models[1].itemType).assertEqual(SettingsItemType.NFC_SETTING);
      service.destroy();
    });
  });
}
