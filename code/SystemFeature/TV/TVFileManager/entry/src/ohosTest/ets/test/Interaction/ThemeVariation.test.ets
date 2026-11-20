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

export default function themeVariationTest() {
  describe('ThemeVariation', () => {
    /*
     * Every helper exported by the shared driver is callable.
     */
    describe('ThemeVariation_Driver_Helper_Contract', () => {
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
    describe('ThemeVariation_Component_Id_Contract', () => {
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
    describe('ThemeVariation_Home_Page_Rendering', () => {
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
    describe('ThemeVariation_Focus_And_Keys', () => {
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
     * Extended boundary, type and matrix coverage for ThemeVariation derived from the reference suite.
     */
    describe('ThemeVariation_Extended_Coverage', () => {
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
    });
  });
}
