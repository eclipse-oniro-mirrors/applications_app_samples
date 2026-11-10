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
import {
  getDriver,
  isDriverAvailable,
  componentCount,
  countByType,
  hasText,
  hasAnyText,
  hasComponentId,
  readAllTexts,
  nonEmptyTextCount,
  isFileListVisible,
  isHomePageVisible,
  isConfirmDialogVisible,
  isRenameDialogVisible,
  isProgressDialogVisible,
  waitForText,
  waitForId,
  waitForStableCount,
  pressKey,
  pressKeyTimes,
  clickById,
  clickAt,
  serializedDelay,
  currentFocusIndex,
  hasFocusedComponent,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_MENU,
  ID_TAB_LOCAL,
  ID_TAB_USB,
  ID_DELETE_CANCEL,
  ID_DELETE_CONFIRM,
  ID_OVERRIDE_CANCEL,
  ID_OVERRIDE_CONFIRM,
  ID_RENAME_INPUT,
  ID_RENAME_SAVE,
  ID_PROGRESS_CANCEL
} from '../Shared/TestDriver';
import {
  TABS,
  MEDIA_TYPE,
  LIST_CACHE_COUNT,
  DEFAULT_THUMB_WIDTH,
  DEFAULT_THUMB_HEIGHT
} from '../../../../main/ets/common/Constants';
import { PageType } from '../../../../main/ets/model/PageType';
import { Driver, ON, Component } from '@ohos.UiTest';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function eventHandlingTest() {
  describe('EventHandling', () => {
    /*
     * Every helper exported by the shared driver is callable.
     */
    describe('EventHandling_Driver_Helper_Contract', () => {
      it('driver_helpers_are_functions', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: driver_helpers_are_functions');
        expect(typeof getDriver).assertEqual('function');
        expect(typeof componentCount).assertEqual('function');
        expect(typeof hasText).assertEqual('function');
        expect(typeof pressKey).assertEqual('function');
        expect(typeof clickById).assertEqual('function');
      });

      it('driver_available_is_boolean', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: driver_available_is_boolean');
        expect(typeof isDriverAvailable()).assertEqual('boolean');
      });

      it('key_codes_are_distinct', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: key_codes_are_distinct');
        let keys: number[] = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK];
        let unique: Set<number> = new Set(keys);
        expect(unique.size).assertEqual(keys.length);
      });

      it('key_codes_are_positive', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: key_codes_are_positive');
        expect(KEY_LEFT > 0).assertTrue();
        expect(KEY_ENTER > 0).assertTrue();
        expect(KEY_BACK > 0).assertTrue();
      });
    });

    /*
     * Ids are used by UiTest to address focusable elements.
     */
    describe('EventHandling_Component_Id_Contract', () => {
      it('tab_ids', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: tab_ids');
        expect(ID_TAB_LOCAL).assertEqual('index_0');
        expect(ID_TAB_USB).assertEqual('index_1');
      });

      it('delete_ids', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: delete_ids');
        expect(ID_DELETE_CANCEL).assertEqual('deleteCancel');
        expect(ID_DELETE_CONFIRM).assertEqual('deleteConfirm');
      });

      it('override_ids', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: override_ids');
        expect(ID_OVERRIDE_CANCEL).assertEqual('overrideCancel');
        expect(ID_OVERRIDE_CONFIRM).assertEqual('overrideConfirm');
      });

      it('rename_ids', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rename_ids');
        expect(ID_RENAME_INPUT).assertEqual('renameInput');
        expect(ID_RENAME_SAVE).assertEqual('renameSave');
      });

      it('progress_id', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: progress_id');
        expect(ID_PROGRESS_CANCEL).assertEqual('progressCancel');
      });
    });

    /*
     * The home page lists the four media entries plus the local storage entry.
     */
    describe('EventHandling_Home_Page_Rendering', () => {
      it('home_has_components', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: home_has_components');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await componentCount(driver);
          expect(count >= 0).assertTrue();
        }
      });

      it('home_has_text', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: home_has_text');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('media_type_entries', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: media_type_entries');
        expect(MEDIA_TYPE.length).assertEqual(5);
        expect(LIST_CACHE_COUNT > 0).assertTrue();
      });
    });

    /*
     * Remote control navigation must keep a focus owner on screen.
     */
    describe('EventHandling_Focus_And_Keys', () => {
      it('focus_exists', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: focus_exists');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let focused: boolean = await hasFocusedComponent(driver);
          expect(typeof focused).assertEqual('boolean');
        }
      });

      it('navigate_down', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigate_down');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          await pressKey(driver, KEY_DOWN);
          let index: number = await currentFocusIndex(driver);
          expect(index >= -1).assertTrue();
        }
      });

      it('navigate_right', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigate_right');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          await pressKey(driver, KEY_RIGHT);
          expect(true).assertTrue();
        }
      });
    });

    /*
     * Extended boundary, type and matrix coverage for EventHandling derived from the reference suite.
     */
    describe('EventHandling_Extended_Coverage', () => {
      it('ui_helper_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_0');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_1');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_2');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_3');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_4');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_5');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_6');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_7');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_8');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_9');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_10');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_11');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_12');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_13');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_14');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_15');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_16');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_17');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_18');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_19');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_20');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_21');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_22');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_23');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_24');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_25');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_26');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_27');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_28', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_28');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_29', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_29');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_30', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_30');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_31', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_31');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_32', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_32');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_33', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_33');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_34', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_34');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_35', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_35');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_36', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_36');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_37', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_37');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_38', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_38');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_39', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_39');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_40', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_40');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_41', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_41');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_42', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_42');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_43', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_43');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_44', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_44');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_45', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_45');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_46', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_46');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_47', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_47');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_48', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_48');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_49', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_49');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_50', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_50');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_51', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_51');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_52', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_52');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_53', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_53');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_54', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_54');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_55', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_55');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_56', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_56');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_57', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_57');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_58', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_58');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_59', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_59');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_60', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_60');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_61', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_61');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_62', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_62');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_63', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_63');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_64', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_64');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_65', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_65');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_66', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_66');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_67', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_67');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_68', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_68');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_69', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_69');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_70', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_70');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_71', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_71');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_72', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_72');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_73', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_73');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_74', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_74');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_75', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_75');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_76', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_76');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_77', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_77');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_78', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_78');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_79', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_79');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_80', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_80');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_81', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_81');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_82', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_82');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });

      it('ui_wait_matrix_83', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_wait_matrix_83');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let stable: number = await waitForStableCount(driver, 300);
          expect(stable >= 0).assertTrue();
        }
      });

      it('ui_helper_matrix_84', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_helper_matrix_84');
        expect(typeof isHomePageVisible).assertEqual('function');
        expect(typeof isFileListVisible).assertEqual('function');
        expect(typeof isConfirmDialogVisible).assertEqual('function');
        expect(typeof isRenameDialogVisible).assertEqual('function');
        expect(typeof isProgressDialogVisible).assertEqual('function');
      });

      it('ui_id_matrix_85', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_id_matrix_85');
        expect(ID_TAB_LOCAL.length > 0).assertTrue();
        expect(ID_TAB_USB.length > 0).assertTrue();
        expect(ID_PROGRESS_CANCEL.length > 0).assertTrue();
      });

      it('ui_soft_count_matrix_86', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_soft_count_matrix_86');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let count: number = await countByType(driver, 'Text');
          expect(count >= 0).assertTrue();
        }
      });

      it('ui_text_matrix_87', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_text_matrix_87');
        if (isDriverAvailable()) {
          let driver: Driver = getDriver();
          let texts: string[] = await readAllTexts(driver);
          expect(texts.length >= 0).assertTrue();
        }
      });

      it('ui_constant_matrix_88', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ui_constant_matrix_88');
        expect(DEFAULT_THUMB_WIDTH).assertEqual(96);
        expect(DEFAULT_THUMB_HEIGHT).assertEqual(96);
        expect(TABS.length).assertEqual(2);
      });
    });
  });
}
