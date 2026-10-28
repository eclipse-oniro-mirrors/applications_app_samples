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

/** Provides Tree Node Spec helpers for the sample. */
export class TreeNodeSpec {
  parentId: number;
  nodeId: number;
  isFolder: boolean;
  title: ResourceStr;

  constructor(parentId: number, nodeId: number, isFolder: boolean, title: ResourceStr) {
    this.parentId = parentId;
    this.nodeId = nodeId;
    this.isFolder = isFolder;
    this.title = title;
  }
}

/** Provides Tree Spec Utils helpers for the sample. */
export class TreeSpecUtils {
  static create(titles: ResourceStr[]): TreeNodeSpec[] {
    const specs: TreeNodeSpec[] = [];
    const parentIds: number[] = [-1, 0, 0, 2, -1, 4];
    const folderFlags: boolean[] = [true, false, true, false, true, false];
    for (let i = 0; i < titles.length && i < 6; i++) {
      specs.push(new TreeNodeSpec(parentIds[i], i, folderFlags[i], titles[i]));
    }
    return specs;
  }

  static rootCount(specs: TreeNodeSpec[]): number {
    let count = 0;
    for (let i = 0; i < specs.length; i++) {
      if (specs[i].parentId === -1) {
        count++;
      }
    }
    return count;
  }

  static childCount(specs: TreeNodeSpec[], parentId: number): number {
    let count = 0;
    for (let i = 0; i < specs.length; i++) {
      if (specs[i].parentId === parentId) {
        count++;
      }
    }
    return count;
  }

  static nodeById(specs: TreeNodeSpec[], nodeId: number): TreeNodeSpec | undefined {
    for (let i = 0; i < specs.length; i++) {
      if (specs[i].nodeId === nodeId) {
        return specs[i];
      }
    }
    return undefined;
  }
}
