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

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsLiteService 接口测试套件。
 * 验证 SettingsLiteService 的初始化、模型获取、状态管理等不依赖 UI 上下文的能力。
 */
export default function SettingsLitePinSettingTest(): void {
  describe('SettingsLitePinSettingTest', () => {

    /**
     * @tc.number SUB_SETTINGS_LITE_PIN_SETTING_0100
     * @tc.name testSettingsLitePinSetting0001
     * @tc.desc 正向用例：初始化服务后状态为已初始化。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLitePinSetting0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLitePinSetting0001: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      const pinModel: SettingsItemModel = service.getPinModel();
      expect(pinModel.itemType).assertEqual(SettingsItemType.PIN_SETTING);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_PIN_SETTING_0200
     * @tc.name testSettingsLitePinSetting0002
     * @tc.desc 正向用例：获取 PIN 模型，验证类型和初始状态。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLitePinSetting0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLitePinSetting0002: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const model: SettingsItemModel = service.getPinModel();
      expect(model.itemType).assertEqual(SettingsItemType.PIN_SETTING);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.title.length).assertLarger(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_PIN_SETTING_0300
     * @tc.name testSettingsLitePinSetting0003
     * @tc.desc 反向用例：重置服务后状态为未初始化。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLitePinSetting0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'serviceResetTest: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.reset();
      expect(service.isServiceInitialized()).assertFalse();
      const pinModel: SettingsItemModel = service.getPinModel();
      expect(pinModel.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      service.destroy();
    });
  });
}
