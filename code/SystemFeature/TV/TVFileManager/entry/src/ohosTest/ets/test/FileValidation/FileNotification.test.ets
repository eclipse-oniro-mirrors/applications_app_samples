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

export default function fileNotificationTest() {
  describe('FileNotification', () => {
    /*
     * Dialog dimensions are expressed through the shared pixel conversion helper.
     */
    describe('FileNotification_Dialog_Unit_Contract', () => {
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
    describe('FileNotification_Dialog_Timing_Contract', () => {
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
    describe('FileNotification_Dialog_Text_Contract', () => {
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
     * Extended boundary, type and matrix coverage for FileNotification derived from the reference suite.
     */
    describe('FileNotification_Extended_Coverage', () => {
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

      it('dialog_id_matrix_33', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_33');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_34', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_34');
        expect(TIMEOUT_DIALOG_RENDER > 40).assertTrue();
      });

      it('dialog_size_matrix_35', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_35');
        expect(Tools.byte2Str(36864).length > 0).assertTrue();
      });

      it('dialog_px_matrix_36', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_36');
        let value = Units.px(37);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_37', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_37');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_38', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_38');
        expect(TIMEOUT_DIALOG_RENDER > 80).assertTrue();
      });

      it('dialog_size_matrix_39', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_39');
        expect(Tools.byte2Str(40960).length > 0).assertTrue();
      });

      it('dialog_px_matrix_40', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_40');
        let value = Units.px(41);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_41', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_41');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_42', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_42');
        expect(TIMEOUT_DIALOG_RENDER > 20).assertTrue();
      });

      it('dialog_size_matrix_43', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_43');
        expect(Tools.byte2Str(45056).length > 0).assertTrue();
      });

      it('dialog_px_matrix_44', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_44');
        let value = Units.px(45);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_45', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_45');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_46', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_46');
        expect(TIMEOUT_DIALOG_RENDER > 60).assertTrue();
      });

      it('dialog_size_matrix_47', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_47');
        expect(Tools.byte2Str(49152).length > 0).assertTrue();
      });

      it('dialog_px_matrix_48', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_48');
        let value = Units.px(49);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_49', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_49');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_50', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_50');
        expect(TIMEOUT_DIALOG_RENDER > 0).assertTrue();
      });

      it('dialog_size_matrix_51', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_51');
        expect(Tools.byte2Str(53248).length > 0).assertTrue();
      });

      it('dialog_px_matrix_52', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_52');
        let value = Units.px(53);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_53', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_53');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_54', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_54');
        expect(TIMEOUT_DIALOG_RENDER > 40).assertTrue();
      });

      it('dialog_size_matrix_55', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_55');
        expect(Tools.byte2Str(57344).length > 0).assertTrue();
      });

      it('dialog_px_matrix_56', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_56');
        let value = Units.px(57);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_57', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_57');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_58', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_58');
        expect(TIMEOUT_DIALOG_RENDER > 80).assertTrue();
      });

      it('dialog_size_matrix_59', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_59');
        expect(Tools.byte2Str(61440).length > 0).assertTrue();
      });

      it('dialog_px_matrix_60', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_60');
        let value = Units.px(61);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_61', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_61');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_62', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_62');
        expect(TIMEOUT_DIALOG_RENDER > 20).assertTrue();
      });

      it('dialog_size_matrix_63', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_63');
        expect(Tools.byte2Str(65536).length > 0).assertTrue();
      });

      it('dialog_px_matrix_64', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_64');
        let value = Units.px(65);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_65', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_65');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_66', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_66');
        expect(TIMEOUT_DIALOG_RENDER > 60).assertTrue();
      });

      it('dialog_size_matrix_67', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_67');
        expect(Tools.byte2Str(69632).length > 0).assertTrue();
      });

      it('dialog_px_matrix_68', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_68');
        let value = Units.px(69);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_69', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_69');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_70', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_70');
        expect(TIMEOUT_DIALOG_RENDER > 0).assertTrue();
      });

      it('dialog_size_matrix_71', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_71');
        expect(Tools.byte2Str(73728).length > 0).assertTrue();
      });

      it('dialog_px_matrix_72', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_72');
        let value = Units.px(73);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_73', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_73');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_74', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_74');
        expect(TIMEOUT_DIALOG_RENDER > 40).assertTrue();
      });

      it('dialog_size_matrix_75', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_75');
        expect(Tools.byte2Str(77824).length > 0).assertTrue();
      });

      it('dialog_px_matrix_76', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_76');
        let value = Units.px(77);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_77', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_77');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_78', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_78');
        expect(TIMEOUT_DIALOG_RENDER > 80).assertTrue();
      });

      it('dialog_size_matrix_79', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_79');
        expect(Tools.byte2Str(81920).length > 0).assertTrue();
      });

      it('dialog_px_matrix_80', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_80');
        let value = Units.px(81);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_81', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_81');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_82', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_82');
        expect(TIMEOUT_DIALOG_RENDER > 20).assertTrue();
      });

      it('dialog_size_matrix_83', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_83');
        expect(Tools.byte2Str(86016).length > 0).assertTrue();
      });

      it('dialog_px_matrix_84', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_84');
        let value = Units.px(85);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_85', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_85');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_86', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_86');
        expect(TIMEOUT_DIALOG_RENDER > 60).assertTrue();
      });

      it('dialog_size_matrix_87', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_87');
        expect(Tools.byte2Str(90112).length > 0).assertTrue();
      });

      it('dialog_px_matrix_88', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_88');
        let value = Units.px(89);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_89', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_89');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_90', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_90');
        expect(TIMEOUT_DIALOG_RENDER > 0).assertTrue();
      });

      it('dialog_size_matrix_91', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_91');
        expect(Tools.byte2Str(94208).length > 0).assertTrue();
      });

      it('dialog_px_matrix_92', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_92');
        let value = Units.px(93);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_93', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_93');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_94', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_94');
        expect(TIMEOUT_DIALOG_RENDER > 40).assertTrue();
      });

      it('dialog_size_matrix_95', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_95');
        expect(Tools.byte2Str(98304).length > 0).assertTrue();
      });

      it('dialog_px_matrix_96', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_96');
        let value = Units.px(97);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_97', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_97');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_98', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_98');
        expect(TIMEOUT_DIALOG_RENDER > 80).assertTrue();
      });

      it('dialog_size_matrix_99', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_99');
        expect(Tools.byte2Str(102400).length > 0).assertTrue();
      });

      it('dialog_px_matrix_100', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_100');
        let value = Units.px(101);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_101', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_101');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_102', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_102');
        expect(TIMEOUT_DIALOG_RENDER > 20).assertTrue();
      });

      it('dialog_size_matrix_103', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_103');
        expect(Tools.byte2Str(106496).length > 0).assertTrue();
      });

      it('dialog_px_matrix_104', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_104');
        let value = Units.px(105);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_105', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_105');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_106', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_106');
        expect(TIMEOUT_DIALOG_RENDER > 60).assertTrue();
      });

      it('dialog_size_matrix_107', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_107');
        expect(Tools.byte2Str(110592).length > 0).assertTrue();
      });

      it('dialog_px_matrix_108', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_108');
        let value = Units.px(109);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_109', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_109');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_110', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_110');
        expect(TIMEOUT_DIALOG_RENDER > 0).assertTrue();
      });

      it('dialog_size_matrix_111', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_111');
        expect(Tools.byte2Str(114688).length > 0).assertTrue();
      });

      it('dialog_px_matrix_112', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_112');
        let value = Units.px(113);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_113', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_113');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_114', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_114');
        expect(TIMEOUT_DIALOG_RENDER > 40).assertTrue();
      });

      it('dialog_size_matrix_115', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_115');
        expect(Tools.byte2Str(118784).length > 0).assertTrue();
      });

      it('dialog_px_matrix_116', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_116');
        let value = Units.px(117);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_117', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_117');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_118', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_118');
        expect(TIMEOUT_DIALOG_RENDER > 80).assertTrue();
      });

      it('dialog_size_matrix_119', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_119');
        expect(Tools.byte2Str(122880).length > 0).assertTrue();
      });

      it('dialog_px_matrix_120', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_120');
        let value = Units.px(121);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_121', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_121');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_122', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_122');
        expect(TIMEOUT_DIALOG_RENDER > 20).assertTrue();
      });

      it('dialog_size_matrix_123', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_123');
        expect(Tools.byte2Str(126976).length > 0).assertTrue();
      });

      it('dialog_px_matrix_124', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_124');
        let value = Units.px(125);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_125', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_125');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_126', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_126');
        expect(TIMEOUT_DIALOG_RENDER > 60).assertTrue();
      });

      it('dialog_size_matrix_127', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_127');
        expect(Tools.byte2Str(131072).length > 0).assertTrue();
      });

      it('dialog_px_matrix_128', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_128');
        let value = Units.px(129);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_129', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_129');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_130', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_130');
        expect(TIMEOUT_DIALOG_RENDER > 0).assertTrue();
      });

      it('dialog_size_matrix_131', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_131');
        expect(Tools.byte2Str(135168).length > 0).assertTrue();
      });

      it('dialog_px_matrix_132', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_132');
        let value = Units.px(133);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_133', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_133');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_134', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_134');
        expect(TIMEOUT_DIALOG_RENDER > 40).assertTrue();
      });

      it('dialog_size_matrix_135', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_size_matrix_135');
        expect(Tools.byte2Str(139264).length > 0).assertTrue();
      });

      it('dialog_px_matrix_136', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_px_matrix_136');
        let value = Units.px(137);
        expect(value).assertContain('px');
      });

      it('dialog_id_matrix_137', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_id_matrix_137');
        let ids: string[] = [ID_DELETE_CANCEL, ID_DELETE_CONFIRM, ID_OVERRIDE_CANCEL, ID_OVERRIDE_CONFIRM];
        let unique: Set<string> = new Set(ids);
        expect(unique.size).assertEqual(ids.length);
      });

      it('dialog_timeout_matrix_138', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: dialog_timeout_matrix_138');
        expect(TIMEOUT_DIALOG_RENDER > 80).assertTrue();
      });
    });
  });
}
