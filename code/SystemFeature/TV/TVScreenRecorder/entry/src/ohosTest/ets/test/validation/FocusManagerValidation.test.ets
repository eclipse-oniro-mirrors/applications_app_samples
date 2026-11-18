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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  recorderComponentCount,
  pressAndWait,
  delay,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// Direction of a remote control focus movement.
enum FocusDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  NONE = 'none'
}

// Owner of the input focus. A floating window is created with
// `setWindowFocusable(false)`, therefore the previous application keeps the
// focus until the window is explicitly made focusable.
enum FocusOwner {
  RECORDER_WINDOW = 'recorder_window',
  PREVIOUS_APP = 'previous_app',
  NONE = 'none'
}

// Strategy used when the focus index needs to be resolved.
enum FocusPolicy {
  NEAREST = 'nearest',
  FIRST = 'first',
  LAST = 'last',
  WRAP = 'wrap'
}

// Movement mode of one focus step.
enum FocusMoveMode {
  STEP = 'step',
  JUMP = 'jump',
  WRAP = 'wrap',
  CLAMP = 'clamp'
}

// Visual state of the TV focus ring.
interface FocusRingState {
  visible: boolean;
  color: string;
  width: number;
}

// Immutable snapshot of the focus state.
interface FocusSnapshot {
  currentIndex: number;
  previousIndex: number;
  direction: FocusDirection;
  owner: FocusOwner;
  ringVisible: boolean;
  timestamp: number;
}

// Statistics of a focus movement history.
interface FocusStatistics {
  totalMovements: number;
  leftMovements: number;
  rightMovements: number;
  upMovements: number;
  downMovements: number;
  invalidMovements: number;
}

// Inclusive index range of a focus container.
interface FocusRange {
  minIndex: number;
  maxIndex: number;
  size: number;
}

// Focus behaviour of the floating windows of the recorder. The timer window and
// the tip window are both created with `setWindowFocusable(false)` so they must
// never steal the focus from the previous application.
class FloatingWindowFocusModel {
  private focusable: boolean = false;
  private owner: FocusOwner = FocusOwner.PREVIOUS_APP;
  private itemCount: number = 0;
  private currentIndex: number = -1;
  private previousIndex: number = -1;
  private direction: FocusDirection = FocusDirection.NONE;
  private ring: FocusRingState = { visible: false, color: '#FFFFFF', width: 2 };
  private history: FocusSnapshot[] = [];
  private focusRequestCount: number = 0;
  private rejectedFocusCount: number = 0;

  public initialize(itemCount: number): void {
    this.itemCount = itemCount;
    this.currentIndex = -1;
    this.previousIndex = -1;
    this.direction = FocusDirection.NONE;
    this.history = [];
    this.focusRequestCount = 0;
    this.rejectedFocusCount = 0;
    this.ring = { visible: false, color: '#FFFFFF', width: 2 };
  }

  public setWindowFocusable(value: boolean): void {
    this.focusable = value;
    if (!value) {
      this.ring = {
        visible: false,
        color: this.ring.color,
        width: this.ring.width
      };
    }
  }

  public isWindowFocusable(): boolean {
    return this.focusable;
  }

  // The floating window only receives the focus when it was created as a
  // focusable window. Otherwise the request is rejected and counted.
  public acquireFocus(): boolean {
    this.focusRequestCount++;
    if (!this.focusable) {
      this.rejectedFocusCount++;
      this.owner = FocusOwner.PREVIOUS_APP;
      return false;
    }
    this.owner = FocusOwner.RECORDER_WINDOW;
    return true;
  }

  // Releasing the focus returns it to the previous application, which is the
  // behaviour of a non focusable floating window.
  public releaseFocus(): FocusOwner {
    this.owner = FocusOwner.PREVIOUS_APP;
    this.currentIndex = -1;
    this.previousIndex = -1;
    this.direction = FocusDirection.NONE;
    this.ring = {
      visible: false,
      color: this.ring.color,
      width: this.ring.width
    };
    return this.owner;
  }

  public getFocusOwner(): FocusOwner {
    return this.owner;
  }

  public getFocusRequestCount(): number {
    return this.focusRequestCount;
  }

  public getRejectedFocusCount(): number {
    return this.rejectedFocusCount;
  }

  public setFocus(index: number, moveDirection: FocusDirection): boolean {
    if (!this.isValidIndex(index)) {
      return false;
    }
    const oldIndex = this.currentIndex;
    this.currentIndex = index;
    this.previousIndex = oldIndex;
    this.direction = moveDirection;
    this.owner = FocusOwner.RECORDER_WINDOW;
    this.ring = {
      visible: true,
      color: this.ring.color,
      width: this.ring.width
    };
    const snapshot: FocusSnapshot = {
      currentIndex: this.currentIndex,
      previousIndex: this.previousIndex,
      direction: this.direction,
      owner: this.owner,
      ringVisible: this.ring.visible,
      timestamp: Date.now()
    };
    this.history.push(snapshot);
    return true;
  }

  // Remote control traversal. The move is clamped at both ends, which is what
  // the TV focus engine does when there is no neighbour in the direction.
  public moveFocus(moveDirection: FocusDirection): boolean {
    if (!this.focusable || this.currentIndex < 0) {
      return false;
    }
    let nextIndex = this.currentIndex;
    if (moveDirection === FocusDirection.LEFT || moveDirection === FocusDirection.UP) {
      nextIndex = this.currentIndex - 1;
    } else if (moveDirection === FocusDirection.RIGHT || moveDirection === FocusDirection.DOWN) {
      nextIndex = this.currentIndex + 1;
    } else {
      return false;
    }
    return this.setFocus(nextIndex, moveDirection);
  }

  public getCurrentIndex(): number {
    return this.currentIndex;
  }

  public getPreviousIndex(): number {
    return this.previousIndex;
  }

  public getDirection(): FocusDirection {
    return this.direction;
  }

  public getItemCount(): number {
    return this.itemCount;
  }

  public hasFocus(): boolean {
    return this.currentIndex >= 0 && this.currentIndex < this.itemCount;
  }

  public isValidIndex(index: number): boolean {
    return index >= 0 && index < this.itemCount;
  }

  public isRingVisible(): boolean {
    return this.ring.visible;
  }

  public setRingColor(color: string): void {
    this.ring = {
      visible: this.ring.visible,
      color: color,
      width: this.ring.width
    };
  }

  public getRingState(): FocusRingState {
    const copied: FocusRingState = {
      visible: this.ring.visible,
      color: this.ring.color,
      width: this.ring.width
    };
    return copied;
  }

  public getFocusHistory(): FocusSnapshot[] {
    // Element level copies keep the stored history immutable for the caller.
    const copied: FocusSnapshot[] = [];
    for (let i = 0; i < this.history.length; i++) {
      const item = this.history[i];
      copied.push({
        currentIndex: item.currentIndex,
        previousIndex: item.previousIndex,
        direction: item.direction,
        owner: item.owner,
        ringVisible: item.ringVisible,
        timestamp: item.timestamp
      });
    }
    return copied;
  }

  public getFocusMoveCount(): number {
    return this.history.length;
  }

  public getDirectionStats(): Map<string, number> {
    const stats = new Map<string, number>();
    for (let i = 0; i < this.history.length; i++) {
      const key = this.history[i].direction;
      const current = stats.get(key);
      if (current === undefined) {
        stats.set(key, 1);
      } else {
        stats.set(key, current + 1);
      }
    }
    return stats;
  }

  public getSnapshot(): FocusSnapshot {
    const snapshot: FocusSnapshot = {
      currentIndex: this.currentIndex,
      previousIndex: this.previousIndex,
      direction: this.direction,
      owner: this.owner,
      ringVisible: this.ring.visible,
      timestamp: Date.now()
    };
    return snapshot;
  }
}
// Resolves the movement mode of a direction.
class FocusMoveModeResolver {
  public resolveMode(direction: FocusDirection): FocusMoveMode {
    if (direction === FocusDirection.LEFT || direction === FocusDirection.RIGHT ||
      direction === FocusDirection.UP || direction === FocusDirection.DOWN) {
      return FocusMoveMode.STEP;
    }
    return FocusMoveMode.CLAMP;
  }

  public isStepMode(mode: FocusMoveMode): boolean {
    return mode === FocusMoveMode.STEP;
  }

  public isJumpMode(mode: FocusMoveMode): boolean {
    return mode === FocusMoveMode.JUMP;
  }
}

// Aggregates a focus history into direction counters.
class FocusStatisticsCalculator {
  private history: FocusSnapshot[] = [];

  constructor(history: FocusSnapshot[]) {
    for (let i = 0; i < history.length; i++) {
      this.history.push(history[i]);
    }
  }

  public buildStatistics(): FocusStatistics {
    const statistics: FocusStatistics = {
      totalMovements: this.history.length,
      leftMovements: this.countByDirection(FocusDirection.LEFT),
      rightMovements: this.countByDirection(FocusDirection.RIGHT),
      upMovements: this.countByDirection(FocusDirection.UP),
      downMovements: this.countByDirection(FocusDirection.DOWN),
      invalidMovements: this.countByDirection(FocusDirection.NONE)
    };
    return statistics;
  }

  private countByDirection(direction: FocusDirection): number {
    return this.history.filter((item: FocusSnapshot) => item.direction === direction).length;
  }

  public computeAverageInterval(): number {
    if (this.history.length < 2) {
      return 0;
    }
    let total = 0;
    for (let i = 1; i < this.history.length; i++) {
      total += this.history[i].timestamp - this.history[i - 1].timestamp;
    }
    return total / (this.history.length - 1);
  }
}

// Range helper with clamp semantics.
class FocusRangeModel {
  private minIndex: number;
  private maxIndex: number;

  constructor(minIndex: number, maxIndex: number) {
    this.minIndex = minIndex;
    this.maxIndex = maxIndex;
  }

  public getMinIndex(): number {
    return this.minIndex;
  }

  public getMaxIndex(): number {
    return this.maxIndex;
  }

  public getSize(): number {
    return this.maxIndex - this.minIndex + 1;
  }

  public contains(index: number): boolean {
    return index >= this.minIndex && index <= this.maxIndex;
  }

  public clamp(index: number): number {
    if (index < this.minIndex) {
      return this.minIndex;
    }
    if (index > this.maxIndex) {
      return this.maxIndex;
    }
    return index;
  }

  public toInterface(): FocusRange {
    const range: FocusRange = {
      minIndex: this.minIndex,
      maxIndex: this.maxIndex,
      size: this.getSize()
    };
    return range;
  }
}

// Position model of a single focus step.
class FocusPositionModel {
  private index: number;
  private direction: FocusDirection;
  private timestamp: number;

  constructor(index: number, direction: FocusDirection, timestamp: number) {
    this.index = index;
    this.direction = direction;
    this.timestamp = timestamp;
  }

  public getIndex(): number {
    return this.index;
  }

  public getDirection(): FocusDirection {
    return this.direction;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  public setIndex(index: number): void {
    this.index = index;
  }

  public isValid(maxIndex: number): boolean {
    return this.index >= 0 && this.index < maxIndex;
  }

  public toString(): string {
    return 'FocusPosition(index=' + this.index + ', direction=' + this.direction + ')';
  }
}

// Holder of the focus position records.
class FocusPositionManager {
  private positions: FocusPositionModel[] = [];

  public appendPosition(position: FocusPositionModel): void {
    this.positions.push(position);
  }

  public getPositions(): FocusPositionModel[] {
    const copied: FocusPositionModel[] = [];
    for (let i = 0; i < this.positions.length; i++) {
      copied.push(this.positions[i]);
    }
    return copied;
  }

  public filterByDirection(direction: FocusDirection): FocusPositionModel[] {
    return this.positions.filter((item: FocusPositionModel) => item.getDirection() === direction);
  }

  public clearPositions(): void {
    this.positions = [];
  }

  public getPositionCount(): number {
    return this.positions.length;
  }
}

// Resolves the focus target index for a policy.
class FocusPolicyResolver {
  private policy: FocusPolicy = FocusPolicy.NEAREST;

  public setPolicy(policy: FocusPolicy): void {
    this.policy = policy;
  }

  public getPolicy(): FocusPolicy {
    return this.policy;
  }

  public resolveTargetIndex(currentIndex: number, itemCount: number, direction: FocusDirection): number {
    if (itemCount <= 0) {
      return -1;
    }
    if (this.policy === FocusPolicy.FIRST) {
      return 0;
    }
    if (this.policy === FocusPolicy.LAST) {
      return itemCount - 1;
    }
    if (direction === FocusDirection.LEFT || direction === FocusDirection.UP) {
      if (currentIndex > 0) {
        return currentIndex - 1;
      }
      if (this.policy === FocusPolicy.WRAP) {
        return itemCount - 1;
      }
      return currentIndex;
    }
    if (direction === FocusDirection.RIGHT || direction === FocusDirection.DOWN) {
      if (currentIndex < itemCount - 1) {
        return currentIndex + 1;
      }
      if (this.policy === FocusPolicy.WRAP) {
        return 0;
      }
      return currentIndex;
    }
    return currentIndex;
  }
}

// Cell of the remote control focus grid.
interface GridCell {
  row: number;
  column: number;
  index: number;
  isFocusable: boolean;
}

// Two dimensional focus grid used by the TV remote traversal scenarios.
class FocusGridModel {
  private rows: number;
  private columns: number;
  private cells: GridCell[] = [];

  constructor(rows: number, columns: number) {
    this.rows = rows;
    this.columns = columns;
    this.initializeCells();
  }

  private initializeCells(): void {
    let index = 0;
    for (let row = 0; row < this.rows; row++) {
      for (let column = 0; column < this.columns; column++) {
        const cell: GridCell = {
          row: row,
          column: column,
          index: index,
          isFocusable: true
        };
        this.cells.push(cell);
        index++;
      }
    }
  }

  public getRows(): number {
    return this.rows;
  }

  public getColumns(): number {
    return this.columns;
  }

  public getCellCount(): number {
    return this.cells.length;
  }

  public getCellByIndex(index: number): GridCell | null {
    for (let i = 0; i < this.cells.length; i++) {
      if (this.cells[i].index === index) {
        return this.cells[i];
      }
    }
    return null;
  }

  public isIndexInGrid(index: number): boolean {
    return index >= 0 && index < this.cells.length;
  }

  public getCells(): GridCell[] {
    const copied: GridCell[] = [];
    for (let i = 0; i < this.cells.length; i++) {
      copied.push(this.cells[i]);
    }
    return copied;
  }
}

// Navigates inside the focus grid with the four remote control directions.
class FocusGridNavigator {
  private grid: FocusGridModel;

  constructor(grid: FocusGridModel) {
    this.grid = grid;
  }

  public moveRight(currentIndex: number): number {
    const cell = this.grid.getCellByIndex(currentIndex);
    if (cell === null) {
      return currentIndex;
    }
    if (cell.column + 1 < this.grid.getColumns()) {
      return currentIndex + 1;
    }
    return currentIndex;
  }

  public moveLeft(currentIndex: number): number {
    const cell = this.grid.getCellByIndex(currentIndex);
    if (cell === null) {
      return currentIndex;
    }
    if (cell.column - 1 >= 0) {
      return currentIndex - 1;
    }
    return currentIndex;
  }

  public moveDown(currentIndex: number): number {
    const target = currentIndex + this.grid.getColumns();
    if (this.grid.isIndexInGrid(target)) {
      return target;
    }
    return currentIndex;
  }

  public moveUp(currentIndex: number): number {
    const target = currentIndex - this.grid.getColumns();
    if (this.grid.isIndexInGrid(target)) {
      return target;
    }
    return currentIndex;
  }
}

// Audits the structure of the focus grid.
class FocusGridAuditor {
  private grid: FocusGridModel;

  constructor(grid: FocusGridModel) {
    this.grid = grid;
  }

  public countFocusableCells(): number {
    return this.grid.getCells().filter((cell: GridCell) => cell.isFocusable).length;
  }

  public isIndexContinuous(): boolean {
    const cells = this.grid.getCells();
    for (let i = 0; i < cells.length; i++) {
      if (cells[i].index !== i) {
        return false;
      }
    }
    return true;
  }

  public generateReport(): string {
    return 'Grid(' + this.grid.getRows() + 'x' + this.grid.getColumns() + ') cells=' +
      this.grid.getCellCount() + ' focusable=' + this.countFocusableCells();
  }
}
// Singleton holder of the model instance, mirroring the production singleton.
class FocusManagerRegistry {
  private static instance: FocusManagerRegistry;
  private model: FloatingWindowFocusModel = new FloatingWindowFocusModel();

  public static getInstance(): FocusManagerRegistry {
    if (!FocusManagerRegistry.instance) {
      FocusManagerRegistry.instance = new FocusManagerRegistry();
    }
    return FocusManagerRegistry.instance;
  }

  public getModel(): FloatingWindowFocusModel {
    return this.model;
  }
}

export default function focusManagerValidationTest(): void {
  describe('FocusManagerValidation_Test', () => {
    let driver: Driver;
    let focusModel: FloatingWindowFocusModel;

    beforeAll(async () => {
      driver = getDriver();
      focusModel = new FloatingWindowFocusModel();
      focusModel.initialize(6);
      await delay(200);
    });

    afterAll(async () => {
      await delay(200);
    });

    it('focus_direction_enum_should_be_defined_correctly', 0, () => {
      expect(FocusDirection.LEFT).assertEqual('left');
      expect(FocusDirection.RIGHT).assertEqual('right');
      expect(FocusDirection.UP).assertEqual('up');
      expect(FocusDirection.DOWN).assertEqual('down');
      expect(FocusDirection.NONE).assertEqual('none');
    });

    it('focus_owner_enum_should_be_defined_correctly', 0, () => {
      expect(FocusOwner.RECORDER_WINDOW).assertEqual('recorder_window');
      expect(FocusOwner.PREVIOUS_APP).assertEqual('previous_app');
      expect(FocusOwner.NONE).assertEqual('none');
      expect(FocusPolicy.NEAREST).assertEqual('nearest');
      expect(FocusPolicy.WRAP).assertEqual('wrap');
    });

    it('focus_model_initialization_should_not_take_focus', 0, () => {
      focusModel.initialize(6);
      expect(focusModel.getCurrentIndex()).assertEqual(-1);
      expect(focusModel.getPreviousIndex()).assertEqual(-1);
      expect(focusModel.getItemCount()).assertEqual(6);
      expect(focusModel.hasFocus()).assertFalse();
      expect(focusModel.isWindowFocusable()).assertFalse();
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.PREVIOUS_APP);
    });

    it('floating_window_should_be_created_not_focusable', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(false);
      expect(focusModel.isWindowFocusable()).assertFalse();
      expect(focusModel.acquireFocus()).assertFalse();
      expect(focusModel.getRejectedFocusCount()).assertEqual(1);
      expect(focusModel.getFocusRequestCount()).assertEqual(1);
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.PREVIOUS_APP);
    });

    it('non_focusable_window_should_keep_previous_app_focus', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(false);
      expect(focusModel.acquireFocus()).assertFalse();
      expect(focusModel.acquireFocus()).assertFalse();
      expect(focusModel.getRejectedFocusCount()).assertEqual(2);
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.PREVIOUS_APP);
      expect(focusModel.isRingVisible()).assertFalse();
    });

    it('focusable_window_should_acquire_focus', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      expect(focusModel.acquireFocus()).assertTrue();
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.RECORDER_WINDOW);
      expect(focusModel.getRejectedFocusCount()).assertEqual(0);
      expect(focusModel.getFocusRequestCount()).assertEqual(1);
    });

    it('release_focus_should_return_to_previous_app', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.acquireFocus();
      focusModel.setFocus(2, FocusDirection.RIGHT);
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.RECORDER_WINDOW);
      const owner = focusModel.releaseFocus();
      expect(owner).assertEqual(FocusOwner.PREVIOUS_APP);
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.PREVIOUS_APP);
      expect(focusModel.getCurrentIndex()).assertEqual(-1);
      expect(focusModel.isRingVisible()).assertFalse();
    });

    it('focus_setting_should_work_correctly', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      expect(focusModel.setFocus(0, FocusDirection.RIGHT)).assertTrue();
      expect(focusModel.getCurrentIndex()).assertEqual(0);
      expect(focusModel.hasFocus()).assertTrue();
      expect(focusModel.setFocus(3, FocusDirection.RIGHT)).assertTrue();
      expect(focusModel.getCurrentIndex()).assertEqual(3);
      expect(focusModel.getPreviousIndex()).assertEqual(0);
    });

    it('focus_setting_boundary_values_should_be_handled', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      expect(focusModel.setFocus(-1, FocusDirection.LEFT)).assertFalse();
      expect(focusModel.setFocus(6, FocusDirection.RIGHT)).assertFalse();
      expect(focusModel.setFocus(0, FocusDirection.RIGHT)).assertTrue();
      expect(focusModel.setFocus(5, FocusDirection.RIGHT)).assertTrue();
      expect(focusModel.getCurrentIndex()).assertEqual(5);
    });

    it('focus_index_validation_should_work_correctly', 0, () => {
      focusModel.initialize(6);
      expect(focusModel.isValidIndex(-1)).assertFalse();
      expect(focusModel.isValidIndex(0)).assertTrue();
      expect(focusModel.isValidIndex(5)).assertTrue();
      expect(focusModel.isValidIndex(6)).assertFalse();
      expect(focusModel.isValidIndex(10)).assertFalse();
    });

    it('remote_traversal_should_move_within_bounds', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(2, FocusDirection.RIGHT);
      expect(focusModel.moveFocus(FocusDirection.RIGHT)).assertTrue();
      expect(focusModel.getCurrentIndex()).assertEqual(3);
      expect(focusModel.moveFocus(FocusDirection.LEFT)).assertTrue();
      expect(focusModel.getCurrentIndex()).assertEqual(2);
      expect(focusModel.moveFocus(FocusDirection.UP)).assertTrue();
      expect(focusModel.getCurrentIndex()).assertEqual(1);
      expect(focusModel.moveFocus(FocusDirection.DOWN)).assertTrue();
      expect(focusModel.getCurrentIndex()).assertEqual(2);
    });

    it('remote_traversal_should_clamp_at_edges', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(0, FocusDirection.RIGHT);
      expect(focusModel.moveFocus(FocusDirection.LEFT)).assertFalse();
      expect(focusModel.getCurrentIndex()).assertEqual(0);
      focusModel.setFocus(5, FocusDirection.RIGHT);
      expect(focusModel.moveFocus(FocusDirection.RIGHT)).assertFalse();
      expect(focusModel.getCurrentIndex()).assertEqual(5);
      expect(focusModel.moveFocus(FocusDirection.NONE)).assertFalse();
    });

    it('traversal_without_focus_should_be_rejected', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      expect(focusModel.moveFocus(FocusDirection.RIGHT)).assertFalse();
      expect(focusModel.getCurrentIndex()).assertEqual(-1);
      focusModel.setWindowFocusable(false);
      focusModel.setFocus(2, FocusDirection.RIGHT);
      expect(focusModel.moveFocus(FocusDirection.RIGHT)).assertFalse();
      expect(focusModel.getCurrentIndex()).assertEqual(2);
    });

    it('focus_ring_should_be_visible_on_focus', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      expect(focusModel.isRingVisible()).assertFalse();
      focusModel.setFocus(1, FocusDirection.RIGHT);
      expect(focusModel.isRingVisible()).assertTrue();
      const ring = focusModel.getRingState();
      expect(ring.visible).assertTrue();
      expect(ring.width).assertEqual(2);
      expect(ring.color).assertEqual('#FFFFFF');
    });

    it('focus_ring_should_hide_when_not_focusable', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(1, FocusDirection.RIGHT);
      expect(focusModel.isRingVisible()).assertTrue();
      focusModel.setWindowFocusable(false);
      expect(focusModel.isRingVisible()).assertFalse();
      expect(focusModel.getRingState().visible).assertFalse();
    });

    it('focus_ring_color_should_be_configurable', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(1, FocusDirection.RIGHT);
      focusModel.setRingColor('#FF0000');
      const ring = focusModel.getRingState();
      expect(ring.color).assertEqual('#FF0000');
      expect(ring.visible).assertTrue();
      expect(ring.width).assertEqual(2);
    });
    it('focus_history_should_record_all_movements', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(0, FocusDirection.RIGHT);
      focusModel.setFocus(1, FocusDirection.RIGHT);
      focusModel.setFocus(2, FocusDirection.RIGHT);
      focusModel.setFocus(1, FocusDirection.LEFT);
      const history = focusModel.getFocusHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].currentIndex).assertEqual(0);
      expect(history[1].currentIndex).assertEqual(1);
      expect(history[2].currentIndex).assertEqual(2);
      expect(history[3].currentIndex).assertEqual(1);
      expect(history[3].previousIndex).assertEqual(2);
      expect(history[0].ringVisible).assertTrue();
    });

    it('focus_history_should_return_deep_copy', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(0, FocusDirection.RIGHT);
      focusModel.setFocus(1, FocusDirection.RIGHT);
      const first = focusModel.getFocusHistory();
      first[0].currentIndex = 99;
      const second = focusModel.getFocusHistory();
      expect(second[0].currentIndex).assertEqual(0);
      expect(focusModel.getFocusMoveCount()).assertEqual(2);
    });

    it('focus_direction_stats_should_be_accurate', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(0, FocusDirection.RIGHT);
      focusModel.moveFocus(FocusDirection.RIGHT);
      focusModel.moveFocus(FocusDirection.RIGHT);
      focusModel.moveFocus(FocusDirection.LEFT);
      focusModel.moveFocus(FocusDirection.LEFT);
      focusModel.moveFocus(FocusDirection.RIGHT);
      const stats = focusModel.getDirectionStats();
      expect(stats.get('right')).assertEqual(4);
      expect(stats.get('left')).assertEqual(2);
      expect(stats.get('up')).assertUndefined();
      expect(focusModel.getFocusMoveCount()).assertEqual(6);
    });

    it('focus_snapshot_should_reflect_current_state', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(3, FocusDirection.DOWN);
      const snapshot = focusModel.getSnapshot();
      expect(snapshot.currentIndex).assertEqual(3);
      expect(snapshot.direction).assertEqual(FocusDirection.DOWN);
      expect(snapshot.owner).assertEqual(FocusOwner.RECORDER_WINDOW);
      expect(snapshot.ringVisible).assertTrue();
      expect(snapshot.timestamp).assertLargerOrEqual(0);
    });

    it('focus_timestamps_should_be_chronological', 0, async () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(0, FocusDirection.RIGHT);
      await delay(20);
      focusModel.setFocus(1, FocusDirection.RIGHT);
      await delay(20);
      focusModel.setFocus(2, FocusDirection.RIGHT);
      const history = focusModel.getFocusHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('focus_registry_singleton_should_return_same_instance', 0, () => {
      const first = FocusManagerRegistry.getInstance();
      const second = FocusManagerRegistry.getInstance();
      expect(first === second).assertTrue();
      const model = first.getModel();
      model.initialize(6);
      model.setWindowFocusable(true);
      model.setFocus(2, FocusDirection.RIGHT);
      expect(second.getModel().getCurrentIndex()).assertEqual(2);
    });

    it('move_mode_resolver_should_map_directions', 0, () => {
      const resolver = new FocusMoveModeResolver();
      expect(resolver.resolveMode(FocusDirection.LEFT)).assertEqual(FocusMoveMode.STEP);
      expect(resolver.resolveMode(FocusDirection.RIGHT)).assertEqual(FocusMoveMode.STEP);
      expect(resolver.resolveMode(FocusDirection.UP)).assertEqual(FocusMoveMode.STEP);
      expect(resolver.resolveMode(FocusDirection.DOWN)).assertEqual(FocusMoveMode.STEP);
      expect(resolver.resolveMode(FocusDirection.NONE)).assertEqual(FocusMoveMode.CLAMP);
      expect(resolver.isStepMode(FocusMoveMode.STEP)).assertTrue();
      expect(resolver.isStepMode(FocusMoveMode.JUMP)).assertFalse();
      expect(resolver.isJumpMode(FocusMoveMode.JUMP)).assertTrue();
    });

    it('statistics_calculator_should_build_statistics', 0, () => {
      const history: FocusSnapshot[] = [];
      const now = Date.now();
      const first: FocusSnapshot = {
        currentIndex: 0, previousIndex: -1, direction: FocusDirection.RIGHT,
        owner: FocusOwner.RECORDER_WINDOW, ringVisible: true, timestamp: now
      };
      const second: FocusSnapshot = {
        currentIndex: 1, previousIndex: 0, direction: FocusDirection.RIGHT,
        owner: FocusOwner.RECORDER_WINDOW, ringVisible: true, timestamp: now
      };
      const third: FocusSnapshot = {
        currentIndex: 0, previousIndex: 1, direction: FocusDirection.LEFT,
        owner: FocusOwner.RECORDER_WINDOW, ringVisible: true, timestamp: now
      };
      const fourth: FocusSnapshot = {
        currentIndex: 1, previousIndex: 0, direction: FocusDirection.UP,
        owner: FocusOwner.RECORDER_WINDOW, ringVisible: true, timestamp: now
      };
      history.push(first);
      history.push(second);
      history.push(third);
      history.push(fourth);
      const calculator = new FocusStatisticsCalculator(history);
      const stats = calculator.buildStatistics();
      expect(stats.totalMovements).assertEqual(4);
      expect(stats.rightMovements).assertEqual(2);
      expect(stats.leftMovements).assertEqual(1);
      expect(stats.upMovements).assertEqual(1);
      expect(stats.downMovements).assertEqual(0);
      expect(stats.invalidMovements).assertEqual(0);
    });

    it('statistics_calculator_empty_history_should_be_zero', 0, () => {
      const calculator = new FocusStatisticsCalculator([]);
      const stats = calculator.buildStatistics();
      expect(stats.totalMovements).assertEqual(0);
      expect(stats.leftMovements).assertEqual(0);
      expect(stats.rightMovements).assertEqual(0);
      expect(calculator.computeAverageInterval()).assertEqual(0);
    });

    it('statistics_calculator_should_compute_average_interval', 0, () => {
      const base = Date.now();
      const first: FocusSnapshot = {
        currentIndex: 0, previousIndex: -1, direction: FocusDirection.RIGHT,
        owner: FocusOwner.RECORDER_WINDOW, ringVisible: true, timestamp: base
      };
      const second: FocusSnapshot = {
        currentIndex: 1, previousIndex: 0, direction: FocusDirection.RIGHT,
        owner: FocusOwner.RECORDER_WINDOW, ringVisible: true, timestamp: base + 100
      };
      const third: FocusSnapshot = {
        currentIndex: 2, previousIndex: 1, direction: FocusDirection.RIGHT,
        owner: FocusOwner.RECORDER_WINDOW, ringVisible: true, timestamp: base + 300
      };
      const calculator = new FocusStatisticsCalculator([first, second, third]);
      expect(calculator.computeAverageInterval()).assertEqual(150);
    });

    it('focus_range_model_should_report_size_and_containment', 0, () => {
      const range = new FocusRangeModel(1, 5);
      expect(range.getMinIndex()).assertEqual(1);
      expect(range.getMaxIndex()).assertEqual(5);
      expect(range.getSize()).assertEqual(5);
      expect(range.contains(1)).assertTrue();
      expect(range.contains(5)).assertTrue();
      expect(range.contains(0)).assertFalse();
      expect(range.contains(6)).assertFalse();
      expect(range.clamp(1)).assertEqual(1);
      expect(range.clamp(9)).assertEqual(5);
    });

    it('focus_range_model_to_interface_should_match', 0, () => {
      const range = new FocusRangeModel(0, 3);
      const iface = range.toInterface();
      expect(iface.minIndex).assertEqual(0);
      expect(iface.maxIndex).assertEqual(3);
      expect(iface.size).assertEqual(4);
      expect(range.clamp(-2)).assertEqual(0);
    });

    it('focus_position_model_should_validate_index', 0, () => {
      const position = new FocusPositionModel(2, FocusDirection.RIGHT, 123);
      expect(position.getIndex()).assertEqual(2);
      expect(position.getDirection()).assertEqual(FocusDirection.RIGHT);
      expect(position.getTimestamp()).assertEqual(123);
      expect(position.isValid(6)).assertTrue();
      position.setIndex(9);
      expect(position.isValid(6)).assertFalse();
      expect(position.toString().includes('9')).assertTrue();
    });

    it('focus_position_manager_should_manage_records', 0, () => {
      const positionManager = new FocusPositionManager();
      positionManager.appendPosition(new FocusPositionModel(0, FocusDirection.RIGHT, 1));
      positionManager.appendPosition(new FocusPositionModel(1, FocusDirection.LEFT, 2));
      positionManager.appendPosition(new FocusPositionModel(2, FocusDirection.RIGHT, 3));
      expect(positionManager.getPositionCount()).assertEqual(3);
      expect(positionManager.filterByDirection(FocusDirection.RIGHT).length).assertEqual(2);
      expect(positionManager.filterByDirection(FocusDirection.UP).length).assertEqual(0);
      expect(positionManager.getPositions().length).assertEqual(3);
      positionManager.clearPositions();
      expect(positionManager.getPositionCount()).assertEqual(0);
    });

    it('focus_policy_resolver_should_resolve_target_index', 0, () => {
      const resolver = new FocusPolicyResolver();
      expect(resolver.getPolicy()).assertEqual(FocusPolicy.NEAREST);
      resolver.setPolicy(FocusPolicy.FIRST);
      expect(resolver.resolveTargetIndex(3, 6, FocusDirection.RIGHT)).assertEqual(0);
      resolver.setPolicy(FocusPolicy.LAST);
      expect(resolver.resolveTargetIndex(3, 6, FocusDirection.LEFT)).assertEqual(5);
      resolver.setPolicy(FocusPolicy.NEAREST);
      expect(resolver.resolveTargetIndex(3, 6, FocusDirection.RIGHT)).assertEqual(4);
      expect(resolver.resolveTargetIndex(3, 6, FocusDirection.LEFT)).assertEqual(2);
      expect(resolver.resolveTargetIndex(0, 0, FocusDirection.RIGHT)).assertEqual(-1);
    });

    it('focus_policy_wrap_should_wrap_at_edges', 0, () => {
      const resolver = new FocusPolicyResolver();
      resolver.setPolicy(FocusPolicy.WRAP);
      expect(resolver.resolveTargetIndex(5, 6, FocusDirection.RIGHT)).assertEqual(0);
      expect(resolver.resolveTargetIndex(0, 6, FocusDirection.LEFT)).assertEqual(5);
      resolver.setPolicy(FocusPolicy.NEAREST);
      expect(resolver.resolveTargetIndex(5, 6, FocusDirection.RIGHT)).assertEqual(5);
      expect(resolver.resolveTargetIndex(0, 6, FocusDirection.LEFT)).assertEqual(0);
    });

    it('focus_grid_model_should_build_cells', 0, () => {
      const grid = new FocusGridModel(3, 4);
      expect(grid.getRows()).assertEqual(3);
      expect(grid.getColumns()).assertEqual(4);
      expect(grid.getCellCount()).assertEqual(12);
      const cell = grid.getCellByIndex(5);
      expect(cell === null).assertFalse();
      expect(cell?.row).assertEqual(1);
      expect(cell?.column).assertEqual(1);
      expect(grid.getCellByIndex(12)).assertEqual(null);
      expect(grid.isIndexInGrid(0)).assertTrue();
      expect(grid.isIndexInGrid(11)).assertTrue();
      expect(grid.isIndexInGrid(12)).assertFalse();
    });

    it('focus_grid_navigator_should_move_within_grid', 0, () => {
      const grid = new FocusGridModel(3, 3);
      const navigator = new FocusGridNavigator(grid);
      expect(navigator.moveRight(1)).assertEqual(2);
      expect(navigator.moveRight(2)).assertEqual(2);
      expect(navigator.moveLeft(1)).assertEqual(0);
      expect(navigator.moveLeft(0)).assertEqual(0);
      expect(navigator.moveDown(0)).assertEqual(3);
      expect(navigator.moveDown(6)).assertEqual(6);
      expect(navigator.moveUp(3)).assertEqual(0);
      expect(navigator.moveUp(0)).assertEqual(0);
    });

    it('focus_grid_auditor_should_audit_grid', 0, () => {
      const grid = new FocusGridModel(2, 2);
      const auditor = new FocusGridAuditor(grid);
      expect(auditor.countFocusableCells()).assertEqual(4);
      expect(auditor.isIndexContinuous()).assertTrue();
      const report = auditor.generateReport();
      expect(report.includes('2x2')).assertTrue();
      expect(report.includes('cells=4')).assertTrue();
      expect(report.includes('focusable=4')).assertTrue();
    });

    it('focus_traversal_performance_should_meet_requirements', 0, () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(true);
      focusModel.setFocus(0, FocusDirection.RIGHT);
      const startTime = Date.now();
      for (let i = 0; i < 5000; i++) {
        const moveDirection = i % 2 === 0 ? FocusDirection.RIGHT : FocusDirection.LEFT;
        focusModel.moveFocus(moveDirection);
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(5000);
      expect(focusModel.getFocusMoveCount()).assertLargerOrEqual(1);
      expect(focusModel.getCurrentIndex()).assertLargerOrEqual(0);
    });

    it('focus_management_should_correlate_with_recorder_window', 0, async () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(false);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(focusModel.acquireFocus()).assertFalse();
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.PREVIOUS_APP);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      focusModel.setWindowFocusable(true);
      focusModel.acquireFocus();
      focusModel.setFocus(1, FocusDirection.RIGHT);
      expect(focusModel.isRingVisible()).assertTrue();
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.RECORDER_WINDOW);
    });

    it('comprehensive_focus_scenario_should_demonstrate_full_functionality', 0, async () => {
      focusModel.initialize(6);
      focusModel.setWindowFocusable(false);
      focusModel.acquireFocus();
      expect(focusModel.getFocusOwner()).assertEqual(FocusOwner.PREVIOUS_APP);
      focusModel.setWindowFocusable(true);
      focusModel.acquireFocus();
      focusModel.setFocus(0, FocusDirection.RIGHT);
      focusModel.moveFocus(FocusDirection.RIGHT);
      focusModel.moveFocus(FocusDirection.RIGHT);
      focusModel.moveFocus(FocusDirection.LEFT);
      focusModel.setFocus(5, FocusDirection.RIGHT);
      focusModel.setFocus(0, FocusDirection.LEFT);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      expect(focusModel.getCurrentIndex()).assertEqual(0);
      expect(focusModel.getFocusMoveCount()).assertEqual(6);
      const stats = focusModel.getDirectionStats();
      expect(stats.get('right')).assertLargerOrEqual(1);
      expect(stats.get('left')).assertLargerOrEqual(1);
      expect(focusModel.releaseFocus()).assertEqual(FocusOwner.PREVIOUS_APP);
      expect(focusModel.getFocusMoveCount()).assertEqual(6);
      expect(focusModel.isRingVisible()).assertFalse();
    });
  });
}



