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

// Field model of the public tree result. It only describes the entries this sample reads and is
// not a replacement for the SDK protocol declaration.
// [Start ui_tree_types]
export interface TreeNode {
  $ID?: number;
  $type?: string;
  compid?: string;
  $children?: TreeNode[];
}
export interface TreeEnvelope {
  schemaVersion: number;
  treeInfo: TreeNode | null;
}
// [End ui_tree_types]

export interface TreeOptions {
  visibleOnly: boolean;
  filterLayout: boolean;
  interaction: boolean;
  accessibility: boolean;
  visual: boolean;
  functional: boolean;
}

// Full-tree request used for node location before command injection.
export const FULL_TREE: TreeOptions = {
  visibleOnly: false, filterLayout: false,
  interaction: false, accessibility: false,
  visual: false, functional: false
};

export const OUTPUT_LIMIT = 2000;

// [Start ui_tree_parse_find]
export function parseTree(value: string): TreeEnvelope {
  const tree = JSON.parse(value) as TreeEnvelope;
  if (tree.schemaVersion !== 1) {
    throw new Error('Unsupported tree schema');
  }
  return tree;
}

export function findNode(tree: TreeEnvelope, componentId: string): TreeNode | undefined {
  if (tree.treeInfo === null) {
    return undefined;
  }
  const nodes: TreeNode[] = [tree.treeInfo];
  while (nodes.length > 0) {
    const node = nodes.pop();
    if (node === undefined) {
      continue;
    }
    if (node.compid === componentId) {
      return node;
    }
    if (node.$children !== undefined) {
      for (const child of node.$children) {
        nodes.push(child);
      }
    }
  }
  return undefined;
}
// [End ui_tree_parse_find]

export function countNodes(tree: TreeEnvelope): number {
  let total: number = 0;
  const visit = (node: TreeNode): void => {
    total += 1;
    if (node.$children !== undefined) {
      for (const child of node.$children) {
        visit(child);
      }
    }
  };
  if (tree.treeInfo !== null) {
    visit(tree.treeInfo);
  }
  return total;
}

// Returns the integer node id of a component; the collected id is only valid for the current
// result and is not a long-term reference to the component.
export function requireNodeId(tree: TreeEnvelope, componentId: string): number {
  const node = findNode(tree, componentId);
  if (node === undefined || node.$ID === undefined) {
    throw new Error(`Node ${componentId} is missing from the collected tree`);
  }
  return node.$ID;
}

export function failure(error: Object): string {
  if (error instanceof Error) {
    return error.message;
  }
  return `${error}`;
}
