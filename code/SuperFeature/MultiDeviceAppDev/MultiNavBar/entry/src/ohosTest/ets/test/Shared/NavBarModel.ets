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

export interface NavMenuNode {
  name: string;
  subCount: number;
  isVisible: boolean;
  parentNode: number;
}

export const NAV_TOP_COUNT: number = 5;

export const NAV_SUB_COUNTS: number[] = [3, 2, 2, 2, 2];

export class NavBarModel {
  private nodes: NavMenuNode[] = [];

  constructor() {
    for (let i = 0; i < NAV_TOP_COUNT; i++) {
      this.nodes.push({
        name: 'nav' + String(i),
        subCount: NAV_SUB_COUNTS[i] === undefined ? 0 : NAV_SUB_COUNTS[i],
        isVisible: true,
        parentNode: -1
      });
    }
  }

  public getTopCount(): number {
    return this.nodes.length;
  }

  public getNodes(): NavMenuNode[] {
    return this.nodes;
  }

  public getNode(index: number): NavMenuNode | undefined {
    if (index < 0 || index >= this.nodes.length) {
      return undefined;
    }
    return this.nodes[index];
  }

  public getSubCount(index: number): number {
    const node = this.getNode(index);
    return node === undefined ? -1 : node.subCount;
  }

  public getTotalSubCount(): number {
    let sum = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      sum += this.nodes[i].subCount;
    }
    return sum;
  }

  public setVisible(index: number, visible: boolean): boolean {
    const node = this.getNode(index);
    if (node === undefined) {
      return false;
    }
    node.isVisible = visible;
    return true;
  }

  public getVisibleCount(): number {
    let count = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].isVisible) {
        count++;
      }
    }
    return count;
  }

  public countChildrenOf(parentIndex: number): number {
    let count = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].parentNode === parentIndex) {
        count++;
      }
    }
    return count;
  }

  public hasUniqueNames(): boolean {
    const seen = new Set<string>();
    for (let i = 0; i < this.nodes.length; i++) {
      if (seen.has(this.nodes[i].name)) {
        return false;
      }
      seen.add(this.nodes[i].name);
    }
    return true;
  }

  public hasNoEmptyTop(): boolean {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].subCount <= 0) {
        return false;
      }
    }
    return true;
  }

  public isSubCountConsistent(): boolean {
    if (this.nodes.length !== NAV_SUB_COUNTS.length) {
      return false;
    }
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].subCount !== NAV_SUB_COUNTS[i]) {
        return false;
      }
    }
    return true;
  }

  public isValidIndex(index: number): boolean {
    return index === Math.floor(index) && index >= 0 && index < this.nodes.length;
  }
}
