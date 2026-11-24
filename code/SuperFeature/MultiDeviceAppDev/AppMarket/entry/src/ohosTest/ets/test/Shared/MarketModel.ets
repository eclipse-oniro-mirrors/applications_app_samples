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
// 应用条目：与工程 HomeDataType 中 AppItem 一致
export interface MarketAppItem {
  id: string;
  title: string;
  group: string;
}

// 入口图标：与工程 entranceIcons 数据结构一致
export interface MarketEntrance {
  title: string;
  index: number;
}

export const MARKET_APP_COUNT: number = 21;
export const MARKET_GAME_COUNT: number = 21;
export const MARKET_ENTRANCE_COUNT: number = 5;

/** 应用市场模型测试替身：复刻 MyAppSource 的数据源语义
 *  totalCount/getData/addData/pushData 与监听器通知行为均按工程实现还原
 */
export class MarketModel {
  private apps: MarketAppItem[] = [];
  private games: MarketAppItem[] = [];
  private entrances: MarketEntrance[] = [];
  private reloadNotifies: number = 0;
  private addNotifies: number = 0;
  private changeNotifies: number = 0;
  private deleteNotifies: number = 0;
  private moveNotifies: number = 0;
  private listenerCount: number = 0;

  constructor() {
    for (let i = 0; i < MARKET_APP_COUNT; i++) {
      this.apps.push({ id: String(i), title: 'public_app' + String(i % 10 + 1), group: 'app' });
    }
    for (let i = 0; i < MARKET_GAME_COUNT; i++) {
      this.games.push({ id: String(i + MARKET_APP_COUNT), title: 'public_game' + String(i % 10 + 1), group: 'game' });
    }
    for (let i = 0; i < MARKET_ENTRANCE_COUNT; i++) {
      this.entrances.push({ title: 'home_entrance' + String(i), index: i });
    }
  }

  public totalCount(): number {
    return this.apps.length;
  }

  public getData(index: number): MarketAppItem | undefined {
    if (index < 0 || index >= this.apps.length) {
      return undefined;
    }
    return this.apps[index];
  }

  public getAppCount(): number {
    return this.apps.length;
  }

  public getGameCount(): number {
    return this.games.length;
  }

  public getEntranceCount(): number {
    return this.entrances.length;
  }

  public getEntrances(): MarketEntrance[] {
    return this.entrances;
  }

  public addData(index: number, data: MarketAppItem): void {
    this.apps.splice(index, 0, data);
    this.addNotifies++;
  }

  public pushData(data: MarketAppItem): void {
    this.apps.push(data);
    this.addNotifies++;
  }

  public notifyDataReload(): void {
    this.reloadNotifies++;
  }

  public notifyDataChange(index: number): void {
    this.changeNotifies++;
  }

  public notifyDataDelete(index: number): void {
    this.deleteNotifies++;
  }

  public notifyDataMove(from: number, to: number): void {
    this.moveNotifies++;
  }

  public registerListener(): void {
    this.listenerCount++;
  }

  public unregisterListener(): void {
    if (this.listenerCount > 0) {
      this.listenerCount--;
    }
  }

  public getListenerCount(): number {
    return this.listenerCount;
  }

  public getAddNotifyCount(): number {
    return this.addNotifies;
  }

  public getReloadNotifyCount(): number {
    return this.reloadNotifies;
  }

  public getChangeNotifyCount(): number {
    return this.changeNotifies;
  }

  public getDeleteNotifyCount(): number {
    return this.deleteNotifies;
  }

  public getMoveNotifyCount(): number {
    return this.moveNotifies;
  }

  /** 校验 id 唯一性：数据源不允许出现重复 id */
  public hasUniqueIds(): boolean {
    const seen = new Set<string>();
    for (let i = 0; i < this.apps.length; i++) {
      if (seen.has(this.apps[i].id)) {
        return false;
      }
      seen.add(this.apps[i].id);
    }
    return true;
  }

  /** id 应连续递增：0..n-1 */
  public isIdSequential(): boolean {
    for (let i = 0; i < this.apps.length; i++) {
      if (this.apps[i].id !== String(i)) {
        return false;
      }
    }
    return true;
  }

  /** 按分组过滤：验证 group 字段可正确区分应用与游戏 */
  public countByGroup(group: string): number {
    let count = 0;
    const pool = group === 'game' ? this.games : this.apps;
    for (let i = 0; i < pool.length; i++) {
      if (pool[i].group === group) {
        count++;
      }
    }
    return count;
  }

  /** 分页切片：模拟列表懒加载的页容量约束 */
  public slicePage(page: number, pageSize: number): MarketAppItem[] {
    const start = page * pageSize;
    if (start >= this.apps.length) {
      return [];
    }
    return this.apps.slice(start, start + pageSize);
  }

  /** 计算总页数：向上取整 */
  public totalPages(pageSize: number): number {
    if (pageSize <= 0) {
      return 0;
    }
    return Math.ceil(this.apps.length / pageSize);
  }

  /** 搜索标题：模拟搜索框的包含匹配 */
  public searchTitle(keyword: string): number {
    let hits = 0;
    for (let i = 0; i < this.apps.length; i++) {
      if (this.apps[i].title.indexOf(keyword) >= 0) {
        hits++;
      }
    }
    return hits;
  }
}
