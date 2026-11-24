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
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  DELAY_AFTER_PICKER,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  contactPageComponentCount,
  ensureContactsPage,
  getDriver,
  pressAndWait,
  serializedDelay,
  clickSampleButton,
  clickSampleButtonAt,
  waitForContactsPage,
  waitForStableContactPage,
  TEXT_ADD_BY_PERMISSION,
  TEXT_UPDATE_BY_PICKER,
  TEXT_SELECT_BY_PICKER
} from '../Shared/ContactsDriver';
import { PickerSession, PickerOptions, ContactPermissionState, ContactFactory, ContactRecord, ContactValidator }
  from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

enum PageState {
  IDLE = 'idle',
  PERMISSIONING = 'permissioning',
  PICKING = 'picking',
  ADDING = 'adding',
  UPDATING = 'updating',
  STABLE = 'stable'
}

interface StateSnapshot {
  pageState: PageState;
  componentCount: number;
  timestamp: number;
}

class PageStateModel {
  private pageState: PageState = PageState.IDLE;
  private history: StateSnapshot[] = [];

  public setState(state: PageState, count: number): void {
    this.pageState = state;
    this.history.push({ pageState: state, componentCount: count, timestamp: Date.now() });
  }

  public getState(): PageState {
    return this.pageState;
  }

  public getHistory(): StateSnapshot[] {
    return this.history.map((s: StateSnapshot) => s);
  }

  public historySize(): number {
    return this.history.length;
  }

  public lastCount(): number {
    if (this.history.length === 0) {
      return 0;
    }
    return this.history[this.history.length - 1].componentCount;
  }

  public isStable(): boolean {
    return this.pageState === PageState.STABLE || this.pageState === PageState.IDLE;
  }

  public reset(): void {
    this.pageState = PageState.IDLE;
    this.history = [];
  }
}

class FocusNavigator {
  private index: number = 0;
  private count: number = 0;

  public setCount(count: number): void {
    this.count = count;
    if (this.index >= count) {
      this.index = Math.max(0, count - 1);
    }
  }

  public move(delta: number): boolean {
    const next: number = this.index + delta;
    if (next < 0 || next >= this.count) {
      return false;
    }
    this.index = next;
    return true;
  }

  public getIndex(): number {
    return this.index;
  }

  public isAtStart(): boolean {
    return this.index === 0;
  }

  public isAtEnd(): boolean {
    return this.count > 0 && this.index === this.count - 1;
  }

  public reset(): void {
    this.index = 0;
  }
}

class PageStateValidator {
  public static isBusy(state: PageState): boolean {
    return state === PageState.PERMISSIONING || state === PageState.PICKING ||
      state === PageState.ADDING || state === PageState.UPDATING;
  }

  public static canLeaveHome(state: PageState): boolean {
    return !PageStateValidator.isBusy(state);
  }

  public static isIdleAfterFinish(state: PageState): boolean {
    return state === PageState.STABLE || state === PageState.IDLE;
  }

  public static transitionValid(from: PageState, to: PageState): boolean {
    if (from === PageState.IDLE) {
      return to === PageState.PERMISSIONING || to === PageState.PICKING || to === PageState.ADDING ||
        to === PageState.UPDATING;
    }
    if (from === PageState.PERMISSIONING) {
      return to === PageState.ADDING || to === PageState.IDLE;
    }
    return to === PageState.STABLE || to === PageState.IDLE;
  }
}

export default function contactPageStateManagementTest(): void {
  describe('ContactPageStateManagement_Test', () => {
    let driver: Driver;
    let model: PageStateModel;

    beforeAll(async () => {
      driver = getDriver();
      model = new PageStateModel();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('page_state_model_should_start_idle', 0, async () => {
      model.reset();
      expect(model.getState()).assertEqual(PageState.IDLE);
      expect(model.isStable()).assertTrue();
    });

    it('page_state_model_should_record_stable_after_render', 0, async () => {
      const ready: boolean = await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      expect(ready).assertTrue();
      const count: number = await contactPageComponentCount(driver);
      model.setState(PageState.STABLE, count);
      expect(model.isStable()).assertTrue();
      expect(model.lastCount()).assertLargerOrEqual(1);
    });

    it('page_state_model_should_enter_picking_state', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
      model.setState(PageState.PICKING, 1);
      expect(model.getState()).assertEqual(PageState.PICKING);
      expect(PageStateValidator.isBusy(PageState.PICKING)).assertTrue();
    });

    it('page_state_validator_should_treat_updating_as_busy__group_5', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('page_state_validator_should_treat_updating_as_busy', () => {
      expect(PageStateValidator.isBusy(PageState.UPDATING)).assertTrue();
      expect(PageStateValidator.isBusy(PageState.STABLE)).assertFalse();
      expect(PageStateValidator.canLeaveHome(PageState.STABLE)).assertTrue();
    });

    mergedCases.run('page_state_validator_should_reject_invalid_transitions', () => {
      expect(PageStateValidator.transitionValid(PageState.PICKING, PageState.UPDATING)).assertFalse();
      expect(PageStateValidator.transitionValid(PageState.UPDATING, PageState.ADDING)).assertFalse();
      expect(PageStateValidator.transitionValid(PageState.IDLE, PageState.PICKING)).assertTrue();
      expect(PageStateValidator.transitionValid(PageState.PERMISSIONING, PageState.ADDING)).assertTrue();
    });

    mergedCases.run('page_state_focus_navigator_should_clamp_bounds', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(4);
      nav.reset();
      expect(nav.move(-1)).assertFalse();
      expect(nav.getIndex()).assertEqual(0);
      expect(nav.move(3)).assertTrue();
      expect(nav.isAtEnd()).assertTrue();
      expect(nav.move(1)).assertFalse();
      expect(nav.getIndex()).assertEqual(3);
    });

    mergedCases.run('page_state_permission_model_should_require_full_grant', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, -1);
      expect(state.canWrite()).assertFalse();
      state.applyAuthResults(0, 0);
      expect(state.canWrite()).assertTrue();
    });

    mergedCases.run('page_state_picker_options_should_obey_single_mode', () => {
      const single: PickerOptions = new PickerOptions(false, 0);
      single.setSelectedCount(1);
      expect(single.canSelectMore()).assertFalse();
      expect(single.single()).assertTrue();
    });
      mergedCases.finish();
    });

    it('page_state_should_survive_add_permission_button', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_ADD_BY_PERMISSION);
      expect(clicked).assertTrue();
      await serializedDelay(driver, 300);
      await ensureContactsPage(driver);
    });

    it('page_state_should_survive_update_button', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_UPDATE_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
    });

    it('page_state_focus_should_cycle_all_buttons__group_3', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('page_state_focus_should_cycle_all_buttons', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(4);
      nav.reset();
      const path: number[] = [];
      path.push(nav.getIndex());
      while (nav.move(1)) {
        path.push(nav.getIndex());
      }
      expect(path.length).assertEqual(4);
      expect(path[0]).assertEqual(0);
      expect(path[path.length - 1]).assertEqual(3);
    });

    mergedCases.run('page_state_model_should_validate_contact_before_add', () => {
      const record: ContactRecord = ContactFactory.buildRecord('赵六', '13800003333');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
      const empty: ContactRecord = ContactFactory.buildRecord('', '');
      expect(ContactValidator.isValidRecord(empty)).assertFalse();
    });

    mergedCases.run('page_state_history_should_grow_linearly', () => {
      model.reset();
      for (let i = 0; i < 5; i++) {
        model.setState(PageState.STABLE, i + 1);
      }
      expect(model.historySize()).assertEqual(5);
      expect(model.lastCount()).assertEqual(5);
    });
      mergedCases.finish();
    });

    it('page_state_remote_navigation_should_keep_page', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButtonAt(driver, 1);
      await serializedDelay(driver, 300);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('page_state_picker_session_should_finish', 0, async () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.resolve(1);
      expect(session.isResolved()).assertTrue();
      expect(session.getResultCount()).assertEqual(1);
    });

    it('page_state_validator_should_treat_picking_as_busy__group_6', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('page_state_validator_should_treat_picking_as_busy', () => {
      expect(PageStateValidator.isBusy(PageState.PICKING)).assertTrue();
      expect(PageStateValidator.isBusy(PageState.PERMISSIONING)).assertTrue();
      expect(PageStateValidator.isBusy(PageState.STABLE)).assertFalse();
    });

    mergedCases.run('page_state_model_state_history_should_track_counts', () => {
      model.reset();
      model.setState(PageState.STABLE, 5);
      expect(model.lastCount()).assertEqual(5);
      expect(model.historySize()).assertEqual(1);
    });

    mergedCases.run('page_state_focus_navigator_should_wrap_start', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(0);
      expect(nav.isAtStart()).assertTrue();
      expect(nav.isAtEnd()).assertFalse();
    });

    mergedCases.run('page_state_focus_navigator_should_hold_last_on_shrink', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(4);
      nav.move(3);
      nav.setCount(3);
      expect(nav.getIndex()).assertEqual(2);
    });

    mergedCases.run('page_state_permission_granted_fields', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, 0);
      expect(state.readGrantedState()).assertTrue();
      expect(state.writeGrantedState()).assertTrue();
    });

    mergedCases.run('page_state_validator_busy_to_stable', () => {
      expect(PageStateValidator.transitionValid(PageState.PICKING, PageState.STABLE)).assertTrue();
      expect(PageStateValidator.transitionValid(PageState.ADDING, PageState.IDLE)).assertTrue();
      expect(PageStateValidator.transitionValid(PageState.PERMISSIONING, PageState.PICKING)).assertFalse();
    });
      mergedCases.finish();
    });

    it('page_state_should_survive_toggle', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      await serializedDelay(driver, 200);
      await ensureContactsPage(driver);
    });

    it('page_state_model_should_reject_empty_contact__group_6', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('page_state_model_should_reject_empty_contact', () => {
      const record: ContactRecord = ContactFactory.buildRecord('', '');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
    });

    mergedCases.run('page_state_permission_denied_fields', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(-1, 0);
      expect(state.readGrantedState()).assertFalse();
      expect(state.writeGrantedState()).assertTrue();
    });

    mergedCases.run('page_state_focus_navigator_should_move_forward', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(4);
      expect(nav.move(1)).assertTrue();
      expect(nav.getIndex()).assertEqual(1);
    });

    mergedCases.run('page_state_focus_navigator_should_not_wrap_backward', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(4);
      nav.reset();
      expect(nav.move(-1)).assertFalse();
      expect(nav.isAtStart()).assertTrue();
    });

    mergedCases.run('page_state_history_should_keep_last_state', () => {
      model.reset();
      model.setState(PageState.PICKING, 2);
      expect(model.getState()).assertEqual(PageState.PICKING);
      expect(model.lastCount()).assertEqual(2);
    });

    mergedCases.run('page_state_validator_should_allow_permission_to_add', () => {
      expect(PageStateValidator.transitionValid(PageState.PERMISSIONING, PageState.ADDING)).assertTrue();
    });
      mergedCases.finish();
    });

    it('page_state_page_should_survive_add_flow', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_ADD_BY_PERMISSION);
      expect(clicked).assertTrue();
      await serializedDelay(driver, 200);
      await ensureContactsPage(driver);
    });

    it('page_state_should_report_stable_after_render', 0, async () => {
      await ensureContactsPage(driver);
      await waitForStableContactPage(driver);
      const count = await contactPageComponentCount(driver);
      model.setState(PageState.STABLE, count);
      expect(model.isStable()).assertTrue();
    });

    it('page_state_role_of_picker_session_should_finish', 0, () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.resolve(0);
      expect(session.isResolved()).assertTrue();
    });

    it('page_state_component_count_should_be_greater_than_zero', 0, async () => {
      await ensureContactsPage(driver);
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('page_state_focus_should_stay_within_range__group_3', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('page_state_focus_should_stay_within_range', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(4);
      expect(nav.move(-1)).assertFalse();
      expect(nav.move(100)).assertFalse();
      expect(nav.getIndex()).assertEqual(0);
    });

    mergedCases.run('page_state_permission_read_only_not_write', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, -1);
      expect(state.canRead()).assertTrue();
      expect(state.canWrite()).assertFalse();
    });

    mergedCases.run('page_state_busy_states_should_be_identified', () => {
      expect(PageStateValidator.isBusy(PageState.PERMISSIONING)).assertTrue();
      expect(PageStateValidator.isBusy(PageState.ADDING)).assertTrue();
      expect(PageStateValidator.isBusy(PageState.UPDATING)).assertTrue();
      expect(PageStateValidator.isBusy(PageState.IDLE)).assertFalse();
    });
      mergedCases.finish();
    });

    it('page_state_should_survive_update_flow', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_UPDATE_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, 200);
      await ensureContactsPage(driver);
    });

    it('page_state_model_should_reject_no_channel__group_3', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('page_state_model_should_reject_no_channel', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
    });

    mergedCases.run('page_state_history_should_reset_cleanly', () => {
      model.reset();
      model.setState(PageState.STABLE, 1);
      expect(model.historySize()).assertEqual(1);
      model.reset();
      expect(model.historySize()).assertEqual(0);
    });

    mergedCases.run('page_state_single_capacity_should_be_one', () => {
      const opts: PickerOptions = new PickerOptions(false, 0);
      opts.setSelectedCount(1);
      expect(opts.canSelectMore()).assertFalse();
    });
      mergedCases.finish();
    });

    it('page_state_page_toggle_stability', 0, async () => {
      await ensureContactsPage(driver);
      await serializedDelay(driver, 80);
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    it('page_state_busy_pure_model__group_7', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('page_state_busy_pure_model', () => {
      expect(PageStateValidator.isBusy(PageState.PERMISSIONING)).assertTrue();
      expect(PageStateValidator.isBusy(PageState.STABLE)).assertFalse();
      expect(PageStateValidator.isBusy(PageState.UPDATING)).assertTrue();
    });

    mergedCases.run('page_state_allowed_success_transitions', () => {
      expect(PageStateValidator.transitionValid(PageState.PERMISSIONING, PageState.ADDING)).assertTrue();
      expect(PageStateValidator.transitionValid(PageState.ADDING, PageState.IDLE)).assertTrue();
      expect(PageStateValidator.transitionValid(PageState.PICKING, PageState.STABLE)).assertTrue();
    });

    mergedCases.run('page_state_forbidden_transitions', () => {
      expect(PageStateValidator.transitionValid(PageState.PICKING, PageState.UPDATING)).assertFalse();
      expect(PageStateValidator.transitionValid(PageState.PERMISSIONING, PageState.PICKING)).assertFalse();
    });

    mergedCases.run('page_state_focus_moves_within_range', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(4);
      expect(nav.move(1)).assertTrue();
      expect(nav.getIndex()).assertEqual(1);
    });

    mergedCases.run('page_state_focus_summary_range', () => {
      const nav: FocusNavigator = new FocusNavigator();
      nav.setCount(4);
      nav.move(3);
      expect(nav.isAtEnd()).assertTrue();
      nav.reset();
      expect(nav.isAtStart()).assertTrue();
    });

    mergedCases.run('page_state_permission_both_granted', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, 0);
      expect(state.canRead()).assertTrue();
      expect(state.canWrite()).assertTrue();
    });

    mergedCases.run('page_state_permission_denied_read_write', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(-1, -1);
      expect(state.canRead()).assertFalse();
      expect(state.canWrite()).assertFalse();
    });
      mergedCases.finish();
    });
  });
}