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

import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG: string = '[BreakpointHarness]';

// 断点定义条目：与工程 BreakpointSystem 内部的 BreakpointEntity 结构对应
export interface BreakpointDefinition {
  id: string;
  name: string;
  size: number;
}

// 断点配置实体：承载一组断点的完整定义与当前选中状态
export interface BreakpointConfiguration {
  definitions: BreakpointDefinition[];
  current: string;
}

// 断点切换事件：记录一次断点变化，供生命周期与统计类用例断言
export interface BreakpointChangeEvent {
  from: string;
  to: string;
  sequence: number;
}

// 断点阈值表：与工程 BreakpointSystem.register() 中的数组严格一致
// xs:0  sm:320  md:600  lg:840
export const DEFAULT_BREAKPOINTS: BreakpointDefinition[] = [
  { id: 'bp_xs', name: 'xs', size: 0 },
  { id: 'bp_sm', name: 'sm', size: 320 },
  { id: 'bp_md', name: 'md', size: 600 },
  { id: 'bp_lg', name: 'lg', size: 840 }
];

/** 断点系统测试替身：忠实复刻工程 BreakpointSystem 的判定与状态流转逻辑
 *  该替身不依赖 mediaQuery，可对纯逻辑做确定性断言；
 *  UI 自动化用例另外验证真实设备上的断点切换行为，二者互补。
 */
export class BreakpointSystemHarness {
  private definitions: BreakpointDefinition[];
  private currentBreakpoint: string = 'md';
  private listeners: Array<(event: BreakpointChangeEvent) => void> = [];
  private changeHistory: BreakpointChangeEvent[] = [];
  private sequenceCounter: number = 0;
  private registerCount: number = 0;
  private unregisterCount: number = 0;

  constructor(definitions: BreakpointDefinition[] = DEFAULT_BREAKPOINTS) {
    this.definitions = definitions;
    hilog.info(DOMAIN, TAG, 'harness created with %{public}d definitions', definitions.length);
  }

  /** 注册断点监听：对应工程中每次 register() 建立 mediaQuery 监听的行为 */
  public register(): void {
    this.registerCount++;
    hilog.info(DOMAIN, TAG, 'register called, total registers=%{public}d', this.registerCount);
  }

  /** 注销断点监听：对应工程中 unregister() 释放 mediaQuery 监听 */
  public unregister(): void {
    this.unregisterCount++;
    hilog.info(DOMAIN, TAG, 'unregister called, total unregisters=%{public}d', this.unregisterCount);
  }

  public getRegisterCount(): number {
    return this.registerCount;
  }

  public getUnregisterCount(): number {
    return this.unregisterCount;
  }

  /** 判断监听是否成对释放：register 与 unregister 次数相等即视为无泄漏 */
  public isListenerBalanced(): boolean {
    return this.registerCount === this.unregisterCount;
  }

  /** 按窗口宽度推导断点名称：复刻工程内 (size<=width<nextSize) 的分段判定
   *  注意最后一段是 <= 的开区间上界，即 width >= 840 判定为 lg
   */
  public resolveBreakpoint(widthVp: number): string {
    if (widthVp < 0) {
      return this.currentBreakpoint;
    }
    for (let i = this.definitions.length - 1; i >= 0; i--) {
      if (widthVp >= this.definitions[i].size) {
        return this.definitions[i].name;
      }
    }
    return this.definitions[0].name;
  }

  /** 应用窗口宽度变化：内部仅在断点真正改变时才触发事件
   *  这与工程 updateCurrentBreakpoint 的 `if (this.currentBreakpoint !== breakpoint)` 判断一致
   */
  public applyWidth(widthVp: number): boolean {
    const resolved = this.resolveBreakpoint(widthVp);
    if (this.currentBreakpoint === resolved) {
      return false;
    }
    const previous = this.currentBreakpoint;
    this.currentBreakpoint = resolved;
    this.sequenceCounter++;
    const event: BreakpointChangeEvent = {
      from: previous,
      to: resolved,
      sequence: this.sequenceCounter
    };
    this.changeHistory.push(event);
    this.notifyListeners(event);
    hilog.info(DOMAIN, TAG, 'breakpoint changed %{public}s -> %{public}s at width %{public}d',
      previous, resolved, widthVp);
    return true;
  }

  private notifyListeners(event: BreakpointChangeEvent): void {
    for (let i = 0; i < this.listeners.length; i++) {
      try {
        this.listeners[i](event);
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'listener threw: %{public}s', JSON.stringify(error) ?? '');
      }
    }
  }

  /** 添加断点变化监听：用于验证事件驱动逻辑 */
  public addListener(listener: (event: BreakpointChangeEvent) => void): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  /** 移除断点变化监听：重复移除应无副作用 */
  public removeListener(listener: (event: BreakpointChangeEvent) => void): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  public getListenerCount(): number {
    return this.listeners.length;
  }

  public getCurrentBreakpoint(): string {
    return this.currentBreakpoint;
  }

  public getChangeHistory(): BreakpointChangeEvent[] {
    return this.changeHistory.slice(0);
  }

  public getChangeCount(): number {
    return this.changeHistory.length;
  }

  /** 清空变化历史：用例之间隔离状态，避免互相污染 */
  public clearHistory(): void {
    this.changeHistory = [];
    this.sequenceCounter = 0;
  }

  /** 计算断点区间的上下界：用于边界值用例
   *  返回 [lowerInclusive, upperExclusive)，最后一档上界为 Number.MAX_SAFE_INTEGER
   */
  public getBreakpointRange(name: string): number[] {
    for (let i = 0; i < this.definitions.length; i++) {
      if (this.definitions[i].name === name) {
        const lower = this.definitions[i].size;
        const upper = (i === this.definitions.length - 1)
          ? Number.MAX_SAFE_INTEGER
          : this.definitions[i + 1].size;
        return [lower, upper];
      }
    }
    return [-1, -1];
  }

  /** 枚举所有断点名称：保持与定义顺序一致 */
  public getBreakpointNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.definitions.length; i++) {
      names.push(this.definitions[i].name);
    }
    return names;
  }

  /** 校验断点阈值单调递增：定义本身必须有序，否则分段判定会失效 */
  public isThresholdAscending(): boolean {
    for (let i = 1; i < this.definitions.length; i++) {
      if (this.definitions[i].size <= this.definitions[i - 1].size) {
        return false;
      }
    }
    return true;
  }
}

/** 断点值映射器：复刻工程 BreakPointType<T> 的按断点取值行为
 *  用于验证不同断点下配置值（字号、内边距等）的选择正确性
 */
export class BreakPointValueMapper<T> {
  private options: Map<string, T> = new Map();

  constructor(options: Map<string, T>) {
    this.options = options;
  }

  /** 按当前断点取值：未命中时回退到 xs，与工程 getValue 的兜底分支一致 */
  public getValue(currentBreakpoint: string): T | undefined {
    if (this.options.has(currentBreakpoint)) {
      return this.options.get(currentBreakpoint);
    }
    return this.options.get('xs');
  }

  public hasBreakpoint(name: string): boolean {
    return this.options.has(name);
  }

  public getConfiguredCount(): number {
    return this.options.size;
  }
}

/** 布局尺寸配置表：模拟工程中按断点定义的不同尺寸方案 */
export interface LayoutSizeProfile {
  breakpoint: string;
  columns: number;
  gutterVp: number;
  marginVp: number;
  fontSizeFp: number;
}

export const LAYOUT_PROFILES: LayoutSizeProfile[] = [
  { breakpoint: 'xs', columns: 2, gutterVp: 8, marginVp: 12, fontSizeFp: 14 },
  { breakpoint: 'sm', columns: 4, gutterVp: 12, marginVp: 16, fontSizeFp: 16 },
  { breakpoint: 'md', columns: 8, gutterVp: 16, marginVp: 24, fontSizeFp: 18 },
  { breakpoint: 'lg', columns: 12, gutterVp: 20, marginVp: 32, fontSizeFp: 20 }
];

/** 按断点查找布局配置：未命中返回 xs 配置作为兜底 */
export function findLayoutProfile(breakpoint: string): LayoutSizeProfile {
  for (let i = 0; i < LAYOUT_PROFILES.length; i++) {
    if (LAYOUT_PROFILES[i].breakpoint === breakpoint) {
      return LAYOUT_PROFILES[i];
    }
  }
  return LAYOUT_PROFILES[0];
}

/** 校验布局配置自洽性：列数、间距、边距、字号均应随断点增大而非递减
 *  这类不变式断言可以发现配置表被误改的问题
 */
export function isLayoutProfileConsistent(profiles: LayoutSizeProfile[]): boolean {
  if (profiles.length < 2) {
    return true;
  }
  for (let i = 1; i < profiles.length; i++) {
    if (profiles[i].columns < profiles[i - 1].columns) {
      return false;
    }
    if (profiles[i].gutterVp < profiles[i - 1].gutterVp) {
      return false;
    }
    if (profiles[i].marginVp < profiles[i - 1].marginVp) {
      return false;
    }
    if (profiles[i].fontSizeFp < profiles[i - 1].fontSizeFp) {
      return false;
    }
  }
  return true;
}
