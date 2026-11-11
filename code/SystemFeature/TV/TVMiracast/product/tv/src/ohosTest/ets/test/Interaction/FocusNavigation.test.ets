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
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPlayerPage, miracastComponentCount,
  getCurrentFocusIndex, isIndexPageVisible, launchPlayerPage, pressAndWait, safeBack, getPlayerTileCount,
  getDeviceIdList, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, TIMEOUT_PAGE_RENDER,
  TIMEOUT_PLAYER_RENDER, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP, STRESS_ROUNDS_NAVIGATION,
  MAX_MIRROR_TILES } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'FocusNavigationSuite';

// ===== 焦点导航领域模型（本地 Mock，纯逻辑） =====
// 覆盖焦点链路：首页 Tab -> 设置列表 -> 设备名输入/保存 -> 信任列表行 -> 删除弹窗按钮 -> 播放宫格

// 导航方向枚举：描述一次焦点移动的方向
enum NavigationDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  NONE = 'none'
}

// 焦点分区枚举：描述 Miracast 各页面中可聚焦的逻辑分区
enum FocusZone {
  TAB_BAR = 'tab_bar',
  SETTING_LIST = 'setting_list',
  DEVICE_NAME_INPUT = 'device_name_input',
  TRUST_LIST = 'trust_list',
  DELETE_DIALOG = 'delete_dialog',
  PLAYER_GRID = 'player_grid'
}

// 导航结果枚举：描述一次焦点移动的判定结果
enum NavigationResult {
  SUCCESS = 'success',
  BLOCKED = 'blocked',
  INVALID = 'invalid',
  WRAPPED = 'wrapped'
}

// 焦点节点接口：描述一个可聚焦控件在分区内的相对位置
interface FocusNode {
  nodeId: string;
  zone: FocusZone;
  index: number;
  row: number;
  column: number;
  enabled: boolean;
}

// 导航目标接口：描述一次移动后的落点与判定结果
interface NavigationTarget {
  targetId: string;
  result: NavigationResult;
}

// 焦点迁移记录接口：描述一次焦点迁移的完整信息
interface FocusTransition {
  fromId: string;
  toId: string;
  direction: NavigationDirection;
  zone: FocusZone;
  steps: number;
  duration: number;
  timestamp: number;
}

// 分区统计接口：汇总某分区的进入、离开与阻塞次数
interface ZoneStatistic {
  zone: FocusZone;
  entries: number;
  exits: number;
  blocked: number;
}

// 方向转换器：在字符串、方向枚举与遥控器键值之间做双向映射
class NavigationDirectionConverter {
  // 将字符串解析为方向枚举
  public parseDirection(direction: string): NavigationDirection {
    if (direction === 'left') {
      return NavigationDirection.LEFT;
    }
    if (direction === 'right') {
      return NavigationDirection.RIGHT;
    }
    if (direction === 'up') {
      return NavigationDirection.UP;
    }
    if (direction === 'down') {
      return NavigationDirection.DOWN;
    }
    return NavigationDirection.NONE;
  }

  // 判断方向是否为水平方向
  public isHorizontal(direction: NavigationDirection): boolean {
    return direction === NavigationDirection.LEFT || direction === NavigationDirection.RIGHT;
  }

  // 判断方向是否为垂直方向
  public isVertical(direction: NavigationDirection): boolean {
    return direction === NavigationDirection.UP || direction === NavigationDirection.DOWN;
  }

  // 返回方向的反向，便于验证往返导航
  public reverse(direction: NavigationDirection): NavigationDirection {
    if (direction === NavigationDirection.LEFT) {
      return NavigationDirection.RIGHT;
    }
    if (direction === NavigationDirection.RIGHT) {
      return NavigationDirection.LEFT;
    }
    if (direction === NavigationDirection.UP) {
      return NavigationDirection.DOWN;
    }
    if (direction === NavigationDirection.DOWN) {
      return NavigationDirection.UP;
    }
    return NavigationDirection.NONE;
  }

  // 将遥控器键值解析为方向枚举
  public directionFromKey(keyCode: number): NavigationDirection {
    if (keyCode === 2014) {
      return NavigationDirection.LEFT;
    }
    if (keyCode === 2015) {
      return NavigationDirection.RIGHT;
    }
    if (keyCode === 2012) {
      return NavigationDirection.UP;
    }
    if (keyCode === 2013) {
      return NavigationDirection.DOWN;
    }
    return NavigationDirection.NONE;
  }

  // 将方向枚举转回键值，便于驱动遥控器事件
  public keyFromDirection(direction: NavigationDirection): number {
    if (direction === NavigationDirection.LEFT) {
      return 2014;
    }
    if (direction === NavigationDirection.RIGHT) {
      return 2015;
    }
    if (direction === NavigationDirection.UP) {
      return 2012;
    }
    if (direction === NavigationDirection.DOWN) {
      return 2013;
    }
    return -1;
  }
}

// 焦点节点模型：封装单个可聚焦控件的位置与可用性，提供克隆与比较能力
class FocusNodeModel {
  private nodeId: string;
  private zone: FocusZone;
  private index: number;
  private row: number;
  private column: number;
  private enabled: boolean;

  constructor(nodeId: string, zone: FocusZone, index: number, row: number, column: number) {
    this.nodeId = nodeId;
    this.zone = zone;
    this.index = index;
    this.row = row;
    this.column = column;
    this.enabled = true;
  }

  public getNodeId(): string {
    return this.nodeId;
  }

  public getZone(): FocusZone {
    return this.zone;
  }

  public getIndex(): number {
    return this.index;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  // 设置可用性：禁用节点不参与焦点流转
  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
  }

  // 校验节点是否合法：索引非负且节点标识非空
  public isValid(): boolean {
    return this.nodeId.length > 0 && this.index >= 0 && this.row >= 0 && this.column >= 0;
  }

  public toFocusNode(): FocusNode {
    const node: FocusNode = {
      nodeId: this.nodeId,
      zone: this.zone,
      index: this.index,
      row: this.row,
      column: this.column,
      enabled: this.enabled
    };
    return node;
  }

  public clone(): FocusNodeModel {
    const cloned = new FocusNodeModel(this.nodeId, this.zone, this.index, this.row, this.column);
    cloned.setEnabled(this.enabled);
    return cloned;
  }

  public equals(other: FocusNodeModel): boolean {
    return this.nodeId === other.nodeId && this.zone === other.zone && this.index === other.index &&
      this.row === other.row && this.column === other.column && this.enabled === other.enabled;
  }

  public toString(): string {
    return 'FocusNodeModel(' + this.nodeId + ', ' + this.zone + ', ' + this.index + ')';
  }
}

// 焦点图模型：集中注册所有可聚焦节点，并提供分区遍历与相邻分区查询
class FocusGraph {
  private nodes: FocusNodeModel[] = [];

  // 注册节点：重复标识或非法节点会被拒绝
  public addNode(model: FocusNodeModel): boolean {
    if (!model.isValid()) {
      return false;
    }
    for (const node of this.nodes) {
      if (node.getNodeId() === model.getNodeId()) {
        return false;
      }
    }
    this.nodes.push(model.clone());
    return true;
  }

  public getNode(nodeId: string): FocusNodeModel {
    for (const node of this.nodes) {
      if (node.getNodeId() === nodeId) {
        return node.clone();
      }
    }
    return new FocusNodeModel('', FocusZone.TAB_BAR, -1, -1, -1);
  }

  public hasNode(nodeId: string): boolean {
    for (const node of this.nodes) {
      if (node.getNodeId() === nodeId) {
        return true;
      }
    }
    return false;
  }

  public countNodes(): number {
    return this.nodes.length;
  }

  // 按分区筛选节点，顺序与注册顺序一致
  public nodesInZone(zone: FocusZone): FocusNodeModel[] {
    const result: FocusNodeModel[] = [];
    for (const node of this.nodes) {
      if (node.getZone() === zone) {
        result.push(node.clone());
      }
    }
    return result;
  }

  public countInZone(zone: FocusZone): number {
    return this.nodesInZone(zone).length;
  }

  // 分区流转顺序：垂直方向按此顺序在分区之间跳转
  public zoneOrder(): FocusZone[] {
    const order: FocusZone[] = [
      FocusZone.TAB_BAR,
      FocusZone.SETTING_LIST,
      FocusZone.DEVICE_NAME_INPUT,
      FocusZone.TRUST_LIST,
      FocusZone.DELETE_DIALOG,
      FocusZone.PLAYER_GRID
    ];
    return order;
  }

  public nextZone(zone: FocusZone): FocusZone {
    const order: FocusZone[] = this.zoneOrder();
    const position: number = order.indexOf(zone);
    if (position < 0 || position >= order.length - 1) {
      return FocusZone.TAB_BAR;
    }
    return order[position + 1];
  }

  public previousZone(zone: FocusZone): FocusZone {
    const order: FocusZone[] = this.zoneOrder();
    const position: number = order.indexOf(zone);
    if (position <= 0) {
      return FocusZone.TAB_BAR;
    }
    return order[position - 1];
  }
}

// 宫格布局数学：复刻播放页列数规则（1 路全屏、2 路两列、3~4 路两列、5~9 路三列）与换行行为
class GridLayoutMath {
  // 根据投屏路数计算列数
  public columnsFor(tileCount: number): number {
    if (tileCount <= 0) {
      return 0;
    }
    if (tileCount === 1) {
      return 1;
    }
    if (tileCount <= 4) {
      return 2;
    }
    return 3;
  }

  // 根据投屏路数计算行数
  public rowsFor(tileCount: number): number {
    const columns: number = this.columnsFor(tileCount);
    if (columns <= 0) {
      return 0;
    }
    return Math.ceil(tileCount / columns);
  }

  // 计算瓦片所在行号：列数非法时返回 -1
  public rowOf(index: number, tileCount: number): number {
    const columns: number = this.columnsFor(tileCount);
    if (columns <= 0 || index < 0) {
      return -1;
    }
    return Math.floor(index / columns);
  }

  // 计算瓦片所在列号：列数非法时返回 -1
  public columnOf(index: number, tileCount: number): number {
    const columns: number = this.columnsFor(tileCount);
    if (columns <= 0 || index < 0) {
      return -1;
    }
    return index % columns;
  }

  // 行优先索引换算：越界返回 -1
  public indexAt(row: number, column: number, tileCount: number): number {
    const columns: number = this.columnsFor(tileCount);
    if (columns <= 0 || row < 0 || column < 0 || column >= columns) {
      return -1;
    }
    const index: number = row * columns + column;
    return index < tileCount ? index : -1;
  }

  // 非全屏模式下向右移动：到边界后保持不动
  public moveRightClamped(index: number, tileCount: number): number {
    if (tileCount <= 0) {
      return -1;
    }
    return Math.min(index + 1, tileCount - 1);
  }

  // 非全屏模式下向左移动：到边界后保持不动
  public moveLeftClamped(index: number, tileCount: number): number {
    if (tileCount <= 0) {
      return -1;
    }
    return Math.max(index - 1, 0);
  }

  // 全屏模式下向右循环：末位回到首位
  public moveRightWrapped(index: number, tileCount: number): number {
    if (tileCount <= 0) {
      return -1;
    }
    return (index + 1) % tileCount;
  }

  // 全屏模式下向左循环：首位回到末位
  public moveLeftWrapped(index: number, tileCount: number): number {
    if (tileCount <= 0) {
      return -1;
    }
    return (index - 1 + tileCount) % tileCount;
  }

  // 向下移动一行：越界保持不动
  public moveDown(index: number, tileCount: number): number {
    const columns: number = this.columnsFor(tileCount);
    if (columns <= 0) {
      return -1;
    }
    const target: number = index + columns;
    return target < tileCount ? target : index;
  }

  // 向上移动一行：越界保持不动
  public moveUp(index: number, tileCount: number): number {
    const columns: number = this.columnsFor(tileCount);
    if (columns <= 0) {
      return -1;
    }
    return Math.max(index - columns, 0);
  }

  // 判断瓦片是否为行内最后一个：用于换行判定
  public isLastInRow(index: number, tileCount: number): boolean {
    const columns: number = this.columnsFor(tileCount);
    if (columns <= 0 || index < 0 || index >= tileCount) {
      return false;
    }
    return this.columnOf(index, tileCount) === columns - 1 || index === tileCount - 1;
  }

  // 计算末行实际瓦片数量：用于判断是否需要补空位
  public tilesInLastRow(tileCount: number): number {
    const columns: number = this.columnsFor(tileCount);
    if (columns <= 0) {
      return 0;
    }
    const remainder: number = tileCount % columns;
    return remainder === 0 ? columns : remainder;
  }

  // 判断当前布局是否为全屏：仅 1 路投屏为全屏
  public isFullScreen(tileCount: number): boolean {
    return tileCount === 1;
  }

  // 计算瓦片中心坐标：用于触控命中区域推导
  public tileCenterX(index: number, tileCount: number, tileWidth: number): number {
    const column: number = this.columnOf(index, tileCount);
    if (column < 0) {
      return -1;
    }
    return column * tileWidth + tileWidth / 2;
  }

  // 计算瓦片中心纵坐标
  public tileCenterY(index: number, tileCount: number, tileHeight: number): number {
    const row: number = this.rowOf(index, tileCount);
    if (row < 0) {
      return -1;
    }
    return row * tileHeight + tileHeight / 2;
  }
}

// 焦点导航器：基于焦点图执行方向移动，并给出成功/阻塞/循环判定
class FocusNavigator {
  private graph: FocusGraph;
  private gridMath: GridLayoutMath = new GridLayoutMath();

  constructor(graph: FocusGraph) {
    this.graph = graph;
  }

  // 生成阻塞结果：目标保持原地
  private blocked(currentId: string): NavigationTarget {
    const target: NavigationTarget = { targetId: currentId, result: NavigationResult.BLOCKED };
    return target;
  }

  // 生成成功结果
  private success(targetId: string): NavigationTarget {
    const target: NavigationTarget = { targetId: targetId, result: NavigationResult.SUCCESS };
    return target;
  }

  // 生成循环结果：全屏宫格末位回到首位
  private wrapped(targetId: string): NavigationTarget {
    const target: NavigationTarget = { targetId: targetId, result: NavigationResult.WRAPPED };
    return target;
  }

  // 执行一次方向移动
  public move(currentId: string, direction: NavigationDirection): NavigationTarget {
    const current: FocusNodeModel = this.graph.getNode(currentId);
    if (!current.getNodeId().length || direction === NavigationDirection.NONE) {
      const invalid: NavigationTarget = { targetId: currentId, result: NavigationResult.INVALID };
      return invalid;
    }
    if (!current.isEnabled()) {
      return this.blocked(currentId);
    }
    if (current.getZone() === FocusZone.PLAYER_GRID) {
      return this.moveInPlayerGrid(current, direction);
    }
    if (direction === NavigationDirection.RIGHT) {
      return this.moveRightInZone(current);
    }
    if (direction === NavigationDirection.LEFT) {
      return this.moveLeftInZone(current);
    }
    return this.moveVerticalAcrossZones(current, direction);
  }

  // 分区内向右移动：出界后进入下一个分区的首个节点
  private moveRightInZone(current: FocusNodeModel): NavigationTarget {
    const peers: FocusNodeModel[] = this.graph.nodesInZone(current.getZone());
    if (current.getIndex() < peers.length - 1) {
      return this.success(peers[current.getIndex() + 1].getNodeId());
    }
    const nextZone: FocusZone = this.graph.nextZone(current.getZone());
    const nextPeers: FocusNodeModel[] = this.graph.nodesInZone(nextZone);
    if (nextPeers.length === 0) {
      return this.blocked(current.getNodeId());
    }
    return this.success(nextPeers[0].getNodeId());
  }

  // 分区内向左移动：出界后进入上一个分区的末个节点
  private moveLeftInZone(current: FocusNodeModel): NavigationTarget {
    const peers: FocusNodeModel[] = this.graph.nodesInZone(current.getZone());
    if (current.getIndex() > 0) {
      return this.success(peers[current.getIndex() - 1].getNodeId());
    }
    if (current.getZone() === FocusZone.TAB_BAR) {
      return this.blocked(current.getNodeId());
    }
    const previousZone: FocusZone = this.graph.previousZone(current.getZone());
    const previousPeers: FocusNodeModel[] = this.graph.nodesInZone(previousZone);
    if (previousPeers.length === 0) {
      return this.blocked(current.getNodeId());
    }
    return this.success(previousPeers[previousPeers.length - 1].getNodeId());
  }

  // 跨分区垂直移动：向下进入下一分区，向上回到上一分区
  private moveVerticalAcrossZones(current: FocusNodeModel, direction: NavigationDirection): NavigationTarget {
    const zone: FocusZone = direction === NavigationDirection.DOWN ? this.graph.nextZone(current.getZone()) :
      this.graph.previousZone(current.getZone());
    const peers: FocusNodeModel[] = this.graph.nodesInZone(zone);
    if (zone === current.getZone() || peers.length === 0) {
      return this.blocked(current.getNodeId());
    }
    const target: FocusNodeModel = direction === NavigationDirection.DOWN ? peers[0] : peers[peers.length - 1];
    return this.success(target.getNodeId());
  }

  // 播放宫格内移动：全屏单瓦片循环，多瓦片按列数上下移动
  private moveInPlayerGrid(current: FocusNodeModel, direction: NavigationDirection): NavigationTarget {
    const peers: FocusNodeModel[] = this.graph.nodesInZone(FocusZone.PLAYER_GRID);
    const tileCount: number = peers.length;
    if (tileCount <= 0) {
      return this.blocked(current.getNodeId());
    }
    const index: number = current.getIndex();
    if (this.gridMath.isFullScreen(tileCount)) {
      const looped: number = direction === NavigationDirection.RIGHT ?
        this.gridMath.moveRightWrapped(index, tileCount) : this.gridMath.moveLeftWrapped(index, tileCount);
      return this.wrapped(peers[looped].getNodeId());
    }
    let nextIndex: number = index;
    if (direction === NavigationDirection.RIGHT) {
      nextIndex = this.gridMath.moveRightClamped(index, tileCount);
    } else if (direction === NavigationDirection.LEFT) {
      nextIndex = this.gridMath.moveLeftClamped(index, tileCount);
    } else if (direction === NavigationDirection.DOWN) {
      nextIndex = this.gridMath.moveDown(index, tileCount);
    } else {
      nextIndex = this.gridMath.moveUp(index, tileCount);
    }
    if (nextIndex === index) {
      return this.blocked(current.getNodeId());
    }
    return this.success(peers[nextIndex].getNodeId());
  }
}

// 分区统计计算器：从迁移记录聚合每个分区的进入、离开与阻塞次数
class ZoneStatisticsCalculator {
  private transitions: FocusTransition[] = [];

  constructor(transitions: FocusTransition[]) {
    this.transitions = transitions;
  }

  // 统计阻塞次数：源与目标相同即为阻塞
  public countBlocked(): number {
    let count: number = 0;
    for (const record of this.transitions) {
      if (record.fromId === record.toId) {
        count++;
      }
    }
    return count;
  }

  // 生成指定分区的统计结果
  public buildForZone(zone: FocusZone): ZoneStatistic {
    let entries: number = 0;
    let exits: number = 0;
    let blocked: number = 0;
    for (const record of this.transitions) {
      if (record.zone !== zone) {
        continue;
      }
      if (record.fromId === record.toId) {
        blocked++;
      } else {
        entries++;
      }
      if (record.toId.length > 0 && record.toId !== record.fromId) {
        exits++;
      }
    }
    const statistic: ZoneStatistic = { zone: zone, entries: entries, exits: exits, blocked: blocked };
    return statistic;
  }

  // 生成全部出现过的分区统计
  public buildAll(): ZoneStatistic[] {
    const zones: FocusZone[] = [];
    for (const record of this.transitions) {
      if (zones.indexOf(record.zone) < 0) {
        zones.push(record.zone);
      }
    }
    const result: ZoneStatistic[] = [];
    for (const zone of zones) {
      result.push(this.buildForZone(zone));
    }
    return result;
  }
}

// 焦点迁移追踪器：单例保存全量迁移历史，供跨用例统计
class FocusTransitionTracker {
  private static instance: FocusTransitionTracker;
  private history: FocusTransition[] = [];
  private currentFocusId: string = '';
  private totalSteps: number = 0;

  public static getInstance(): FocusTransitionTracker {
    if (!FocusTransitionTracker.instance) {
      FocusTransitionTracker.instance = new FocusTransitionTracker();
    }
    return FocusTransitionTracker.instance;
  }

  // 记录一次迁移：时长为负视为非法，直接拒绝
  public record(fromId: string, toId: string, direction: NavigationDirection, zone: FocusZone,
    duration: number): boolean {
    if (duration < 0) {
      return false;
    }
    const record: FocusTransition = {
      fromId: fromId,
      toId: toId,
      direction: direction,
      zone: zone,
      steps: fromId === toId ? 0 : 1,
      duration: duration,
      timestamp: Date.now()
    };
    this.history.push(record);
    this.currentFocusId = toId;
    this.totalSteps += record.steps;
    return true;
  }

  public getHistory(): FocusTransition[] {
    const copied: FocusTransition[] = [];
    for (const record of this.history) {
      const item: FocusTransition = {
        fromId: record.fromId,
        toId: record.toId,
        direction: record.direction,
        zone: record.zone,
        steps: record.steps,
        duration: record.duration,
        timestamp: record.timestamp
      };
      copied.push(item);
    }
    return copied;
  }

  public getCurrentFocusId(): string {
    return this.currentFocusId;
  }

  public getTotalSteps(): number {
    return this.totalSteps;
  }

  public getRecordCount(): number {
    return this.history.length;
  }

  // 按方向统计迁移次数
  public countByDirection(direction: NavigationDirection): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.direction === direction) {
        count++;
      }
    }
    return count;
  }

  // 按分区统计迁移次数
  public countByZone(zone: FocusZone): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.zone === zone) {
        count++;
      }
    }
    return count;
  }

  // 统计阻塞迁移次数
  public countBlocked(): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.fromId === record.toId) {
        count++;
      }
    }
    return count;
  }

  // 计算平均迁移耗时
  public getAverageDuration(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of this.history) {
      total += record.duration;
    }
    return total / this.history.length;
  }

  // 计算最大迁移耗时
  public getMaxDuration(): number {
    let max: number = 0;
    for (const record of this.history) {
      if (record.duration > max) {
        max = record.duration;
      }
    }
    return max;
  }

  public hasVisited(nodeId: string): boolean {
    for (const record of this.history) {
      if (record.toId === nodeId) {
        return true;
      }
    }
    return false;
  }

  // 判断迁移时间戳是否单调递增
  public isChronological(): boolean {
    for (let i: number = 1; i < this.history.length; i++) {
      if (this.history[i].timestamp < this.history[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.history = [];
    this.currentFocusId = '';
    this.totalSteps = 0;
  }
}

// 焦点导航校验器：提供节点、索引与方向的合法性判定
class FocusNavigationValidator {
  // 校验节点完整性
  public isValidNode(node: FocusNode): boolean {
    return node.nodeId.length > 0 && node.index >= 0 && node.row >= 0 && node.column >= 0;
  }

  // 校验索引是否落在分区范围内
  public isIndexInRange(index: number, nodeCount: number): boolean {
    return index >= 0 && index < nodeCount;
  }

  // 索引裁剪：超界时收敛到合法边界
  public clampIndex(index: number, nodeCount: number): number {
    if (nodeCount <= 0) {
      return -1;
    }
    if (index < 0) {
      return 0;
    }
    if (index >= nodeCount) {
      return nodeCount - 1;
    }
    return index;
  }

  // 校验方向是否为可用方向
  public isValidDirection(direction: NavigationDirection): boolean {
    return direction !== NavigationDirection.NONE;
  }

  // 判断是否为全屏宫格循环场景
  public isFullScreenCycle(tileCount: number): boolean {
    return tileCount === 1;
  }
}

// 构建标准 Miracast 焦点图：按业务页面顺序注册节点，播放宫格按需注入瓦片数量
function buildMiracastFocusGraph(tileCount: number): FocusGraph {
  const graph = new FocusGraph();
  graph.addNode(new FocusNodeModel('tab_miracast', FocusZone.TAB_BAR, 0, 0, 0));
  graph.addNode(new FocusNodeModel('tab_settings', FocusZone.TAB_BAR, 1, 0, 1));
  graph.addNode(new FocusNodeModel('switch_btn', FocusZone.SETTING_LIST, 0, 0, 0));
  graph.addNode(new FocusNodeModel('item_device_name', FocusZone.SETTING_LIST, 1, 1, 0));
  graph.addNode(new FocusNodeModel('item_trust_device', FocusZone.SETTING_LIST, 2, 2, 0));
  graph.addNode(new FocusNodeModel('item_about', FocusZone.SETTING_LIST, 3, 3, 0));
  graph.addNode(new FocusNodeModel('input_name', FocusZone.DEVICE_NAME_INPUT, 0, 0, 0));
  graph.addNode(new FocusNodeModel('btn_save', FocusZone.DEVICE_NAME_INPUT, 1, 0, 1));
  graph.addNode(new FocusNodeModel('trust_row_0', FocusZone.TRUST_LIST, 0, 0, 0));
  graph.addNode(new FocusNodeModel('trust_row_1', FocusZone.TRUST_LIST, 1, 1, 0));
  graph.addNode(new FocusNodeModel('trust_row_2', FocusZone.TRUST_LIST, 2, 2, 0));
  graph.addNode(new FocusNodeModel('dialog_cancel', FocusZone.DELETE_DIALOG, 0, 0, 0));
  graph.addNode(new FocusNodeModel('dialog_confirm', FocusZone.DELETE_DIALOG, 1, 0, 1));
  for (let i: number = 0; i < tileCount; i++) {
    graph.addNode(new FocusNodeModel('tile_' + i, FocusZone.PLAYER_GRID, i, 0, i));
  }
  return graph;
}

export default function focusNavigationSuite(): void {
  describe('FocusNavigation_Test', () => {
    let driver: Driver;
    let tracker: FocusTransitionTracker;

    // 测试前置：初始化驱动与追踪器，并回到投屏首页
    beforeAll(async () => {
      driver = getDriver();
      tracker = FocusTransitionTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'focus navigation suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // 测试清理：退出弹窗与播放页，回到首页
    afterAll(async () => {
      await safeBack(driver, 2);
      await triggerMiracastHome(driver);
      await driver.delayMs(DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'focus navigation suite end');
    });

    // 验证首页可见后焦点落在默认 Tab 上
    it('index_page_should_be_visible_before_navigation', 0, async () => {
      const visible: boolean = await isIndexPageVisible(driver);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      tracker.record('tab_miracast', 'tab_miracast', NavigationDirection.NONE, FocusZone.TAB_BAR, 10);
      expect(tracker.getRecordCount()).assertEqual(1);
    });

    // 验证播放页宫格可接受焦点导航，且页面可见
    it('player_grid_should_accept_focus_navigation', 0, async () => {
      const devices: string[] = await getDeviceIdList(driver);
      const deviceId: string = devices.length > 0 ? devices[0] : 'mock_device_0';
      await launchPlayerPage(deviceId, 'Miracast_Mock_Device');
      const playerVisible: boolean = await waitForPlayerPage(driver, TIMEOUT_PLAYER_RENDER);
      const tiles: number = await getPlayerTileCount(driver);
      expect(tiles).assertLargerOrEqual(0);
      expect(tiles).assertLessOrEqual(MAX_MIRROR_TILES);
      const graph: FocusGraph = buildMiracastFocusGraph(4);
      const navigator = new FocusNavigator(graph);
      const target: NavigationTarget = navigator.move('tile_0', NavigationDirection.RIGHT);
      expect(target.targetId).assertEqual('tile_1');
    });

    // 验证方向解析覆盖全部方向与非法输入
    it('direction_converter_should_parse_all_directions', 0, async () => {
      const converter = new NavigationDirectionConverter();
      expect(converter.parseDirection('left')).assertEqual(NavigationDirection.LEFT);
      expect(converter.parseDirection('right')).assertEqual(NavigationDirection.RIGHT);
      expect(converter.parseDirection('up')).assertEqual(NavigationDirection.UP);
      expect(converter.parseDirection('down')).assertEqual(NavigationDirection.DOWN);
      expect(converter.parseDirection('sideways')).assertEqual(NavigationDirection.NONE);
      expect(converter.isHorizontal(NavigationDirection.RIGHT)).assertTrue();
      expect(converter.isVertical(NavigationDirection.UP)).assertTrue();
      expect(converter.isVertical(NavigationDirection.LEFT)).assertFalse();
    });

    // 验证方向反转映射完整且自反
    it('direction_converter_should_reverse_directions', 0, async () => {
      const converter = new NavigationDirectionConverter();
      expect(converter.reverse(NavigationDirection.LEFT)).assertEqual(NavigationDirection.RIGHT);
      expect(converter.reverse(NavigationDirection.RIGHT)).assertEqual(NavigationDirection.LEFT);
      expect(converter.reverse(NavigationDirection.UP)).assertEqual(NavigationDirection.DOWN);
      expect(converter.reverse(NavigationDirection.DOWN)).assertEqual(NavigationDirection.UP);
      expect(converter.reverse(NavigationDirection.NONE)).assertEqual(NavigationDirection.NONE);
      expect(converter.reverse(converter.reverse(NavigationDirection.LEFT))).assertEqual(NavigationDirection.LEFT);
    });

    // 验证遥控器键值与方向的双向映射
    it('direction_converter_should_map_key_codes', 0, async () => {
      const converter = new NavigationDirectionConverter();
      expect(converter.directionFromKey(KEY_LEFT)).assertEqual(NavigationDirection.LEFT);
      expect(converter.directionFromKey(KEY_RIGHT)).assertEqual(NavigationDirection.RIGHT);
      expect(converter.directionFromKey(KEY_UP)).assertEqual(NavigationDirection.UP);
      expect(converter.directionFromKey(KEY_DOWN)).assertEqual(NavigationDirection.DOWN);
      expect(converter.directionFromKey(KEY_ENTER)).assertEqual(NavigationDirection.NONE);
      expect(converter.keyFromDirection(NavigationDirection.RIGHT)).assertEqual(KEY_RIGHT);
      expect(converter.keyFromDirection(NavigationDirection.NONE)).assertEqual(-1);
    });

    // 验证焦点图注册节点并保持分区计数
    it('focus_graph_should_register_nodes', 0, async () => {
      const graph: FocusGraph = buildMiracastFocusGraph(5);
      expect(graph.countNodes()).assertEqual(18);
      expect(graph.countInZone(FocusZone.TAB_BAR)).assertEqual(2);
      expect(graph.countInZone(FocusZone.SETTING_LIST)).assertEqual(4);
      expect(graph.countInZone(FocusZone.DEVICE_NAME_INPUT)).assertEqual(2);
      expect(graph.countInZone(FocusZone.DELETE_DIALOG)).assertEqual(2);
      expect(graph.countInZone(FocusZone.PLAYER_GRID)).assertEqual(5);
    });

    // 验证重复节点标识被拒绝
    it('focus_graph_should_reject_duplicate_node', 0, async () => {
      const graph = new FocusGraph();
      const first = new FocusNodeModel('tab_miracast', FocusZone.TAB_BAR, 0, 0, 0);
      const duplicate = new FocusNodeModel('tab_miracast', FocusZone.TAB_BAR, 1, 0, 1);
      const invalid = new FocusNodeModel('', FocusZone.TAB_BAR, -1, 0, 0);
      expect(graph.addNode(first)).assertTrue();
      expect(graph.addNode(duplicate)).assertFalse();
      expect(graph.addNode(invalid)).assertFalse();
      expect(graph.countNodes()).assertEqual(1);
    });

    // 验证未知节点返回空标识占位模型
    it('focus_graph_should_return_placeholder_for_unknown_node', 0, async () => {
      const graph: FocusGraph = buildMiracastFocusGraph(2);
      const unknown = graph.getNode('not_exists');
      expect(unknown.getNodeId()).assertEqual('');
      expect(unknown.isValid()).assertFalse();
      expect(graph.hasNode('not_exists')).assertFalse();
      expect(graph.hasNode('tile_1')).assertTrue();
    });

    // 验证分区流转顺序前进与回退
    it('focus_graph_should_resolve_zone_order', 0, async () => {
      const graph = new FocusGraph();
      expect(graph.nextZone(FocusZone.TAB_BAR)).assertEqual(FocusZone.SETTING_LIST);
      expect(graph.nextZone(FocusZone.SETTING_LIST)).assertEqual(FocusZone.DEVICE_NAME_INPUT);
      expect(graph.nextZone(FocusZone.DELETE_DIALOG)).assertEqual(FocusZone.PLAYER_GRID);
      expect(graph.previousZone(FocusZone.TRUST_LIST)).assertEqual(FocusZone.DEVICE_NAME_INPUT);
      expect(graph.previousZone(FocusZone.TAB_BAR)).assertEqual(FocusZone.TAB_BAR);
      expect(graph.zoneOrder().length).assertEqual(6);
    });

    // 验证宫格列数规则：1 路单列、2~4 路两列、5~9 路三列
    it('grid_math_should_resolve_columns_for_tile_count', 0, async () => {
      const math = new GridLayoutMath();
      expect(math.columnsFor(0)).assertEqual(0);
      expect(math.columnsFor(1)).assertEqual(1);
      expect(math.columnsFor(2)).assertEqual(2);
      expect(math.columnsFor(3)).assertEqual(2);
      expect(math.columnsFor(4)).assertEqual(2);
      expect(math.columnsFor(5)).assertEqual(3);
      expect(math.columnsFor(9)).assertEqual(3);
    });

    // 验证宫格行数规则与末行瓦片数
    it('grid_math_should_resolve_rows_and_last_row', 0, async () => {
      const math = new GridLayoutMath();
      expect(math.rowsFor(1)).assertEqual(1);
      expect(math.rowsFor(2)).assertEqual(1);
      expect(math.rowsFor(3)).assertEqual(2);
      expect(math.rowsFor(4)).assertEqual(2);
      expect(math.rowsFor(5)).assertEqual(2);
      expect(math.rowsFor(9)).assertEqual(3);
      expect(math.tilesInLastRow(3)).assertEqual(1);
      expect(math.tilesInLastRow(4)).assertEqual(2);
      expect(math.tilesInLastRow(5)).assertEqual(2);
      expect(math.tilesInLastRow(6)).assertEqual(3);
    });

    // 验证行优先索引与行列号换算
    it('grid_math_should_compute_row_and_column', 0, async () => {
      const math = new GridLayoutMath();
      expect(math.rowOf(0, 4)).assertEqual(0);
      expect(math.rowOf(3, 4)).assertEqual(1);
      expect(math.columnOf(3, 4)).assertEqual(1);
      expect(math.columnOf(4, 5)).assertEqual(1);
      expect(math.indexAt(1, 1, 4)).assertEqual(3);
      expect(math.indexAt(0, 2, 4)).assertEqual(-1);
      expect(math.indexAt(-1, 0, 4)).assertEqual(-1);
    });

    // 验证非全屏模式下左右移动被边界夹紧
    it('grid_math_should_clamp_horizontal_moves', 0, async () => {
      const math = new GridLayoutMath();
      expect(math.moveRightClamped(4, 5)).assertEqual(4);
      expect(math.moveRightClamped(3, 5)).assertEqual(4);
      expect(math.moveLeftClamped(0, 5)).assertEqual(0);
      expect(math.moveLeftClamped(1, 5)).assertEqual(0);
      expect(math.moveRightClamped(0, 0)).assertEqual(-1);
      expect(math.moveLeftClamped(0, 0)).assertEqual(-1);
    });

    // 验证全屏模式下左右循环
    it('grid_math_should_wrap_in_fullscreen', 0, async () => {
      const math = new GridLayoutMath();
      expect(math.isFullScreen(1)).assertTrue();
      expect(math.isFullScreen(2)).assertFalse();
      expect(math.moveRightWrapped(0, 1)).assertEqual(0);
      expect(math.moveLeftWrapped(0, 1)).assertEqual(0);
      expect(math.moveRightWrapped(8, 9)).assertEqual(0);
      expect(math.moveLeftWrapped(0, 9)).assertEqual(8);
      expect(math.moveRightWrapped(0, 0)).assertEqual(-1);
    });

    // 验证上下移动按列数跳动且越界不动

    // 验证行末判定与瓦片中心坐标

    // 验证分区内右移进入同分区下一个节点
    it('focus_navigator_should_move_right_within_zone', 0, async () => {
      const graph: FocusGraph = buildMiracastFocusGraph(4);
      const navigator = new FocusNavigator(graph);
      const first: NavigationTarget = navigator.move('trust_row_0', NavigationDirection.RIGHT);
      expect(first.targetId).assertEqual('trust_row_1');
      expect(first.result).assertEqual(NavigationResult.SUCCESS);
      const loop: NavigationTarget = navigator.move('tab_miracast', NavigationDirection.RIGHT);
      expect(loop.targetId).assertEqual('tab_settings');
    });

    // 验证垂直方向在分区之间跳转
    it('focus_navigator_should_move_vertically_across_zones', 0, async () => {
      const graph: FocusGraph = buildMiracastFocusGraph(2);
      const navigator = new FocusNavigator(graph);
      const down: NavigationTarget = navigator.move('tab_miracast', NavigationDirection.DOWN);
      expect(down.targetId).assertEqual('switch_btn');
      const up: NavigationTarget = navigator.move('input_name', NavigationDirection.UP);
      expect(up.targetId).assertEqual('item_about');
      const blocked: NavigationTarget = navigator.move('tab_miracast', NavigationDirection.UP);
      expect(blocked.result).assertEqual(NavigationResult.BLOCKED);
    });

    // 验证多路宫格上下移动按列数跳动
    it('focus_navigator_should_handle_grid_vertical_moves', 0, async () => {
      const graph: FocusGraph = buildMiracastFocusGraph(9);
      const navigator = new FocusNavigator(graph);
      const down: NavigationTarget = navigator.move('tile_0', NavigationDirection.DOWN);
      expect(down.targetId).assertEqual('tile_3');
      const up: NavigationTarget = navigator.move('tile_4', NavigationDirection.UP);
      expect(up.targetId).assertEqual('tile_1');
      const blocked: NavigationTarget = navigator.move('tile_0', NavigationDirection.UP);
      expect(blocked.result).assertEqual(NavigationResult.BLOCKED);
    });

    // 验证分区统计计算器聚合进入与阻塞
    it('zone_statistics_should_count_entries_and_blocked', 0, async () => {
      const transitions: FocusTransition[] = [
        {
          fromId: 'tab_miracast', toId: 'tab_settings', direction: NavigationDirection.RIGHT,
          zone: FocusZone.TAB_BAR, steps: 1, duration: 30, timestamp: 1
        },
        {
          fromId: 'tab_settings', toId: 'tab_settings', direction: NavigationDirection.RIGHT,
          zone: FocusZone.TAB_BAR, steps: 0, duration: 10, timestamp: 2
        },
        {
          fromId: 'switch_btn', toId: 'item_device_name', direction: NavigationDirection.DOWN,
          zone: FocusZone.SETTING_LIST, steps: 1, duration: 20, timestamp: 3
        }
      ];
      const calculator = new ZoneStatisticsCalculator(transitions);
      const tabStatistic: ZoneStatistic = calculator.buildForZone(FocusZone.TAB_BAR);
      expect(tabStatistic.entries).assertEqual(1);
      expect(tabStatistic.exits).assertEqual(1);
      expect(tabStatistic.blocked).assertEqual(1);
      expect(calculator.buildAll().length).assertEqual(2);
    });

    // 验证迁移追踪器记录历史与当前焦点
    it('transition_tracker_should_record_history', 0, async () => {
      tracker.reset();
      expect(tracker.record('tab_miracast', 'tab_settings', NavigationDirection.RIGHT, FocusZone.TAB_BAR, 20)).assertTrue();
      expect(tracker.record('tab_settings', 'switch_btn', NavigationDirection.DOWN, FocusZone.SETTING_LIST, 30)).assertTrue();
      expect(tracker.getRecordCount()).assertEqual(2);
      expect(tracker.getCurrentFocusId()).assertEqual('switch_btn');
      expect(tracker.getTotalSteps()).assertEqual(2);
      expect(tracker.isChronological()).assertTrue();
    });

    // 验证平均与最大迁移耗时计算
    it('transition_tracker_should_compute_duration_metrics', 0, async () => {
      tracker.reset();
      tracker.record('a', 'b', NavigationDirection.RIGHT, FocusZone.TAB_BAR, 10);
      tracker.record('b', 'c', NavigationDirection.RIGHT, FocusZone.SETTING_LIST, 20);
      tracker.record('c', 'c', NavigationDirection.LEFT, FocusZone.SETTING_LIST, 60);
      expect(tracker.getAverageDuration()).assertEqual(30);
      expect(tracker.getMaxDuration()).assertEqual(60);
      expect(tracker.countBlocked()).assertEqual(1);
      expect(tracker.countByZone(FocusZone.SETTING_LIST)).assertEqual(2);
      expect(tracker.countByDirection(NavigationDirection.RIGHT)).assertEqual(2);
    });

    // 验证访问记录判定与重置能力
    it('transition_tracker_should_track_visited_nodes', 0, async () => {
      tracker.reset();
      tracker.record('tab_miracast', 'item_trust_device', NavigationDirection.DOWN, FocusZone.TRUST_LIST, 15);
      expect(tracker.hasVisited('item_trust_device')).assertTrue();
      expect(tracker.hasVisited('tile_8')).assertFalse();
      const snapshot: FocusTransition[] = tracker.getHistory();
      expect(snapshot.length).assertEqual(1);
      snapshot[0].duration = 999;
      expect(tracker.getHistory()[0].duration).assertEqual(15);
      tracker.reset();
      expect(tracker.getRecordCount()).assertEqual(0);
      expect(tracker.getCurrentFocusId()).assertEqual('');
    });

    // 验证焦点节点模型克隆、比较与序列化
    it('focus_node_model_should_clone_and_compare', 0, async () => {
      const model = new FocusNodeModel('tile_2', FocusZone.PLAYER_GRID, 2, 1, 0);
      expect(model.isValid()).assertTrue();
      const clone = model.clone();
      expect(clone.equals(model)).assertTrue();
      clone.setEnabled(false);
      expect(clone.equals(model)).assertFalse();
      expect(model.isEnabled()).assertTrue();
      expect(clone.toString().indexOf('tile_2')).assertLargerOrEqual(0);
      const node: FocusNode = model.toFocusNode();
      expect(node.zone).assertEqual(FocusZone.PLAYER_GRID);
      expect(node.enabled).assertTrue();
    });

    // 验证导航校验器处理节点、索引与方向合法性
    it('focus_validator_should_validate_nodes_and_indices', 0, async () => {
      const validator = new FocusNavigationValidator();
      const node: FocusNode = {
        nodeId: 'btn_save', zone: FocusZone.DEVICE_NAME_INPUT, index: 1, row: 0, column: 1, enabled: true
      };
      expect(validator.isValidNode(node)).assertTrue();
      expect(validator.isIndexInRange(0, 2)).assertTrue();
      expect(validator.isIndexInRange(2, 2)).assertFalse();
      expect(validator.clampIndex(-3, 3)).assertEqual(0);
      expect(validator.clampIndex(5, 3)).assertEqual(2);
      expect(validator.clampIndex(1, 0)).assertEqual(-1);
      expect(validator.isValidDirection(NavigationDirection.NONE)).assertFalse();
      expect(validator.isFullScreenCycle(1)).assertTrue();
    });

    // 验证连续快速导航后控件数量保持稳定

    // 验证压力轮次下焦点导航不丢失
    it('stress_navigation_rounds_should_complete', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let round: number = 0; round < 5; round++) {
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        tracker.record('tab_miracast', 'switch_btn', NavigationDirection.DOWN, FocusZone.SETTING_LIST, 25);
        await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
        tracker.record('switch_btn', 'tab_miracast', NavigationDirection.UP, FocusZone.TAB_BAR, 25);
      }
      expect(STRESS_ROUNDS_NAVIGATION).assertLargerOrEqual(10);
      expect(tracker.getRecordCount()).assertEqual(10);
      expect(tracker.countByZone(FocusZone.SETTING_LIST)).assertEqual(5);
    });

  });
}
