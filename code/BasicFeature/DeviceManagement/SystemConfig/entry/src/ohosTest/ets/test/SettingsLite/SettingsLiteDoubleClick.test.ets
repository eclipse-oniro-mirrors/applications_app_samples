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
 * SettingsLiteService double-click setting test suite.
 */
export default function SettingsLiteDoubleClickTest(): void {
  describe('SettingsLiteDoubleClickTest', () => {

    /**
     * @tc.number SUB_SETTINGS_LITE_DOUBLE_CLICK_0100
     * @tc.name testSettingsLiteDoubleClick0001
     * @tc.desc Verify getDoubleClickModel returns a model of type DOUBLE_CLICK_SETTING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteDoubleClick0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteDoubleClick0001: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const model: SettingsItemModel = service.getDoubleClickModel();
      expect(model.itemType).assertEqual(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.clickResult).assertEqual(ClickResult.NOT_SELF);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_DOUBLE_CLICK_0200
     * @tc.name testSettingsLiteDoubleClick0002
     * @tc.desc Verify the status becomes OPENING after markOpening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteDoubleClick0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteDoubleClick0002: begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.DOUBLE_CLICK_SETTING, TestRes.str('card_double_click_title'), '测试'
      );
      model.markOpening();
      expect(model.isOpening()).assertTrue();
      expect(model.isSuccess()).assertFalse();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.OPENING);
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_DOUBLE_CLICK_0300
     * @tc.name testSettingsLiteDoubleClick0003
     * @tc.desc Verify updateClickResult updates the double-click result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteDoubleClick0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteDoubleClick0003: begin');
      const model: SettingsItemModel = new SettingsItemModel();
      model.updateClickResult(ClickResult.IS_SELF);
      expect(model.clickResult).assertEqual(ClickResult.IS_SELF);
      expect(model.lastOperationTime).assertLarger(0);
      model.updateClickResult(ClickResult.ERROR);
      expect(model.clickResult).assertEqual(ClickResult.ERROR);
    });
  });
}
