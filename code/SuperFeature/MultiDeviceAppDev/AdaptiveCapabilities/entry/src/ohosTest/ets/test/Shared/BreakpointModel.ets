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
// 断点定义：与工程 BreakpointSystem 的 breakpoints 数组严格一致
export interface BpDefinition {
  name: string;
  size: number;
}

// 断点布局配置：描述各断点下的栅格与字号方案
export interface BpLayoutProfile {
  breakpoint: string;
  columns: number;
  gutterVp: number;
  marginVp: number;
  fontFp: number;
}

// 断点切换记录：用于验证事件驱动与去重逻辑
export interface BpChange {
  from: string;
  to: string;
  seq: number;
}

export const BP_DEFINITIONS: BpDefinition[] = [
  { name: 'xs', size: 0 },
  { name: 'sm', size: 320 },
  { name: 'md', size: 600 },
  { name: 'lg', size: 840 }
];

export const BP_PROFILES: BpLayoutProfile[] = [
  { breakpoint: 'xs', columns: 2, gutterVp: 8, marginVp: 12, fontFp: 14 },
  { breakpoint: 'sm', columns: 4, gutterVp: 12, marginVp: 16, fontFp: 16 },
  { breakpoint: 'md', columns: 8, gutterVp: 16, marginVp: 24, fontFp: 18 },
  { breakpoint: 'lg', columns: 12, gutterVp: 20, marginVp: 32, fontFp: 20 }
];

/** 断点模型测试替身：复刻工程 BreakpointSystem 的分段判定与状态流转
 *  之所以在测试侧重建而不是直接 import 主模块，是因为 ohosTest 模块与主模块
 *  是独立的 hap，跨模块引用主模块的 @Component 会在编译期产生符号解析问题。
 */
export class BreakpointModel {
  private defs: BpDefinition[] = BP_DEFINITIONS;
  private current: string = 'md';
  private history: BpChange[] = [];
  private seq: number = 0;
  private listeners: number = 0;
  private registerCalls: number = 0;
  private unregisterCalls: number = 0;

  public getDefinitions(): BpDefinition[] {
    return this.defs;
  }

  /** 按宽度解析断点：末档上界为无穷，即 width >= 840 判为 lg */
  public resolve(widthVp: number): string {
    if (widthVp < 0) {
      return this.current;
    }
    for (let i = this.defs.length - 1; i >= 0; i--) {
      if (widthVp >= this.defs[i].size) {
        return this.defs[i].name;
      }
    }
    return this.defs[0].name;
  }

  /** 应用宽度：仅在断点真正变化时才记录，复刻 updateCurrentBreakpoint 的判重 */
  public applyWidth(widthVp: number): boolean {
    const next = this.resolve(widthVp);
    if (next === this.current) {
      return false;
    }
    const previous = this.current;
    this.current = next;
    this.seq++;
    this.history.push({ from: previous, to: next, seq: this.seq });
    return true;
  }

  public getCurrent(): string {
    return this.current;
  }

  public getHistory(): BpChange[] {
    return this.history;
  }

  public getChangeCount(): number {
    return this.history.length;
  }

  public clearHistory(): void {
    this.history = [];
    this.seq = 0;
  }

  public register(): void {
    this.registerCalls++;
    this.listeners++;
  }

  public unregister(): void {
    this.unregisterCalls++;
    if (this.listeners > 0) {
      this.listeners--;
    }
  }

  public getRegisterCalls(): number {
    return this.registerCalls;
  }

  public getUnregisterCalls(): number {
    return this.unregisterCalls;
  }

  public getListenerCount(): number {
    return this.listeners;
  }

  public isListenerBalanced(): boolean {
    return this.registerCalls === this.unregisterCalls && this.listeners === 0;
  }

  /** 断点区间：[lower, upper) */
  public rangeOf(name: string): number[] {
    for (let i = 0; i < this.defs.length; i++) {
      if (this.defs[i].name === name) {
        const upper = (i === this.defs.length - 1) ? Number.MAX_SAFE_INTEGER : this.defs[i + 1].size;
        return [this.defs[i].size, upper];
      }
    }
    return [-1, -1];
  }

  /** 阈值必须严格递增，否则分段判定失效 */
  public isThresholdAscending(): boolean {
    for (let i = 1; i < this.defs.length; i++) {
      if (this.defs[i].size <= this.defs[i - 1].size) {
        return false;
      }
    }
    return true;
  }

  /** 布局配置应随断点增大而单调不减 */
  public isProfileMonotonic(): boolean {
    for (let i = 1; i < BP_PROFILES.length; i++) {
      if (BP_PROFILES[i].columns < BP_PROFILES[i - 1].columns) {
        return false;
      }
      if (BP_PROFILES[i].gutterVp < BP_PROFILES[i - 1].gutterVp) {
        return false;
      }
      if (BP_PROFILES[i].marginVp < BP_PROFILES[i - 1].marginVp) {
        return false;
      }
      if (BP_PROFILES[i].fontFp < BP_PROFILES[i - 1].fontFp) {
        return false;
      }
    }
    return true;
  }

  public profileOf(breakpoint: string): BpLayoutProfile {
    for (let i = 0; i < BP_PROFILES.length; i++) {
      if (BP_PROFILES[i].breakpoint === breakpoint) {
        return BP_PROFILES[i];
      }
    }
    return BP_PROFILES[0];
  }

  public getBreakpointNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.defs.length; i++) {
      names.push(this.defs[i].name);
    }
    return names;
  }

  /** 把宽度钳制到合法区间：负值归零，超宽保持 */
  public clampWidth(widthVp: number): number {
    if (widthVp < 0) {
      return 0;
    }
    return widthVp;
  }

  /** 计算栅格单列宽度：扣除左右 margin 与列间 gutter 后的均分 */
  public columnWidth(widthVp: number, breakpoint: string): number {
    const profile = this.profileOf(breakpoint);
    const usable = widthVp - profile.marginVp * 2 - profile.gutterVp * (profile.columns - 1);
    if (usable <= 0) {
      return 0;
    }
    return usable / profile.columns;
  }

  /** 判断两次采样是否处于同一断点：稳定性断言的基础 */
  public isSameBreakpoint(widthA: number, widthB: number): boolean {
    return this.resolve(widthA) === this.resolve(widthB);
  }
}
