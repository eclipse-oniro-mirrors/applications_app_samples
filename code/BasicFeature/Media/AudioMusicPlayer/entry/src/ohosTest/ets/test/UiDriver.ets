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

import { abilityDelegatorRegistry, Driver, ON, PointerMatrix, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const GESTURE_SPEED: number = 600;
const FIND_RETRY_COUNT: number = 5;
const FIND_RETRY_INTERVAL_MS: number = 1000;

/**
 * 界面链路用例共用的驱动封装：统一冷启动、等待控件、安全点击与滑动。
 * 只封装动作与等待，不做断言，避免用例之间通过共享状态互相影响判断。
 */
export class UiDriver {
  public readonly driver: Driver;
  private readonly bundle: string;

  constructor() {
    this.driver = Driver.create();
    this.bundle = abilityDelegatorRegistry.getArguments().bundleName;
  }

  /**
   * 唤醒、解锁（如处于锁屏）并拉起应用的播放主界面，返回是否已经找到主界面根控件。
   */
  async openHome(): Promise<boolean> {
    await this.wakeUp();
    const want: Want = {
      bundleName: this.bundle,
      abilityName: 'EntryAbility'
    };
    await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
    await this.driver.delayMs(1000);
    const root: Component | null = await this.find('playerInfoComponent');
    return root !== null;
  }

  private async wakeUp(): Promise<void> {
    await this.driver.wakeUpDisplay();
    await this.driver.delayMs(500);
    const lockNodes: Component[] = await this.driver.findComponents(ON.text('上滑解锁'));
    if (lockNodes === null || lockNodes.length === 0) {
      return;
    }
    hilog.info(DOMAIN, TAG, '%{public}s', '检测到锁屏，执行上滑解锁');
    const size = await this.driver.getDisplaySize();
    const pointers = PointerMatrix.create(1, 3);
    pointers.setPoint(0, 0, { x: Math.round(size.x / 2), y: Math.round(size.y * 0.8) });
    pointers.setPoint(0, 1, { x: Math.round(size.x / 2), y: Math.round(size.y * 0.5) });
    pointers.setPoint(0, 2, { x: Math.round(size.x / 2), y: Math.round(size.y * 0.2) });
    await this.driver.injectMultiPointerAction(pointers, GESTURE_SPEED);
    await this.driver.delayMs(1000);
  }

  /**
   * 按控件编号查找控件，找不到返回 null。每次重新创建驱动以适配界面重建。
   */
  async find(id: string): Promise<Component | null> {
    let current: Driver = this.driver;
    for (let attempt = 0; attempt < FIND_RETRY_COUNT; attempt++) {
      const comp: Component | null = await current.waitForComponent(ON.id(id), 3000);
      if (comp !== null) {
        return comp;
      }
      await current.delayMs(FIND_RETRY_INTERVAL_MS);
      current = Driver.create();
    }
    return null;
  }

  /**
   * 等待控件出现，找不到时抛出带控件编号的错误，便于定位是哪条链路失败。
   */
  async require(id: string): Promise<Component> {
    const comp: Component | null = await this.find(id);
    if (comp === null) {
      throw new Error(`组件 ${id} 在 ${FIND_RETRY_COUNT} 次重试后仍未出现`);
    }
    return comp;
  }

  async wait(ms: number): Promise<void> {
    await this.driver.delayMs(ms);
  }

  /**
   * 控件是否存在，不等待。
   */
  async exists(id: string): Promise<boolean> {
    const comp: Component | null = await this.driver.waitForComponent(ON.id(id), 1500);
    return comp !== null;
  }

  /**
   * 统计当前界面上文字等于给定文本的控件个数。
   */
  async countText(text: string): Promise<number> {
    const nodes: Component[] = await this.driver.findComponents(ON.text(text));
    return nodes === null ? 0 : nodes.length;
  }

  /**
   * 统计当前界面上文字以给定前缀开头的控件个数。
   */
  async countTextStartsWith(prefix: string): Promise<number> {
    const nodes: Component[] = await this.driver.findComponents(ON.text(prefix, 'startsWith'));
    return nodes === null ? 0 : nodes.length;
  }

  /**
   * 按文字查找并点击控件（播放列表每行没有单独编号，只能按歌名定位）。
   */
  async clickText(text: string): Promise<boolean> {
    const comp: Component | null = await this.driver.waitForComponent(ON.text(text), 3000);
    if (comp === null) {
      return false;
    }
    return await comp.click();
  }

  /**
   * 在控件区域内从左到右滑动一次（进度条、音量与倍速滑块共用）。
   */
  async dragHorizontal(comp: Component, fromRatio: number, toRatio: number): Promise<void> {
    const bounds = await comp.getBounds();
    const middleY: number = Math.round(bounds.top + bounds.height / 2);
    const startX: number = Math.round(bounds.left + bounds.width * fromRatio);
    const endX: number = Math.round(bounds.left + bounds.width * toRatio);
    const pointers = PointerMatrix.create(1, 3);
    pointers.setPoint(0, 0, { x: startX, y: middleY });
    pointers.setPoint(0, 1, { x: Math.round((startX + endX) / 2), y: middleY });
    pointers.setPoint(0, 2, { x: endX, y: middleY });
    await this.driver.injectMultiPointerAction(pointers, GESTURE_SPEED);
  }

  /**
   * 在控件区域内从右到左滑动一次（主界面轮播翻到歌词页）。
   */
  async swipeLeft(comp: Component): Promise<void> {
    const bounds = await comp.getBounds();
    const middleY: number = Math.round(bounds.top + bounds.height / 2);
    const startX: number = Math.round(bounds.left + bounds.width * 0.85);
    const endX: number = Math.round(bounds.left + bounds.width * 0.15);
    const pointers = PointerMatrix.create(1, 3);
    pointers.setPoint(0, 0, { x: startX, y: middleY });
    pointers.setPoint(0, 1, { x: Math.round((startX + endX) / 2), y: middleY });
    pointers.setPoint(0, 2, { x: endX, y: middleY });
    await this.driver.injectMultiPointerAction(pointers, GESTURE_SPEED);
  }

  /**
   * 点击界面空白处，用于收起弹出面板而非通过系统返回键。
   */
  async tapBlank(): Promise<void> {
    const size = await this.driver.getDisplaySize();
    await this.driver.click(Math.round(size.x / 2), Math.round(size.y * 0.06));
    await this.driver.delayMs(800);
  }
}
