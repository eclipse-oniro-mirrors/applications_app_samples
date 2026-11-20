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

import { describe, it, expect } from '@ohos/hypium';


// TabAuthSession 数据集：模拟 TabDataSource/WaterFlowDataSource 的基础增删查
class TabAuthSessionDataSet {
  private values: number[] = [];

  public add(value: number): void {
    this.values.push(value);
  }

  public insert(index: number, value: number): boolean {
    if (index < 0 || index > this.values.length) {
      return false;
    }
    this.values.splice(index, 0, value);
    return true;
  }

  public remove(value: number): boolean {
    const pos: number = this.values.indexOf(value);
    if (pos < 0) {
      return false;
    }
    this.values.splice(pos, 1);
    return true;
  }

  public contains(value: number): boolean {
    return this.values.indexOf(value) >= 0;
  }

  public size(): number {
    return this.values.length;
  }

  public get(index: number): number {
    return (index >= 0 && index < this.values.length) ? this.values[index] : -1;
  }

  public toArray(): number[] {
    const copy: number[] = [];
    for (let i: number = 0; i < this.values.length; i++) {
      copy.push(this.values[i]);
    }
    return copy;
  }

  public clear(): void {
    this.values = [];
  }
}


// TabAuthSession 配置表：模拟 STYLE_CONFIGURATION 的键值读取
class TabAuthSessionConfig {
  private entries: Map<string, number> = new Map<string, number>();

  public set(key: string, value: number): void {
    this.entries.set(key, value);
  }

  public get(key: string, defaultValue: number): number {
    const value: number | undefined = this.entries.get(key);
    return value === undefined ? defaultValue : value;
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public keys(): string[] {
    const result: string[] = [];
    this.entries.forEach((value: number, key: string) => {
      result.push(key);
    });
    return result;
  }

  public keyCount(): number {
    return this.entries.size;
  }

  public clear(): void {
    this.entries = new Map<string, number>();
  }
}


// TabAuthSession 瀑布流数据源模型：对齐 WaterFlowDataSource 的增删移动/重载
class TabAuthSessionWaterFlowModel {
  private dataArray: string[] = [];
  private listeners: number = 0;

  public constructor(initial: string[]) {
    this.dataArray = initial;
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    if (index < 0 || index >= this.dataArray.length) {
      return '';
    }
    return this.dataArray[index];
  }

  public addItem(index: number, value: string): boolean {
    if (index < 0 || index > this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 0, value);
    return true;
  }

  public deleteItem(index: number): boolean {
    if (index < 0 || index >= this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 1);
    return true;
  }

  public move(from: number, to: number): boolean {
    if (from < 0 || from >= this.dataArray.length || to < 0 || to > this.dataArray.length) {
      return false;
    }
    const value: string = this.dataArray[from];
    this.dataArray.splice(from, 1);
    this.dataArray.splice(to, 0, value);
    return true;
  }

  public reload(data: string[]): void {
    this.dataArray = data;
  }

  public registerListener(): void {
    this.listeners = this.listeners + 1;
  }

  public unregisterListener(): void {
    if (this.listeners > 0) {
      this.listeners = this.listeners - 1;
    }
  }

  public getListenerCount(): number {
    return this.listeners;
  }
}


// TabAuthSession 树节点模型：对齐 TreeNode/ArticleNode 的折叠展开语义
class TabAuthSessionTreeNodeModel {
  public expand: boolean;
  public type: number;
  public title: string;
  public children: TabAuthSessionTreeNodeModel[];

  public constructor(title: string, type: number, expand: boolean) {
    this.title = title;
    this.type = type;
    this.expand = expand;
    this.children = [];
  }

  public addChild(child: TabAuthSessionTreeNodeModel): void {
    this.children.push(child);
  }

  public toggle(): boolean {
    this.expand = !this.expand;
    return this.expand;
  }

  public childCount(): number {
    return this.children.length;
  }

  public hasChildren(): boolean {
    return this.children.length > 0;
  }

  public isCollapseMenu(): boolean {
    return this.type === 2;
  }

  public countAll(): number {
    let total: number = 1;
    for (let i: number = 0; i < this.children.length; i++) {
      total += this.children[i].countAll();
    }
    return total;
  }
}


// TabAuthSession 文章数据模型：对齐 ArticleNode 与 ArticleSource
class TabAuthSessionArticleNodeModel {
  public type: number = 0;
  public title: string = '';
  public url: string = '';

  public constructor(type: number, title: string, url: string) {
    this.type = type;
    this.title = title;
    this.url = url;
  }
}

class TabAuthSessionArticleSourceModel {
  private articleData: TabAuthSessionArticleNodeModel[] = [];
  private listeners: number = 0;

  public totalCount(): number {
    return this.articleData.length;
  }

  public getData(index: number): TabAuthSessionArticleNodeModel {
    if (index < 0 || index >= this.articleData.length) {
      return new TabAuthSessionArticleNodeModel(-1, '', '');
    }
    return this.articleData[index];
  }

  public pushData(value: TabAuthSessionArticleNodeModel): void {
    this.articleData.push(value);
  }

  public addData(index: number, value: TabAuthSessionArticleNodeModel): boolean {
    if (index < 0 || index > this.articleData.length) {
      return false;
    }
    this.articleData.splice(index, 0, value);
    return true;
  }

  public updateData(index: number, value: TabAuthSessionArticleNodeModel): boolean {
    if (index < 0 || index >= this.articleData.length) {
      return false;
    }
    this.articleData.splice(index, 1, value);
    return true;
  }

  public registerListener(): void {
    this.listeners = this.listeners + 1;
  }

  public getListenerCount(): number {
    return this.listeners;
  }
}


// TabAuthSession 校验器：提供页签索引/输入范围等通用边界校验
class TabAuthSessionValidator {
  public static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  public static isValidIndex(index: number, count: number): boolean {
    return index >= 0 && index < count;
  }

  public static isNonEmptyText(text: string): boolean {
    return text.length > 0;
  }

  public static isPositive(value: number): boolean {
    return value > 0;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static normalizeIndex(index: number, count: number): number {
    if (count <= 0) {
      return 0;
    }
    const mod: number = index % count;
    return mod < 0 ? mod + count : mod;
  }
}


// TabAuthSession 注册表：以键统计页签/配置条目数量，覆盖增删与去重
class TabAuthSessionRegistry {
  private items: Map<string, number> = new Map<string, number>();

  public add(key: string, value: number): void {
    if (!this.items.has(key)) {
      this.items.set(key, value);
    }
  }

  public update(key: string, value: number): boolean {
    if (!this.items.has(key)) {
      return false;
    }
    this.items.set(key, value);
    return true;
  }

  public get(key: string): number {
    const value: number | undefined = this.items.get(key);
    return value === undefined ? -1 : value;
  }

  public has(key: string): boolean {
    return this.items.has(key);
  }

  public remove(key: string): boolean {
    return this.items.delete(key);
  }

  public size(): number {
    return this.items.size;
  }

  public totalValue(): number {
    let total: number = 0;
    this.items.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public clear(): void {
    this.items = new Map<string, number>();
  }
}

export default function tabAuthSessionTest() {
  describe('TabAuthSession_Test', () => {
    it('tabAuthSessionTest_add_contains_0', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(0);
      dataSet.add(1);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(0)).assertTrue();
      expect(dataSet.contains(9)).assertFalse();
      expect(dataSet.get(0)).assertEqual(0);
    });

    it('tabAuthSessionTest_insert_remove_0', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabAuthSessionTest_copy_and_clear_0', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(0);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabAuthSessionTest_add_contains_1', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(1);
      dataSet.add(2);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(1)).assertTrue();
      expect(dataSet.contains(10)).assertFalse();
      expect(dataSet.get(0)).assertEqual(1);
    });

    it('tabAuthSessionTest_insert_remove_1', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabAuthSessionTest_copy_and_clear_1', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(1);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabAuthSessionTest_add_contains_2', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(2);
      dataSet.add(3);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(2)).assertTrue();
      expect(dataSet.contains(11)).assertFalse();
      expect(dataSet.get(0)).assertEqual(2);
    });

    it('tabAuthSessionTest_insert_remove_2', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabAuthSessionTest_copy_and_clear_2', 0, async () => {
      const dataSet = new TabAuthSessionDataSet();
      dataSet.add(2);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabAuthSessionTest_set_get_0', 0, async () => {
      const config = new TabAuthSessionConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 3)).assertEqual(3);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabAuthSessionTest_keys_and_clear_0', 0, async () => {
      const config = new TabAuthSessionConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabAuthSessionTest_default_fallback_0', 0, async () => {
      const config = new TabAuthSessionConfig();
      expect(config.get('UNKNOWN', 0)).assertEqual(0);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 1);
      expect(config.get('UNKNOWN', 0)).assertEqual(1);
    });

    it('tabAuthSessionTest_set_get_1', 0, async () => {
      const config = new TabAuthSessionConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 4)).assertEqual(4);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabAuthSessionTest_keys_and_clear_1', 0, async () => {
      const config = new TabAuthSessionConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabAuthSessionTest_default_fallback_1', 0, async () => {
      const config = new TabAuthSessionConfig();
      expect(config.get('UNKNOWN', 1)).assertEqual(1);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 2);
      expect(config.get('UNKNOWN', 0)).assertEqual(2);
    });

    it('tabAuthSessionTest_set_get_2', 0, async () => {
      const config = new TabAuthSessionConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 5)).assertEqual(5);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabAuthSessionTest_keys_and_clear_2', 0, async () => {
      const config = new TabAuthSessionConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabAuthSessionTest_default_fallback_2', 0, async () => {
      const config = new TabAuthSessionConfig();
      expect(config.get('UNKNOWN', 2)).assertEqual(2);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 3);
      expect(config.get('UNKNOWN', 0)).assertEqual(3);
    });

    it('tabAuthSessionTest_add_delete_0', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('tabAuthSessionTest_move_reload_0', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('tabAuthSessionTest_listener_lifecycle_0', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('tabAuthSessionTest_add_delete_1', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('tabAuthSessionTest_move_reload_1', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('tabAuthSessionTest_listener_lifecycle_1', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('tabAuthSessionTest_add_delete_2', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('tabAuthSessionTest_move_reload_2', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('tabAuthSessionTest_listener_lifecycle_2', 0, async () => {
      const flow = new TabAuthSessionWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('tabAuthSessionTest_toggle_expand_0', 0, async () => {
      const node = new TabAuthSessionTreeNodeModel('第一章', 2, false);
      expect(node.expand).assertFalse();
      expect(node.toggle()).assertTrue();
      expect(node.expand).assertTrue();
      expect(node.toggle()).assertFalse();
      expect(node.isCollapseMenu()).assertTrue();
    });

    it('tabAuthSessionTest_children_0', 0, async () => {
      const root = new TabAuthSessionTreeNodeModel('root', 2, true);
      root.addChild(new TabAuthSessionTreeNodeModel('c1', 1, false));
      root.addChild(new TabAuthSessionTreeNodeModel('c2', 1, false));
      expect(root.childCount()).assertEqual(2);
      expect(root.hasChildren()).assertTrue();
      expect(root.countAll()).assertEqual(3);
      expect(root.isCollapseMenu()).assertTrue();
    });

    it('tabAuthSessionTest_leaf_semantics_0', 0, async () => {
      const leaf = new TabAuthSessionTreeNodeModel('leaf', 1, false);
      expect(leaf.hasChildren()).assertFalse();
      expect(leaf.childCount()).assertEqual(0);
      expect(leaf.countAll()).assertEqual(1);
      expect(leaf.isCollapseMenu()).assertFalse();
    });

    it('tabAuthSessionTest_toggle_expand_1', 0, async () => {
      const node = new TabAuthSessionTreeNodeModel('第一章', 2, false);
      expect(node.expand).assertFalse();
      expect(node.toggle()).assertTrue();
      expect(node.expand).assertTrue();
      expect(node.toggle()).assertFalse();
      expect(node.isCollapseMenu()).assertTrue();
    });

    it('tabAuthSessionTest_children_1', 0, async () => {
      const root = new TabAuthSessionTreeNodeModel('root', 2, true);
      root.addChild(new TabAuthSessionTreeNodeModel('c1', 1, false));
      root.addChild(new TabAuthSessionTreeNodeModel('c2', 1, false));
      expect(root.childCount()).assertEqual(2);
      expect(root.hasChildren()).assertTrue();
      expect(root.countAll()).assertEqual(3);
      expect(root.isCollapseMenu()).assertTrue();
    });

    it('tabAuthSessionTest_leaf_semantics_1', 0, async () => {
      const leaf = new TabAuthSessionTreeNodeModel('leaf', 1, false);
      expect(leaf.hasChildren()).assertFalse();
      expect(leaf.childCount()).assertEqual(0);
      expect(leaf.countAll()).assertEqual(1);
      expect(leaf.isCollapseMenu()).assertFalse();
    });

    it('tabAuthSessionTest_toggle_expand_2', 0, async () => {
      const node = new TabAuthSessionTreeNodeModel('第一章', 2, false);
      expect(node.expand).assertFalse();
      expect(node.toggle()).assertTrue();
      expect(node.expand).assertTrue();
      expect(node.toggle()).assertFalse();
      expect(node.isCollapseMenu()).assertTrue();
    });

    it('tabAuthSessionTest_children_2', 0, async () => {
      const root = new TabAuthSessionTreeNodeModel('root', 2, true);
      root.addChild(new TabAuthSessionTreeNodeModel('c1', 1, false));
      root.addChild(new TabAuthSessionTreeNodeModel('c2', 1, false));
      expect(root.childCount()).assertEqual(2);
      expect(root.hasChildren()).assertTrue();
      expect(root.countAll()).assertEqual(3);
      expect(root.isCollapseMenu()).assertTrue();
    });

    it('tabAuthSessionTest_leaf_semantics_2', 0, async () => {
      const leaf = new TabAuthSessionTreeNodeModel('leaf', 1, false);
      expect(leaf.hasChildren()).assertFalse();
      expect(leaf.childCount()).assertEqual(0);
      expect(leaf.countAll()).assertEqual(1);
      expect(leaf.isCollapseMenu()).assertFalse();
    });

    it('tabAuthSessionTest_node_fields_0', 0, async () => {
      const node = new TabAuthSessionArticleNodeModel(1, '高性能编程规范', 'high-performance-programming.md');
      expect(node.type).assertEqual(1);
      expect(node.title).assertEqual('高性能编程规范');
      expect(node.url).assertEqual('high-performance-programming.md');
    });

    it('tabAuthSessionTest_source_push_0', 0, async () => {
      const source = new TabAuthSessionArticleSourceModel();
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'A', 'a.md'));
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'B', 'b.md'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1).title).assertEqual('B');
      expect(source.getData(9).type).assertEqual(-1);
    });

    it('tabAuthSessionTest_source_insert_update_0', 0, async () => {
      const source = new TabAuthSessionArticleSourceModel();
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'A', 'a.md'));
      expect(source.addData(1, new TabAuthSessionArticleNodeModel(1, 'B', 'b.md'))).assertTrue();
      expect(source.getData(1).title).assertEqual('B');
      expect(source.updateData(0, new TabAuthSessionArticleNodeModel(1, 'Z', 'z.md'))).assertTrue();
      expect(source.getData(0).title).assertEqual('Z');
      expect(source.updateData(9, new TabAuthSessionArticleNodeModel(1, 'X', 'x.md'))).assertFalse();
    });

    it('tabAuthSessionTest_node_fields_1', 0, async () => {
      const node = new TabAuthSessionArticleNodeModel(1, '高性能编程规范', 'high-performance-programming.md');
      expect(node.type).assertEqual(1);
      expect(node.title).assertEqual('高性能编程规范');
      expect(node.url).assertEqual('high-performance-programming.md');
    });

    it('tabAuthSessionTest_source_push_1', 0, async () => {
      const source = new TabAuthSessionArticleSourceModel();
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'A', 'a.md'));
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'B', 'b.md'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1).title).assertEqual('B');
      expect(source.getData(9).type).assertEqual(-1);
    });

    it('tabAuthSessionTest_source_insert_update_1', 0, async () => {
      const source = new TabAuthSessionArticleSourceModel();
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'A', 'a.md'));
      expect(source.addData(1, new TabAuthSessionArticleNodeModel(1, 'B', 'b.md'))).assertTrue();
      expect(source.getData(1).title).assertEqual('B');
      expect(source.updateData(0, new TabAuthSessionArticleNodeModel(1, 'Z', 'z.md'))).assertTrue();
      expect(source.getData(0).title).assertEqual('Z');
      expect(source.updateData(9, new TabAuthSessionArticleNodeModel(1, 'X', 'x.md'))).assertFalse();
    });

    it('tabAuthSessionTest_node_fields_2', 0, async () => {
      const node = new TabAuthSessionArticleNodeModel(1, '高性能编程规范', 'high-performance-programming.md');
      expect(node.type).assertEqual(1);
      expect(node.title).assertEqual('高性能编程规范');
      expect(node.url).assertEqual('high-performance-programming.md');
    });

    it('tabAuthSessionTest_source_push_2', 0, async () => {
      const source = new TabAuthSessionArticleSourceModel();
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'A', 'a.md'));
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'B', 'b.md'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1).title).assertEqual('B');
      expect(source.getData(9).type).assertEqual(-1);
    });

    it('tabAuthSessionTest_source_insert_update_2', 0, async () => {
      const source = new TabAuthSessionArticleSourceModel();
      source.pushData(new TabAuthSessionArticleNodeModel(1, 'A', 'a.md'));
      expect(source.addData(1, new TabAuthSessionArticleNodeModel(1, 'B', 'b.md'))).assertTrue();
      expect(source.getData(1).title).assertEqual('B');
      expect(source.updateData(0, new TabAuthSessionArticleNodeModel(1, 'Z', 'z.md'))).assertTrue();
      expect(source.getData(0).title).assertEqual('Z');
      expect(source.updateData(9, new TabAuthSessionArticleNodeModel(1, 'X', 'x.md'))).assertFalse();
    });

    it('tabAuthSessionTest_range_checks_0', 0, async () => {
      expect(TabAuthSessionValidator.isInRange(1, 0, 5)).assertTrue();
      expect(TabAuthSessionValidator.isInRange(9, 0, 5)).assertFalse();
      expect(TabAuthSessionValidator.isValidIndex(0, 3)).assertTrue();
      expect(TabAuthSessionValidator.isValidIndex(3, 3)).assertFalse();
      expect(TabAuthSessionValidator.isPositive(1)).assertTrue();
      expect(TabAuthSessionValidator.isPositive(0)).assertFalse();
    });

    it('tabAuthSessionTest_text_and_clamp_0', 0, async () => {
      expect(TabAuthSessionValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TabAuthSessionValidator.isNonEmptyText('')).assertFalse();
      expect(TabAuthSessionValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TabAuthSessionValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TabAuthSessionValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('tabAuthSessionTest_normalize_index_0', 0, async () => {
      expect(TabAuthSessionValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TabAuthSessionValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TabAuthSessionValidator.normalizeIndex(7, 5)).assertEqual(2);
      expect(TabAuthSessionValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('tabAuthSessionTest_range_checks_1', 0, async () => {
      expect(TabAuthSessionValidator.isInRange(2, 0, 6)).assertTrue();
      expect(TabAuthSessionValidator.isInRange(10, 0, 6)).assertFalse();
      expect(TabAuthSessionValidator.isValidIndex(0, 4)).assertTrue();
      expect(TabAuthSessionValidator.isValidIndex(4, 4)).assertFalse();
      expect(TabAuthSessionValidator.isPositive(1)).assertTrue();
      expect(TabAuthSessionValidator.isPositive(0)).assertFalse();
    });

    it('tabAuthSessionTest_text_and_clamp_1', 0, async () => {
      expect(TabAuthSessionValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TabAuthSessionValidator.isNonEmptyText('')).assertFalse();
      expect(TabAuthSessionValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TabAuthSessionValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TabAuthSessionValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('tabAuthSessionTest_normalize_index_1', 0, async () => {
      expect(TabAuthSessionValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TabAuthSessionValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TabAuthSessionValidator.normalizeIndex(8, 5)).assertEqual(3);
      expect(TabAuthSessionValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('tabAuthSessionTest_range_checks_2', 0, async () => {
      expect(TabAuthSessionValidator.isInRange(3, 0, 7)).assertTrue();
      expect(TabAuthSessionValidator.isInRange(11, 0, 7)).assertFalse();
      expect(TabAuthSessionValidator.isValidIndex(0, 5)).assertTrue();
      expect(TabAuthSessionValidator.isValidIndex(5, 5)).assertFalse();
      expect(TabAuthSessionValidator.isPositive(1)).assertTrue();
      expect(TabAuthSessionValidator.isPositive(0)).assertFalse();
    });

    it('tabAuthSessionTest_text_and_clamp_2', 0, async () => {
      expect(TabAuthSessionValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TabAuthSessionValidator.isNonEmptyText('')).assertFalse();
      expect(TabAuthSessionValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TabAuthSessionValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TabAuthSessionValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('tabAuthSessionTest_normalize_index_2', 0, async () => {
      expect(TabAuthSessionValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TabAuthSessionValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TabAuthSessionValidator.normalizeIndex(9, 5)).assertEqual(4);
      expect(TabAuthSessionValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('tabAuthSessionTest_add_and_query_0', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('tab0', 1);
      expect(registry.has('tab0')).assertTrue();
      expect(registry.get('tab0')).assertEqual(1);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab0', 99);
      expect(registry.get('tab0')).assertEqual(1);
      expect(registry.size()).assertEqual(1);
    });

    it('tabAuthSessionTest_update_remove_0', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('tab0', 1);
      expect(registry.update('tab0', 2)).assertTrue();
      expect(registry.get('tab0')).assertEqual(2);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab0')).assertTrue();
      expect(registry.has('tab0')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('tabAuthSessionTest_total_value_0', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('a', 1);
      registry.add('b', 2);
      expect(registry.totalValue()).assertEqual(3);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

    it('tabAuthSessionTest_add_and_query_1', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('tab1', 2);
      expect(registry.has('tab1')).assertTrue();
      expect(registry.get('tab1')).assertEqual(2);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab1', 99);
      expect(registry.get('tab1')).assertEqual(2);
      expect(registry.size()).assertEqual(1);
    });

    it('tabAuthSessionTest_update_remove_1', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('tab1', 1);
      expect(registry.update('tab1', 3)).assertTrue();
      expect(registry.get('tab1')).assertEqual(3);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab1')).assertTrue();
      expect(registry.has('tab1')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('tabAuthSessionTest_total_value_1', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('a', 2);
      registry.add('b', 3);
      expect(registry.totalValue()).assertEqual(5);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

    it('tabAuthSessionTest_add_and_query_2', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('tab2', 3);
      expect(registry.has('tab2')).assertTrue();
      expect(registry.get('tab2')).assertEqual(3);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab2', 99);
      expect(registry.get('tab2')).assertEqual(3);
      expect(registry.size()).assertEqual(1);
    });

    it('tabAuthSessionTest_update_remove_2', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('tab2', 1);
      expect(registry.update('tab2', 4)).assertTrue();
      expect(registry.get('tab2')).assertEqual(4);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab2')).assertTrue();
      expect(registry.has('tab2')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('tabAuthSessionTest_total_value_2', 0, async () => {
      const registry = new TabAuthSessionRegistry();
      registry.add('a', 3);
      registry.add('b', 4);
      expect(registry.totalValue()).assertEqual(7);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

  });
}
