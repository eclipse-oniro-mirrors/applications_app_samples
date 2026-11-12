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
  KEY_MENU,
  miracastComponentCount,
  isPlayerPageVisible,
  waitForPageStable,
  pressAndWait,
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_PAGE_RENDER,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

const TAG: string = 'MiracastItemInfoModelSuite';

// 投屏画面几何信息：一个镜像画面在播放页中的位置与尺寸
interface TileGeometry {
  x: number;
  y: number;
  width: number;
  height: number;
}

// 播放器布局模式枚举：按投屏路数选择全屏 / 左右二分 / 四宫格 / 九宫格
enum PlayerLayoutMode {
  MODE_FULL_SCREEN = 'full_screen',
  MODE_SPLIT_TWO = 'split_two',
  MODE_GRID_FOUR = 'grid_four',
  MODE_GRID_NINE = 'grid_nine'
}

// 画面焦点视觉枚举：描述镜像画面在焦点变化时的边框状态
enum TileFocusVisual {
  VISUAL_NORMAL = 'normal',
  VISUAL_FOCUSED = 'focused',
  VISUAL_DIMMED = 'dimmed'
}

// 播放器项模型：对应 PlayerPage 的 PlayerItem（deviceId/screenId/布局字段）
class MiracastPlayerItem {
  public deviceId: string;
  public screenId: string;
  public isScreenSet: boolean;
  public index: number;
  public color: string;
  public isFocused: boolean;
  public layoutWidth: number;
  public layoutHeight: number;
  public layoutX: number;
  public layoutY: number;

  constructor(deviceId: string, screenId: string, index: number) {
    this.deviceId = deviceId;
    this.screenId = screenId;
    this.isScreenSet = false;
    this.index = index;
    this.color = '#FF000000';
    this.isFocused = false;
    this.layoutWidth = 0;
    this.layoutHeight = 0;
    this.layoutX = 0;
    this.layoutY = 0;
  }

  public static createDefault(): MiracastPlayerItem {
    return new MiracastPlayerItem('', '', 0);
  }

  public getDeviceId(): string {
    return this.deviceId;
  }

  public getScreenId(): string {
    return this.screenId;
  }

  public bindScreen(screenId: string): boolean {
    if (screenId.length === 0) {
      return false;
    }
    this.screenId = screenId;
    this.isScreenSet = true;
    return true;
  }

  public releaseScreen(): void {
    this.screenId = '';
    this.isScreenSet = false;
  }

  public setFocusState(focused: boolean): void {
    this.isFocused = focused;
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

  public getFocusVisual(): TileFocusVisual {
    if (!this.isScreenSet) {
      return TileFocusVisual.VISUAL_DIMMED;
    }
    return this.isFocused ? TileFocusVisual.VISUAL_FOCUSED : TileFocusVisual.VISUAL_NORMAL;
  }

  public isValidIndex(maxIndex: number): boolean {
    return this.index >= 0 && this.index < maxIndex;
  }

  public hasScreenBinding(): boolean {
    return this.isScreenSet && this.screenId.length > 0;
  }

  public clone(): MiracastPlayerItem {
    const cloned = new MiracastPlayerItem(this.deviceId, this.screenId, this.index);
    cloned.isScreenSet = this.isScreenSet;
    cloned.color = this.color;
    cloned.isFocused = this.isFocused;
    cloned.layoutWidth = this.layoutWidth;
    cloned.layoutHeight = this.layoutHeight;
    cloned.layoutX = this.layoutX;
    cloned.layoutY = this.layoutY;
    return cloned;
  }

  public equals(other: MiracastPlayerItem): boolean {
    return this.deviceId === other.deviceId && this.screenId === other.screenId &&
      this.isScreenSet === other.isScreenSet && this.index === other.index &&
      this.color === other.color && this.isFocused === other.isFocused &&
      this.layoutWidth === other.layoutWidth && this.layoutHeight === other.layoutHeight &&
      this.layoutX === other.layoutX && this.layoutY === other.layoutY;
  }

  public toString(): string {
    return `PlayerItem{deviceId: ${this.deviceId}, index: ${this.index}, screenSet: ${this.isScreenSet}}`;
  }
}
// 布局计算器：按投屏路数计算列数、行数与每路画面的几何信息
class TileLayoutCalculator {
  public static readonly SCREEN_WIDTH: number = 1920;
  public static readonly SCREEN_HEIGHT: number = 1080;

  public static getColumns(tileCount: number): number {
    if (tileCount <= 1) {
      return 1;
    }
    if (tileCount === 2) {
      return 2;
    }
    if (tileCount <= 4) {
      return 2;
    }
    return 3;
  }

  public static getRows(tileCount: number): number {
    if (tileCount <= 2) {
      return 1;
    }
    if (tileCount <= 4) {
      return 2;
    }
    return 3;
  }

  public static getLayoutMode(tileCount: number): PlayerLayoutMode {
    if (tileCount <= 1) {
      return PlayerLayoutMode.MODE_FULL_SCREEN;
    }
    if (tileCount === 2) {
      return PlayerLayoutMode.MODE_SPLIT_TWO;
    }
    if (tileCount <= 4) {
      return PlayerLayoutMode.MODE_GRID_FOUR;
    }
    return PlayerLayoutMode.MODE_GRID_NINE;
  }

  public static computeTile(tileCount: number, index: number): TileGeometry {
    const columns = TileLayoutCalculator.getColumns(tileCount);
    const rows = TileLayoutCalculator.getRows(tileCount);
    const width = Math.floor(TileLayoutCalculator.SCREEN_WIDTH / columns);
    const height = Math.floor(TileLayoutCalculator.SCREEN_HEIGHT / rows);
    const column = index % columns;
    const row = Math.floor(index / columns);
    return {
      x: column * width,
      y: row * height,
      width: width,
      height: height
    };
  }

  public static isValidTileCount(tileCount: number): boolean {
    return tileCount >= 1 && tileCount <= MAX_MIRROR_TILES;
  }

  public static isFullScreen(tileCount: number): boolean {
    return tileCount === 1;
  }

  public static getTotalArea(tileCount: number): number {
    const geometry = TileLayoutCalculator.computeTile(tileCount, 0);
    return geometry.width * geometry.height * tileCount;
  }
}

// 画面颜色调色板：为每路镜像画面分配可区分的底色
class TileColorPalette {
  private static readonly COLORS: string[] = ['#FF5C5C', '#5C9CFF', '#5CD65C', '#FFC75C', '#B45CFF',
    '#5CE0D6', '#FF8A5C', '#8A5CFF', '#C7C75C'];

  public static getColor(index: number): string {
    if (index < 0 || index >= TileColorPalette.COLORS.length) {
      return '#FF000000';
    }
    return TileColorPalette.COLORS[index];
  }

  public static getColorCount(): number {
    return TileColorPalette.COLORS.length;
  }

  public static isKnownColor(color: string): boolean {
    return TileColorPalette.COLORS.includes(color);
  }

  public static getPalette(): string[] {
    return [...TileColorPalette.COLORS];
  }
}

// 播放器项构建器：以链式方式构建 PlayerItem
class PlayerItemBuilder {
  private deviceId: string = '';
  private screenId: string = '';
  private index: number = 0;
  private color: string = '#FF000000';
  private isFocused: boolean = false;
  private layoutWidth: number = 0;
  private layoutHeight: number = 0;
  private layoutX: number = 0;
  private layoutY: number = 0;

  public withDeviceId(deviceId: string): PlayerItemBuilder {
    this.deviceId = deviceId;
    return this;
  }

  public withScreenId(screenId: string): PlayerItemBuilder {
    this.screenId = screenId;
    return this;
  }

  public withIndex(index: number): PlayerItemBuilder {
    this.index = index;
    return this;
  }

  public withColor(color: string): PlayerItemBuilder {
    this.color = color;
    return this;
  }

  public withFocus(isFocused: boolean): PlayerItemBuilder {
    this.isFocused = isFocused;
    return this;
  }

  public withLayout(width: number, height: number, x: number, y: number): PlayerItemBuilder {
    this.layoutWidth = width;
    this.layoutHeight = height;
    this.layoutX = x;
    this.layoutY = y;
    return this;
  }

  public build(): MiracastPlayerItem {
    const item = new MiracastPlayerItem(this.deviceId, this.screenId, this.index);
    item.isScreenSet = this.screenId.length > 0;
    item.color = this.color;
    item.isFocused = this.isFocused;
    item.layoutWidth = this.layoutWidth;
    item.layoutHeight = this.layoutHeight;
    item.layoutX = this.layoutX;
    item.layoutY = this.layoutY;
    return item;
  }
}
// 播放器项排序器：按索引或设备 id 排序，保证多路画面顺序稳定
class PlayerItemSorter {
  public static sortByIndex(items: MiracastPlayerItem[]): MiracastPlayerItem[] {
    const copied: MiracastPlayerItem[] = [...items];
    copied.sort((a: MiracastPlayerItem, b: MiracastPlayerItem) => a.index - b.index);
    return copied;
  }

  public static sortByDeviceId(items: MiracastPlayerItem[]): MiracastPlayerItem[] {
    const copied: MiracastPlayerItem[] = [...items];
    copied.sort((a: MiracastPlayerItem, b: MiracastPlayerItem) => {
      if (a.deviceId < b.deviceId) {
        return -1;
      }
      if (a.deviceId > b.deviceId) {
        return 1;
      }
      return 0;
    });
    return copied;
  }
}

// 播放器项校验器：校验画面项字段的完整性
class PlayerItemValidator {
  public static hasDeviceId(item: MiracastPlayerItem): boolean {
    return item.deviceId.length > 0;
  }

  public static hasScreenBinding(item: MiracastPlayerItem): boolean {
    return item.hasScreenBinding();
  }

  public static hasPositiveLayout(item: MiracastPlayerItem): boolean {
    return item.layoutWidth > 0 && item.layoutHeight > 0;
  }

  public static isComplete(item: MiracastPlayerItem): boolean {
    return PlayerItemValidator.hasDeviceId(item) && PlayerItemValidator.hasScreenBinding(item) &&
      PlayerItemValidator.hasPositiveLayout(item) && item.isValidIndex(MAX_MIRROR_TILES);
  }

  public static isPlaceholder(item: MiracastPlayerItem): boolean {
    return item.deviceId.length === 0 && item.screenId.length === 0 && item.layoutWidth === 0;
  }

  public static countComplete(items: MiracastPlayerItem[]): number {
    return items.filter((item: MiracastPlayerItem) => PlayerItemValidator.isComplete(item)).length;
  }
}

// 播放器项比较器：按面积、索引与焦点比较画面项
class PlayerItemComparator {
  public static compareByArea(a: MiracastPlayerItem, b: MiracastPlayerItem): number {
    return a.getArea() - b.getArea();
  }

  public static compareByIndex(a: MiracastPlayerItem, b: MiracastPlayerItem): number {
    return a.index - b.index;
  }

  public static compareByFocus(a: MiracastPlayerItem, b: MiracastPlayerItem): number {
    if (a.isFocused === b.isFocused) {
      return 0;
    }
    return a.isFocused ? -1 : 1;
  }
}

// 播放器项集合：管理一组画面项并支持批量查询
class PlayerItemCollection {
  private items: MiracastPlayerItem[] = [];

  public add(item: MiracastPlayerItem): void {
    this.items.push(item);
  }

  public addAll(items: MiracastPlayerItem[]): void {
    this.items.push(...items);
  }

  public getCount(): number {
    return this.items.length;
  }

  public getByIndex(index: number): MiracastPlayerItem | null {
    const found = this.items.filter((item: MiracastPlayerItem) => item.index === index);
    return found.length === 0 ? null : found[0];
  }

  public getFocusedItem(): MiracastPlayerItem | null {
    const found = this.items.filter((item: MiracastPlayerItem) => item.isFocused);
    return found.length === 0 ? null : found[0];
  }

  public getBoundItems(): MiracastPlayerItem[] {
    return this.items.filter((item: MiracastPlayerItem) => item.hasScreenBinding());
  }

  public clear(): void {
    this.items = [];
  }
}

// 播放器项统计器：统计绑定率、焦点数与布局覆盖
class PlayerItemStatistics {
  private items: MiracastPlayerItem[] = [];

  public collect(items: MiracastPlayerItem[]): void {
    this.items.push(...items);
  }

  public getTotalCount(): number {
    return this.items.length;
  }

  public getBoundCount(): number {
    return this.items.filter((item: MiracastPlayerItem) => item.hasScreenBinding()).length;
  }

  public getFocusedCount(): number {
    return this.items.filter((item: MiracastPlayerItem) => item.isFocused).length;
  }

  public getBoundRatio(): number {
    if (this.items.length === 0) {
      return 0;
    }
    return this.getBoundCount() / this.items.length;
  }

  public getTotalArea(): number {
    let total = 0;
    this.items.forEach((item: MiracastPlayerItem) => {
      total += item.getArea();
    });
    return total;
  }

  public clear(): void {
    this.items = [];
  }
}
// 播放器项描述接口：描述一路镜像画面的静态元数据
interface PlayerItemDescriptor {
  deviceId: string;
  index: number;
  layoutMode: PlayerLayoutMode;
  color: string;
}

// 描述工厂：根据索引与路数生成标准描述
class PlayerItemDescriptorFactory {
  public static create(deviceId: string, index: number, tileCount: number): PlayerItemDescriptor {
    return {
      deviceId: deviceId,
      index: index,
      layoutMode: TileLayoutCalculator.getLayoutMode(tileCount),
      color: TileColorPalette.getColor(index)
    };
  }

  public static getLayoutName(mode: PlayerLayoutMode): string {
    switch (mode) {
      case PlayerLayoutMode.MODE_FULL_SCREEN:
        return 'full screen';
      case PlayerLayoutMode.MODE_SPLIT_TWO:
        return 'split two';
      case PlayerLayoutMode.MODE_GRID_FOUR:
        return 'grid four';
      case PlayerLayoutMode.MODE_GRID_NINE:
        return 'grid nine';
      default:
        return 'unknown layout';
    }
  }

  public static getFocusVisualName(visual: TileFocusVisual): string {
    switch (visual) {
      case TileFocusVisual.VISUAL_FOCUSED:
        return 'focused';
      case TileFocusVisual.VISUAL_NORMAL:
        return 'normal';
      case TileFocusVisual.VISUAL_DIMMED:
        return 'dimmed';
      default:
        return 'unknown visual';
    }
  }
}

// 播放器项工厂：批量创建标准多路投屏集合

// 字段提取器：从集合中提取指定字段列表
class PlayerItemFieldExtractor {
  public static extractDeviceIds(items: MiracastPlayerItem[]): string[] {
    return items.map((item: MiracastPlayerItem) => item.deviceId);
  }

  public static extractScreenIds(items: MiracastPlayerItem[]): string[] {
    return items.map((item: MiracastPlayerItem) => item.screenId);
  }

  public static extractIndices(items: MiracastPlayerItem[]): number[] {
    return items.map((item: MiracastPlayerItem) => item.index);
  }

  public static extractFocused(items: MiracastPlayerItem[]): MiracastPlayerItem[] {
    return items.filter((item: MiracastPlayerItem) => item.isFocused);
  }

  public static extractColors(items: MiracastPlayerItem[]): string[] {
    return items.map((item: MiracastPlayerItem) => item.color);
  }
}

// 画面焦点管理器：维护唯一焦点并计算音频互斥结果
class TileFocusManager {
  private items: MiracastPlayerItem[] = [];

  public setItems(items: MiracastPlayerItem[]): void {
    this.items = items;
  }

  public focusByIndex(index: number): boolean {
    if (index < 0 || index >= this.items.length) {
      return false;
    }
    this.items.forEach((item: MiracastPlayerItem, position: number) => {
      item.setFocusState(position === index);
    });
    return true;
  }

  public getFocusedIndex(): number {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].isFocused) {
        return i;
      }
    }
    return -1;
  }

  public shouldMute(index: number): boolean {
    const focusedIndex = this.getFocusedIndex();
    return focusedIndex >= 0 && index !== focusedIndex;
  }

  public getMutedCount(): number {
    if (this.getFocusedIndex() < 0) {
      return 0;
    }
    return this.items.length - 1;
  }

  public getFocusedCount(): number {
    return this.items.filter((item: MiracastPlayerItem) => item.isFocused).length;
  }
}
// 测试夹具工厂：批量/单个构造完整播放条目，避免各用例重复拼装
class PlayerItemFactory {
  public static createSingle(deviceId: string): MiracastPlayerItem {
    return PlayerItemFactory.createAt(deviceId, 0);
  }

  public static createAt(deviceId: string, index: number): MiracastPlayerItem {
    const item: MiracastPlayerItem = new MiracastPlayerItem(deviceId, `screen_${index}`, index);
    item.isScreenSet = true;
    item.layoutWidth = 960;
    item.layoutHeight = 1080;
    item.color = TileColorPalette.getColor(index);
    item.isFocused = index === 0;
    return item;
  }

  public static createCount(count: number): MiracastPlayerItem[] {
    const total: number = count > 0 ? count : 0;
    const items: MiracastPlayerItem[] = [];
    for (let i = 0; i < total; i++) {
      items.push(PlayerItemFactory.createAt(`device_${i}`, i));
    }
    return items;
  }
}

/**
 * 播放条目模型的确定性校验：只依赖本地模型，不触碰真实投屏会话。
 */
export default function miracastItemInfoModelSuite(): void {
  describe('MiracastItemInfoModel_Suite', () => {
    beforeAll(() => {
      Log.info(TAG, 'item info model suite start');
    });
    afterAll(() => {
      Log.info(TAG, 'item info model suite end');
    });

    it('factory_should_create_requested_item_count', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(4);
      expect(items.length).assertEqual(4);
      expect(items[0].deviceId).assertEqual('device_0');
      expect(items[3].index).assertEqual(3);
    });

    it('factory_should_clamp_negative_count', 0, async () => {
      expect(PlayerItemFactory.createCount(-2).length).assertEqual(0);
      expect(PlayerItemFactory.createCount(0).length).assertEqual(0);
    });

    it('factory_should_bind_screen_by_index', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(3);
      expect(items[0].screenId).assertEqual('screen_0');
      expect(items[2].screenId).assertEqual('screen_2');
      expect(items[1].hasScreenBinding()).assertTrue();
    });

    it('factory_should_focus_first_item_only', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(4);
      expect(items.filter((item: MiracastPlayerItem) => item.isFocused).length).assertEqual(1);
      expect(items[0].isFocused).assertTrue();
      expect(items[3].isFocused).assertFalse();
    });

    it('factory_should_use_palette_colors', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(3);
      expect(items[0].color).assertEqual(TileColorPalette.getColor(0));
      expect(items[1].color).assertEqual('#5C9CFF');
    });

    it('item_area_should_follow_layout_size', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createSingle('device_area');
      expect(item.getArea()).assertEqual(960 * 1080);
    });

    it('item_should_reject_empty_screen_binding', 0, async () => {
      const item: MiracastPlayerItem = MiracastPlayerItem.createDefault();
      expect(item.bindScreen('')).assertFalse();
      expect(item.hasScreenBinding()).assertFalse();
    });

    it('item_should_bind_and_release_screen', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createSingle('device_bind');
      item.releaseScreen();
      expect(item.hasScreenBinding()).assertFalse();
      expect(item.bindScreen('screen_rebind')).assertTrue();
      expect(item.hasScreenBinding()).assertTrue();
    });

    it('item_should_reject_invalid_layout', 0, async () => {
      const item: MiracastPlayerItem = MiracastPlayerItem.createDefault();
      expect(item.setLayout(0, 100, 0, 0)).assertFalse();
      expect(item.setLayout(100, -1, 0, 0)).assertFalse();
      expect(item.setLayout(100, 100, -1, 0)).assertFalse();
    });

    it('item_should_apply_valid_layout', 0, async () => {
      const item: MiracastPlayerItem = MiracastPlayerItem.createDefault();
      expect(item.setLayout(480, 270, 0, 0)).assertTrue();
      expect(item.getArea()).assertEqual(480 * 270);
    });

    it('item_clone_should_preserve_layout_and_color', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createCount(2)[1];
      const copy: MiracastPlayerItem = item.clone();
      expect(copy.equals(item)).assertTrue();
      expect(copy.color).assertEqual(item.color);
    });

    it('item_to_string_should_contain_device_id', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createSingle('device_text');
      expect(item.toString().includes('device_text')).assertTrue();
    });

    it('layout_should_pick_columns_by_tile_count', 0, async () => {
      expect(TileLayoutCalculator.getColumns(1)).assertEqual(1);
      expect(TileLayoutCalculator.getColumns(2)).assertEqual(2);
      expect(TileLayoutCalculator.getColumns(4)).assertEqual(2);
      expect(TileLayoutCalculator.getColumns(9)).assertEqual(3);
    });

    it('layout_should_pick_rows_by_tile_count', 0, async () => {
      expect(TileLayoutCalculator.getRows(1)).assertEqual(1);
      expect(TileLayoutCalculator.getRows(2)).assertEqual(1);
      expect(TileLayoutCalculator.getRows(4)).assertEqual(2);
      expect(TileLayoutCalculator.getRows(9)).assertEqual(3);
    });

    it('layout_mode_should_follow_tile_count', 0, async () => {
      expect(TileLayoutCalculator.getLayoutMode(1)).assertEqual(PlayerLayoutMode.MODE_FULL_SCREEN);
      expect(TileLayoutCalculator.getLayoutMode(2)).assertEqual(PlayerLayoutMode.MODE_SPLIT_TWO);
      expect(TileLayoutCalculator.getLayoutMode(3)).assertEqual(PlayerLayoutMode.MODE_GRID_FOUR);
      expect(TileLayoutCalculator.getLayoutMode(5)).assertEqual(PlayerLayoutMode.MODE_GRID_NINE);
    });

    it('layout_tile_origin_should_match_grid', 0, async () => {
      const first: TileGeometry = TileLayoutCalculator.computeTile(2, 0);
      const second: TileGeometry = TileLayoutCalculator.computeTile(2, 1);
      expect(first.x).assertEqual(0);
      expect(second.x).assertEqual(960);
      expect(first.width).assertEqual(960);
    });

    it('layout_quad_tile_should_be_half_screen', 0, async () => {
      const tile: TileGeometry = TileLayoutCalculator.computeTile(4, 3);
      expect(tile.width).assertEqual(960);
      expect(tile.height).assertEqual(540);
      expect(tile.y).assertEqual(540);
    });

    it('layout_nine_tile_should_use_third_screen', 0, async () => {
      const tile: TileGeometry = TileLayoutCalculator.computeTile(9, 8);
      expect(tile.width).assertEqual(640);
      expect(tile.height).assertEqual(360);
      expect(tile.x).assertEqual(1280);
    });

    it('layout_total_area_should_cover_screen', 0, async () => {
      expect(TileLayoutCalculator.getTotalArea(2)).assertEqual(1920 * 1080);
      expect(TileLayoutCalculator.getTotalArea(1)).assertEqual(1920 * 1080);
    });

    it('layout_valid_tile_count_should_be_bounded', 0, async () => {
      expect(TileLayoutCalculator.isValidTileCount(0)).assertFalse();
      expect(TileLayoutCalculator.isValidTileCount(1)).assertTrue();
      expect(TileLayoutCalculator.isValidTileCount(MAX_MIRROR_TILES)).assertTrue();
      expect(TileLayoutCalculator.isValidTileCount(MAX_MIRROR_TILES + 1)).assertFalse();
    });

    it('layout_full_screen_should_match_single_tile', 0, async () => {
      expect(TileLayoutCalculator.isFullScreen(1)).assertTrue();
      expect(TileLayoutCalculator.isFullScreen(2)).assertFalse();
    });

    it('palette_should_return_known_colors', 0, async () => {
      expect(TileColorPalette.getColor(0)).assertEqual('#FF5C5C');
      expect(TileColorPalette.isKnownColor('#5C9CFF')).assertTrue();
      expect(TileColorPalette.isKnownColor('#123456')).assertFalse();
    });

    it('palette_should_fallback_for_out_of_range', 0, async () => {
      expect(TileColorPalette.getColor(-1)).assertEqual('#FF000000');
      expect(TileColorPalette.getColor(TileColorPalette.getColorCount())).assertEqual('#FF000000');
    });

    it('palette_should_expose_stable_size', 0, async () => {
      expect(TileColorPalette.getColorCount()).assertEqual(9);
      expect(TileColorPalette.getPalette().length).assertEqual(9);
    });

    it('sorter_should_order_by_index', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(3);
      const sorted: MiracastPlayerItem[] = PlayerItemSorter.sortByIndex([items[2], items[0], items[1]]);
      expect(sorted[0].index).assertEqual(0);
      expect(sorted[2].index).assertEqual(2);
    });

    it('sorter_should_order_by_device_id', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(3);
      const sorted: MiracastPlayerItem[] = PlayerItemSorter.sortByDeviceId(items);
      expect(sorted[0].deviceId).assertEqual('device_0');
      expect(sorted[2].deviceId).assertEqual('device_2');
    });

    it('validator_should_accept_complete_item', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createSingle('device_ok');
      expect(PlayerItemValidator.isComplete(item)).assertTrue();
      expect(PlayerItemValidator.countComplete(PlayerItemFactory.createCount(3))).assertEqual(3);
    });

    it('validator_should_reject_placeholder_item', 0, async () => {
      const item: MiracastPlayerItem = MiracastPlayerItem.createDefault();
      expect(PlayerItemValidator.isPlaceholder(item)).assertTrue();
      expect(PlayerItemValidator.isComplete(item)).assertFalse();
    });

    it('validator_should_reject_missing_screen', 0, async () => {
      const item: MiracastPlayerItem = new MiracastPlayerItem('device_no_screen', '', 0);
      item.setLayout(100, 100, 0, 0);
      expect(PlayerItemValidator.hasScreenBinding(item)).assertFalse();
      expect(PlayerItemValidator.isComplete(item)).assertFalse();
    });

    it('comparator_should_order_by_area', 0, async () => {
      const small: MiracastPlayerItem = MiracastPlayerItem.createDefault();
      small.setLayout(100, 100, 0, 0);
      const large: MiracastPlayerItem = MiracastPlayerItem.createDefault();
      large.setLayout(200, 200, 0, 0);
      expect(PlayerItemComparator.compareByArea(small, large) < 0).assertTrue();
    });

    it('comparator_should_report_equal_index', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(2);
      expect(PlayerItemComparator.compareByIndex(items[0], items[0])).assertEqual(0);
      expect(PlayerItemComparator.compareByIndex(items[0], items[1]) < 0).assertTrue();
    });

    it('comparator_should_order_focused_first', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(2);
      expect(PlayerItemComparator.compareByFocus(items[0], items[1]) < 0).assertTrue();
    });

    it('collection_should_return_focused_item', 0, async () => {
      const collection = new PlayerItemCollection();
      collection.addAll(PlayerItemFactory.createCount(3));
      const focused: MiracastPlayerItem | null = collection.getFocusedItem();
      expect(focused === null).assertFalse();
      expect(focused?.index).assertEqual(0);
    });

    it('collection_should_count_bound_items', 0, async () => {
      const collection = new PlayerItemCollection();
      collection.addAll(PlayerItemFactory.createCount(4));
      expect(collection.getCount()).assertEqual(4);
      expect(collection.getBoundItems().length).assertEqual(4);
    });

    it('collection_should_clear_all_items', 0, async () => {
      const collection = new PlayerItemCollection();
      collection.add(PlayerItemFactory.createSingle('device_clear'));
      collection.clear();
      expect(collection.getCount()).assertEqual(0);
      expect(collection.getByIndex(0) === null).assertTrue();
    });

    it('statistics_should_compute_bound_ratio', 0, async () => {
      const stats = new PlayerItemStatistics();
      stats.collect(PlayerItemFactory.createCount(4));
      expect(stats.getTotalCount()).assertEqual(4);
      expect(stats.getBoundCount()).assertEqual(4);
      expect(stats.getFocusedCount()).assertEqual(1);
      expect(stats.getBoundRatio()).assertEqual(1);
    });

    it('statistics_should_accumulate_total_area', 0, async () => {
      const stats = new PlayerItemStatistics();
      stats.collect(PlayerItemFactory.createCount(2));
      expect(stats.getTotalArea()).assertEqual(960 * 1080 * 2);
    });

    it('statistics_empty_collection_should_report_zero', 0, async () => {
      const stats = new PlayerItemStatistics();
      expect(stats.getTotalCount()).assertEqual(0);
      expect(stats.getBoundRatio()).assertEqual(0);
      stats.collect(PlayerItemFactory.createCount(2));
      stats.clear();
      expect(stats.getTotalCount()).assertEqual(0);
    });

    it('descriptor_should_describe_nine_grid', 0, async () => {
      const descriptor: PlayerItemDescriptor = PlayerItemDescriptorFactory.create('device_a', 0, 9);
      expect(descriptor.deviceId).assertEqual('device_a');
      expect(descriptor.layoutMode).assertEqual(PlayerLayoutMode.MODE_GRID_NINE);
      expect(PlayerItemDescriptorFactory.getLayoutName(descriptor.layoutMode)).assertEqual('grid nine');
    });

    it('descriptor_should_describe_full_screen', 0, async () => {
      const descriptor: PlayerItemDescriptor = PlayerItemDescriptorFactory.create('device_b', 0, 1);
      expect(descriptor.layoutMode).assertEqual(PlayerLayoutMode.MODE_FULL_SCREEN);
      expect(PlayerItemDescriptorFactory.getLayoutName(PlayerLayoutMode.MODE_FULL_SCREEN)).assertEqual('full screen');
    });

    it('descriptor_should_name_focus_visuals', 0, async () => {
      expect(PlayerItemDescriptorFactory.getFocusVisualName(TileFocusVisual.VISUAL_FOCUSED)).assertEqual('focused');
      expect(PlayerItemDescriptorFactory.getFocusVisualName(TileFocusVisual.VISUAL_DIMMED)).assertEqual('dimmed');
    });

    it('field_extractor_should_extract_identifiers', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(3);
      expect(PlayerItemFieldExtractor.extractDeviceIds(items).length).assertEqual(3);
      expect(PlayerItemFieldExtractor.extractScreenIds(items)[0]).assertEqual('screen_0');
      expect(PlayerItemFieldExtractor.extractIndices(items)[2]).assertEqual(2);
    });

    it('field_extractor_should_extract_focus_and_colors', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(3);
      const focused: MiracastPlayerItem[] = PlayerItemFieldExtractor.extractFocused(items);
      const colors: string[] = PlayerItemFieldExtractor.extractColors(items);
      expect(focused.length).assertEqual(1);
      expect(colors[1]).assertEqual('#5C9CFF');
      expect(colors.length).assertEqual(3);
    });

    it('focus_manager_should_track_single_focus', 0, async () => {
      const manager = new TileFocusManager();
      manager.setItems(PlayerItemFactory.createCount(4));
      expect(manager.getFocusedIndex()).assertEqual(0);
      expect(manager.getFocusedCount()).assertEqual(1);
    });

    it('focus_manager_should_reject_out_of_range_index', 0, async () => {
      const manager = new TileFocusManager();
      manager.setItems(PlayerItemFactory.createCount(3));
      expect(manager.focusByIndex(-1)).assertFalse();
      expect(manager.focusByIndex(3)).assertFalse();
      expect(manager.getFocusedIndex()).assertEqual(0);
    });

    it('focus_manager_should_move_focus', 0, async () => {
      const manager = new TileFocusManager();
      manager.setItems(PlayerItemFactory.createCount(3));
      expect(manager.focusByIndex(2)).assertTrue();
      expect(manager.getFocusedIndex()).assertEqual(2);
      expect(manager.shouldMute(0)).assertTrue();
      expect(manager.shouldMute(2)).assertFalse();
    });

    it('focus_manager_should_count_muted_tiles', 0, async () => {
      const manager = new TileFocusManager();
      manager.setItems(PlayerItemFactory.createCount(5));
      expect(manager.getMutedCount()).assertEqual(4);
    });

    it('item_index_should_be_valid_within_tile_limit', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createAt('device_index', MAX_MIRROR_TILES - 1);
      expect(item.isValidIndex(MAX_MIRROR_TILES)).assertTrue();
      expect(item.index).assertEqual(MAX_MIRROR_TILES - 1);
    });

    it('item_should_report_device_and_screen_ids', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createAt('device_ids', 2);
      expect(item.getDeviceId()).assertEqual('device_ids');
      expect(item.getScreenId()).assertEqual('screen_2');
    });

    it('item_focus_state_should_drive_visual', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createSingle('device_focus');
      item.setFocusState(true);
      expect(item.isFocused).assertTrue();
      expect(item.getFocusVisual()).assertEqual(TileFocusVisual.VISUAL_FOCUSED);
    });

    it('validator_should_detect_missing_device_id', 0, async () => {
      const item: MiracastPlayerItem = new MiracastPlayerItem('', 'screen_empty', 0);
      expect(PlayerItemValidator.hasDeviceId(item)).assertFalse();
      expect(PlayerItemValidator.countComplete([item])).assertEqual(0);
    });

    it('validator_should_require_positive_layout', 0, async () => {
      const item: MiracastPlayerItem = new MiracastPlayerItem('device_layout', 'screen_layout', 0);
      expect(PlayerItemValidator.hasPositiveLayout(item)).assertFalse();
      item.setLayout(10, 10, 0, 0);
      expect(PlayerItemValidator.hasPositiveLayout(item)).assertTrue();
    });

    it('collection_should_lookup_by_index', 0, async () => {
      const collection = new PlayerItemCollection();
      collection.addAll(PlayerItemFactory.createCount(3));
      const found: MiracastPlayerItem | null = collection.getByIndex(1);
      expect(found === null).assertFalse();
      expect(collection.getByIndex(9) === null).assertTrue();
    });

    it('statistics_single_item_should_be_focused', 0, async () => {
      const stats = new PlayerItemStatistics();
      stats.collect(PlayerItemFactory.createCount(1));
      expect(stats.getFocusedCount()).assertEqual(1);
      expect(stats.getBoundRatio()).assertEqual(1);
    });

    it('layout_nine_grid_first_tile_should_start_at_origin', 0, async () => {
      const tile: TileGeometry = TileLayoutCalculator.computeTile(9, 0);
      expect(tile.x).assertEqual(0);
      expect(tile.y).assertEqual(0);
      expect(tile.width).assertEqual(640);
    });

    it('layout_quad_last_tile_should_fill_bottom_right', 0, async () => {
      const tile: TileGeometry = TileLayoutCalculator.computeTile(3, 2);
      expect(tile.x).assertEqual(0);
      expect(tile.y).assertEqual(540);
      expect(tile.width).assertEqual(960);
    });

    it('palette_last_color_should_be_available', 0, async () => {
      expect(TileColorPalette.getColor(8)).assertEqual('#C7C75C');
      expect(TileColorPalette.getPalette()[8]).assertEqual('#C7C75C');
    });

    it('sorter_should_keep_single_item_unchanged', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(1);
      expect(PlayerItemSorter.sortByIndex(items).length).assertEqual(1);
      expect(PlayerItemSorter.sortByDeviceId(items)[0].deviceId).assertEqual('device_0');
    });

    it('comparator_should_report_equal_focus', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(2);
      expect(PlayerItemComparator.compareByFocus(items[1], items[1])).assertEqual(0);
    });

    it('descriptor_should_describe_split_two', 0, async () => {
      const descriptor: PlayerItemDescriptor = PlayerItemDescriptorFactory.create('device_split', 1, 2);
      expect(descriptor.layoutMode).assertEqual(PlayerLayoutMode.MODE_SPLIT_TWO);
      expect(PlayerItemDescriptorFactory.getLayoutName(PlayerLayoutMode.MODE_SPLIT_TWO)).assertEqual('split two');
    });

    it('descriptor_should_describe_grid_four', 0, async () => {
      const descriptor: PlayerItemDescriptor = PlayerItemDescriptorFactory.create('device_four', 3, 4);
      expect(descriptor.layoutMode).assertEqual(PlayerLayoutMode.MODE_GRID_FOUR);
      expect(PlayerItemDescriptorFactory.getLayoutName(PlayerLayoutMode.MODE_GRID_FOUR)).assertEqual('grid four');
    });

    it('factory_should_place_item_at_requested_index', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createAt('device_at', 5);
      expect(item.index).assertEqual(5);
      expect(item.screenId).assertEqual('screen_5');
      expect(item.isFocused).assertFalse();
    });

    it('focus_manager_should_mute_none_when_empty', 0, async () => {
      const manager = new TileFocusManager();
      expect(manager.getFocusedIndex()).assertEqual(-1);
      expect(manager.getMutedCount()).assertEqual(0);
      expect(manager.getFocusedCount()).assertEqual(0);
    });

    it('field_extractor_should_keep_field_order', 0, async () => {
      const items: MiracastPlayerItem[] = PlayerItemFactory.createCount(4);
      expect(PlayerItemFieldExtractor.extractDeviceIds(items)[3]).assertEqual('device_3');
      expect(PlayerItemFieldExtractor.extractIndices(items)[3]).assertEqual(3);
      expect(PlayerItemFieldExtractor.extractScreenIds(items).length).assertEqual(4);
    });

    it('item_should_reject_out_of_range_index', 0, async () => {
      const item: MiracastPlayerItem = PlayerItemFactory.createSingle('device_range');
      item.index = MAX_MIRROR_TILES;
      expect(item.isValidIndex(MAX_MIRROR_TILES)).assertFalse();
    });

    it('layout_total_area_nine_tiles_should_cover_screen', 0, async () => {
      expect(TileLayoutCalculator.getTotalArea(9)).assertEqual(1920 * 1080);
    });

    it('collection_should_keep_insertion_order', 0, async () => {
      const collection = new PlayerItemCollection();
      collection.add(PlayerItemFactory.createAt('device_x', 2));
      collection.add(PlayerItemFactory.createAt('device_y', 1));
      expect(collection.getByIndex(2)?.deviceId).assertEqual('device_x');
    });

    it('statistics_ratio_should_be_zero_for_cleared_items', 0, async () => {
      const stats = new PlayerItemStatistics();
      stats.collect(PlayerItemFactory.createCount(3));
      stats.clear();
      expect(stats.getBoundRatio()).assertEqual(0);
      expect(stats.getTotalArea()).assertEqual(0);
    });
  });
}
