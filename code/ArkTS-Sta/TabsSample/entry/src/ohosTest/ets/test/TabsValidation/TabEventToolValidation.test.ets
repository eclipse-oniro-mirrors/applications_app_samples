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


// TabEventToolValidation 数据集：模拟 TabDataSource/WaterFlowDataSource 的基础增删查
class TabEventToolValidationDataSet {
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


// TabEventToolValidation 配置表：模拟 STYLE_CONFIGURATION 的键值读取
class TabEventToolValidationConfig {
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


// TabEventToolValidation 瀑布流数据源模型：对齐 WaterFlowDataSource 的增删移动/重载
class TabEventToolValidationWaterFlowModel {
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


// TabEventToolValidation 树节点模型：对齐 TreeNode/ArticleNode 的折叠展开语义
class TabEventToolValidationTreeNodeModel {
  public expand: boolean;
  public type: number;
  public title: string;
  public children: TabEventToolValidationTreeNodeModel[];

  public constructor(title: string, type: number, expand: boolean) {
    this.title = title;
    this.type = type;
    this.expand = expand;
    this.children = [];
  }

  public addChild(child: TabEventToolValidationTreeNodeModel): void {
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

export default function tabEventToolValidationTest() {
  describe('TabEventToolValidation_Test', () => {
    it('tabEventToolValidationTest_add_contains_0', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(0);
      dataSet.add(1);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(0)).assertTrue();
      expect(dataSet.contains(9)).assertFalse();
      expect(dataSet.get(0)).assertEqual(0);
    });

    it('tabEventToolValidationTest_insert_remove_0', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabEventToolValidationTest_copy_and_clear_0', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(0);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabEventToolValidationTest_add_contains_1', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(1);
      dataSet.add(2);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(1)).assertTrue();
      expect(dataSet.contains(10)).assertFalse();
      expect(dataSet.get(0)).assertEqual(1);
    });

    it('tabEventToolValidationTest_insert_remove_1', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabEventToolValidationTest_copy_and_clear_1', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(1);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabEventToolValidationTest_add_contains_2', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(2);
      dataSet.add(3);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(2)).assertTrue();
      expect(dataSet.contains(11)).assertFalse();
      expect(dataSet.get(0)).assertEqual(2);
    });

    it('tabEventToolValidationTest_insert_remove_2', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabEventToolValidationTest_copy_and_clear_2', 0, async () => {
      const dataSet = new TabEventToolValidationDataSet();
      dataSet.add(2);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabEventToolValidationTest_set_get_0', 0, async () => {
      const config = new TabEventToolValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 3)).assertEqual(3);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabEventToolValidationTest_keys_and_clear_0', 0, async () => {
      const config = new TabEventToolValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabEventToolValidationTest_default_fallback_0', 0, async () => {
      const config = new TabEventToolValidationConfig();
      expect(config.get('UNKNOWN', 0)).assertEqual(0);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 1);
      expect(config.get('UNKNOWN', 0)).assertEqual(1);
    });

    it('tabEventToolValidationTest_set_get_1', 0, async () => {
      const config = new TabEventToolValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 4)).assertEqual(4);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabEventToolValidationTest_keys_and_clear_1', 0, async () => {
      const config = new TabEventToolValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabEventToolValidationTest_default_fallback_1', 0, async () => {
      const config = new TabEventToolValidationConfig();
      expect(config.get('UNKNOWN', 1)).assertEqual(1);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 2);
      expect(config.get('UNKNOWN', 0)).assertEqual(2);
    });

    it('tabEventToolValidationTest_set_get_2', 0, async () => {
      const config = new TabEventToolValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 5)).assertEqual(5);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabEventToolValidationTest_keys_and_clear_2', 0, async () => {
      const config = new TabEventToolValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabEventToolValidationTest_default_fallback_2', 0, async () => {
      const config = new TabEventToolValidationConfig();
      expect(config.get('UNKNOWN', 2)).assertEqual(2);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 3);
      expect(config.get('UNKNOWN', 0)).assertEqual(3);
    });

    it('tabEventToolValidationTest_add_delete_0', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('tabEventToolValidationTest_move_reload_0', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('tabEventToolValidationTest_listener_lifecycle_0', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('tabEventToolValidationTest_add_delete_1', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('tabEventToolValidationTest_move_reload_1', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('tabEventToolValidationTest_listener_lifecycle_1', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('tabEventToolValidationTest_add_delete_2', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('tabEventToolValidationTest_move_reload_2', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('tabEventToolValidationTest_listener_lifecycle_2', 0, async () => {
      const flow = new TabEventToolValidationWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('tabEventToolValidationTest_toggle_expand_0', 0, async () => {
      const node = new TabEventToolValidationTreeNodeModel('第一章', 2, false);
      expect(node.expand).assertFalse();
      expect(node.toggle()).assertTrue();
      expect(node.expand).assertTrue();
      expect(node.toggle()).assertFalse();
      expect(node.isCollapseMenu()).assertTrue();
    });

    it('tabEventToolValidationTest_children_0', 0, async () => {
      const root = new TabEventToolValidationTreeNodeModel('root', 2, true);
      root.addChild(new TabEventToolValidationTreeNodeModel('c1', 1, false));
      root.addChild(new TabEventToolValidationTreeNodeModel('c2', 1, false));
      expect(root.childCount()).assertEqual(2);
      expect(root.hasChildren()).assertTrue();
      expect(root.countAll()).assertEqual(3);
      expect(root.isCollapseMenu()).assertTrue();
    });

    it('tabEventToolValidationTest_leaf_semantics_0', 0, async () => {
      const leaf = new TabEventToolValidationTreeNodeModel('leaf', 1, false);
      expect(leaf.hasChildren()).assertFalse();
      expect(leaf.childCount()).assertEqual(0);
      expect(leaf.countAll()).assertEqual(1);
      expect(leaf.isCollapseMenu()).assertFalse();
    });

    it('tabEventToolValidationTest_toggle_expand_1', 0, async () => {
      const node = new TabEventToolValidationTreeNodeModel('第一章', 2, false);
      expect(node.expand).assertFalse();
      expect(node.toggle()).assertTrue();
      expect(node.expand).assertTrue();
      expect(node.toggle()).assertFalse();
      expect(node.isCollapseMenu()).assertTrue();
    });

    it('tabEventToolValidationTest_children_1', 0, async () => {
      const root = new TabEventToolValidationTreeNodeModel('root', 2, true);
      root.addChild(new TabEventToolValidationTreeNodeModel('c1', 1, false));
      root.addChild(new TabEventToolValidationTreeNodeModel('c2', 1, false));
      expect(root.childCount()).assertEqual(2);
      expect(root.hasChildren()).assertTrue();
      expect(root.countAll()).assertEqual(3);
      expect(root.isCollapseMenu()).assertTrue();
    });

    it('tabEventToolValidationTest_leaf_semantics_1', 0, async () => {
      const leaf = new TabEventToolValidationTreeNodeModel('leaf', 1, false);
      expect(leaf.hasChildren()).assertFalse();
      expect(leaf.childCount()).assertEqual(0);
      expect(leaf.countAll()).assertEqual(1);
      expect(leaf.isCollapseMenu()).assertFalse();
    });

    it('tabEventToolValidationTest_toggle_expand_2', 0, async () => {
      const node = new TabEventToolValidationTreeNodeModel('第一章', 2, false);
      expect(node.expand).assertFalse();
      expect(node.toggle()).assertTrue();
      expect(node.expand).assertTrue();
      expect(node.toggle()).assertFalse();
      expect(node.isCollapseMenu()).assertTrue();
    });

    it('tabEventToolValidationTest_children_2', 0, async () => {
      const root = new TabEventToolValidationTreeNodeModel('root', 2, true);
      root.addChild(new TabEventToolValidationTreeNodeModel('c1', 1, false));
      root.addChild(new TabEventToolValidationTreeNodeModel('c2', 1, false));
      expect(root.childCount()).assertEqual(2);
      expect(root.hasChildren()).assertTrue();
      expect(root.countAll()).assertEqual(3);
      expect(root.isCollapseMenu()).assertTrue();
    });

    it('tabEventToolValidationTest_leaf_semantics_2', 0, async () => {
      const leaf = new TabEventToolValidationTreeNodeModel('leaf', 1, false);
      expect(leaf.hasChildren()).assertFalse();
      expect(leaf.childCount()).assertEqual(0);
      expect(leaf.countAll()).assertEqual(1);
      expect(leaf.isCollapseMenu()).assertFalse();
    });

  });
}
