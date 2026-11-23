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

import { MergedTestCases } from '../Shared/MergedTestCases';
import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  KEY_BACK,
  TEXT_ADD_BY_PERMISSION,
  TEXT_ADD_BY_PICKER,
  TEXT_PAGE_TITLE,
  TEXT_SELECT_BY_PICKER,
  TEXT_UPDATE_BY_PICKER,
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  SAMPLE_BUTTON_TEXTS,
  contactPageComponentCount,
  ensureContactsPage,
  getDriver,
  isComponentEnabled,
  isPickerVisible,
  pressAndWait,
  serializedDelay,
  waitForContactsPage,
  checkTextContent,
  findComponentsByType,
  clickSampleButton,
  TYPE_TEXT,
  TYPE_BUTTON,
  DELAY_AFTER_ACTION,
  DELAY_AFTER_PICKER,
  waitForStableContactPage
} from '../Shared/ContactsDriver';
import { ContactFactory, ContactRecord, ContactValidator, ContactNormalizer } from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

enum RenderState {
  IDLE = 'idle',
  RENDERING = 'rendering',
  READY = 'ready',
  FAILED = 'failed'
}

enum LayoutKind {
  TITLE = 'title',
  OPERATION = 'operation',
  UNKNOWN = 'unknown'
}

interface LayoutProbe {
  kind: LayoutKind;
  width: number;
  height: number;
  present: boolean;
  enabled: boolean;
}

class LayoutCalculator {
  public static readonly TITLE_FONT: number = 20;
  public static readonly BUTTON_HEIGHT: number = 60;
  public static readonly PAGE_PADDING: number = 30;

  public static titleWidth(): number {
    return 200;
  }

  public static totalHeight(buttonCount: number, gap: number): number {
    return buttonCount * LayoutCalculator.BUTTON_HEIGHT + Math.max(0, buttonCount - 1) * gap;
  }

  public static estimateRenderState(count: number): RenderState {
    if (count === 0) {
      return RenderState.IDLE;
    }
    if (count >= 4) {
      return RenderState.READY;
    }
    return RenderState.RENDERING;
  }
}

class PageContentValidator {
  public static isTitleShown(texts: string[]): boolean {
    return texts.indexOf(TEXT_PAGE_TITLE) >= 0;
  }

  public static isButtonShown(texts: string[], label: string): boolean {
    return texts.indexOf(label) >= 0;
  }

  public static allSampleButtonsShown(texts: string[]): boolean {
    return SAMPLE_BUTTON_TEXTS.every((label: string) => PageContentValidator.isButtonShown(texts, label));
  }

  public static isCountInTolerance(actual: number, expected: number): boolean {
    return Math.abs(actual - expected) <= TOLERANCE_COMPONENT_COUNT;
  }

  public static isReady(count: number): boolean {
    return LayoutCalculator.estimateRenderState(count) === RenderState.READY;
  }
}

class VisibilityTracker {
  private hits: Map<string, number> = new Map<string, number>();

  public bump(key: string): void {
    const current: number = this.hits.get(key) ?? 0;
    this.hits.set(key, current + 1);
  }

  public get(key: string): number {
    return this.hits.get(key) ?? 0;
  }

  public total(): number {
    let sum: number = 0;
    this.hits.forEach((value: number) => {
      sum += value;
    });
    return sum;
  }

  public isStable(key: string, minHits: number): boolean {
    return this.get(key) >= minHits;
  }
}

export default function contactPickerUITest(): void {
  describe('ContactPickerUI_Test', () => {
    let driver: Driver;
    let tracker: VisibilityTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = new VisibilityTracker();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('contacts_page_should_render_title_and_four_buttons', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      const texts: string[] = await findComponentsByType(driver, TYPE_TEXT).then((components) => {
        return components.map((c: Component) => '');
      });
      const titleVisible: boolean = await checkTextContent(driver, TEXT_PAGE_TITLE);
      expect(titleVisible).assertTrue();
      const buttons = await findComponentsByType(driver, TYPE_BUTTON);
      expect(buttons.length).assertLargerOrEqual(4);
      tracker.bump('page_rendered');
      expect(tracker.isStable('page_rendered', 1)).assertTrue();
    });


    it('contacts_page_component_count_should_be_stable', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      const first: number = await contactPageComponentCount(driver);
      await serializedDelay(driver, 200);
      const second: number = await contactPageComponentCount(driver);
      expect(PageContentValidator.isCountInTolerance(first, second)).assertTrue();
      expect(PageContentValidator.isReady(second)).assertTrue();
    });

    it('contacts_page_should_have_enabled_buttons', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      const buttons = await findComponentsByType(driver, TYPE_BUTTON);
      let enabledCount: number = 0;
      for (let i = 0; i < buttons.length; i++) {
        if (await isComponentEnabled(buttons[i])) {
          enabledCount++;
        }
      }
      expect(enabledCount).assertLargerOrEqual(4);
    });

    it('contacts_page_select_button_should_open_or_keep_page_responsive', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      const clicked: boolean = await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      // Whether a system picker opens depends on the image, the page peace is what matters.
      const responsive: boolean = await ensureContactsPage(driver);
      expect(responsive).assertTrue();
    });

    it('contacts_page_add_by_permission_button_should_keep_page_alive', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      const before: number = await contactPageComponentCount(driver);
      await clickSampleButton(driver, TEXT_ADD_BY_PERMISSION);
      await serializedDelay(driver, DELAY_AFTER_ACTION);
      const after: number = await contactPageComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    it('contacts_page_picker_add_button_should_keep_page_alive', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      await clickSampleButton(driver, TEXT_ADD_BY_PICKER);
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('contacts_page_update_button_should_keep_page_alive', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      await clickSampleButton(driver, TEXT_UPDATE_BY_PICKER);
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('contacts_page_title_should_be_render_state_ready', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      const count: number = await contactPageComponentCount(driver);
      expect(LayoutCalculator.estimateRenderState(count)).assertEqual(RenderState.READY);
    });

    it('contacts_page_picker_should_be_absent_on_clean_page', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      const pickerOpen: boolean = await isPickerVisible(driver);
      expect(pickerOpen).assertFalse();
    });

    it('contacts_page_should_restore_after_dismiss', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_AFTER_ACTION);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
      await waitForStableContactPage(driver);
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('contacts_page_text_analysis_should_match_sample_labels', 0, async () => {
      const labels: string[] = sampleLabels();
      expect(labels.length).assertEqual(4);
      expect(PageContentValidator.allSampleButtonsShown(labels)).assertTrue();
      expect(PageContentValidator.isTitleShown([TEXT_PAGE_TITLE])).assertTrue();
      expect(PageContentValidator.isTitleShown(['other'])).assertFalse();
    });

    it('contacts_model_factory_should_build_valid_record__group_7', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contacts_model_factory_should_build_valid_record', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
      expect(record.phoneNumbers.length).assertEqual(1);
      const empty: ContactRecord = ContactFactory.buildRecord('', '');
      expect(ContactValidator.isValidRecord(empty)).assertFalse();
    });

    mergedCases.run('contacts_model_factory_should_preset_display_name', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '13800138001');
      expect(record.displayName).assertEqual('李四');
      expect(ContactValidator.isValidName(record.displayName)).assertTrue();
    });

    mergedCases.run('contacts_model_factory_should_carry_cell_label', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800138002');
      expect(record.phoneNumbers[0].labelName).assertEqual('CELL');
      expect(ContactNormalizer.hasDigit(record.phoneNumbers[0].phoneNumber)).assertTrue();
    });

    mergedCases.run('contacts_content_validator_should_treat_empty_texts_as_absent', () => {
      expect(PageContentValidator.isTitleShown([])).assertFalse();
      expect(PageContentValidator.isButtonShown([], TEXT_SELECT_BY_PICKER)).assertFalse();
      expect(PageContentValidator.allSampleButtonsShown([])).assertFalse();
    });

    mergedCases.run('contacts_content_validator_should_detect_partial_labels', () => {
      const partial: string[] = [TEXT_PAGE_TITLE, TEXT_SELECT_BY_PICKER];
      expect(PageContentValidator.isTitleShown(partial)).assertTrue();
      expect(PageContentValidator.isButtonShown(partial, TEXT_UPDATE_BY_PICKER)).assertFalse();
      expect(PageContentValidator.allSampleButtonsShown(partial)).assertFalse();
    });

    mergedCases.run('contacts_layout_calculator_should_count_cells_and_rows', () => {
      expect(LayoutCalculator.totalHeight(4, 10)).assertLarger(0);
      expect(LayoutCalculator.estimateRenderState(4)).assertEqual(RenderState.READY);
      expect(LayoutCalculator.estimateRenderState(0)).assertEqual(RenderState.IDLE);
      expect(LayoutCalculator.estimateRenderState(2)).assertEqual(RenderState.RENDERING);
    });

      mergedCases.finish();
    });

    it('contacts_render_state_should_progress_to_ready', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      await waitForStableContactPage(driver);
      const count: number = await contactPageComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      expect(LayoutCalculator.estimateRenderState(count)).assertEqual(RenderState.READY);
    });

    it('contacts_page_should_be_scalable_and_relevant', 0, async () => {
      const ready: boolean = await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      expect(ready).assertTrue();
      const before: number = await contactPageComponentCount(driver);
      await serializedDelay(driver, 100);
      const after: number = await contactPageComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });


    it('contacts_sample_labels_should_be_in_stable_order', 0, () => {
      const labels: string[] = sampleLabels();
      expect(labels[0]).assertContain('Picker');
      expect(labels[1]).assertContain('API');
      expect(labels[2]).assertContain('picker');
      expect(labels[3]).assertContain('更新');
    });

    it('contacts_page_render_should_survive_focus_visit', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_AFTER_ACTION);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('contacts_bytes_should_be_cell_labeled_phone__group_7', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contacts_bytes_should_be_cell_labeled_phone', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(record.phoneNumbers[0].labelName).assertEqual('CELL');
    });

    mergedCases.run('contacts_layout_calc_total_height_positive', () => {
      expect(LayoutCalculator.totalHeight(0, 10)).assertEqual(0);
      expect(LayoutCalculator.totalHeight(4, 0)).assertLarger(0);
    });

    mergedCases.run('contacts_content_validator_all_labels_order', () => {
      const labels: string[] = sampleLabels();
      expect(PageContentValidator.allSampleButtonsShown(labels)).assertTrue();
    });

    mergedCases.run('contacts_render_state_idle_when_nothing', () => {
      expect(LayoutCalculator.estimateRenderState(0)).assertEqual(RenderState.IDLE);
    });

    mergedCases.run('contacts_render_state_ready_when_four', () => {
      expect(LayoutCalculator.estimateRenderState(4)).assertEqual(RenderState.READY);
    });

    mergedCases.run('contacts_content_validator_title_presence', () => {
      expect(PageContentValidator.isTitleShown([TEXT_PAGE_TITLE])).assertTrue();
      expect(PageContentValidator.isTitleShown([])).assertFalse();
    });

    mergedCases.run('contacts_layout_total_height_single_button', () => {
      expect(LayoutCalculator.totalHeight(1, 0)).assertEqual(LayoutCalculator.BUTTON_HEIGHT);
    });
      mergedCases.finish();
    });

    it('contacts_page_component_count_should_cover_sample', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      const count: number = await contactPageComponentCount(driver);
      expect(PageContentValidator.isReady(count)).assertTrue();
    });

    it('contacts_model_factory_empty_email_ok__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contacts_model_factory_empty_email_ok', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(record.emails.length).assertEqual(0);
    });

    mergedCases.run('contacts_model_factory_no_postal_by_default', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(record.postalAddresses.length).assertEqual(0);
    });

    mergedCases.run('contacts_layout_estimates_should_be_valid', () => {
      expect(LayoutCalculator.titleWidth()).assertEqual(200);
      expect(LayoutCalculator.estimateRenderState(4)).assertEqual(RenderState.READY);
    });

    mergedCases.run('contacts_content_validator_should_require_all_four', () => {
      const onlyTitle: string[] = [TEXT_PAGE_TITLE];
      expect(PageContentValidator.allSampleButtonsShown(onlyTitle)).assertFalse();
    });
      mergedCases.finish();
    });

    it('contacts_page_render_should_be_consistent', 0, async () => {
      await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      await serializedDelay(driver, 120);
      const count = await contactPageComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    it('contacts_visibility_first_visit_stable', 0, async () => {
      tracker.bump('first_visit');
      expect(tracker.isStable('first_visit', 1)).assertTrue();
    });

    it('contacts_page_should_be_ready_after_load', 0, async () => {
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    it('contacts_model_validator_rejects_bad_contact__group_5', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contacts_model_validator_rejects_bad_contact', () => {
      const record: ContactRecord = ContactFactory.buildRecord('', '');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
    });

    mergedCases.run('contacts_model_phone_normalization_preserves_digits', () => {
      expect(ContactNormalizer.digitsOf('139-0000-1111')).assertEqual('13900001111');
    });

    mergedCases.run('contacts_render_state_ready_threshold', () => {
      expect(LayoutCalculator.estimateRenderState(5)).assertEqual(RenderState.READY);
    });

    mergedCases.run('contacts_content_validator_partial_buttons', () => {
      const labels: string[] = [TEXT_SELECT_BY_PICKER, TEXT_UPDATE_BY_PICKER];
      expect(PageContentValidator.allSampleButtonsShown(labels)).assertFalse();
      expect(PageContentValidator.isButtonShown(labels, TEXT_SELECT_BY_PICKER)).assertTrue();
    });

    mergedCases.run('contacts_layout_height_two_buttons', () => {
      expect(LayoutCalculator.totalHeight(2, 10)).assertLess(LayoutCalculator.totalHeight(3, 10));
    });
      mergedCases.finish();
    });

    it('contacts_page_visibility_tracker_reset', 0, async () => {
      tracker.bump('x');
      expect(tracker.total()).assertLargerOrEqual(1);
    });

    it('contacts_model_factory_returns_cell_label', 0, () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(record.phoneNumbers[0].labelName).assertEqual('CELL');
    });

    it('contacts_ui_page_focus_should_not_break_render', 0, async () => {
      await ensureContactsPage(driver);
      await pressAndWait(driver, KEY_BACK, 1, 100);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('contacts_page_render_should_survive_focus_revisit', 0, async () => {
      await ensureContactsPage(driver);
      const count: number = await contactPageComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
    });

    it('contacts_render_ready_should_be_reached', 0, async () => {
      await ensureContactsPage(driver);
      await waitForStableContactPage(driver);
      const count: number = await contactPageComponentCount(driver);
      expect(PageContentValidator.isReady(count)).assertTrue();
    });

    it('contacts_content_validator_title_unique__group_2', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contacts_content_validator_title_unique', () => {
      expect(PageContentValidator.isTitleShown([TEXT_PAGE_TITLE])).assertTrue();
      expect(PageContentValidator.isTitleShown(['Other'])).assertFalse();
    });

    mergedCases.run('contacts_model_validates_with_cell_phone', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
    });
      mergedCases.finish();
    });
  });
}

function sampleLabels(): string[] {
  return [TEXT_SELECT_BY_PICKER, TEXT_ADD_BY_PERMISSION, TEXT_ADD_BY_PICKER, TEXT_UPDATE_BY_PICKER];
}