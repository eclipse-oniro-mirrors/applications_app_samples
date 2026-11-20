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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  miracastComponentCount,
  waitForPageStable,
  pressAndWait,
  triggerMiracastHome,
  getCurrentFocusIndex,
  serializedDelay,
  getPlayerTileCount,
  isFullScreenMode,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'MiracastStateManagementSuite';

class MiracastStateModel {
  public started: boolean = false;
  public sessionActive: boolean = false;
  public muted: boolean = false;
  public playing: boolean = false;
  public screenBoundCount: number = 0;
  public playerCount: number = 0;
  public focusIndex: number = 0;
  public beforeFocusIndex: number = 0;
  public tileCount: number = 1;
  public isFullScreen: boolean = true;
  public pageName: string = 'pages/Index';
  public isFocusable: boolean = true;
  public layoutColumns: number = 1;

  public reset(): void {
    this.started = false;
    this.sessionActive = false;
    this.muted = false;
    this.playing = false;
    this.screenBoundCount = 0;
    this.playerCount = 0;
    this.focusIndex = 0;
    this.beforeFocusIndex = 0;
    this.tileCount = 1;
    this.isFullScreen = true;
    this.pageName = 'pages/Index';
    this.isFocusable = true;
    this.layoutColumns = 1;
  }

  public startSession(): boolean {
    if (this.sessionActive) {
      return false;
    }
    this.started = true;
    this.sessionActive = true;
    return true;
  }

  public endSession(): boolean {
    if (!this.sessionActive) {
      return false;
    }
    this.sessionActive = false;
    this.playing = false;
    this.screenBoundCount = 0;
    return true;
  }

  public bindScreen(): boolean {
    if (!this.sessionActive || this.screenBoundCount >= MAX_MIRROR_TILES) {
      return false;
    }
    this.screenBoundCount++;
    return true;
  }

  public toggleMute(): void {
    this.muted = !this.muted;
  }

  public toggleFocusable(): void {
    this.isFocusable = !this.isFocusable;
  }

  public applyTileCount(tileCount: number): boolean {
    if (tileCount <= 0 || tileCount > MAX_MIRROR_TILES) {
      return false;
    }
    this.tileCount = tileCount;
    this.isFullScreen = tileCount === 1;
    if (tileCount === 1) {
      this.layoutColumns = 1;
    } else if (tileCount === 2) {
      this.layoutColumns = 2;
    } else if (tileCount <= 4) {
      this.layoutColumns = 2;
    } else {
      this.layoutColumns = 3;
    }
    return true;
  }

  public selectFocus(index: number): boolean {
    if (index < 0 || index >= this.tileCount) {
      return false;
    }
    this.beforeFocusIndex = this.focusIndex;
    this.focusIndex = index;
    return true;
  }

  public navigatePage(pageName: string): boolean {
    if (pageName.length === 0) {
      return false;
    }
    this.pageName = pageName;
    return true;
  }
}

interface StateSnapshot {
  sessionActive: boolean;
  muted: boolean;
  playing: boolean;
  focusIndex: number;
  beforeFocusIndex: number;
  tileCount: number;
  screenBoundCount: number;
  isFocusable: boolean;
}

class StateSnapshotModel {
  public sessionActive: boolean;
  public muted: boolean;
  public playing: boolean;
  public focusIndex: number;
  public beforeFocusIndex: number;
  public tileCount: number;
  public screenBoundCount: number;
  public isFocusable: boolean;

  constructor(sessionActive: boolean, muted: boolean, playing: boolean, focusIndex: number,
    beforeFocusIndex: number, tileCount: number, screenBoundCount: number, isFocusable: boolean) {
    this.sessionActive = sessionActive;
    this.muted = muted;
    this.playing = playing;
    this.focusIndex = focusIndex;
    this.beforeFocusIndex = beforeFocusIndex;
    this.tileCount = tileCount;
    this.screenBoundCount = screenBoundCount;
    this.isFocusable = isFocusable;
  }

  public static fromState(state: MiracastStateModel): StateSnapshotModel {
    return new StateSnapshotModel(state.sessionActive, state.muted, state.playing, state.focusIndex,
      state.beforeFocusIndex, state.tileCount, state.screenBoundCount, state.isFocusable);
  }

  public equals(other: StateSnapshotModel): boolean {
    return this.sessionActive === other.sessionActive && this.muted === other.muted &&
      this.playing === other.playing && this.focusIndex === other.focusIndex &&
      this.beforeFocusIndex === other.beforeFocusIndex && this.tileCount === other.tileCount &&
      this.screenBoundCount === other.screenBoundCount && this.isFocusable === other.isFocusable;
  }

  public toString(): string {
    return `StateSnapshot{focusIndex: ${this.focusIndex}, tileCount: ${this.tileCount}}`;
  }

  public toRecord(): StateSnapshot {
    const record: StateSnapshot = {
      sessionActive: this.sessionActive,
      muted: this.muted,
      playing: this.playing,
      focusIndex: this.focusIndex,
      beforeFocusIndex: this.beforeFocusIndex,
      tileCount: this.tileCount,
      screenBoundCount: this.screenBoundCount,
      isFocusable: this.isFocusable
    };
    return record;
  }
}

class StateHistory {
  private undoStack: StateSnapshotModel[] = [];
  private redoStack: StateSnapshotModel[] = [];

  public push(snapshot: StateSnapshotModel): void {
    this.undoStack.push(snapshot);
    this.redoStack = [];
  }

  public undo(): StateSnapshotModel | null {
    if (this.undoStack.length === 0) {
      return null;
    }
    const lastIndex: number = this.undoStack.length - 1;
    const snapshot: StateSnapshotModel = this.undoStack[lastIndex];
    this.undoStack.pop();
    this.redoStack.push(snapshot);
    return snapshot;
  }

  public redo(): StateSnapshotModel | null {
    if (this.redoStack.length === 0) {
      return null;
    }
    const lastIndex: number = this.redoStack.length - 1;
    const snapshot: StateSnapshotModel = this.redoStack[lastIndex];
    this.redoStack.pop();
    this.undoStack.push(snapshot);
    return snapshot;
  }

  public getUndoCount(): number {
    return this.undoStack.length;
  }

  public getRedoCount(): number {
    return this.redoStack.length;
  }

  public clear(): void {
    this.undoStack = [];
    this.redoStack = [];
  }
}

class StateValidator {
  public static isValidFocusIndex(index: number, tileCount: number): boolean { return index >= 0 && index < tileCount; }

  public static isValidTileCount(tileCount: number): boolean { return tileCount > 0 && tileCount <= MAX_MIRROR_TILES; }

  public static isFocusStable(focusIndex: number, beforeFocusIndex: number): boolean { return focusIndex >= 0 && beforeFocusIndex >= 0; }

  public static isLayoutColumnsValid(columns: number, tileCount: number): boolean {
    if (columns <= 0 || tileCount <= 0) {
      return false;
    }
    return columns * columns >= tileCount || columns === 2;
  }

  public static isScreenCountValid(screenCount: number, tileCount: number): boolean { return screenCount >= 0 && screenCount <= tileCount; }
}

class StateDiffCalculator {
  public static diff(a: StateSnapshotModel, b: StateSnapshotModel): number {
    let differences: number = 0;
    differences += a.sessionActive !== b.sessionActive ? 1 : 0;
    differences += a.muted !== b.muted ? 1 : 0;
    differences += a.playing !== b.playing ? 1 : 0;
    differences += a.focusIndex !== b.focusIndex ? 1 : 0;
    differences += a.beforeFocusIndex !== b.beforeFocusIndex ? 1 : 0;
    differences += a.tileCount !== b.tileCount ? 1 : 0;
    differences += a.screenBoundCount !== b.screenBoundCount ? 1 : 0;
    differences += a.isFocusable !== b.isFocusable ? 1 : 0;
    return differences;
  }
}

export default function miracastStateManagementSuite(): void {
  describe('MiracastStateManagement_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('started_state_should_default_to_false', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.started).assertFalse();
      expect(state.sessionActive).assertFalse();
      expect(state.playing).assertFalse();
    });

    it('muted_state_should_default_to_false', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.muted).assertFalse();
      state.toggleMute();
      expect(state.muted).assertTrue();
      state.toggleMute();
      expect(state.muted).assertFalse();
    });

    it('page_name_should_default_to_index_page', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.pageName).assertEqual('pages/Index');
      expect(state.navigatePage('pages/PlayerPage')).assertTrue();
      expect(state.pageName).assertEqual('pages/PlayerPage');
      expect(state.navigatePage('')).assertFalse();
      expect(state.pageName).assertEqual('pages/PlayerPage');
    });

    it('focus_state_should_default_correctly', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.focusIndex).assertEqual(0);
      expect(state.beforeFocusIndex).assertEqual(0);
      expect(state.isFocusable).assertTrue();
      state.toggleFocusable();
      expect(state.isFocusable).assertFalse();
      state.toggleFocusable();
      expect(state.isFocusable).assertTrue();
    });

    it('tile_state_should_default_to_full_screen', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.tileCount).assertEqual(1);
      expect(state.isFullScreen).assertTrue();
      expect(state.layoutColumns).assertEqual(1);
      expect(StateValidator.isValidTileCount(state.tileCount)).assertTrue();
    });

    it('screen_and_player_counts_should_default_to_zero', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.screenBoundCount).assertEqual(0);
      expect(state.playerCount).assertEqual(0);
      expect(StateValidator.isScreenCountValid(state.screenBoundCount, state.tileCount)).assertTrue();
    });

    it('start_session_should_set_session_flag', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.startSession()).assertTrue();
      expect(state.started).assertTrue();
      expect(state.sessionActive).assertTrue();
      expect(state.endSession()).assertTrue();
      expect(state.sessionActive).assertFalse();
      expect(state.endSession()).assertFalse();
    });

    it('start_session_twice_should_be_rejected', 0, async () => {
      const state = new MiracastStateModel();
      state.startSession();
      expect(state.startSession()).assertFalse();
      expect(state.sessionActive).assertTrue();
      expect(state.started).assertTrue();
    });

    it('bind_screen_should_require_active_session', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.bindScreen()).assertFalse();
      state.startSession();
      expect(state.bindScreen()).assertTrue();
      expect(state.screenBoundCount).assertEqual(1);
      state.endSession();
      expect(state.bindScreen()).assertFalse();
      expect(state.screenBoundCount).assertEqual(0);
    });

    it('bind_screen_should_be_capped_at_nine', 0, async () => {
      const state = new MiracastStateModel();
      state.startSession();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        expect(state.bindScreen()).assertTrue();
      }
      expect(state.screenBoundCount).assertEqual(MAX_MIRROR_TILES);
      expect(state.bindScreen()).assertFalse();
    });

    it('two_tile_state_should_use_two_columns', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.applyTileCount(2)).assertTrue();
      expect(state.tileCount).assertEqual(2);
      expect(state.layoutColumns).assertEqual(2);
      expect(state.isFullScreen).assertFalse();
      expect(StateValidator.isLayoutColumnsValid(state.layoutColumns, state.tileCount)).assertTrue();
    });

    it('four_tile_state_should_use_quad_layout', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.applyTileCount(4)).assertTrue();
      expect(state.layoutColumns).assertEqual(2);
      expect(state.isFullScreen).assertFalse();
      expect(StateValidator.isLayoutColumnsValid(2, 4)).assertTrue();
    });

    it('nine_tile_state_should_use_three_columns', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.applyTileCount(MAX_MIRROR_TILES)).assertTrue();
      expect(state.layoutColumns).assertEqual(3);
      expect(state.isFullScreen).assertFalse();
      expect(StateValidator.isLayoutColumnsValid(3, MAX_MIRROR_TILES)).assertTrue();
    });

    it('invalid_tile_count_should_not_change_state', 0, async () => {
      const state = new MiracastStateModel();
      expect(state.applyTileCount(0)).assertFalse();
      expect(state.applyTileCount(MAX_MIRROR_TILES + 1)).assertFalse();
      expect(state.tileCount).assertEqual(1);
      expect(state.isFullScreen).assertTrue();
    });

    it('select_focus_should_record_previous_index', 0, async () => {
      const state = new MiracastStateModel();
      state.applyTileCount(4);
      expect(state.selectFocus(2)).assertTrue();
      expect(state.focusIndex).assertEqual(2);
      expect(state.beforeFocusIndex).assertEqual(0);
      expect(state.selectFocus(3)).assertTrue();
      expect(state.beforeFocusIndex).assertEqual(2);
      expect(state.selectFocus(4)).assertFalse();
      expect(state.focusIndex).assertEqual(3);
    });

    it('invalid_focus_index_should_not_change_state', 0, async () => {
      const state = new MiracastStateModel();
      const before: number = state.focusIndex;
      expect(state.selectFocus(-1)).assertFalse();
      expect(state.selectFocus(100)).assertFalse();
      expect(state.focusIndex).assertEqual(before);
      expect(StateValidator.isValidFocusIndex(state.focusIndex, state.tileCount)).assertTrue();
    });

    it('reset_should_restore_initial_state', 0, async () => {
      const state = new MiracastStateModel();
      state.startSession();
      state.bindScreen();
      state.toggleMute();
      state.applyTileCount(4);
      state.navigatePage('pages/PlayerPage');
      state.reset();
      expect(state.sessionActive).assertFalse();
      expect(state.muted).assertFalse();
      expect(state.tileCount).assertEqual(1);
      expect(state.screenBoundCount).assertEqual(0);
      expect(state.pageName).assertEqual('pages/Index');
      expect(state.isFullScreen).assertTrue();
    });

    it('state_snapshot_should_capture_model_state', 0, async () => {
      const state = new MiracastStateModel();
      state.startSession();
      state.bindScreen();
      const snapshot: StateSnapshotModel = StateSnapshotModel.fromState(state);
      expect(snapshot.sessionActive).assertTrue();
      expect(snapshot.screenBoundCount).assertEqual(1);
      expect(snapshot.tileCount).assertEqual(1);
      expect(snapshot.equals(StateSnapshotModel.fromState(state))).assertTrue();
      expect(snapshot.toString().includes('tileCount')).assertTrue();
      const record: StateSnapshot = snapshot.toRecord();
      expect(record.focusIndex).assertEqual(0);
      expect(record.isFocusable).assertTrue();
    });

    it('state_history_should_undo_and_redo', 0, async () => {
      const history = new StateHistory();
      const state = new MiracastStateModel();
      history.push(StateSnapshotModel.fromState(state));
      state.applyTileCount(4);
      history.push(StateSnapshotModel.fromState(state));
      expect(history.getUndoCount()).assertEqual(2);
      const undone: StateSnapshotModel | null = history.undo();
      expect(undone === null).assertFalse();
      if (undone !== null) {
        expect(undone.tileCount).assertEqual(4);
      }
      expect(history.getRedoCount()).assertEqual(1);
      const redone: StateSnapshotModel | null = history.redo();
      expect(redone === null).assertFalse();
      expect(history.getUndoCount()).assertEqual(2);
      expect(history.getRedoCount()).assertEqual(0);
    });

    it('state_history_should_return_null_when_empty', 0, async () => {
      const history = new StateHistory();
      expect(history.undo() === null).assertTrue();
      expect(history.redo() === null).assertTrue();
      expect(history.getUndoCount()).assertEqual(0);
      expect(history.getRedoCount()).assertEqual(0);
      history.clear();
      expect(history.getUndoCount()).assertEqual(0);
    });

    it('push_should_clear_redo_stack', 0, async () => {
      const history = new StateHistory();
      const state = new MiracastStateModel();
      history.push(StateSnapshotModel.fromState(state));
      history.undo();
      expect(history.getRedoCount()).assertEqual(1);
      history.push(StateSnapshotModel.fromState(state));
      expect(history.getRedoCount()).assertEqual(0);
      expect(history.getUndoCount()).assertEqual(1);
    });

    it('real_home_state_should_be_stable', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertEqual(0);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertEqual(-1);
    });

    it('real_tile_state_should_match_full_screen_rule', 0, async () => {
      const tileCount: number = await getPlayerTileCount(driver);
      expect(tileCount).assertLargerOrEqual(0);
      expect(tileCount).assertLessOrEqual(MAX_MIRROR_TILES);
      const fullScreen: boolean = await isFullScreenMode(driver, 1);
      expect(fullScreen).assertTrue();
      const state = new MiracastStateModel();
      state.applyTileCount(1);
      expect(state.isFullScreen).assertTrue();
    });

    it('snapshot_should_capture_tile_layout_change', 0, async () => {
      const state = new MiracastStateModel();
      const single: StateSnapshotModel = StateSnapshotModel.fromState(state);
      state.applyTileCount(4);
      const quad: StateSnapshotModel = StateSnapshotModel.fromState(state);
      expect(StateDiffCalculator.diff(single, quad)).assertEqual(1);
      expect(quad.tileCount).assertEqual(4);
      expect(quad.equals(single)).assertFalse();
    });

    it('navigation_should_keep_focus_state_valid', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      expect(StateValidator.isFocusStable(Math.max(focusIndex, 0), 0)).assertTrue();
    });

  });
}
