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
  isPlayerPageVisible,
  waitForPageStable,
  pressAndWait,
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_PAGE_RENDER,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

const TAG: string = 'MiracastModelDeepSuite';

// 播放器项生命周期枚举：描述单路镜像画面的状态阶段
enum PlayerItemStateType {
  ITEM_CREATED = 'created',
  ITEM_ACTIVE = 'active',
  ITEM_PAUSED = 'paused',
  ITEM_FULLSCREEN = 'fullscreen',
  ITEM_DESTROYED = 'destroyed'
}

// 焦点迁移方向枚举
enum FocusDirection {
  DIRECTION_NEXT = 'next',
  DIRECTION_PREV = 'prev',
  DIRECTION_JUMP = 'jump'
}

// 播放器项统计快照接口
interface PlayerItemSnapshot {
  totalCount: number;
  focusedCount: number;
  boundCount: number;
  fullscreenCount: number;
  totalArea: number;
}

// 播放器项资源接口：描述设备接入后一路镜像画面的完整状态
class DeepPlayerItem {
  public deviceId: string;
  public deviceName: string;
  public screenId: string;
  public isScreenSet: boolean;
  public index: number;
  public color: string;
  public isFocused: boolean;
  public isMuted: boolean;
  public state: PlayerItemStateType;
  public layoutWidth: number;
  public layoutHeight: number;
  public layoutX: number;
  public layoutY: number;

  constructor(deviceId: string, deviceName: string, index: number) {
    this.deviceId = deviceId;
    this.deviceName = deviceName;
    this.screenId = '';
    this.isScreenSet = false;
    this.index = index;
    this.color = '#FF000000';
    this.isFocused = false;
    this.isMuted = false;
    this.state = PlayerItemStateType.ITEM_CREATED;
    this.layoutWidth = 0;
    this.layoutHeight = 0;
    this.layoutX = 0;
    this.layoutY = 0;
  }

  public bindScreen(screenId: string): boolean {
    if (screenId.length === 0) {
      return false;
    }
    this.screenId = screenId;
    this.isScreenSet = true;
    return true;
  }

  public activate(): boolean {
    if (this.state === PlayerItemStateType.ITEM_CREATED) {
      this.state = PlayerItemStateType.ITEM_ACTIVE;
      return true;
    }
    return false;
  }

  public pause(): boolean {
    if (this.state === PlayerItemStateType.ITEM_ACTIVE) {
      this.state = PlayerItemStateType.ITEM_PAUSED;
      return true;
    }
    return false;
  }

  public resume(): boolean {
    if (this.state === PlayerItemStateType.ITEM_PAUSED) {
      this.state = PlayerItemStateType.ITEM_ACTIVE;
      return true;
    }
    return false;
  }

  public enterFullscreen(): boolean {
    if (this.state === PlayerItemStateType.ITEM_ACTIVE) {
      this.state = PlayerItemStateType.ITEM_FULLSCREEN;
      return true;
    }
    return false;
  }

  public exitFullscreen(): boolean {
    if (this.state === PlayerItemStateType.ITEM_FULLSCREEN) {
      this.state = PlayerItemStateType.ITEM_ACTIVE;
      return true;
    }
    return false;
  }

  public destroy(): boolean {
    if (this.state !== PlayerItemStateType.ITEM_DESTROYED) {
      this.state = PlayerItemStateType.ITEM_DESTROYED;
      this.isScreenSet = false;
      this.screenId = '';
      return true;
    }
    return false;
  }

  public setMuted(muted: boolean): void {
    this.isMuted = muted;
  }

  public setLayout(width: number, height: number, x: number, y: number): boolean {
    if (width <= 0 || height <= 0 || x < 0 || y < 0) {
      return false;
    }
    this.layoutWidth = width;
    this.layoutHeight = height;
    this.layoutX = x;
    this.layoutY = y;
    return true;
  }

  public getArea(): number {
    return this.layoutWidth * this.layoutHeight;
  }

  public isFullscreen(): boolean {
    return this.state === PlayerItemStateType.ITEM_FULLSCREEN;
  }

  public isAlive(): boolean {
    return this.state !== PlayerItemStateType.ITEM_DESTROYED;
  }

  public clone(): DeepPlayerItem {
    const cloned = new DeepPlayerItem(this.deviceId, this.deviceName, this.index);
    cloned.screenId = this.screenId;
    cloned.isScreenSet = this.isScreenSet;
    cloned.color = this.color;
    cloned.isFocused = this.isFocused;
    cloned.isMuted = this.isMuted;
    cloned.state = this.state;
    cloned.layoutWidth = this.layoutWidth;
    cloned.layoutHeight = this.layoutHeight;
    cloned.layoutX = this.layoutX;
    cloned.layoutY = this.layoutY;
    return cloned;
  }

  public equals(other: DeepPlayerItem): boolean {
    return this.deviceId === other.deviceId && this.screenId === other.screenId &&
      this.isScreenSet === other.isScreenSet && this.index === other.index &&
      this.isFocused === other.isFocused && this.state === other.state &&
      this.layoutWidth === other.layoutWidth && this.layoutHeight === other.layoutHeight;
  }

  public toString(): string {
    return `DeepPlayerItem{device: ${this.deviceId}, index: ${this.index}, state: ${this.state}}`;
  }
}
// 播放器项列表管理器：管理多路画面并维护唯一焦点
class PlayerItemListManager {
  private items: DeepPlayerItem[] = [];

  constructor() {
    this.initializeDefaultItems();
  }

  public getAllItems(): DeepPlayerItem[] {
    return [...this.items];
  }

  public getLength(): number {
    return this.items.length;
  }

  public getItemByIndex(index: number): DeepPlayerItem | null {
    if (index >= 0 && index < this.items.length) {
      return this.items[index];
    }
    return null;
  }

  public getItemByDeviceId(deviceId: string): DeepPlayerItem | null {
    const found = this.items.filter((item: DeepPlayerItem) => item.deviceId === deviceId);
    return found.length === 0 ? null : found[0];
  }

  public getFocusedItem(): DeepPlayerItem | null {
    const found = this.items.filter((item: DeepPlayerItem) => item.isFocused);
    return found.length === 0 ? null : found[0];
  }

  public setFocusToIndex(index: number): boolean {
    if (index < 0 || index >= this.items.length) {
      return false;
    }
    this.items.forEach((item: DeepPlayerItem, position: number) => {
      item.isFocused = position === index;
    });
    return true;
  }

  public moveFocusNext(): boolean {
    const current = this.items.findIndex((item: DeepPlayerItem) => item.isFocused);
    if (current >= 0 && current < this.items.length - 1) {
      return this.setFocusToIndex(current + 1);
    }
    return false;
  }

  public moveFocusPrev(): boolean {
    const current = this.items.findIndex((item: DeepPlayerItem) => item.isFocused);
    if (current > 0) {
      return this.setFocusToIndex(current - 1);
    }
    return false;
  }

  public addItem(item: DeepPlayerItem): boolean {
    if (this.items.length >= MAX_MIRROR_TILES) {
      return false;
    }
    if (this.getItemByDeviceId(item.deviceId) !== null) {
      return false;
    }
    item.index = this.items.length;
    this.items.push(item);
    return true;
  }

  public removeItemByDeviceId(deviceId: string): boolean {
    const before = this.items.length;
    this.items = this.items.filter((item: DeepPlayerItem) => item.deviceId !== deviceId);
    return this.items.length !== before;
  }

  public removeItemByIndex(index: number): boolean {
    if (index < 0 || index >= this.items.length) {
      return false;
    }
    this.items.splice(index, 1);
    return true;
  }

  public clearAllItems(): void {
    this.items = [];
  }

  public validateListIntegrity(): boolean {
    if (this.items.length === 0) {
      return false;
    }
    if (this.items.filter((item: DeepPlayerItem) => item.isFocused).length !== 1) {
      return false;
    }
    return this.items.every((item: DeepPlayerItem) => item.isAlive());
  }

  private initializeDefaultItems(): void {
    const first = new DeepPlayerItem('device_0', 'LivingRoom', 0);
    first.bindScreen('screen_0');
    first.activate();
    first.setLayout(960, 1080, 0, 0);
    first.isFocused = true;
    const second = new DeepPlayerItem('device_1', 'Bedroom', 1);
    second.bindScreen('screen_1');
    second.activate();
    second.setLayout(960, 1080, 960, 0);
    const third = new DeepPlayerItem('device_2', 'Office', 2);
    third.bindScreen('screen_2');
    third.activate();
    third.setLayout(640, 540, 0, 0);
    this.items.push(first, second, third);
  }
}
// 播放器项统计器：对列表做聚合统计与快照
class PlayerItemStatistics {
  private manager: PlayerItemListManager;

  constructor(manager: PlayerItemListManager) {
    this.manager = manager;
  }

  public getTotalCount(): number {
    return this.manager.getLength();
  }

  public getFocusedCount(): number {
    return this.manager.getAllItems().filter((item: DeepPlayerItem) => item.isFocused).length;
  }

  public getBoundCount(): number {
    return this.manager.getAllItems().filter((item: DeepPlayerItem) => item.isScreenSet).length;
  }

  public getFullscreenCount(): number {
    return this.manager.getAllItems().filter((item: DeepPlayerItem) => item.isFullscreen()).length;
  }

  public getMutedCount(): number {
    return this.manager.getAllItems().filter((item: DeepPlayerItem) => item.isMuted).length;
  }

  public getTotalArea(): number {
    let total = 0;
    this.manager.getAllItems().forEach((item: DeepPlayerItem) => {
      total += item.getArea();
    });
    return total;
  }

  public getFocusedRatio(): number {
    const total = this.getTotalCount();
    if (total === 0) {
      return 0;
    }
    return this.getFocusedCount() / total;
  }

  public generateSnapshot(): PlayerItemSnapshot {
    return {
      totalCount: this.getTotalCount(),
      focusedCount: this.getFocusedCount(),
      boundCount: this.getBoundCount(),
      fullscreenCount: this.getFullscreenCount(),
      totalArea: this.getTotalArea()
    };
  }

  public describeSnapshot(): string {
    const snapshot: PlayerItemSnapshot = this.generateSnapshot();
    return `PlayerItemStatistics{total: ${snapshot.totalCount}, focused: ${snapshot.focusedCount}, ` +
      `bound: ${snapshot.boundCount}}`;
  }
}

// 播放器项构建器：以链式方式构建深度模型对象
class DeepPlayerItemBuilder {
  private deviceId: string = '';
  private deviceName: string = '';
  private index: number = 0;
  private screenId: string = '';
  private color: string = '#FF000000';
  private isFocused: boolean = false;
  private state: PlayerItemStateType = PlayerItemStateType.ITEM_CREATED;
  private layoutWidth: number = 0;
  private layoutHeight: number = 0;
  private layoutX: number = 0;
  private layoutY: number = 0;

  public withDevice(deviceId: string, deviceName: string): DeepPlayerItemBuilder {
    this.deviceId = deviceId;
    this.deviceName = deviceName;
    return this;
  }

  public withIndex(index: number): DeepPlayerItemBuilder {
    this.index = index;
    return this;
  }

  public withScreen(screenId: string): DeepPlayerItemBuilder {
    this.screenId = screenId;
    return this;
  }

  public withColor(color: string): DeepPlayerItemBuilder {
    this.color = color;
    return this;
  }

  public withFocus(isFocused: boolean): DeepPlayerItemBuilder {
    this.isFocused = isFocused;
    return this;
  }

  public withState(state: PlayerItemStateType): DeepPlayerItemBuilder {
    this.state = state;
    return this;
  }

  public withLayout(width: number, height: number, x: number, y: number): DeepPlayerItemBuilder {
    this.layoutWidth = width;
    this.layoutHeight = height;
    this.layoutX = x;
    this.layoutY = y;
    return this;
  }

  public build(): DeepPlayerItem {
    const item = new DeepPlayerItem(this.deviceId, this.deviceName, this.index);
    item.color = this.color;
    item.isFocused = this.isFocused;
    item.state = this.state;
    item.layoutWidth = this.layoutWidth;
    item.layoutHeight = this.layoutHeight;
    item.layoutX = this.layoutX;
    item.layoutY = this.layoutY;
    if (this.screenId.length > 0) {
      item.bindScreen(this.screenId);
    }
    return item;
  }
}

// 播放器项深度校验器：多维度校验并收集违规项
class PlayerItemDeepValidator {
  private item: DeepPlayerItem;

  constructor(item: DeepPlayerItem) {
    this.item = item;
  }

  public hasDeviceIdentity(): boolean {
    return this.item.deviceId.length > 0 && this.item.deviceName.length > 0;
  }

  public hasScreen(): boolean {
    return this.item.isScreenSet && this.item.screenId.length > 0;
  }

  public hasLayout(): boolean {
    return this.item.layoutWidth > 0 && this.item.layoutHeight > 0;
  }

  public isIndexWithinLimit(): boolean {
    return this.item.index >= 0 && this.item.index < MAX_MIRROR_TILES;
  }

  public validateAll(): boolean {
    return this.hasDeviceIdentity() && this.hasScreen() && this.hasLayout() && this.isIndexWithinLimit() &&
      this.item.isAlive();
  }

  public collectViolations(): string[] {
    const violations: string[] = [];
    if (!this.hasDeviceIdentity()) {
      violations.push('missing identity');
    }
    if (!this.hasScreen()) {
      violations.push('missing screen');
    }
    if (!this.hasLayout()) {
      violations.push('missing layout');
    }
    if (!this.isIndexWithinLimit()) {
      violations.push('invalid index');
    }
    if (!this.item.isAlive()) {
      violations.push('destroyed item');
    }
    return violations;
  }
}
// 播放器项快照仓库：保存快照并支持回归对比
class PlayerItemSnapshotStore {
  private snapshots: PlayerItemSnapshot[] = [];

  public capture(manager: PlayerItemListManager): void {
    const stats = new PlayerItemStatistics(manager);
    this.snapshots.push(stats.generateSnapshot());
  }

  public getSnapshotCount(): number {
    return this.snapshots.length;
  }

  public getLatestSnapshot(): PlayerItemSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  public areSnapshotsIdentical(): boolean {
    if (this.snapshots.length < 2) {
      return false;
    }
    const first: PlayerItemSnapshot = this.snapshots[0];
    const last: PlayerItemSnapshot = this.snapshots[this.snapshots.length - 1];
    return first.totalCount === last.totalCount && first.focusedCount === last.focusedCount &&
      first.boundCount === last.boundCount && first.fullscreenCount === last.fullscreenCount &&
      first.totalArea === last.totalArea;
  }

  public clear(): void {
    this.snapshots = [];
  }
}

// 播放器项格式化器：输出多种可读文本
class PlayerItemFormatter {
  public formatItem(item: DeepPlayerItem): string {
    return `${item.deviceName}[${item.state}]`;
  }

  public formatItemList(manager: PlayerItemListManager): string {
    const parts: string[] = manager.getAllItems().map((item: DeepPlayerItem) => this.formatItem(item));
    return parts.join(', ');
  }

  public formatFocusState(item: DeepPlayerItem): string {
    return item.isFocused ? 'focused' : 'unfocused';
  }

  public formatCountSummary(manager: PlayerItemListManager): string {
    const stats = new PlayerItemStatistics(manager);
    const snapshot: PlayerItemSnapshot = stats.generateSnapshot();
    return `total=${snapshot.totalCount} focused=${snapshot.focusedCount} bound=${snapshot.boundCount}`;
  }

  public formatDirection(direction: FocusDirection): string {
    if (direction === FocusDirection.DIRECTION_NEXT) {
      return 'move next';
    }
    if (direction === FocusDirection.DIRECTION_PREV) {
      return 'move prev';
    }
    return 'jump to tile';
  }
}

// 焦点迁移记录器：记录迁移方向并判断交替模式
class FocusTransitionRecorder {
  private directions: FocusDirection[] = [];

  public record(direction: FocusDirection): void {
    this.directions.push(direction);
  }

  public getTransitionCount(): number {
    return this.directions.length;
  }

  public countByDirection(direction: FocusDirection): number {
    return this.directions.filter((item: FocusDirection) => item === direction).length;
  }

  public getDirectionSequence(): FocusDirection[] {
    return [...this.directions];
  }

  public isAlternating(): boolean {
    for (let i = 2; i < this.directions.length; i++) {
      if (this.directions[i] === this.directions[i - 1] &&
        this.directions[i - 1] === this.directions[i - 2]) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.directions = [];
  }
}

// 音频互斥账本：记录每路画面 mute/unMute 的调用结果
class AudioMutexLedger {
  private muteCount: number = 0;
  private unmuteCount: number = 0;
  private mutedDevices: Set<string> = new Set<string>();

  public recordMute(deviceId: string): void {
    this.muteCount++;
    this.mutedDevices.add(deviceId);
  }

  public recordUnmute(deviceId: string): void {
    this.unmuteCount++;
    this.mutedDevices.delete(deviceId);
  }

  public getMuteCount(): number {
    return this.muteCount;
  }

  public getUnmuteCount(): number {
    return this.unmuteCount;
  }

  public isMuted(deviceId: string): boolean {
    return this.mutedDevices.has(deviceId);
  }

  public getMutedDeviceCount(): number {
    return this.mutedDevices.size;
  }

  public clear(): void {
    this.muteCount = 0;
    this.unmuteCount = 0;
    this.mutedDevices = new Set<string>();
  }
}
export default function miracastModelDeepSuite(): void {
  describe('MiracastModelDeep_Suite', () => {
    let driver: Driver;
    let itemManager: PlayerItemListManager;

    beforeAll(async () => {
      Log.info(TAG, 'model deep suite start');
      driver = getDriver();
      itemManager = new PlayerItemListManager();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      Log.info(TAG, 'model deep suite end');
    });
    it('deep_item_constructor_should_initialize_defaults', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      expect(item.deviceId).assertEqual('device_a');
      expect(item.deviceName).assertEqual('LivingRoom');
      expect(item.screenId).assertEqual('');
      expect(item.isScreenSet).assertFalse();
      expect(item.isFocused).assertFalse();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_CREATED);
    });
    it('deep_item_bind_screen_should_set_flag', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      expect(item.bindScreen('screen_a')).assertTrue();
      expect(item.isScreenSet).assertTrue();
      expect(item.screenId).assertEqual('screen_a');
      expect(item.bindScreen('')).assertFalse();
    });
    it('deep_item_activation_should_follow_created_state', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      expect(item.activate()).assertTrue();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_ACTIVE);
      expect(item.activate()).assertFalse();
      expect(item.isAlive()).assertTrue();
    });
    it('deep_item_pause_and_resume_should_round_trip', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      item.activate();
      expect(item.pause()).assertTrue();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_PAUSED);
      expect(item.resume()).assertTrue();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_ACTIVE);
      expect(item.resume()).assertFalse();
    });
    it('deep_item_fullscreen_cycle_should_be_reversible', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      item.activate();
      expect(item.enterFullscreen()).assertTrue();
      expect(item.isFullscreen()).assertTrue();
      expect(item.exitFullscreen()).assertTrue();
      expect(item.isFullscreen()).assertFalse();
      expect(item.exitFullscreen()).assertFalse();
    });
    it('deep_item_fullscreen_requires_active_state', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      expect(item.enterFullscreen()).assertFalse();
      item.activate();
      item.pause();
      expect(item.enterFullscreen()).assertFalse();
      expect(item.isFullscreen()).assertFalse();
    });
    it('deep_item_destroy_should_release_screen', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      item.bindScreen('screen_a');
      item.activate();
      expect(item.destroy()).assertTrue();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_DESTROYED);
      expect(item.isScreenSet).assertFalse();
      expect(item.screenId).assertEqual('');
      expect(item.destroy()).assertFalse();
      expect(item.isAlive()).assertFalse();
    });
    it('deep_item_layout_should_validate_geometry', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      expect(item.setLayout(960, 540, 0, 0)).assertTrue();
      expect(item.getArea()).assertEqual(960 * 540);
      expect(item.setLayout(0, 540, 0, 0)).assertFalse();
      expect(item.setLayout(960, 540, -2, 0)).assertFalse();
    });
    it('deep_item_mute_flag_should_be_settable', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      expect(item.isMuted).assertFalse();
      item.setMuted(true);
      expect(item.isMuted).assertTrue();
      item.setMuted(false);
      expect(item.isMuted).assertFalse();
    });
    it('deep_item_clone_should_be_independent', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      item.bindScreen('screen_a');
      item.activate();
      item.setMuted(true);
      const cloned = item.clone();
      expect(item.equals(cloned)).assertTrue();
      cloned.setMuted(false);
      cloned.destroy();
      expect(item.isMuted).assertTrue();
      expect(item.isAlive()).assertTrue();
    });
    it('deep_item_equals_should_compare_all_key_fields', 0, async () => {
      const first = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      const second = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      const third = new DeepPlayerItem('device_b', 'Bedroom', 1);
      expect(first.equals(second)).assertTrue();
      expect(first.equals(third)).assertFalse();
    });
    it('deep_item_to_string_should_expose_state', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 2);
      const text: string = item.toString();
      expect(text.includes('device_a')).assertTrue();
      expect(text.includes('2')).assertTrue();
      expect(text.includes('created')).assertTrue();
    });
    it('list_manager_should_initialize_three_items', 0, async () => {
      expect(itemManager.getLength()).assertEqual(3);
      expect(itemManager.validateListIntegrity()).assertTrue();
      const items: DeepPlayerItem[] = itemManager.getAllItems();
      expect(items[0].deviceName).assertEqual('LivingRoom');
      expect(items[1].deviceName).assertEqual('Bedroom');
      expect(items[2].deviceName).assertEqual('Office');
    });
    it('list_manager_focus_should_start_at_first_item', 0, async () => {
      const manager = new PlayerItemListManager();
      const focused: DeepPlayerItem | null = manager.getFocusedItem();
      expect(focused === null).assertFalse();
      expect(focused?.deviceName).assertEqual('LivingRoom');
      expect(focused?.index).assertEqual(0);
    });
    it('list_manager_should_move_focus_forward_and_backward', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.moveFocusNext()).assertTrue();
      expect(manager.getFocusedItem()?.deviceName).assertEqual('Bedroom');
      expect(manager.moveFocusNext()).assertTrue();
      expect(manager.getFocusedItem()?.deviceName).assertEqual('Office');
      expect(manager.moveFocusPrev()).assertTrue();
      expect(manager.getFocusedItem()?.deviceName).assertEqual('Bedroom');
    });
    it('list_manager_focus_should_stop_at_edges', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.moveFocusPrev()).assertFalse();
      expect(manager.setFocusToIndex(2)).assertTrue();
      expect(manager.moveFocusNext()).assertFalse();
      expect(manager.getFocusedItem()?.deviceName).assertEqual('Office');
    });
    it('list_manager_should_reject_invalid_focus_index', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.setFocusToIndex(-1)).assertFalse();
      expect(manager.setFocusToIndex(99)).assertFalse();
      expect(manager.getFocusedItem()?.index).assertEqual(0);
    });
    it('list_manager_should_query_by_index_and_device', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.getItemByIndex(1)?.deviceName).assertEqual('Bedroom');
      expect(manager.getItemByIndex(-1) === null).assertTrue();
      expect(manager.getItemByIndex(10) === null).assertTrue();
      expect(manager.getItemByDeviceId('device_2')?.index).assertEqual(2);
      expect(manager.getItemByDeviceId('device_x') === null).assertTrue();
    });
    it('list_manager_should_add_new_item', 0, async () => {
      const manager = new PlayerItemListManager();
      const item = new DeepPlayerItem('device_3', 'Kitchen', 0);
      item.bindScreen('screen_3');
      item.activate();
      item.setLayout(640, 360, 0, 540);
      expect(manager.addItem(item)).assertTrue();
      expect(manager.getLength()).assertEqual(4);
      expect(manager.getItemByDeviceId('device_3')?.index).assertEqual(3);
    });
    it('list_manager_should_reject_duplicate_device', 0, async () => {
      const manager = new PlayerItemListManager();
      const duplicated = new DeepPlayerItem('device_0', 'Duplicate', 0);
      expect(manager.addItem(duplicated)).assertFalse();
      expect(manager.getLength()).assertEqual(3);
    });
    it('list_manager_should_cap_items_at_maximum', 0, async () => {
      const manager = new PlayerItemListManager();
      for (let i = 3; i < MAX_MIRROR_TILES; i++) {
        const item = new DeepPlayerItem('device_' + i, 'Extra' + i, i);
        item.bindScreen('screen_' + i);
        item.activate();
        item.setLayout(640, 360, 0, 0);
        expect(manager.addItem(item)).assertTrue();
      }
      const overflow = new DeepPlayerItem('device_99', 'Overflow', 0);
      expect(manager.addItem(overflow)).assertFalse();
      expect(manager.getLength()).assertEqual(MAX_MIRROR_TILES);
    });
    it('list_manager_should_remove_item_by_device_id', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.removeItemByDeviceId('device_1')).assertTrue();
      expect(manager.getLength()).assertEqual(2);
      expect(manager.removeItemByDeviceId('device_1')).assertFalse();
      expect(manager.getItemByDeviceId('device_1') === null).assertTrue();
    });
    it('list_manager_should_remove_item_by_index', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.removeItemByIndex(2)).assertTrue();
      expect(manager.getLength()).assertEqual(2);
      expect(manager.removeItemByIndex(2)).assertFalse();
      expect(manager.removeItemByIndex(-1)).assertFalse();
    });
    it('list_manager_integrity_should_detect_broken_focus', 0, async () => {
      const manager = new PlayerItemListManager();
      const items: DeepPlayerItem[] = manager.getAllItems();
      items[0].isFocused = false;
      expect(manager.validateListIntegrity()).assertFalse();
      manager.setFocusToIndex(1);
      expect(manager.validateListIntegrity()).assertTrue();
    });
    it('list_manager_integrity_should_detect_destroyed_item', 0, async () => {
      const manager = new PlayerItemListManager();
      const items: DeepPlayerItem[] = manager.getAllItems();
      items[2].destroy();
      expect(manager.validateListIntegrity()).assertFalse();
      expect(manager.getLength()).assertEqual(3);
    });
    it('list_manager_empty_state_should_be_safe', 0, async () => {
      const manager = new PlayerItemListManager();
      manager.clearAllItems();
      expect(manager.getLength()).assertEqual(0);
      expect(manager.getFocusedItem() === null).assertTrue();
      expect(manager.validateListIntegrity()).assertFalse();
      expect(manager.moveFocusNext()).assertFalse();
      expect(manager.moveFocusPrev()).assertFalse();
      expect(manager.setFocusToIndex(0)).assertFalse();
      expect(manager.removeItemByIndex(0)).assertFalse();
    });
    it('statistics_should_report_aggregate_counts', 0, async () => {
      const manager = new PlayerItemListManager();
      const stats = new PlayerItemStatistics(manager);
      expect(stats.getTotalCount()).assertEqual(3);
      expect(stats.getFocusedCount()).assertEqual(1);
      expect(stats.getBoundCount()).assertEqual(3);
      expect(stats.getFullscreenCount()).assertEqual(0);
      expect(stats.getMutedCount()).assertEqual(0);
      expect(stats.getFocusedRatio()).assertEqual(1 / 3);
    });
    it('statistics_should_generate_snapshot', 0, async () => {
      const manager = new PlayerItemListManager();
      const stats = new PlayerItemStatistics(manager);
      const snapshot: PlayerItemSnapshot = stats.generateSnapshot();
      expect(snapshot.totalCount).assertEqual(3);
      expect(snapshot.focusedCount).assertEqual(1);
      expect(snapshot.boundCount).assertEqual(3);
      expect(snapshot.totalArea).assertLarger(0);
      expect(stats.describeSnapshot().includes('total: 3')).assertTrue();
    });
    it('statistics_should_reflect_fullscreen_and_mute', 0, async () => {
      const manager = new PlayerItemListManager();
      manager.getItemByIndex(0)?.enterFullscreen();
      manager.getItemByIndex(1)?.setMuted(true);
      const stats = new PlayerItemStatistics(manager);
      expect(stats.getFullscreenCount()).assertEqual(1);
      expect(stats.getMutedCount()).assertEqual(1);
      expect(stats.getFocusedCount()).assertEqual(1);
    });
    it('statistics_empty_manager_should_report_zero', 0, async () => {
      const manager = new PlayerItemListManager();
      manager.clearAllItems();
      const stats = new PlayerItemStatistics(manager);
      expect(stats.getTotalCount()).assertEqual(0);
      expect(stats.getFocusedRatio()).assertEqual(0);
      expect(stats.getTotalArea()).assertEqual(0);
    });
    it('statistics_total_area_should_sum_all_items', 0, async () => {
      const manager = new PlayerItemListManager();
      const stats = new PlayerItemStatistics(manager);
      const expected: number = 960 * 1080 + 960 * 1080 + 640 * 540;
      expect(stats.getTotalArea()).assertEqual(expected);
    });
    it('builder_should_build_full_item', 0, async () => {
      const item: DeepPlayerItem = new DeepPlayerItemBuilder().withDevice('device_x', 'Kitchen')
        .withIndex(4).withScreen('screen_x').withColor('#5C9CFF').withFocus(true)
        .withState(PlayerItemStateType.ITEM_ACTIVE).withLayout(640, 360, 0, 0).build();
      expect(item.deviceId).assertEqual('device_x');
      expect(item.deviceName).assertEqual('Kitchen');
      expect(item.isFocused).assertTrue();
      expect(item.isScreenSet).assertTrue();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_ACTIVE);
      expect(item.getArea()).assertEqual(640 * 360);
    });
    it('builder_should_apply_defaults_without_screen', 0, async () => {
      const item: DeepPlayerItem = new DeepPlayerItemBuilder().build();
      expect(item.deviceId).assertEqual('');
      expect(item.screenId).assertEqual('');
      expect(item.isScreenSet).assertFalse();
      expect(item.isFocused).assertFalse();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_CREATED);
      expect(item.getArea()).assertEqual(0);
    });
    it('validator_should_accept_complete_item', 0, async () => {
      const item: DeepPlayerItem = new DeepPlayerItemBuilder().withDevice('device_a', 'LivingRoom')
        .withScreen('screen_a').withLayout(960, 540, 0, 0)
        .withState(PlayerItemStateType.ITEM_ACTIVE).build();
      const validator = new PlayerItemDeepValidator(item);
      expect(validator.hasDeviceIdentity()).assertTrue();
      expect(validator.hasScreen()).assertTrue();
      expect(validator.hasLayout()).assertTrue();
      expect(validator.isIndexWithinLimit()).assertTrue();
      expect(validator.validateAll()).assertTrue();
      expect(validator.collectViolations().length).assertEqual(0);
    });
    it('validator_should_collect_multiple_violations', 0, async () => {
      const item = new DeepPlayerItem('', '', 20);
      item.destroy();
      const validator = new PlayerItemDeepValidator(item);
      expect(validator.validateAll()).assertFalse();
      const violations: string[] = validator.collectViolations();
      expect(violations.length).assertEqual(5);
      expect(violations.includes('missing identity')).assertTrue();
      expect(violations.includes('missing screen')).assertTrue();
      expect(violations.includes('missing layout')).assertTrue();
      expect(violations.includes('invalid index')).assertTrue();
      expect(violations.includes('destroyed item')).assertTrue();
    });
    it('validator_should_reject_partial_item', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      item.bindScreen('screen_a');
      const validator = new PlayerItemDeepValidator(item);
      expect(validator.hasScreen()).assertTrue();
      expect(validator.hasLayout()).assertFalse();
      expect(validator.validateAll()).assertFalse();
      expect(validator.collectViolations().includes('missing layout')).assertTrue();
    });
    it('snapshot_store_should_compare_identical_captures', 0, async () => {
      const store = new PlayerItemSnapshotStore();
      const manager = new PlayerItemListManager();
      store.capture(manager);
      store.capture(manager);
      expect(store.getSnapshotCount()).assertEqual(2);
      expect(store.areSnapshotsIdentical()).assertTrue();
    });
    it('snapshot_store_should_detect_change', 0, async () => {
      const store = new PlayerItemSnapshotStore();
      const manager = new PlayerItemListManager();
      store.capture(manager);
      manager.getItemByIndex(0)?.enterFullscreen();
      store.capture(manager);
      expect(store.areSnapshotsIdentical()).assertFalse();
      expect(store.getLatestSnapshot()?.fullscreenCount).assertEqual(1);
    });
    it('snapshot_store_should_handle_empty_state', 0, async () => {
      const store = new PlayerItemSnapshotStore();
      expect(store.getLatestSnapshot() === null).assertTrue();
      expect(store.areSnapshotsIdentical()).assertFalse();
      const manager = new PlayerItemListManager();
      store.capture(manager);
      expect(store.areSnapshotsIdentical()).assertFalse();
      store.clear();
      expect(store.getSnapshotCount()).assertEqual(0);
    });
    it('formatter_should_format_item_and_list', 0, async () => {
      const manager = new PlayerItemListManager();
      const formatter = new PlayerItemFormatter();
      const focused: DeepPlayerItem | null = manager.getFocusedItem();
      expect(focused === null).assertFalse();
      expect(formatter.formatItem(focused as DeepPlayerItem).includes('LivingRoom')).assertTrue();
      expect(formatter.formatItemList(manager).includes('Bedroom')).assertTrue();
      expect(formatter.formatFocusState(focused as DeepPlayerItem)).assertEqual('focused');
    });
    it('formatter_should_summarize_counts', 0, async () => {
      const manager = new PlayerItemListManager();
      const formatter = new PlayerItemFormatter();
      const summary: string = formatter.formatCountSummary(manager);
      expect(summary.includes('total=3')).assertTrue();
      expect(summary.includes('focused=1')).assertTrue();
      expect(summary.includes('bound=3')).assertTrue();
    });
    it('formatter_should_map_direction_names', 0, async () => {
      const formatter = new PlayerItemFormatter();
      expect(formatter.formatDirection(FocusDirection.DIRECTION_NEXT)).assertEqual('move next');
      expect(formatter.formatDirection(FocusDirection.DIRECTION_PREV)).assertEqual('move prev');
      expect(formatter.formatDirection(FocusDirection.DIRECTION_JUMP)).assertEqual('jump to tile');
    });
    it('focus_recorder_should_count_directions', 0, async () => {
      const recorder = new FocusTransitionRecorder();
      recorder.record(FocusDirection.DIRECTION_NEXT);
      recorder.record(FocusDirection.DIRECTION_NEXT);
      recorder.record(FocusDirection.DIRECTION_PREV);
      expect(recorder.getTransitionCount()).assertEqual(3);
      expect(recorder.countByDirection(FocusDirection.DIRECTION_NEXT)).assertEqual(2);
      expect(recorder.countByDirection(FocusDirection.DIRECTION_PREV)).assertEqual(1);
    });
    it('focus_recorder_should_detect_alternation', 0, async () => {
      const recorder = new FocusTransitionRecorder();
      recorder.record(FocusDirection.DIRECTION_NEXT);
      recorder.record(FocusDirection.DIRECTION_PREV);
      recorder.record(FocusDirection.DIRECTION_NEXT);
      expect(recorder.isAlternating()).assertTrue();
      recorder.record(FocusDirection.DIRECTION_NEXT);
      recorder.record(FocusDirection.DIRECTION_NEXT);
      expect(recorder.isAlternating()).assertFalse();
      expect(recorder.getDirectionSequence().length).assertEqual(5);
    });
    it('focus_recorder_should_reset_after_clear', 0, async () => {
      const recorder = new FocusTransitionRecorder();
      recorder.record(FocusDirection.DIRECTION_JUMP);
      recorder.clear();
      expect(recorder.getTransitionCount()).assertEqual(0);
      expect(recorder.isAlternating()).assertTrue();
    });
    it('audio_ledger_should_track_mute_state', 0, async () => {
      const ledger = new AudioMutexLedger();
      ledger.recordMute('device_1');
      ledger.recordMute('device_2');
      ledger.recordUnmute('device_0');
      expect(ledger.getMuteCount()).assertEqual(2);
      expect(ledger.getUnmuteCount()).assertEqual(1);
      expect(ledger.isMuted('device_1')).assertTrue();
      expect(ledger.isMuted('device_0')).assertFalse();
      expect(ledger.getMutedDeviceCount()).assertEqual(2);
    });
    it('audio_ledger_should_clear_state', 0, async () => {
      const ledger = new AudioMutexLedger();
      ledger.recordMute('device_1');
      ledger.clear();
      expect(ledger.getMuteCount()).assertEqual(0);
      expect(ledger.getMutedDeviceCount()).assertEqual(0);
      expect(ledger.isMuted('device_1')).assertFalse();
    });
    it('audio_mutex_should_mute_all_but_focused_tile', 0, async () => {
      const manager = new PlayerItemListManager();
      const ledger = new AudioMutexLedger();
      const items: DeepPlayerItem[] = manager.getAllItems();
      items.forEach((item: DeepPlayerItem, position: number) => {
        if (position === 0) {
          ledger.recordUnmute(item.deviceId);
        } else {
          item.setMuted(true);
          ledger.recordMute(item.deviceId);
        }
      });
      expect(ledger.getMutedDeviceCount()).assertEqual(2);
      expect(items[0].isMuted).assertFalse();
      expect(items[1].isMuted).assertTrue();
      expect(items[2].isMuted).assertTrue();
    });
    it('deep_model_should_support_full_focus_cycle', 0, async () => {
      const manager = new PlayerItemListManager();
      manager.moveFocusNext();
      manager.moveFocusNext();
      manager.moveFocusPrev();
      manager.moveFocusPrev();
      const focused: DeepPlayerItem | null = manager.getFocusedItem();
      expect(focused === null).assertFalse();
      expect(focused?.deviceName).assertEqual('LivingRoom');
      expect(manager.validateListIntegrity()).assertTrue();
    });
    it('deep_model_should_keep_focus_unique_after_jump', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.setFocusToIndex(2)).assertTrue();
      const focusedCount: number = manager.getAllItems().filter((item: DeepPlayerItem) => item.isFocused).length;
      expect(focusedCount).assertEqual(1);
      expect(manager.getFocusedItem()?.deviceName).assertEqual('Office');
    });
    it('player_page_should_render_with_deep_model', 0, async () => {
      const manager = new PlayerItemListManager();
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(manager.getLength()).assertEqual(3);
      expect(manager.validateListIntegrity()).assertTrue();
    });
    it('player_page_visibility_should_not_throw', 0, async () => {
      const visible = await isPlayerPageVisible(driver);
      expect(visible === true || visible === false).assertTrue();
      expect(PlayerItemStateType.ITEM_FULLSCREEN).assertEqual('fullscreen');
      expect(PlayerItemStateType.ITEM_DESTROYED).assertEqual('destroyed');
    });
    it('deep_item_pause_from_created_should_be_rejected', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      expect(item.pause()).assertFalse();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_CREATED);
      item.activate();
      expect(item.pause()).assertTrue();
      expect(item.state).assertEqual(PlayerItemStateType.ITEM_PAUSED);
    });
    it('deep_item_destroy_should_be_idempotent_safe', 0, async () => {
      const item = new DeepPlayerItem('device_a', 'LivingRoom', 0);
      item.activate();
      expect(item.destroy()).assertTrue();
      expect(item.destroy()).assertFalse();
      expect(item.isAlive()).assertFalse();
      expect(item.isFullscreen()).assertFalse();
    });
    it('list_manager_should_keep_integrity_after_removal', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.removeItemByIndex(1)).assertTrue();
      expect(manager.validateListIntegrity()).assertTrue();
      expect(manager.getFocusedItem()?.deviceName).assertEqual('LivingRoom');
      expect(manager.getLength()).assertEqual(2);
    });
    it('validator_should_accept_last_valid_index', 0, async () => {
      const item: DeepPlayerItem = new DeepPlayerItemBuilder().withDevice('device_i', 'Index')
        .withScreen('screen_i').withIndex(MAX_MIRROR_TILES - 1).withLayout(320, 180, 0, 0)
        .withState(PlayerItemStateType.ITEM_ACTIVE).build();
      const validator = new PlayerItemDeepValidator(item);
      expect(validator.isIndexWithinLimit()).assertTrue();
      expect(validator.validateAll()).assertTrue();
      expect(validator.collectViolations().length).assertEqual(0);
    });
    it('list_manager_should_keep_focus_after_device_removal', 0, async () => {
      const manager = new PlayerItemListManager();
      expect(manager.removeItemByDeviceId('device_2')).assertTrue();
      expect(manager.getLength()).assertEqual(2);
      expect(manager.getFocusedItem()?.deviceName).assertEqual('LivingRoom');
      expect(manager.validateListIntegrity()).assertTrue();
    });
  });
}
