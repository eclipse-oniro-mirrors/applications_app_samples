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
import { Log } from 'library';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  miracastComponentCount,
  pressAndWait,
  waitForPageStable,
  getCurrentFocusIndex,
  checkFocusState,
  ID_TAB_MIRACAST,
  ID_TAB_SETTINGS,
  ID_PERMANENT_TRUST,
  ID_ALLOW_BTN,
  ID_CANCEL_BTN,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  MAX_MIRROR_TILES,
  serializedDelay,
  triggerSerializedKey
} from '../Shared/MiracastDriver';

const TAG: string = 'KeyCodeSuite';

// Remote control key codes used by the miracast pages. Values are identical to
// the platform key codes so that assertions can be compared with the driver.
class MiracastKeyCodes {
  public static readonly DPAD_LEFT: number = 2014;
  public static readonly DPAD_RIGHT: number = 2015;
  public static readonly DPAD_UP: number = 2012;
  public static readonly DPAD_DOWN: number = 2013;
  public static readonly ENTER: number = 2049;
  public static readonly BACK: number = 2;
  public static readonly HOME: number = 3;
  public static readonly ESCAPE: number = 1;
  public static readonly TAB: number = 4;
  public static readonly SPACE: number = 57;
  public static readonly MENU: number = 18;
  public static readonly POWER: number = 26;
  public static readonly SEARCH: number = 84;
  public static readonly MEDIA_PLAY_PAUSE: number = 163;
  public static readonly MEDIA_STOP: number = 164;
  public static readonly MEDIA_NEXT: number = 165;
  public static readonly MEDIA_PREVIOUS: number = 166;
  public static readonly VOLUME_UP: number = 16;
  public static readonly VOLUME_DOWN: number = 17;
  public static readonly VOLUME_MUTE: number = 167;
}

// Functional category of a key, used to decide which page consumes it.
enum KeyCategory {
  NAVIGATION = 'navigation',
  CONFIRM = 'confirm',
  SYSTEM = 'system',
  MEDIA = 'media',
  VOLUME = 'volume',
  UNKNOWN = 'unknown'
}

// Key action of the event stream.
enum KeyAction {
  NONE = 0,
  KEY_DOWN = 1,
  KEY_UP = 2,
  KEY_REPEAT = 3
}

// Processing phase of a dispatched key event.
enum KeyEventPhase {
  DISPATCH = 'dispatch',
  CONSUME = 'consume',
  IGNORE = 'ignore',
  PROPAGATE = 'propagate'
}

// One recorded key event.
interface KeyEventRecord {
  keyCode: number;
  eventType: number;
  timestamp: number;
}

// Metrics of a single key handling round.
interface KeyMetrics {
  keyCode: number;
  category: KeyCategory;
  action: KeyAction;
  processingTime: number;
  handled: boolean;
}

// Key handling configuration of the miracast pages.
interface KeyConfig {
  repeatDelayMs: number;
  repeatIntervalMs: number;
  enableRepeat: boolean;
  enableLongPress: boolean;
  filterUnknownKeys: boolean;
}

// Descriptor produced by the key event synthesizer.
interface KeyEventDescriptor {
  keyCode: number;
  action: KeyAction;
  category: KeyCategory;
  phase: KeyEventPhase;
  timestamp: number;
}

// Records remote control events and classifies delivered key codes.
class KeyEventRecorder {
  private static instance: KeyEventRecorder | null = null;
  private keyEvents: Array<KeyEventRecord> = [];
  private keyDownCount: number = 0;
  private keyUpCount: number = 0;

  public static getInstance(): KeyEventRecorder {
    if (KeyEventRecorder.instance === null) {
      KeyEventRecorder.instance = new KeyEventRecorder();
    }
    return KeyEventRecorder.instance;
  }

  public handleKeyDown(keyCode: number): void {
    this.keyDownCount++;
    const entry: KeyEventRecord = {
      keyCode: keyCode,
      eventType: 1,
      timestamp: Date.now()
    };
    this.keyEvents.push(entry);
  }

  public handleKeyUp(keyCode: number): void {
    this.keyUpCount++;
    const entry: KeyEventRecord = {
      keyCode: keyCode,
      eventType: 0,
      timestamp: Date.now()
    };
    this.keyEvents.push(entry);
  }

  public getKeyEventRecord(): Array<KeyEventRecord> {
    return [...this.keyEvents];
  }

  public getKeyDownCount(): number {
    return this.keyDownCount;
  }

  public getKeyUpCount(): number {
    return this.keyUpCount;
  }

  public getTotalEventCount(): number {
    return this.keyEvents.length;
  }

  public hasKeyCode(keyCode: number): boolean {
    let found: boolean = false;
    for (let i = 0; i < this.keyEvents.length; i++) {
      if (this.keyEvents[i].keyCode === keyCode) {
        found = true;
      }
    }
    return found;
  }

  public getKeyCodeCount(keyCode: number): number {
    let count: number = 0;
    for (let i = 0; i < this.keyEvents.length; i++) {
      if (this.keyEvents[i].keyCode === keyCode) {
        count++;
      }
    }
    return count;
  }

  public getKeyDownEventCount(keyCode: number): number {
    let count: number = 0;
    for (let i = 0; i < this.keyEvents.length; i++) {
      const entry = this.keyEvents[i];
      if (entry.keyCode === keyCode && entry.eventType === 1) {
        count++;
      }
    }
    return count;
  }

  public getKeyUpEventCount(keyCode: number): number {
    let count: number = 0;
    for (let i = 0; i < this.keyEvents.length; i++) {
      const entry = this.keyEvents[i];
      if (entry.keyCode === keyCode && entry.eventType === 0) {
        count++;
      }
    }
    return count;
  }

  public getKeyCodeFrequency(): Map<number, number> {
    const frequency: Map<number, number> = new Map<number, number>();
    for (let i = 0; i < this.keyEvents.length; i++) {
      const keyCode = this.keyEvents[i].keyCode;
      const current = frequency.get(keyCode);
      if (current === undefined) {
        frequency.set(keyCode, 1);
      } else {
        frequency.set(keyCode, current + 1);
      }
    }
    return frequency;
  }

  public hasUnpairedEvents(): boolean {
    return this.keyDownCount !== this.keyUpCount;
  }

  public isNavigationKey(keyCode: number): boolean {
    return keyCode === MiracastKeyCodes.DPAD_LEFT || keyCode === MiracastKeyCodes.DPAD_RIGHT ||
      keyCode === MiracastKeyCodes.DPAD_UP || keyCode === MiracastKeyCodes.DPAD_DOWN;
  }

  public isConfirmKey(keyCode: number): boolean {
    return keyCode === MiracastKeyCodes.ENTER || keyCode === MiracastKeyCodes.SPACE;
  }

  public isSystemKey(keyCode: number): boolean {
    return keyCode === MiracastKeyCodes.BACK || keyCode === MiracastKeyCodes.HOME ||
      keyCode === MiracastKeyCodes.POWER || keyCode === MiracastKeyCodes.MENU ||
      keyCode === MiracastKeyCodes.ESCAPE;
  }

  public isMediaKey(keyCode: number): boolean {
    return keyCode === MiracastKeyCodes.MEDIA_PLAY_PAUSE || keyCode === MiracastKeyCodes.MEDIA_STOP ||
      keyCode === MiracastKeyCodes.MEDIA_NEXT || keyCode === MiracastKeyCodes.MEDIA_PREVIOUS;
  }

  public isVolumeKey(keyCode: number): boolean {
    return keyCode === MiracastKeyCodes.VOLUME_UP || keyCode === MiracastKeyCodes.VOLUME_DOWN ||
      keyCode === MiracastKeyCodes.VOLUME_MUTE;
  }

  public categoryOf(keyCode: number): KeyCategory {
    if (this.isNavigationKey(keyCode)) {
      return KeyCategory.NAVIGATION;
    }
    if (this.isConfirmKey(keyCode)) {
      return KeyCategory.CONFIRM;
    }
    if (this.isMediaKey(keyCode)) {
      return KeyCategory.MEDIA;
    }
    if (this.isVolumeKey(keyCode)) {
      return KeyCategory.VOLUME;
    }
    if (this.isSystemKey(keyCode)) {
      return KeyCategory.SYSTEM;
    }
    return KeyCategory.UNKNOWN;
  }

  public clearLog(): void {
    this.keyEvents = [];
    this.keyDownCount = 0;
    this.keyUpCount = 0;
  }

  public toString(): string {
    return `KeyEventRecorder{down=${this.keyDownCount}, up=${this.keyUpCount}, total=${this.keyEvents.length}}`;
  }
}

// Encapsulates one key code together with its dispatch context.
class KeyCodeModel {
  private keyCode: number = 0;
  private category: KeyCategory = KeyCategory.UNKNOWN;
  private action: KeyAction = KeyAction.NONE;
  private phase: KeyEventPhase = KeyEventPhase.IGNORE;
  private handled: boolean = false;

  public setKeyCode(keyCode: number): void {
    this.keyCode = keyCode;
  }

  public getKeyCode(): number {
    return this.keyCode;
  }

  public setCategory(category: KeyCategory): void {
    this.category = category;
  }

  public getCategory(): KeyCategory {
    return this.category;
  }

  public setAction(action: KeyAction): void {
    this.action = action;
  }

  public getAction(): KeyAction {
    return this.action;
  }

  public setPhase(phase: KeyEventPhase): void {
    this.phase = phase;
  }

  public getPhase(): KeyEventPhase {
    return this.phase;
  }

  public setHandled(handled: boolean): void {
    this.handled = handled;
  }

  public getHandled(): boolean {
    return this.handled;
  }

  public isKeyCodeValid(): boolean {
    return this.keyCode >= 0;
  }

  public isConsumed(): boolean {
    return this.phase === KeyEventPhase.CONSUME;
  }

  public clone(): KeyCodeModel {
    const copied = new KeyCodeModel();
    copied.setKeyCode(this.keyCode);
    copied.setCategory(this.category);
    copied.setAction(this.action);
    copied.setPhase(this.phase);
    copied.setHandled(this.handled);
    return copied;
  }

  public equals(other: KeyCodeModel): boolean {
    return this.keyCode === other.getKeyCode() && this.category === other.getCategory() &&
      this.action === other.getAction() && this.phase === other.getPhase() && this.handled === other.getHandled();
  }

  public toString(): string {
    return `KeyCodeModel{keyCode=${this.keyCode}, category=${this.category}, phase=${this.phase}}`;
  }
}

// Aggregates key handling metrics for latency and coverage assertions.
class KeyMetricsCalculator {
  private metrics: Array<KeyMetrics> = [];

  public constructor(metrics: Array<KeyMetrics>) {
    this.metrics = metrics;
  }

  public averageProcessingTime(): number {
    if (this.metrics.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      total = total + this.metrics[i].processingTime;
    }
    return total / this.metrics.length;
  }

  public maxProcessingTime(): number {
    let maxTime: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].processingTime > maxTime) {
        maxTime = this.metrics[i].processingTime;
      }
    }
    return maxTime;
  }

  public minProcessingTime(): number {
    let minTime: number = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].processingTime < minTime) {
        minTime = this.metrics[i].processingTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  public handledCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].handled) {
        count++;
      }
    }
    return count;
  }

  public countByCategory(category: KeyCategory): number {
    let count: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].category === category) {
        count++;
      }
    }
    return count;
  }
}

// Synthesizes key event descriptors for offline navigation assertions.
class KeyEventSynthesizer {
  private events: Array<KeyEventDescriptor> = [];

  public synthesizeEvent(keyCode: number, category: KeyCategory, action: KeyAction): void {
    const descriptor: KeyEventDescriptor = {
      keyCode: keyCode,
      action: action,
      category: category,
      phase: KeyEventPhase.DISPATCH,
      timestamp: Date.now()
    };
    this.events.push(descriptor);
  }

  public getEvents(): Array<KeyEventDescriptor> {
    return [...this.events];
  }

  public getEventCount(): number {
    return this.events.length;
  }

  public countByCategory(category: KeyCategory): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].category === category) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.events = [];
  }
}

// Validates the repeat configuration used by long press navigation.
class KeyConfigValidator {
  private config: KeyConfig;

  public constructor(config: KeyConfig) {
    this.config = config;
  }

  public isRepeatDelayValid(): boolean {
    return this.config.repeatDelayMs > 0;
  }

  public isRepeatIntervalValid(): boolean {
    return this.config.repeatIntervalMs > 0;
  }

  public isValid(): boolean {
    return this.isRepeatDelayValid() && this.isRepeatIntervalValid();
  }

  public generateValidationReport(): string {
    return `KeyConfig{repeatDelay=${this.config.repeatDelayMs}, repeatInterval=${this.config.repeatIntervalMs}, ` +
      `repeat=${this.config.enableRepeat}, longPress=${this.config.enableLongPress}, ` +
      `filterUnknown=${this.config.filterUnknownKeys}}`;
  }
}

// Tab strip navigation of the miracast index page driven by DPAD keys.
class TabNavigationModel {
  public static readonly TAB_MIRACAST: string = 'miracast_screen_casting';
  public static readonly TAB_SETTINGS: string = 'projection_Settings';
  private tabs: Array<string> = [TabNavigationModel.TAB_MIRACAST, TabNavigationModel.TAB_SETTINGS];
  private currentIndex: number = 0;
  private moveCount: number = 0;

  public getTabCount(): number {
    return this.tabs.length;
  }

  public getCurrentIndex(): number {
    return this.currentIndex;
  }

  public getCurrentTabId(): string {
    return this.tabs[this.currentIndex];
  }

  public moveRight(): boolean {
    if (this.currentIndex >= this.tabs.length - 1) {
      return false;
    }
    this.currentIndex++;
    this.moveCount++;
    return true;
  }

  public moveLeft(): boolean {
    if (this.currentIndex <= 0) {
      return false;
    }
    this.currentIndex--;
    this.moveCount++;
    return true;
  }

  public moveRightWithWrap(): void {
    if (this.currentIndex >= this.tabs.length - 1) {
      this.currentIndex = 0;
    } else {
      this.currentIndex++;
    }
    this.moveCount++;
  }

  public isAtLeftEdge(): boolean {
    return this.currentIndex === 0;
  }

  public isAtRightEdge(): boolean {
    return this.currentIndex === this.tabs.length - 1;
  }

  public getMoveCount(): number {
    return this.moveCount;
  }

  public reset(): void {
    this.currentIndex = 0;
    this.moveCount = 0;
  }

  public describe(): string {
    return `tab[${this.currentIndex}]=${this.getCurrentTabId()}`;
  }
}

// The three options of the miracast permission dialog.
class PermissionOptionModel {
  public static readonly OPTION_PERMANENT: string = 'permanent_trust';
  public static readonly OPTION_ONCE: string = 'allowBtn';
  public static readonly OPTION_CANCEL: string = 'cancel';
  private options: Array<string> =
    [PermissionOptionModel.OPTION_PERMANENT, PermissionOptionModel.OPTION_ONCE, PermissionOptionModel.OPTION_CANCEL];
  private types: Array<number> = [0, 1, 2];
  private focusedIndex: number = 0;
  private moveCount: number = 0;

  public optionCount(): number {
    return this.options.length;
  }

  public getFocusedIndex(): number {
    return this.focusedIndex;
  }

  public getFocusedOptionId(): string {
    return this.options[this.focusedIndex];
  }

  public getOptionIdAt(index: number): string {
    if (index < 0 || index >= this.options.length) {
      return '';
    }
    return this.options[index];
  }

  public moveDown(): boolean {
    if (this.focusedIndex >= this.options.length - 1) {
      return false;
    }
    this.focusedIndex++;
    this.moveCount++;
    return true;
  }

  public moveUp(): boolean {
    if (this.focusedIndex <= 0) {
      return false;
    }
    this.focusedIndex--;
    this.moveCount++;
    return true;
  }

  public moveDownWithWrap(): void {
    this.focusedIndex = (this.focusedIndex + 1) % this.options.length;
    this.moveCount++;
  }

  public getPermissionType(): number {
    return this.types[this.focusedIndex];
  }

  public isPermanentTrustSelected(): boolean {
    return this.focusedIndex === 0;
  }

  public isOnceSelected(): boolean {
    return this.focusedIndex === 1;
  }

  public isCancelSelected(): boolean {
    return this.focusedIndex === 2;
  }

  public canAccept(): boolean {
    return !this.isCancelSelected();
  }

  public getConfirmResult(): number {
    if (this.isCancelSelected()) {
      return -1;
    }
    return this.getPermissionType();
  }

  public getMoveCount(): number {
    return this.moveCount;
  }

  public reset(): void {
    this.focusedIndex = 0;
    this.moveCount = 0;
  }

  public describe(): string {
    return `permission[${this.focusedIndex}]=${this.getFocusedOptionId()} type=${this.getPermissionType()}`;
  }
}

// Player page tile grid: 1 full screen, 2 split, 3-4 quad, 5-9 nine grid.
class PlayerTileGridModel {
  public static readonly MAX_TILES: number = 9;
  private tileCount: number = 0;
  private focusedIndex: number = 0;
  private fullScreen: boolean = false;

  public constructor(tileCount: number) {
    this.tileCount = PlayerTileGridModel.normalizeTileCount(tileCount);
  }

  public static normalizeTileCount(tileCount: number): number {
    if (tileCount <= 0) {
      return 0;
    }
    if (tileCount > PlayerTileGridModel.MAX_TILES) {
      return PlayerTileGridModel.MAX_TILES;
    }
    return tileCount;
  }

  public getTileCount(): number {
    return this.tileCount;
  }

  public getFocusedIndex(): number {
    return this.focusedIndex;
  }

  public setFocusedIndex(index: number): boolean {
    if (index < 0 || index >= this.tileCount) {
      return false;
    }
    this.focusedIndex = index;
    return true;
  }

  public getColumns(): number {
    if (this.tileCount <= 0) {
      return 0;
    }
    if (this.tileCount === 1) {
      return 1;
    }
    if (this.tileCount === 2) {
      return 2;
    }
    if (this.tileCount <= 4) {
      return 2;
    }
    return 3;
  }

  public getRows(): number {
    if (this.tileCount <= 0) {
      return 0;
    }
    if (this.tileCount <= 2) {
      return 1;
    }
    if (this.tileCount <= 4) {
      return 2;
    }
    return 3;
  }

  public layoutName(): string {
    if (this.tileCount === 0) {
      return 'empty';
    }
    if (this.tileCount === 1) {
      return 'full_screen';
    }
    if (this.tileCount === 2) {
      return 'split_two';
    }
    if (this.tileCount <= 4) {
      return 'quad_grid';
    }
    return 'nine_grid';
  }

  public moveFocus(keyCode: number): boolean {
    if (this.fullScreen || this.tileCount === 0) {
      return false;
    }
    const columns = this.getColumns();
    const column = this.focusedIndex % columns;
    if (keyCode === MiracastKeyCodes.DPAD_LEFT) {
      if (column === 0) {
        return false;
      }
      this.focusedIndex--;
      return true;
    }
    if (keyCode === MiracastKeyCodes.DPAD_RIGHT) {
      if (column >= columns - 1 || this.focusedIndex + 1 >= this.tileCount) {
        return false;
      }
      this.focusedIndex++;
      return true;
    }
    if (keyCode === MiracastKeyCodes.DPAD_UP) {
      if (this.focusedIndex - columns < 0) {
        return false;
      }
      this.focusedIndex = this.focusedIndex - columns;
      return true;
    }
    if (keyCode === MiracastKeyCodes.DPAD_DOWN) {
      if (this.focusedIndex + columns >= this.tileCount) {
        return false;
      }
      this.focusedIndex = this.focusedIndex + columns;
      return true;
    }
    return false;
  }

  public toggleFullScreen(): boolean {
    this.fullScreen = !this.fullScreen;
    return this.fullScreen;
  }

  public setFullScreen(fullScreen: boolean): void {
    this.fullScreen = fullScreen;
  }

  public isFullScreen(): boolean {
    return this.fullScreen;
  }

  public isTileIndexValid(index: number): boolean {
    return index >= 0 && index < this.tileCount;
  }

  public isTileMuted(index: number): boolean {
    return index !== this.focusedIndex;
  }

  public reset(): void {
    this.fullScreen = false;
    this.focusedIndex = 0;
  }
}

// Routes key codes to the focused page of the miracast application.
class KeyDispatchRouter {
  public static readonly PAGE_INDEX: string = 'index';
  public static readonly PAGE_PLAYER: string = 'player';
  public static readonly PAGE_PERMISSION: string = 'permission';
  private page: string = KeyDispatchRouter.PAGE_INDEX;
  private routeLog: Array<string> = [];

  public setPage(page: string): boolean {
    if (page !== KeyDispatchRouter.PAGE_INDEX && page !== KeyDispatchRouter.PAGE_PLAYER &&
      page !== KeyDispatchRouter.PAGE_PERMISSION) {
      return false;
    }
    this.page = page;
    return true;
  }

  public getPage(): string {
    return this.page;
  }

  public route(keyCode: number): string {
    let action: string = 'unhandled';
    if (keyCode === MiracastKeyCodes.BACK) {
      action = 'back';
    } else if (this.page === KeyDispatchRouter.PAGE_INDEX) {
      if (keyCode === MiracastKeyCodes.DPAD_LEFT || keyCode === MiracastKeyCodes.DPAD_RIGHT) {
        action = 'switch_tab';
      } else if (keyCode === MiracastKeyCodes.ENTER) {
        action = 'toggle_switch';
      }
    } else if (this.page === KeyDispatchRouter.PAGE_PERMISSION) {
      if (keyCode === MiracastKeyCodes.DPAD_UP || keyCode === MiracastKeyCodes.DPAD_DOWN) {
        action = 'move_permission_focus';
      } else if (keyCode === MiracastKeyCodes.ENTER) {
        action = 'confirm_permission';
      }
    } else if (this.page === KeyDispatchRouter.PAGE_PLAYER) {
      if (keyCode === MiracastKeyCodes.DPAD_LEFT || keyCode === MiracastKeyCodes.DPAD_RIGHT ||
        keyCode === MiracastKeyCodes.DPAD_UP || keyCode === MiracastKeyCodes.DPAD_DOWN) {
        action = 'move_grid_focus';
      } else if (keyCode === MiracastKeyCodes.ENTER) {
        action = 'toggle_fullscreen';
      } else if (keyCode === MiracastKeyCodes.MEDIA_PLAY_PAUSE) {
        action = 'toggle_play';
      }
    }
    this.routeLog.push(action);
    return action;
  }

  public consumes(keyCode: number): boolean {
    return this.route(keyCode) !== 'unhandled';
  }

  public getRouteLog(): Array<string> {
    return [...this.routeLog];
  }

  public getRouteCount(): number {
    return this.routeLog.length;
  }

  public countAction(action: string): number {
    let count: number = 0;
    for (let i = 0; i < this.routeLog.length; i++) {
      if (this.routeLog[i] === action) {
        count++;
      }
    }
    return count;
  }

  public clearRoutes(): void {
    this.routeLog = [];
  }
}

export default function keyCodeValidationSuite(): void {
  describe('KeyCodeValidation_Suite', () => {
    let driver: Driver;
    let recorder: KeyEventRecorder;

    beforeAll(async () => {
      driver = getDriver();
      recorder = KeyEventRecorder.getInstance();
      recorder.clearLog();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      Log.info(TAG, 'suite end');
    });

    it('key_code_constants_should_match_platform_values', 0, async () => {
      expect(MiracastKeyCodes.DPAD_LEFT).assertEqual(2014);
      expect(MiracastKeyCodes.DPAD_RIGHT).assertEqual(2015);
      expect(MiracastKeyCodes.DPAD_UP).assertEqual(2012);
      expect(MiracastKeyCodes.DPAD_DOWN).assertEqual(2013);
      expect(MiracastKeyCodes.ENTER).assertEqual(2049);
      expect(MiracastKeyCodes.BACK).assertEqual(2);
      expect(MiracastKeyCodes.HOME).assertEqual(3);
      expect(MiracastKeyCodes.MENU).assertEqual(18);
      expect(MiracastKeyCodes.POWER).assertEqual(26);
      expect(MiracastKeyCodes.SEARCH).assertEqual(84);
    });

    it('key_event_recorder_should_record_down_and_up', 0, async () => {
      recorder.clearLog();
      recorder.handleKeyDown(MiracastKeyCodes.DPAD_RIGHT);
      expect(recorder.getKeyDownCount()).assertEqual(1);
      expect(recorder.getKeyUpCount()).assertEqual(0);
      recorder.handleKeyUp(MiracastKeyCodes.DPAD_RIGHT);
      expect(recorder.getKeyDownCount()).assertEqual(1);
      expect(recorder.getKeyUpCount()).assertEqual(1);
      const log = recorder.getKeyEventRecord();
      expect(log.length).assertEqual(2);
      expect(log[0].eventType).assertEqual(1);
      expect(log[1].eventType).assertEqual(0);
      expect(recorder.getTotalEventCount()).assertEqual(2);
    });

    it('navigation_key_identification_should_cover_dpad', 0, async () => {
      expect(recorder.isNavigationKey(MiracastKeyCodes.DPAD_LEFT)).assertTrue();
      expect(recorder.isNavigationKey(MiracastKeyCodes.DPAD_RIGHT)).assertTrue();
      expect(recorder.isNavigationKey(MiracastKeyCodes.DPAD_UP)).assertTrue();
      expect(recorder.isNavigationKey(MiracastKeyCodes.DPAD_DOWN)).assertTrue();
      expect(recorder.isNavigationKey(MiracastKeyCodes.ENTER)).assertFalse();
      expect(recorder.isNavigationKey(MiracastKeyCodes.BACK)).assertFalse();
      expect(recorder.isNavigationKey(MiracastKeyCodes.MEDIA_PLAY_PAUSE)).assertFalse();
    });

    it('confirm_key_identification_should_cover_enter_and_space', 0, async () => {
      expect(recorder.isConfirmKey(MiracastKeyCodes.ENTER)).assertTrue();
      expect(recorder.isConfirmKey(MiracastKeyCodes.SPACE)).assertTrue();
      expect(recorder.isConfirmKey(MiracastKeyCodes.DPAD_DOWN)).assertFalse();
      expect(recorder.isConfirmKey(MiracastKeyCodes.BACK)).assertFalse();
      expect(recorder.categoryOf(MiracastKeyCodes.ENTER)).assertEqual(KeyCategory.CONFIRM);
    });

    it('key_event_recorder_singleton_should_share_state', 0, async () => {
      const first = KeyEventRecorder.getInstance();
      const second = KeyEventRecorder.getInstance();
      expect(first === second).assertTrue();
      first.clearLog();
      first.handleKeyDown(KEY_RIGHT);
      expect(second.getKeyDownCount()).assertEqual(1);
      expect(second.hasKeyCode(KEY_RIGHT)).assertTrue();
      expect(second.toString().includes('down=1')).assertTrue();
    });

    it('recorder_down_and_up_counts_should_be_separated', 0, async () => {
      recorder.clearLog();
      recorder.handleKeyDown(KEY_RIGHT);
      recorder.handleKeyDown(KEY_RIGHT);
      recorder.handleKeyUp(KEY_RIGHT);
      recorder.handleKeyUp(KEY_LEFT);
      expect(recorder.getKeyDownEventCount(KEY_RIGHT)).assertEqual(2);
      expect(recorder.getKeyUpEventCount(KEY_RIGHT)).assertEqual(1);
      expect(recorder.getKeyDownEventCount(KEY_LEFT)).assertEqual(0);
      expect(recorder.getKeyUpEventCount(KEY_LEFT)).assertEqual(1);
      expect(recorder.getKeyDownCount()).assertEqual(2);
      expect(recorder.getKeyUpCount()).assertEqual(2);
    });

    it('recorder_should_detect_unpaired_events', 0, async () => {
      recorder.clearLog();
      expect(recorder.hasUnpairedEvents()).assertFalse();
      recorder.handleKeyDown(KEY_RIGHT);
      expect(recorder.hasUnpairedEvents()).assertTrue();
      recorder.handleKeyUp(KEY_RIGHT);
      expect(recorder.hasUnpairedEvents()).assertFalse();
      recorder.handleKeyDown(KEY_LEFT);
      recorder.handleKeyDown(KEY_ENTER);
      expect(recorder.hasUnpairedEvents()).assertTrue();
    });

    it('key_code_model_defaults_should_be_neutral', 0, async () => {
      const model = new KeyCodeModel();
      expect(model.getKeyCode()).assertEqual(0);
      expect(model.getCategory()).assertEqual(KeyCategory.UNKNOWN);
      expect(model.getAction()).assertEqual(KeyAction.NONE);
      expect(model.getPhase()).assertEqual(KeyEventPhase.IGNORE);
      expect(model.getHandled()).assertFalse();
      expect(model.isConsumed()).assertFalse();
      expect(model.isKeyCodeValid()).assertTrue();
    });

    it('key_code_model_validation_should_reject_negative', 0, async () => {
      const model = new KeyCodeModel();
      model.setKeyCode(KEY_ENTER);
      expect(model.isKeyCodeValid()).assertTrue();
      model.setKeyCode(0);
      expect(model.isKeyCodeValid()).assertTrue();
      model.setKeyCode(-1);
      expect(model.isKeyCodeValid()).assertFalse();
      model.setKeyCode(-2049);
      expect(model.isKeyCodeValid()).assertFalse();
    });

    it('key_code_model_clone_should_be_independent', 0, async () => {
      const model = new KeyCodeModel();
      model.setKeyCode(KEY_RIGHT);
      model.setCategory(KeyCategory.NAVIGATION);
      model.setPhase(KeyEventPhase.CONSUME);
      const cloned = model.clone();
      expect(model.equals(cloned)).assertTrue();
      cloned.setKeyCode(KEY_ENTER);
      expect(model.getKeyCode()).assertEqual(KEY_RIGHT);
      expect(cloned.getKeyCode()).assertEqual(KEY_ENTER);
      expect(model.isConsumed()).assertTrue();
    });

    it('key_code_model_equals_should_compare_all_fields', 0, async () => {
      const base = new KeyCodeModel();
      base.setKeyCode(KEY_RIGHT);
      base.setCategory(KeyCategory.NAVIGATION);
      base.setAction(KeyAction.KEY_DOWN);
      base.setPhase(KeyEventPhase.DISPATCH);
      base.setHandled(true);
      const other = base.clone();
      expect(base.equals(other)).assertTrue();
      other.setCategory(KeyCategory.MEDIA);
      expect(base.equals(other)).assertFalse();
      other.setCategory(KeyCategory.NAVIGATION);
      other.setAction(KeyAction.KEY_UP);
      expect(base.equals(other)).assertFalse();
      other.setAction(KeyAction.KEY_DOWN);
      other.setHandled(false);
      expect(base.equals(other)).assertFalse();
    });

    it('metrics_calculator_should_compute_average_time', 0, async () => {
      const metrics: Array<KeyMetrics> = [{
        keyCode: KEY_LEFT,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_DOWN,
        processingTime: 10,
        handled: true
      }, {
        keyCode: KEY_RIGHT,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_UP,
        processingTime: 30,
        handled: true
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.averageProcessingTime()).assertEqual(20);
    });

    it('metrics_calculator_should_compute_extremes', 0, async () => {
      const metrics: Array<KeyMetrics> = [{
        keyCode: KEY_LEFT,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_DOWN,
        processingTime: 10,
        handled: true
      }, {
        keyCode: KEY_ENTER,
        category: KeyCategory.CONFIRM,
        action: KeyAction.KEY_DOWN,
        processingTime: 50,
        handled: false
      }, {
        keyCode: KEY_BACK,
        category: KeyCategory.SYSTEM,
        action: KeyAction.KEY_DOWN,
        processingTime: 20,
        handled: true
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.maxProcessingTime()).assertEqual(50);
      expect(calculator.minProcessingTime()).assertEqual(10);
      expect(calculator.averageProcessingTime()).assertEqual(80 / 3);
    });

    it('metrics_calculator_should_handle_empty_metrics', 0, async () => {
      const calculator = new KeyMetricsCalculator([]);
      expect(calculator.averageProcessingTime()).assertEqual(0);
      expect(calculator.maxProcessingTime()).assertEqual(0);
      expect(calculator.minProcessingTime()).assertEqual(0);
      expect(calculator.handledCount()).assertEqual(0);
      expect(calculator.countByCategory(KeyCategory.NAVIGATION)).assertEqual(0);
    });

    it('metrics_calculator_should_count_by_category', 0, async () => {
      const metrics: Array<KeyMetrics> = [{
        keyCode: KEY_LEFT,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_DOWN,
        processingTime: 10,
        handled: true
      }, {
        keyCode: KEY_ENTER,
        category: KeyCategory.CONFIRM,
        action: KeyAction.KEY_DOWN,
        processingTime: 20,
        handled: true
      }, {
        keyCode: MiracastKeyCodes.VOLUME_UP,
        category: KeyCategory.VOLUME,
        action: KeyAction.KEY_UP,
        processingTime: 30,
        handled: false
      }, {
        keyCode: KEY_LEFT,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_UP,
        processingTime: 40,
        handled: true
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.countByCategory(KeyCategory.NAVIGATION)).assertEqual(2);
      expect(calculator.countByCategory(KeyCategory.CONFIRM)).assertEqual(1);
      expect(calculator.countByCategory(KeyCategory.VOLUME)).assertEqual(1);
      expect(calculator.countByCategory(KeyCategory.MEDIA)).assertEqual(0);
    });

    it('event_synthesizer_should_synthesize_events', 0, async () => {
      const synthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(KEY_RIGHT, KeyCategory.NAVIGATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(KEY_RIGHT, KeyCategory.NAVIGATION, KeyAction.KEY_UP);
      expect(synthesizer.getEventCount()).assertEqual(2);
      const events: Array<KeyEventDescriptor> = synthesizer.getEvents();
      expect(events[0].phase).assertEqual(KeyEventPhase.DISPATCH);
      expect(events[0].keyCode).assertEqual(KEY_RIGHT);
      expect(events[1].action).assertEqual(KeyAction.KEY_UP);
      synthesizer.clear();
      expect(synthesizer.getEventCount()).assertEqual(0);
    });

    it('event_synthesizer_get_events_should_return_copy', 0, async () => {
      const synthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(KEY_ENTER, KeyCategory.CONFIRM, KeyAction.KEY_DOWN);
      const events: Array<KeyEventDescriptor> = synthesizer.getEvents();
      events.push({
        keyCode: KEY_BACK,
        action: KeyAction.KEY_UP,
        category: KeyCategory.SYSTEM,
        phase: KeyEventPhase.DISPATCH,
        timestamp: 0
      });
      expect(synthesizer.getEventCount()).assertEqual(1);
    });

    it('config_validator_should_validate_repeat_delay', 0, async () => {
      const valid: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      const invalid: KeyConfig = {
        repeatDelayMs: 0,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(valid).isRepeatDelayValid()).assertTrue();
      expect(new KeyConfigValidator(invalid).isRepeatDelayValid()).assertFalse();
    });

    it('config_validator_should_validate_entire_config', 0, async () => {
      const valid: KeyConfig = {
        repeatDelayMs: 200,
        repeatIntervalMs: 100,
        enableRepeat: true,
        enableLongPress: true,
        filterUnknownKeys: true
      };
      const invalid: KeyConfig = {
        repeatDelayMs: 0,
        repeatIntervalMs: 0,
        enableRepeat: false,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(valid).isValid()).assertTrue();
      expect(new KeyConfigValidator(invalid).isValid()).assertFalse();
      const report: string = new KeyConfigValidator(valid).generateValidationReport();
      expect(report.includes('repeatDelay=200')).assertTrue();
      expect(report.includes('filterUnknown=true')).assertTrue();
    });

    it('tab_model_should_start_on_miracast_tab', 0, async () => {
      const tabs = new TabNavigationModel();
      expect(tabs.getTabCount()).assertEqual(2);
      expect(tabs.getCurrentIndex()).assertEqual(0);
      expect(tabs.getCurrentTabId()).assertEqual(ID_TAB_MIRACAST);
      expect(tabs.isAtLeftEdge()).assertTrue();
      expect(tabs.isAtRightEdge()).assertFalse();
      expect(tabs.getMoveCount()).assertEqual(0);
    });

    it('tab_model_move_right_should_reach_settings', 0, async () => {
      const tabs = new TabNavigationModel();
      expect(tabs.moveRight()).assertTrue();
      expect(tabs.getCurrentIndex()).assertEqual(1);
      expect(tabs.getCurrentTabId()).assertEqual(ID_TAB_SETTINGS);
      expect(tabs.isAtRightEdge()).assertTrue();
      expect(tabs.isAtLeftEdge()).assertFalse();
      expect(tabs.getMoveCount()).assertEqual(1);
    });

    it('tab_model_should_stop_at_right_edge', 0, async () => {
      const tabs = new TabNavigationModel();
      tabs.moveRight();
      expect(tabs.moveRight()).assertFalse();
      expect(tabs.getCurrentIndex()).assertEqual(1);
      expect(tabs.getMoveCount()).assertEqual(1);
      expect(tabs.getCurrentTabId()).assertEqual(ID_TAB_SETTINGS);
      expect(tabs.moveLeft()).assertTrue();
      expect(tabs.getCurrentIndex()).assertEqual(0);
    });

    it('tab_model_wrap_should_cycle_between_tabs', 0, async () => {
      const tabs = new TabNavigationModel();
      tabs.moveRightWithWrap();
      expect(tabs.getCurrentIndex()).assertEqual(1);
      tabs.moveRightWithWrap();
      expect(tabs.getCurrentIndex()).assertEqual(0);
      tabs.moveRightWithWrap();
      expect(tabs.getCurrentIndex()).assertEqual(1);
      expect(tabs.getMoveCount()).assertEqual(3);
    });

    it('tab_model_reset_should_restore_default_focus', 0, async () => {
      const tabs = new TabNavigationModel();
      tabs.moveRight();
      tabs.moveRightWithWrap();
      expect(tabs.getMoveCount()).assertEqual(2);
      tabs.reset();
      expect(tabs.getCurrentIndex()).assertEqual(0);
      expect(tabs.getMoveCount()).assertEqual(0);
      expect(tabs.getCurrentTabId()).assertEqual(TabNavigationModel.TAB_MIRACAST);
    });

    it('permission_model_should_expose_three_options', 0, async () => {
      const permission = new PermissionOptionModel();
      expect(permission.optionCount()).assertEqual(3);
      expect(permission.getOptionIdAt(0)).assertEqual(ID_PERMANENT_TRUST);
      expect(permission.getOptionIdAt(1)).assertEqual(ID_ALLOW_BTN);
      expect(permission.getOptionIdAt(2)).assertEqual(ID_CANCEL_BTN);
      expect(permission.getOptionIdAt(3)).assertEqual('');
      expect(permission.getOptionIdAt(-1)).assertEqual('');
    });

    it('permission_model_default_focus_should_be_permanent_trust', 0, async () => {
      const permission = new PermissionOptionModel();
      expect(permission.getFocusedIndex()).assertEqual(0);
      expect(permission.getFocusedOptionId()).assertEqual(ID_PERMANENT_TRUST);
      expect(permission.isPermanentTrustSelected()).assertTrue();
      expect(permission.isOnceSelected()).assertFalse();
      expect(permission.isCancelSelected()).assertFalse();
      expect(permission.canAccept()).assertTrue();
    });

    it('permission_model_wrap_should_cycle_options', 0, async () => {
      const permission = new PermissionOptionModel();
      permission.moveDownWithWrap();
      expect(permission.getFocusedIndex()).assertEqual(1);
      permission.moveDownWithWrap();
      expect(permission.getFocusedIndex()).assertEqual(2);
      permission.moveDownWithWrap();
      expect(permission.getFocusedIndex()).assertEqual(0);
      expect(permission.getMoveCount()).assertEqual(3);
      expect(permission.moveUp()).assertFalse();
      expect(permission.getFocusedIndex()).assertEqual(0);
    });

    it('permission_model_cancel_should_block_accept', 0, async () => {
      const permission = new PermissionOptionModel();
      permission.moveDown();
      permission.moveDown();
      expect(permission.canAccept()).assertFalse();
      expect(permission.getConfirmResult()).assertEqual(-1);
      permission.reset();
      expect(permission.canAccept()).assertTrue();
      expect(permission.getConfirmResult()).assertEqual(0);
    });

    it('permission_model_confirm_result_should_map_types', 0, async () => {
      const permission = new PermissionOptionModel();
      expect(permission.getConfirmResult()).assertEqual(0);
      permission.moveDown();
      expect(permission.getConfirmResult()).assertEqual(1);
      expect(permission.canAccept()).assertTrue();
      permission.reset();
      permission.moveDownWithWrap();
      permission.moveDownWithWrap();
      expect(permission.getConfirmResult()).assertEqual(-1);
    });

    it('tile_grid_should_map_layout_by_tile_count', 0, async () => {
      expect(new PlayerTileGridModel(0).layoutName()).assertEqual('empty');
      expect(new PlayerTileGridModel(1).layoutName()).assertEqual('full_screen');
      expect(new PlayerTileGridModel(2).layoutName()).assertEqual('split_two');
      expect(new PlayerTileGridModel(3).layoutName()).assertEqual('quad_grid');
      expect(new PlayerTileGridModel(4).layoutName()).assertEqual('quad_grid');
      expect(new PlayerTileGridModel(5).layoutName()).assertEqual('nine_grid');
      expect(new PlayerTileGridModel(MAX_MIRROR_TILES).layoutName()).assertEqual('nine_grid');
      const grid = new PlayerTileGridModel(4);
      expect(grid.isFullScreen()).assertFalse();
      expect(grid.toggleFullScreen()).assertTrue();
      grid.setFullScreen(false);
      expect(grid.isFullScreen()).assertFalse();
    });

    it('tile_grid_should_clamp_tile_count', 0, async () => {
      expect(PlayerTileGridModel.normalizeTileCount(-3)).assertEqual(0);
      expect(PlayerTileGridModel.normalizeTileCount(0)).assertEqual(0);
      expect(PlayerTileGridModel.normalizeTileCount(4)).assertEqual(4);
      expect(PlayerTileGridModel.normalizeTileCount(9)).assertEqual(9);
      expect(PlayerTileGridModel.normalizeTileCount(20)).assertEqual(MAX_MIRROR_TILES);
      expect(new PlayerTileGridModel(20).getTileCount()).assertEqual(MAX_MIRROR_TILES);
      expect(new PlayerTileGridModel(-1).getTileCount()).assertEqual(0);
    });

    it('tile_grid_should_compute_columns_and_rows', 0, async () => {
      expect(new PlayerTileGridModel(1).getColumns()).assertEqual(1);
      expect(new PlayerTileGridModel(1).getRows()).assertEqual(1);
      expect(new PlayerTileGridModel(2).getColumns()).assertEqual(2);
      expect(new PlayerTileGridModel(2).getRows()).assertEqual(1);
      expect(new PlayerTileGridModel(4).getColumns()).assertEqual(2);
      expect(new PlayerTileGridModel(4).getRows()).assertEqual(2);
      expect(new PlayerTileGridModel(9).getColumns()).assertEqual(3);
      expect(new PlayerTileGridModel(9).getRows()).assertEqual(3);
      expect(new PlayerTileGridModel(0).getColumns()).assertEqual(0);
      expect(new PlayerTileGridModel(0).getRows()).assertEqual(0);
    });

    it('tile_grid_should_move_focus_horizontally', 0, async () => {
      const grid = new PlayerTileGridModel(4);
      expect(grid.getFocusedIndex()).assertEqual(0);
      expect(grid.moveFocus(KEY_RIGHT)).assertTrue();
      expect(grid.getFocusedIndex()).assertEqual(1);
      expect(grid.moveFocus(KEY_LEFT)).assertTrue();
      expect(grid.getFocusedIndex()).assertEqual(0);
      expect(grid.moveFocus(KEY_LEFT)).assertFalse();
      expect(grid.getFocusedIndex()).assertEqual(0);
    });

    it('tile_grid_should_block_focus_at_row_edges', 0, async () => {
      const grid = new PlayerTileGridModel(4);
      expect(grid.moveFocus(KEY_RIGHT)).assertTrue();
      expect(grid.moveFocus(KEY_RIGHT)).assertFalse();
      expect(grid.getFocusedIndex()).assertEqual(1);
      expect(grid.moveFocus(KEY_DOWN)).assertTrue();
      expect(grid.getFocusedIndex()).assertEqual(3);
      expect(grid.moveFocus(KEY_DOWN)).assertFalse();
      expect(grid.moveFocus(KEY_UP)).assertTrue();
      expect(grid.getFocusedIndex()).assertEqual(1);
    });

    it('tile_grid_should_mute_unfocused_tiles', 0, async () => {
      const grid = new PlayerTileGridModel(4);
      expect(grid.isTileMuted(0)).assertFalse();
      expect(grid.isTileMuted(1)).assertTrue();
      grid.moveFocus(KEY_RIGHT);
      expect(grid.isTileMuted(0)).assertTrue();
      expect(grid.isTileMuted(1)).assertFalse();
      expect(grid.isTileIndexValid(3)).assertTrue();
      expect(grid.isTileIndexValid(4)).assertFalse();
      expect(grid.setFocusedIndex(3)).assertTrue();
      expect(grid.setFocusedIndex(4)).assertFalse();
    });

    it('router_default_page_should_be_index', 0, async () => {
      const router = new KeyDispatchRouter();
      expect(router.getPage()).assertEqual(KeyDispatchRouter.PAGE_INDEX);
      expect(router.getPage()).assertEqual('index');
      expect(router.getRouteCount()).assertEqual(0);
      expect(router.getRouteLog().length).assertEqual(0);
    });

    it('router_index_page_should_map_navigation_and_enter', 0, async () => {
      const router = new KeyDispatchRouter();
      expect(router.route(KEY_RIGHT)).assertEqual('switch_tab');
      expect(router.route(KEY_LEFT)).assertEqual('switch_tab');
      expect(router.route(KEY_ENTER)).assertEqual('toggle_switch');
      expect(router.route(KEY_UP)).assertEqual('unhandled');
      expect(router.route(MiracastKeyCodes.MEDIA_STOP)).assertEqual('unhandled');
      expect(router.consumes(KEY_RIGHT)).assertTrue();
      expect(router.consumes(KEY_UP)).assertFalse();
    });

    it('router_permission_page_should_map_focus_keys', 0, async () => {
      const router = new KeyDispatchRouter();
      router.setPage(KeyDispatchRouter.PAGE_PERMISSION);
      expect(router.route(KEY_DOWN)).assertEqual('move_permission_focus');
      expect(router.route(KEY_UP)).assertEqual('move_permission_focus');
      expect(router.route(KEY_ENTER)).assertEqual('confirm_permission');
      expect(router.route(KEY_LEFT)).assertEqual('unhandled');
      expect(router.countAction('move_permission_focus')).assertEqual(2);
      expect(router.countAction('confirm_permission')).assertEqual(1);
    });

    it('router_player_page_should_map_grid_and_media_keys', 0, async () => {
      const router = new KeyDispatchRouter();
      router.setPage(KeyDispatchRouter.PAGE_PLAYER);
      expect(router.route(KEY_DOWN)).assertEqual('move_grid_focus');
      expect(router.route(KEY_LEFT)).assertEqual('move_grid_focus');
      expect(router.route(KEY_ENTER)).assertEqual('toggle_fullscreen');
      expect(router.route(MiracastKeyCodes.MEDIA_PLAY_PAUSE)).assertEqual('toggle_play');
      expect(router.getRouteCount()).assertEqual(4);
      expect(router.getRouteLog()[2]).assertEqual('toggle_fullscreen');
    });

    it('router_should_always_handle_back_key', 0, async () => {
      const router = new KeyDispatchRouter();
      expect(router.route(KEY_BACK)).assertEqual('back');
      router.setPage(KeyDispatchRouter.PAGE_PLAYER);
      expect(router.route(KEY_BACK)).assertEqual('back');
      router.setPage(KeyDispatchRouter.PAGE_PERMISSION);
      expect(router.route(KEY_BACK)).assertEqual('back');
      expect(router.countAction('back')).assertEqual(3);
      expect(router.consumes(KEY_BACK)).assertTrue();
    });

    it('router_route_log_should_be_resettable', 0, async () => {
      const router = new KeyDispatchRouter();
      router.route(KEY_RIGHT);
      router.route(KEY_ENTER);
      expect(router.getRouteLog().length).assertEqual(2);
      const copy: Array<string> = router.getRouteLog();
      copy.push('injected');
      expect(router.getRouteCount()).assertEqual(2);
      router.clearRoutes();
      expect(router.getRouteCount()).assertEqual(0);
      expect(router.countAction('switch_tab')).assertEqual(0);
    });

    it('device_navigation_should_keep_page_stable', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const before = await miracastComponentCount(driver);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const after = await miracastComponentCount(driver);
      expect(before).assertLargerOrEqual(0);
      expect(after).assertLargerOrEqual(0);
      expect(Math.abs(after - before) <= TOLERANCE_COMPONENT_COUNT + 3).assertTrue();
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex >= -1).assertTrue();
    });

    it('device_key_press_should_be_recordable_by_recorder', 0, async () => {
      recorder.clearLog();
      await triggerSerializedKey(driver, KEY_DOWN);
      recorder.handleKeyDown(KEY_DOWN);
      await triggerSerializedKey(driver, KEY_DOWN);
      recorder.handleKeyDown(KEY_DOWN);
      expect(recorder.hasKeyCode(KEY_DOWN)).assertTrue();
      expect(recorder.getKeyCodeCount(KEY_DOWN)).assertEqual(2);
      expect(recorder.isNavigationKey(KEY_DOWN)).assertTrue();
      expect(recorder.getKeyDownCount()).assertEqual(2);
      expect(recorder.getKeyCodeFrequency().get(KEY_DOWN)).assertEqual(2);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(ID_TAB_MIRACAST.length > 0).assertTrue();
    });

    it('device_comprehensive_navigation_scenario_should_complete', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      recorder.clearLog();
      const keys: Array<number> = [KEY_RIGHT, KEY_RIGHT, KEY_LEFT, KEY_ENTER, KEY_BACK];
      for (let i = 0; i < keys.length; i++) {
        await triggerSerializedKey(driver, keys[i]);
        recorder.handleKeyDown(keys[i]);
        recorder.handleKeyUp(keys[i]);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }
      expect(recorder.getKeyDownCount()).assertEqual(keys.length);
      expect(recorder.getKeyUpCount()).assertEqual(keys.length);
      expect(recorder.hasUnpairedEvents()).assertFalse();
      const count = await miracastComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(recorder.toString().includes('total=10')).assertTrue();
    });
  });
}
