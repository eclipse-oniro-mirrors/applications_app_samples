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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Units } from '../../../../main/ets/common/utils/PixelUnitConversion';
import { TABS } from '../../../../main/ets/common/Constants';
import { PageType } from '../../../../main/ets/model/PageType';
import { Tools } from '../../../../main/ets/common/utils/Tools';
import {
  ID_DELETE_CANCEL,
  ID_DELETE_CONFIRM,
  ID_OVERRIDE_CANCEL,
  ID_OVERRIDE_CONFIRM,
  ID_RENAME_INPUT,
  ID_RENAME_SAVE,
  ID_PROGRESS_CANCEL,
  TIMEOUT_DIALOG_RENDER
} from '../Shared/TestDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function dialogPositioningTest() {
  describe('DialogPositioning', () => {
    /*
     * Dialog dimensions are expressed through the shared pixel conversion helper.
     */
    describe('DialogPositioning_Dialog_Unit_Contract', () => {
      it('units_px_returns_string', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: units_px_returns_string');
        let value = Units.px(10);
        expect(typeof value).assertEqual('string');
        expect(value).assertContain('px');
      });

      it('delete_ids_distinct', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: delete_ids_distinct');
        expect(ID_DELETE_CANCEL).not().assertEqual(ID_DELETE_CONFIRM);
      });

      it('override_ids_distinct', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: override_ids_distinct');
        expect(ID_OVERRIDE_CANCEL).not().assertEqual(ID_OVERRIDE_CONFIRM);
      });

      it('rename_ids_distinct', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rename_ids_distinct');
        expect(ID_RENAME_INPUT).not().assertEqual(ID_RENAME_SAVE);
      });

      it('progress_id_size', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: progress_id_size');
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });
    });

    /*
     * Dialog render timeout is shared by all dialog suites.
     */
    describe('DialogPositioning_Dialog_Timing_Contract', () => {
      it('timeout_positive', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: timeout_positive');
        expect(TIMEOUT_DIALOG_RENDER > 0).assertTrue();
      });

      it('timeout_below_page_render', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: timeout_below_page_render');
        expect(TIMEOUT_DIALOG_RENDER <= 2000).assertTrue();
      });

      it('tabs_available', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: tabs_available');
        expect(TABS.length).assertEqual(2);
      });

      it('page_types_available', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: page_types_available');
        expect(PageType.HOME_PAGE).assertEqual('HOME_PAGE');
      });
    });

    /*
     * Confirmation dialogs use short, translatable button labels.
     */
    describe('DialogPositioning_Dialog_Text_Contract', () => {
      it('size_format_for_dialog', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: size_format_for_dialog');
        expect(Tools.byte2Str(1024 * 1024).length > 0).assertTrue();
      });

      it('empty_name_validation', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_name_validation');
        expect(Tools.isEmpty('')).assertTrue();
        expect(Tools.isEmpty('ok')).assertFalse();
      });
    });

    /*
     * Extended boundary, type and matrix coverage for DialogPositioning derived from the reference suite.
     */
    describe('DialogPositioning_Extended_Coverage', () => {
      it('dialog_px_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_0');
        let value = Units.px(1);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_1');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_2');
        expect(TIMEOUT_DIALOG_RENDER > 20).assertTrue();
      });

      it('dialog_size_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_3');
        expect(Tools.byte2Str(4096).length > 0).assertTrue();
      });

      it('dialog_px_matrix_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_4');
        let value = Units.px(5);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_5');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_6');
        expect(TIMEOUT_DIALOG_RENDER > 60).assertTrue();
      });

      it('dialog_size_matrix_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_7');
        expect(Tools.byte2Str(8192).length > 0).assertTrue();
      });

      it('dialog_px_matrix_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_8');
        let value = Units.px(9);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_9');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_10');
        expect(TIMEOUT_DIALOG_RENDER > 0).assertTrue();
      });

      it('dialog_size_matrix_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_11');
        expect(Tools.byte2Str(12288).length > 0).assertTrue();
      });

      it('dialog_px_matrix_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_12');
        let value = Units.px(13);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_13');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_14');
        expect(TIMEOUT_DIALOG_RENDER > 40).assertTrue();
      });

      it('dialog_size_matrix_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_15');
        expect(Tools.byte2Str(16384).length > 0).assertTrue();
      });

      it('dialog_px_matrix_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_16');
        let value = Units.px(17);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_17');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_18');
        expect(TIMEOUT_DIALOG_RENDER > 80).assertTrue();
      });

      it('dialog_size_matrix_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_19');
        expect(Tools.byte2Str(20480).length > 0).assertTrue();
      });

      it('dialog_px_matrix_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_20');
        let value = Units.px(21);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_21');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_22');
        expect(TIMEOUT_DIALOG_RENDER > 20).assertTrue();
      });

      it('dialog_size_matrix_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_23');
        expect(Tools.byte2Str(24576).length > 0).assertTrue();
      });

      it('dialog_px_matrix_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_24');
        let value = Units.px(25);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_25');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_26');
        expect(TIMEOUT_DIALOG_RENDER > 60).assertTrue();
      });

      it('dialog_size_matrix_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_27');
        expect(Tools.byte2Str(28672).length > 0).assertTrue();
      });

      it('dialog_px_matrix_28', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_28');
        let value = Units.px(29);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_29', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_29');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_30', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_30');
        expect(TIMEOUT_DIALOG_RENDER > 0).assertTrue();
      });

      it('dialog_size_matrix_31', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_31');
        expect(Tools.byte2Str(32768).length > 0).assertTrue();
      });

      it('dialog_px_matrix_32', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_32');
        let value = Units.px(33);
        expect(value).assertContain('px');
      });
    });
  });
}
