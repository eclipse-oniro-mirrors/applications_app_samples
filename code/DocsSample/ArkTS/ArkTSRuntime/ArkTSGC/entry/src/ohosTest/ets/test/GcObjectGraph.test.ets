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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  allocatePressure,
  buildRing,
  COLLECT_ROUNDS,
  CycleChild,
  CycleParent,
  expectedIdSum,
  GcSnapshot,
  hintGC,
  linkPair,
  pairIsLinked,
  range,
  RingNode,
  ringIdSum,
  ringLength,
  runGcCycles,
  sameNumbers
} from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const CHAIN_SIZES: number[] = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
const RING_SIZES: number[] = [2, 3, 4, 7, 10, 32, 100, 500, 1000, 2048];
const PAYLOAD_WIDTHS: number[] = [0, 1, 2, 8, 64, 256, 1024];
const MESH_SIZES: number[] = [2, 3, 4, 5, 6, 8, 10];
const TREE_LEVELS: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
const LIST_LENGTHS: number[] = [1, 2, 3, 5, 16, 64, 256, 1024];
const BAG_DEPTHS: number[] = [1, 2, 3, 4, 5];
const DIAMOND_SHAPES: number[][] = [
  [1, 2, 1],
  [1, 3, 3, 1],
  [1, 4, 6, 4, 1],
  [1, 2, 4, 2, 1]
];
const HINT_REPEATS: number = 10;
const WALK_LIMIT: number = 20000;
const OWNER_COUNTS: number[] = [1, 2, 3, 5, 8];
const LEAF_COUNTS: number[] = [1, 2, 4, 7, 12];

class ChainNode {
  id: number;
  next: ChainNode | null = null;
  payload: number[];

  constructor(id: number, payloadWidth: number) {
    this.id = id;
    this.payload = new Array<number>(payloadWidth).fill(id);
  }
}

class LinkNode {
  id: number;
  prev: LinkNode | null = null;
  next: LinkNode | null = null;
  payload: number[];

  constructor(id: number, payloadWidth: number) {
    this.id = id;
    this.payload = new Array<number>(payloadWidth).fill(id);
  }
}

class BranchNode {
  id: number;
  level: number;
  parent: BranchNode | null = null;
  left: BranchNode | null = null;
  right: BranchNode | null = null;
  payload: number[];

  constructor(id: number, level: number, payloadWidth: number) {
    this.id = id;
    this.level = level;
    this.payload = new Array<number>(payloadWidth).fill(id);
  }
}

class ForkNode {
  id: number;
  level: number;
  parent: ForkNode | null = null;
  children: ForkNode[] = [];
  payload: number[];

  constructor(id: number, level: number, payloadWidth: number) {
    this.id = id;
    this.level = level;
    this.payload = new Array<number>(payloadWidth).fill(id);
  }
}

class MeshNode {
  id: number;
  peers: MeshNode[] = [];
  payload: number[];

  constructor(id: number, payloadWidth: number) {
    this.id = id;
    this.payload = new Array<number>(payloadWidth).fill(id);
  }
}

class GridCell {
  row: number;
  col: number;
  id: number;
  peers: GridCell[] = [];
  payload: number[];

  constructor(row: number, col: number, id: number, payloadWidth: number) {
    this.row = row;
    this.col = col;
    this.id = id;
    this.payload = new Array<number>(payloadWidth).fill(id);
  }
}

class BagNode {
  id: number;
  label: string;
  items: BagNode[] = [];
  table: Map<string, BagNode> = new Map<string, BagNode>();
  rings: RingNode[] = [];

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

class IdCounter {
  next: number;

  constructor(first: number) {
    this.next = first;
  }

  take(): number {
    const value: number = this.next;
    this.next = this.next + 1;
    return value;
  }
}

class SharedOwner {
  id: number;
  leaves: SharedLeaf[] = [];

  constructor(id: number) {
    this.id = id;
  }
}

class SharedLeaf {
  id: number;
  owners: SharedOwner[] = [];
  payload: number[];

  constructor(id: number, payloadWidth: number) {
    this.id = id;
    this.payload = new Array<number>(payloadWidth).fill(id);
  }
}

class DiamondNode {
  id: number;
  layer: number;
  children: DiamondNode[] = [];
  parents: DiamondNode[] = [];
  payload: number[];

  constructor(id: number, layer: number, payloadWidth: number) {
    this.id = id;
    this.layer = layer;
    this.payload = new Array<number>(payloadWidth).fill(id);
  }
}

function buildChain(length: number, payloadWidth: number, firstId: number): ChainNode {
  const head: ChainNode = new ChainNode(firstId, payloadWidth);
  let tail: ChainNode = head;
  for (let i = 1; i < length; i++) {
    const node: ChainNode = new ChainNode(firstId + i, payloadWidth);
    tail.next = node;
    tail = node;
  }
  return head;
}

function chainLength(head: ChainNode, limit: number): number {
  let steps: number = 0;
  let current: ChainNode | null = head;
  while (current !== null) {
    steps++;
    if (steps > limit) {
      return -1;
    }
    current = current.next;
  }
  return steps;
}

function chainIdSum(head: ChainNode, limit: number): number {
  let sum: number = 0;
  let steps: number = 0;
  let current: ChainNode | null = head;
  while (current !== null && steps < limit) {
    sum += current.id;
    current = current.next;
    steps++;
  }
  return sum;
}

function chainSequential(head: ChainNode, length: number, firstId: number): boolean {
  let current: ChainNode | null = head;
  let index: number = 0;
  while (current !== null && index < length) {
    if (current.id !== firstId + index) {
      return false;
    }
    current = current.next;
    index++;
  }
  return index === length && current === null;
}

function chainPayloadUniform(head: ChainNode, length: number): boolean {
  let current: ChainNode | null = head;
  let index: number = 0;
  let uniform: boolean = true;
  while (current !== null && index < length) {
    const node: ChainNode = current;
    uniform = uniform && node.payload.every((value: number) => value === node.id);
    current = current.next;
    index++;
  }
  return uniform && index === length;
}

function chainTail(head: ChainNode, limit: number): ChainNode | null {
  let current: ChainNode = head;
  let steps: number = 0;
  let forward: ChainNode | null = current.next;
  while (forward !== null && steps < limit) {
    current = forward;
    forward = current.next;
    steps++;
  }
  if (forward === null) {
    return current;
  }
  return null;
}

function buildDoubleList(length: number, payloadWidth: number, firstId: number): LinkNode {
  const head: LinkNode = new LinkNode(firstId, payloadWidth);
  let tail: LinkNode = head;
  for (let i = 1; i < length; i++) {
    const node: LinkNode = new LinkNode(firstId + i, payloadWidth);
    node.prev = tail;
    tail.next = node;
    tail = node;
  }
  return head;
}

function doubleForwardLength(head: LinkNode, limit: number): number {
  let steps: number = 0;
  let current: LinkNode | null = head;
  while (current !== null && steps <= limit) {
    steps++;
    current = current.next;
  }
  if (steps > limit) {
    return -1;
  }
  return steps;
}

function doubleBackwardLength(tail: LinkNode, limit: number): number {
  let steps: number = 0;
  let current: LinkNode | null = tail;
  while (current !== null && steps <= limit) {
    steps++;
    current = current.prev;
  }
  if (steps > limit) {
    return -1;
  }
  return steps;
}

function doubleTail(head: LinkNode, limit: number): LinkNode | null {
  let current: LinkNode = head;
  let steps: number = 0;
  let forward: LinkNode | null = current.next;
  while (forward !== null && steps < limit) {
    current = forward;
    forward = current.next;
    steps++;
  }
  if (forward === null) {
    return current;
  }
  return null;
}

function doubleBackLinksOk(head: LinkNode, length: number): boolean {
  let current: LinkNode | null = head;
  let index: number = 0;
  let ok: boolean = true;
  while (current !== null && index < length) {
    const node: LinkNode = current;
    const nextNode: LinkNode | null = node.next;
    const prevNode: LinkNode | null = node.prev;
    const forward: boolean = nextNode === null ? true : nextNode.prev === node;
    const backward: boolean = prevNode === null ? true : prevNode.next === node;
    ok = ok && forward && backward;
    current = nextNode;
    index++;
  }
  return ok && index === length;
}

function doubleIdSum(head: LinkNode, length: number): number {
  let sum: number = 0;
  let steps: number = 0;
  let current: LinkNode | null = head;
  while (current !== null && steps < length) {
    sum += current.id;
    current = current.next;
    steps++;
  }
  return sum;
}

function doublePayloadUniform(head: LinkNode, length: number): boolean {
  let current: LinkNode | null = head;
  let steps: number = 0;
  let uniform: boolean = true;
  while (current !== null && steps < length) {
    const node: LinkNode = current;
    uniform = uniform && node.payload.every((value: number) => value === node.id);
    current = node.next;
    steps++;
  }
  return uniform && steps === length;
}

function buildBranchTree(levels: number, payloadWidth: number, firstId: number): BranchNode {
  const root: BranchNode = new BranchNode(firstId, 0, payloadWidth);
  let nextId: number = firstId + 1;
  let frontier: BranchNode[] = [root];
  for (let level = 1; level < levels; level++) {
    const grown: BranchNode[] = [];
    for (const node of frontier) {
      const left: BranchNode = new BranchNode(nextId, level, payloadWidth);
      nextId++;
      const right: BranchNode = new BranchNode(nextId, level, payloadWidth);
      nextId++;
      left.parent = node;
      right.parent = node;
      node.left = left;
      node.right = right;
      grown.push(left);
      grown.push(right);
    }
    frontier = grown;
  }
  return root;
}

function countBranch(node: BranchNode | null): number {
  if (node === null) {
    return 0;
  }
  return 1 + countBranch(node.left) + countBranch(node.right);
}

function countBranchLeaves(node: BranchNode | null): number {
  if (node === null) {
    return 0;
  }
  if (node.left === null && node.right === null) {
    return 1;
  }
  return countBranchLeaves(node.left) + countBranchLeaves(node.right);
}

function countBranchBackLinks(node: BranchNode | null): number {
  if (node === null) {
    return 0;
  }
  const left: BranchNode | null = node.left;
  const right: BranchNode | null = node.right;
  let links: number = 0;
  if (left !== null && left.parent === node) {
    links++;
  }
  if (right !== null && right.parent === node) {
    links++;
  }
  return links + countBranchBackLinks(left) + countBranchBackLinks(right);
}

function branchIdSum(node: BranchNode | null): number {
  if (node === null) {
    return 0;
  }
  return node.id + branchIdSum(node.left) + branchIdSum(node.right);
}

function branchDepthsOk(node: BranchNode | null): boolean {
  if (node === null) {
    return true;
  }
  const left: BranchNode | null = node.left;
  const right: BranchNode | null = node.right;
  let leftOk: boolean = true;
  let rightOk: boolean = true;
  if (left !== null) {
    leftOk = left.level === node.level + 1 && branchDepthsOk(left);
  }
  if (right !== null) {
    rightOk = right.level === node.level + 1 && branchDepthsOk(right);
  }
  return leftOk && rightOk;
}

function branchPayloadOk(node: BranchNode | null): boolean {
  if (node === null) {
    return true;
  }
  const uniform: boolean = node.payload.every((value: number) => value === node.id);
  return uniform && branchPayloadOk(node.left) && branchPayloadOk(node.right);
}

function buildForkTree(levels: number, fanout: number, payloadWidth: number, firstId: number): ForkNode {
  const root: ForkNode = new ForkNode(firstId, 0, payloadWidth);
  let nextId: number = firstId + 1;
  let frontier: ForkNode[] = [root];
  for (let level = 1; level < levels; level++) {
    const grown: ForkNode[] = [];
    for (const node of frontier) {
      for (let i = 0; i < fanout; i++) {
        const child: ForkNode = new ForkNode(nextId, level, payloadWidth);
        nextId++;
        child.parent = node;
        node.children.push(child);
        grown.push(child);
      }
    }
    frontier = grown;
  }
  return root;
}

function countFork(node: ForkNode | null): number {
  if (node === null) {
    return 0;
  }
  let total: number = 1;
  for (const child of node.children) {
    total += countFork(child);
  }
  return total;
}

function countForkBackLinks(node: ForkNode | null): number {
  if (node === null) {
    return 0;
  }
  let links: number = 0;
  for (const child of node.children) {
    if (child.parent === node) {
      links++;
    }
    links += countForkBackLinks(child);
  }
  return links;
}

function forkPayloadOk(node: ForkNode | null): boolean {
  if (node === null) {
    return true;
  }
  let uniform: boolean = node.payload.every((value: number) => value === node.id);
  for (const child of node.children) {
    uniform = uniform && forkPayloadOk(child);
  }
  return uniform;
}

function buildMesh(size: number, payloadWidth: number, firstId: number): MeshNode[] {
  const nodes: MeshNode[] = [];
  for (let i = 0; i < size; i++) {
    nodes.push(new MeshNode(firstId + i, payloadWidth));
  }
  for (let i = 0; i < size; i++) {
    for (let j = 0; j < size; j++) {
      if (i !== j) {
        nodes[i].peers.push(nodes[j]);
      }
    }
  }
  return nodes;
}

function meshEdgeTotal(nodes: MeshNode[]): number {
  let total: number = 0;
  for (const node of nodes) {
    total += node.peers.length;
  }
  return total;
}

function meshPeersIntact(nodes: MeshNode[], size: number): boolean {
  let intact: boolean = true;
  for (const node of nodes) {
    const wanted: number = size - 1;
    let foreign: number = 0;
    for (const peer of node.peers) {
      if (peer.id !== node.id) {
        foreign++;
      }
    }
    intact = intact && node.peers.length === wanted && foreign === wanted;
  }
  return intact;
}

function meshIdSum(nodes: MeshNode[]): number {
  let sum: number = 0;
  for (const node of nodes) {
    sum += node.id;
  }
  return sum;
}

function meshPayloadOk(nodes: MeshNode[]): boolean {
  let ok: boolean = true;
  for (const node of nodes) {
    ok = ok && node.payload.every((value: number) => value === node.id);
  }
  return ok;
}

function buildGrid(rows: number, cols: number, payloadWidth: number, firstId: number): GridCell[] {
  const cells: GridCell[] = [];
  for (let row = 0; row < rows; row++) {
    for (let col = 0; col < cols; col++) {
      cells.push(new GridCell(row, col, firstId + row * cols + col, payloadWidth));
    }
  }
  for (let row = 0; row < rows; row++) {
    for (let col = 0; col < cols; col++) {
      const cell: GridCell = cells[row * cols + col];
      if (row > 0) {
        cell.peers.push(cells[(row - 1) * cols + col]);
      }
      if (row + 1 < rows) {
        cell.peers.push(cells[(row + 1) * cols + col]);
      }
      if (col > 0) {
        cell.peers.push(cells[row * cols + col - 1]);
      }
      if (col + 1 < cols) {
        cell.peers.push(cells[row * cols + col + 1]);
      }
    }
  }
  return cells;
}

function gridNeighborEdges(rows: number, cols: number): number {
  return 2 * rows * cols - rows - cols;
}

function gridEdgesIntact(cells: GridCell[], rows: number, cols: number): boolean {
  let intact: boolean = true;
  for (const cell of cells) {
    let wanted: number = 0;
    if (cell.row > 0) {
      wanted++;
    }
    if (cell.row + 1 < rows) {
      wanted++;
    }
    if (cell.col > 0) {
      wanted++;
    }
    if (cell.col + 1 < cols) {
      wanted++;
    }
    intact = intact && cell.peers.length === wanted;
    for (const peer of cell.peers) {
      const touching: number = Math.abs(peer.row - cell.row) + Math.abs(peer.col - cell.col);
      intact = intact && touching === 1;
    }
  }
  return intact;
}

function gridIdSum(cells: GridCell[]): number {
  let sum: number = 0;
  for (const cell of cells) {
    sum += cell.id;
  }
  return sum;
}

function gridPayloadOk(cells: GridCell[]): boolean {
  let ok: boolean = true;
  for (const cell of cells) {
    ok = ok && cell.payload.every((value: number) => value === cell.id);
  }
  return ok;
}

function buildBagTree(depth: number, fanout: number, payloadWidth: number, counter: IdCounter): BagNode {
  const bag: BagNode = new BagNode(counter.take(), 'bag' + depth);
  if (payloadWidth > 0) {
    bag.rings.push(new RingNode(bag.id, payloadWidth));
  }
  if (depth <= 1) {
    return bag;
  }
  for (let i = 0; i < fanout; i++) {
    const child: BagNode = buildBagTree(depth - 1, fanout, payloadWidth, counter);
    bag.items.push(child);
    bag.table.set('k' + i, child);
  }
  return bag;
}

function countBag(node: BagNode): number {
  let total: number = 1;
  for (const child of node.items) {
    total += countBag(child);
  }
  return total;
}

function countBagEntries(node: BagNode): number {
  let total: number = node.table.size;
  for (const child of node.items) {
    total += countBagEntries(child);
  }
  return total;
}

function countBagRings(node: BagNode): number {
  let total: number = node.rings.length;
  for (const child of node.items) {
    total += countBagRings(child);
  }
  return total;
}

function bagMapsAgree(node: BagNode): boolean {
  let ok: boolean = node.table.size === node.items.length;
  for (let i = 0; i < node.items.length; i++) {
    const mapped: BagNode | undefined = node.table.get('k' + i);
    ok = ok && mapped === node.items[i];
  }
  for (const child of node.items) {
    ok = ok && bagMapsAgree(child);
  }
  return ok;
}

function ringFull(ring: RingNode): boolean {
  return ring.payload.every((value: number) => value === ring.id);
}

function bagRingsUniform(node: BagNode): boolean {
  let ok: boolean = true;
  for (const ring of node.rings) {
    ok = ok && ring.id === node.id && ringFull(ring);
  }
  for (const child of node.items) {
    ok = ok && bagRingsUniform(child);
  }
  return ok;
}

function bagIdSum(node: BagNode): number {
  let sum: number = node.id;
  for (const child of node.items) {
    sum += bagIdSum(child);
  }
  return sum;
}

function buildSharedGraph(ownerCount: number, leafCount: number, payloadWidth: number,
  firstId: number): SharedOwner[] {
  const owners: SharedOwner[] = [];
  const leaves: SharedLeaf[] = [];
  for (let i = 0; i < ownerCount; i++) {
    owners.push(new SharedOwner(firstId + i));
  }
  for (let i = 0; i < leafCount; i++) {
    leaves.push(new SharedLeaf(firstId + ownerCount + i, payloadWidth));
  }
  for (const owner of owners) {
    for (const leaf of leaves) {
      owner.leaves.push(leaf);
      leaf.owners.push(owner);
    }
  }
  return owners;
}

function sharedEdgeTotal(owners: SharedOwner[]): number {
  let total: number = 0;
  for (const owner of owners) {
    total += owner.leaves.length;
  }
  return total;
}

function sharedOwnerCountsOk(owners: SharedOwner[], ownerCount: number, leafCount: number): boolean {
  let ok: boolean = true;
  for (const owner of owners) {
    ok = ok && owner.leaves.length === leafCount;
    for (const leaf of owner.leaves) {
      ok = ok && leaf.owners.length === ownerCount && leaf.owners.indexOf(owner) >= 0;
    }
  }
  return ok;
}

function buildDiamond(widths: number[], payloadWidth: number, firstId: number): DiamondNode[] {
  const layers: DiamondNode[][] = [];
  let nextId: number = firstId;
  for (let layer = 0; layer < widths.length; layer++) {
    const nodes: DiamondNode[] = [];
    for (let i = 0; i < widths[layer]; i++) {
      nodes.push(new DiamondNode(nextId, layer, payloadWidth));
      nextId++;
    }
    layers.push(nodes);
  }
  for (let layer = 0; layer + 1 < layers.length; layer++) {
    const upper: DiamondNode[] = layers[layer];
    const lower: DiamondNode[] = layers[layer + 1];
    for (const parent of upper) {
      for (const child of lower) {
        parent.children.push(child);
        child.parents.push(parent);
      }
    }
  }
  return layers[0];
}

function diamondWidthTotal(widths: number[]): number {
  let total: number = 0;
  for (const width of widths) {
    total += width;
  }
  return total;
}

function diamondEdgeOracle(widths: number[]): number {
  let total: number = 0;
  for (let i = 0; i + 1 < widths.length; i++) {
    total += widths[i] * widths[i + 1];
  }
  return total;
}

function diamondReachCount(first: DiamondNode[]): number {
  const seen: Set<number> = new Set<number>();
  const stack: DiamondNode[] = first.slice();
  while (stack.length > 0) {
    const node: DiamondNode = stack[stack.length - 1];
    stack.pop();
    if (!seen.has(node.id)) {
      seen.add(node.id);
      for (const child of node.children) {
        stack.push(child);
      }
    }
  }
  return seen.size;
}

function diamondEdgeTotal(first: DiamondNode[]): number {
  const seen: Set<number> = new Set<number>();
  const stack: DiamondNode[] = first.slice();
  let total: number = 0;
  while (stack.length > 0) {
    const node: DiamondNode = stack[stack.length - 1];
    stack.pop();
    if (!seen.has(node.id)) {
      seen.add(node.id);
      total += node.children.length;
      for (const child of node.children) {
        stack.push(child);
      }
    }
  }
  return total;
}

function diamondBackRefsOk(first: DiamondNode[]): boolean {
  const seen: Set<number> = new Set<number>();
  const stack: DiamondNode[] = first.slice();
  let ok: boolean = true;
  while (stack.length > 0) {
    const node: DiamondNode = stack[stack.length - 1];
    stack.pop();
    if (!seen.has(node.id)) {
      seen.add(node.id);
      for (const child of node.children) {
        ok = ok && child.parents.indexOf(node) >= 0;
        stack.push(child);
      }
    }
  }
  return ok;
}

function diamondPayloadOk(first: DiamondNode[]): boolean {
  const seen: Set<number> = new Set<number>();
  const stack: DiamondNode[] = first.slice();
  let ok: boolean = true;
  while (stack.length > 0) {
    const node: DiamondNode = stack[stack.length - 1];
    stack.pop();
    if (!seen.has(node.id)) {
      seen.add(node.id);
      ok = ok && node.payload.every((value: number) => value === node.id);
      for (const child of node.children) {
        stack.push(child);
      }
    }
  }
  return ok;
}

export default function gcObjectGraphTest() {
  describe('GcObjectGraph', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0100
     * @tc.name      testGraphCycle0001
     * @tc.desc      Build one Parent and Child cycle, hint GC and check both directions of the cycle still resolve to
     *               the same objects with the same tag
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphCycle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const parent: CycleParent = linkPair(42);
      const linkedBefore: boolean = pairIsLinked(parent);
      hintGC();
      const linkedAfter: boolean = pairIsLinked(parent);
      const childTag: number = (parent.child as CycleChild).tag;
      logCase('testGraphCycle0001', `linkedBefore=${linkedBefore} linkedAfter=${linkedAfter} tag=${parent.tag}`);
      expect(linkedBefore).assertTrue();
      expect(linkedAfter).assertTrue();
      expect(childTag).assertEqual(42);
      expect(parent.tag).assertEqual(42);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0200
     * @tc.name      testGraphCycle0002
     * @tc.desc      Build ten cycles with tags from zero to nine, hint GC once and check every pair is still linked and
     *               the tag sum matches the arithmetic series oracle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphCycle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const tags: number[] = range(0, 10);
      const parents: CycleParent[] = tags.map((tag: number) => linkPair(tag));
      hintGC();
      let linked: number = 0;
      let tagSum: number = 0;
      for (const parent of parents) {
        if (pairIsLinked(parent)) {
          linked++;
        }
        tagSum += parent.tag;
      }
      logCase('testGraphCycle0002', `pairs=${parents.length} linked=${linked} tagSum=${tagSum} ` +
        `oracle=${expectedIdSum(0, 10)}`);
      expect(parents.length).assertEqual(10);
      expect(linked).assertEqual(10);
      expect(tagSum).assertEqual(expectedIdSum(0, 10));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0300
     * @tc.name      testGraphCycle0003
     * @tc.desc      Build two hundred cycles from one tag range, hint GC and check the survivor count, the link count
     *               and the summed tags against an independent series
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphCycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const parents: CycleParent[] = range(1000, 200).map((tag: number) => linkPair(tag));
      hintGC();
      let linked: number = 0;
      let tagSum: number = 0;
      for (const parent of parents) {
        if (pairIsLinked(parent)) {
          linked++;
        }
        tagSum += parent.tag;
      }
      logCase('testGraphCycle0003', `pairs=${parents.length} linked=${linked} tagSum=${tagSum} ` +
        `oracle=${expectedIdSum(1000, 200)}`);
      expect(linked).assertEqual(200);
      expect(tagSum).assertEqual(expectedIdSum(1000, 200));
      expect(parents[0].tag).assertEqual(1000);
      expect(parents[199].tag).assertEqual(1199);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0400
     * @tc.name      testGraphCycle0004
     * @tc.desc      Hold fifty cycles across ten repeated hintGC calls and check the GC counters never move backwards
     *               while all pairs stay linked
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphCycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const parents: CycleParent[] = range(0, 50).map((tag: number) => linkPair(tag));
      const before: GcSnapshot = new GcSnapshot();
      for (let round = 0; round < HINT_REPEATS; round++) {
        hintGC();
      }
      const after: GcSnapshot = new GcSnapshot();
      let linked: number = 0;
      for (const parent of parents) {
        if (pairIsLinked(parent)) {
          linked++;
        }
      }
      const ordered: boolean = after.notBefore(before);
      logCase('testGraphCycle0004', `linked=${linked} ordered=${ordered} countDelta=${after.count - before.count} ` +
        `freed=${after.freed} allocated=${after.allocated}`);
      expect(linked).assertEqual(50);
      expect(ordered).assertTrue();
      expect(after.count - before.count <= HINT_REPEATS).assertTrue();
      expect(parents.length).assertEqual(50);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0500
     * @tc.name      testGraphCycle0005
     * @tc.desc      Build fifty cycles with ascending tags, hint GC and check the child of each pair reports the tag
     *               of its own parent
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphCycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const first: number = 500;
      const parents: CycleParent[] = range(first, 50).map((tag: number) => linkPair(tag));
      hintGC();
      let mirrored: number = 0;
      let backPointing: number = 0;
      for (let i = 0; i < parents.length; i++) {
        const child: CycleChild = parents[i].child as CycleChild;
        if (child.tag === first + i) {
          mirrored++;
        }
        if (child.parent === parents[i]) {
          backPointing++;
        }
      }
      const mirroredOk: boolean = mirrored === 50;
      logCase('testGraphCycle0005', `mirrored=${mirrored} backPointing=${backPointing} first=${first}`);
      expect(mirroredOk).assertTrue();
      expect(backPointing).assertEqual(50);
      expect(pairIsLinked(parents[0])).assertTrue();
      expect(sameNumbers([parents[0].tag, parents[49].tag], [500, 549])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0600
     * @tc.name      testGraphCycle0006
     * @tc.desc      Keep twenty cycles reachable while two real collections are forced and check the link count and
     *               tag sum survive the tracing passes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphCycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parents: CycleParent[] = range(10, 20).map((tag: number) => linkPair(tag));
      hintGC();
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      let linked: number = 0;
      let tagSum: number = 0;
      for (const parent of parents) {
        if (pairIsLinked(parent)) {
          linked++;
        }
        tagSum += parent.tag;
      }
      logCase('testGraphCycle0006', `cycles=${cycles} linked=${linked} tagSum=${tagSum} ` +
        `oracle=${expectedIdSum(10, 20)}`);
      expect(cycles >= 2).assertTrue();
      expect(linked).assertEqual(20);
      expect(tagSum).assertEqual(expectedIdSum(10, 20));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0700
     * @tc.name      testGraphCycle0007
     * @tc.desc      Allocate pressure rings between hintGC calls while thirty cycles stay reachable and check the
     *               pairs are unchanged and a fresh collection counter advanced
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testGraphCycle0007', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const parents: CycleParent[] = range(2000, 30).map((tag: number) => linkPair(tag));
      const before: GcSnapshot = new GcSnapshot();
      let sink: number = 0;
      for (let round = 0; round < 3; round++) {
        sink += allocatePressure();
        hintGC();
      }
      const after: GcSnapshot = new GcSnapshot();
      let linked: number = 0;
      for (const parent of parents) {
        if (pairIsLinked(parent)) {
          linked++;
        }
      }
      logCase('testGraphCycle0007', `sink=${sink} linked=${linked} allocatedDelta=${after.allocated - before.allocated} ` +
        `freed=${after.freed}`);
      expect(sink > 0).assertTrue();
      expect(linked).assertEqual(30);
      expect(after.allocated > before.allocated).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0800
     * @tc.name      testGraphCycle0008
     * @tc.desc      Break one cycle by clearing the child link, hint GC and check the broken pair reports no link while
     *               its healthy neighbour still reports both directions
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphCycle0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const broken: CycleParent = linkPair(7);
      const healthy: CycleParent = linkPair(8);
      const orphan: CycleChild = broken.child as CycleChild;
      broken.child = null;
      hintGC();
      const brokenLinked: boolean = pairIsLinked(broken);
      const healthyLinked: boolean = pairIsLinked(healthy);
      const orphanKeepsParent: boolean = orphan.parent === broken;
      const healthyKeepsChild: boolean = healthy.child !== null;
      logCase('testGraphCycle0008', `brokenLinked=${brokenLinked} healthyLinked=${healthyLinked} ` +
        `orphanTag=${orphan.tag} healthyTag=${healthy.tag}`);
      expect(brokenLinked).assertFalse();
      expect(healthyLinked).assertTrue();
      expect(orphanKeepsParent).assertTrue();
      expect(healthyKeepsChild).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_0900
     * @tc.name      testGraphChain0001
     * @tc.desc      Build the shortest possible chain of one node, hint GC and check the walk stops at one node with
     *               no successor and the id sum matches the series oracle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphChain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: ChainNode = buildChain(1, 4, 0);
      const before: number = chainLength(head, WALK_LIMIT);
      hintGC();
      const after: number = chainLength(head, WALK_LIMIT);
      const terminal: boolean = head.next === null;
      logCase('testGraphChain0001', `before=${before} after=${after} terminal=${terminal} ` +
        `payloadLength=${head.payload.length}`);
      expect(before).assertEqual(1);
      expect(after).assertEqual(1);
      expect(terminal).assertTrue();
      expect(head.payload.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1000
     * @tc.name      testGraphChain0002
     * @tc.desc      Build a two node chain starting at id five, hint GC and check the successor keeps the next id, the
     *               tail is terminal and the sum is eleven
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphChain0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: ChainNode = buildChain(2, 1, 5);
      hintGC();
      const walked: number = chainLength(head, WALK_LIMIT);
      const nextId: number = (head.next as ChainNode).id;
      const tail: ChainNode | null = chainTail(head, WALK_LIMIT);
      const tailId: number = tail === null ? -1 : tail.id;
      logCase('testGraphChain0002', `walked=${walked} nextId=${nextId} tailId=${tailId} ` +
        `idSum=${chainIdSum(head, 2)}`);
      expect(walked).assertEqual(2);
      expect(nextId).assertEqual(6);
      expect(tailId).assertEqual(6);
      expect(chainIdSum(head, 2)).assertEqual(11);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1100
     * @tc.name      testGraphChain0003
     * @tc.desc      Build an eight node chain whose nodes carry empty payload arrays, hint GC and check the walk, the
     *               sequential ids and the zero payload width survive
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphChain0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: ChainNode = buildChain(8, 0, 100);
      const sequentialBefore: boolean = chainSequential(head, 8, 100);
      hintGC();
      const sequentialAfter: boolean = chainSequential(head, 8, 100);
      const walked: number = chainLength(head, WALK_LIMIT);
      logCase('testGraphChain0003', `sequentialBefore=${sequentialBefore} sequentialAfter=${sequentialAfter} ` +
        `walked=${walked} payloadLength=${head.payload.length}`);
      expect(sequentialBefore).assertTrue();
      expect(sequentialAfter).assertTrue();
      expect(walked).assertEqual(8);
      expect(head.payload.length).assertEqual(0);
      expect(chainIdSum(head, 8)).assertEqual(expectedIdSum(100, 8));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1200
     * @tc.name      testGraphChain0004
     * @tc.desc      Build a thirty two node chain with a two slot payload, hint GC and check the walk length, the id
     *               series and the uniform payload of every node
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphChain0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const head: ChainNode = buildChain(32, 2, 0);
      hintGC();
      const walked: number = chainLength(head, WALK_LIMIT);
      const uniform: boolean = chainPayloadUniform(head, 32);
      const sum: number = chainIdSum(head, 32);
      logCase('testGraphChain0004', `walked=${walked} uniform=${uniform} sum=${sum} ` +
        `oracle=${expectedIdSum(0, 32)}`);
      expect(walked).assertEqual(32);
      expect(uniform).assertTrue();
      expect(sum).assertEqual(expectedIdSum(0, 32));
      expect(chainSequential(head, 32, 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1300
     * @tc.name      testGraphChain0005
     * @tc.desc      Build a one hundred twenty eight node chain with an eight slot payload, collected between walk
     *               passes, and check the structure is walked identically twice
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphChain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: ChainNode = buildChain(128, 8, 1000);
      const firstWalk: number = chainLength(head, WALK_LIMIT);
      hintGC();
      const secondWalk: number = chainLength(head, WALK_LIMIT);
      const stable: boolean = firstWalk === secondWalk;
      logCase('testGraphChain0005', `firstWalk=${firstWalk} secondWalk=${secondWalk} stable=${stable}`);
      expect(firstWalk).assertEqual(128);
      expect(stable).assertTrue();
      expect(chainIdSum(head, 128)).assertEqual(expectedIdSum(1000, 128));
      expect(chainPayloadUniform(head, 128)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1400
     * @tc.name      testGraphChain0006
     * @tc.desc      Build a one thousand node chain, hint GC and check the walk limit is not hit, the id sum equals
     *               the arithmetic series and both ends carry the expected ids
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphChain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: ChainNode = buildChain(1000, 1, 0);
      hintGC();
      const walked: number = chainLength(head, WALK_LIMIT);
      const tail: ChainNode | null = chainTail(head, WALK_LIMIT);
      const tailId: number = tail === null ? -1 : tail.id;
      logCase('testGraphChain0006', `walked=${walked} tailId=${tailId} sum=${chainIdSum(head, 1000)}`);
      expect(walked).assertEqual(1000);
      expect(tailId).assertEqual(999);
      expect(chainIdSum(head, 1000)).assertEqual(expectedIdSum(0, 1000));
      expect(head.id).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1500
     * @tc.name      testGraphChain0007
     * @tc.desc      Build a five thousand node chain of payload free nodes, hint GC and check the length, the closing
     *               id and the summed ids against the series oracle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphChain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const head: ChainNode = buildChain(5000, 0, 10);
      hintGC();
      const walked: number = chainLength(head, WALK_LIMIT);
      const tail: ChainNode | null = chainTail(head, WALK_LIMIT);
      const tailId: number = tail === null ? -1 : tail.id;
      const sum: number = chainIdSum(head, 5000);
      logCase('testGraphChain0007', `walked=${walked} tailId=${tailId} sum=${sum} ` +
        `oracle=${expectedIdSum(10, 5000)}`);
      expect(walked).assertEqual(5000);
      expect(tailId).assertEqual(5009);
      expect(sum).assertEqual(expectedIdSum(10, 5000));
      expect(chainSequential(head, 5000, 10)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1600
     * @tc.name      testGraphChain0008
     * @tc.desc      Build one sixty four node chain per payload width from zero to one thousand twenty four slots,
     *               hint GC each time and check the walked length, the payload widths and the id sums stay exact
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphChain0008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const first: number = 300;
      const walked: number[] = [];
      const widths: number[] = [];
      const sums: number[] = [];
      for (const width of PAYLOAD_WIDTHS) {
        const head: ChainNode = buildChain(64, width, first);
        widths.push(head.payload.length);
        hintGC();
        walked.push(chainLength(head, WALK_LIMIT));
        sums.push(chainIdSum(head, 64));
      }
      const lengthsOk: boolean = walked.every((value: number) => value === 64);
      const widthsOk: boolean = sameNumbers(widths, PAYLOAD_WIDTHS);
      const sumsOk: boolean = sums.every((value: number) => value === expectedIdSum(first, 64));
      logCase('testGraphChain0008', `walked=${walked.join(',')} widths=${widths.join(',')} ` +
        `lengthsOk=${lengthsOk} sumsOk=${sumsOk}`);
      expect(lengthsOk).assertTrue();
      expect(widthsOk).assertTrue();
      expect(sumsOk).assertTrue();
      expect(walked.length).assertEqual(PAYLOAD_WIDTHS.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1700
     * @tc.name      testGraphChain0009
     * @tc.desc      Walk a matrix of chain sizes from one to eighty nine nodes and check every walked length equals
     *               its requested size and every id sum equals the series for that size
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphChain0009', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const walked: number[] = [];
      const sums: number[] = [];
      const uniform: boolean[] = [];
      for (const size of CHAIN_SIZES) {
        const head: ChainNode = buildChain(size, 1, 0);
        hintGC();
        walked.push(chainLength(head, WALK_LIMIT));
        sums.push(chainIdSum(head, size));
        uniform.push(chainPayloadUniform(head, size));
      }
      const lengthsOk: boolean = sameNumbers(walked, CHAIN_SIZES);
      let sumsOk: boolean = true;
      for (let i = 0; i < CHAIN_SIZES.length; i++) {
        sumsOk = sumsOk && sums[i] === expectedIdSum(0, CHAIN_SIZES[i]);
      }
      logCase('testGraphChain0009', `sizes=${CHAIN_SIZES.join(',')} walked=${walked.join(',')} ` +
        `sumsOk=${sumsOk} uniformOk=${uniform.every((ok: boolean) => ok)}`);
      expect(lengthsOk).assertTrue();
      expect(sumsOk).assertTrue();
      expect(uniform.every((ok: boolean) => ok)).assertTrue();
      expect(walked.length).assertEqual(CHAIN_SIZES.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1800
     * @tc.name      testGraphChain0010
     * @tc.desc      Build a forty node chain and check the sequential id oracle, the tail id and the number of links
     *               counted by hand before and after hintGC
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphChain0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const head: ChainNode = buildChain(40, 3, 700);
      let linksBefore: number = 0;
      let cursor: ChainNode | null = head;
      while (cursor !== null && cursor.next !== null) {
        linksBefore++;
        cursor = cursor.next;
      }
      hintGC();
      let linksAfter: number = 0;
      let again: ChainNode | null = head;
      while (again !== null && again.next !== null) {
        linksAfter++;
        again = again.next;
      }
      const linksStable: boolean = linksBefore === linksAfter;
      const tail: ChainNode | null = chainTail(head, WALK_LIMIT);
      const tailId: number = tail === null ? -1 : tail.id;
      logCase('testGraphChain0010', `linksBefore=${linksBefore} linksAfter=${linksAfter} tailId=${tailId} ` +
        `sequential=${chainSequential(head, 40, 700)}`);
      expect(linksBefore).assertEqual(39);
      expect(linksStable).assertTrue();
      expect(tailId).assertEqual(739);
      expect(chainSequential(head, 40, 700)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_1900
     * @tc.name      testGraphChain0011
     * @tc.desc      Hold a two hundred node chain across ten hintGC calls and check the walk stays complete, the
     *               snapshot never regresses and the id sum equals the oracle after every hint
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testGraphChain0011', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const head: ChainNode = buildChain(200, 4, 0);
      const before: GcSnapshot = new GcSnapshot();
      let walked: number = 0;
      let sumsOk: boolean = true;
      for (let round = 0; round < HINT_REPEATS; round++) {
        hintGC();
        walked = chainLength(head, WALK_LIMIT);
        sumsOk = sumsOk && chainIdSum(head, 200) === expectedIdSum(0, 200);
      }
      const after: GcSnapshot = new GcSnapshot();
      const ordered: boolean = after.notBefore(before);
      logCase('testGraphChain0011', `walked=${walked} sumsOk=${sumsOk} ordered=${ordered} ` +
        `countDelta=${after.count - before.count}`);
      expect(walked).assertEqual(200);
      expect(sumsOk).assertTrue();
      expect(ordered).assertTrue();
      expect(after.count >= before.count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2000
     * @tc.name      testGraphChain0012
     * @tc.desc      Keep a two hundred fifty six node chain reachable during two forced collections and check the
     *               length, the payload and the summed ids are unchanged
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphChain0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const head: ChainNode = buildChain(256, 2, 50);
      hintGC();
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      const walked: number = chainLength(head, WALK_LIMIT);
      const uniform: boolean = chainPayloadUniform(head, 256);
      logCase('testGraphChain0012', `cycles=${cycles} walked=${walked} uniform=${uniform} ` +
        `sum=${chainIdSum(head, 256)}`);
      expect(cycles >= 2).assertTrue();
      expect(walked).assertEqual(256);
      expect(uniform).assertTrue();
      expect(chainIdSum(head, 256)).assertEqual(expectedIdSum(50, 256));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2100
     * @tc.name      testGraphChain0013
     * @tc.desc      Allocate pressure while a ninety node chain stays reachable, hint GC and check the chain length,
     *               the tail id and the allocation counter advance
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testGraphChain0013', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const head: ChainNode = buildChain(90, 1, 400);
      const before: GcSnapshot = new GcSnapshot();
      const sink: number = allocatePressure();
      hintGC();
      const after: GcSnapshot = new GcSnapshot();
      const walked: number = chainLength(head, WALK_LIMIT);
      const tail: ChainNode | null = chainTail(head, WALK_LIMIT);
      const tailId: number = tail === null ? -1 : tail.id;
      logCase('testGraphChain0013', `sink=${sink} walked=${walked} tailId=${tailId} ` +
        `allocatedDelta=${after.allocated - before.allocated}`);
      expect(sink > 0).assertTrue();
      expect(walked).assertEqual(90);
      expect(tailId).assertEqual(489);
      expect(after.notBefore(before)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2200
     * @tc.name      testGraphRing0001
     * @tc.desc      Build the smallest ring of two payload free nodes, hint GC and check the walk returns to the head
     *               after two steps with the summed ids equal to the series
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphRing0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: RingNode = buildRing(2, 0, 0);
      const before: number = ringLength(head, 3);
      hintGC();
      const after: number = ringLength(head, 3);
      logCase('testGraphRing0001', `before=${before} after=${after} idSum=${ringIdSum(head, 2)}`);
      expect(before).assertEqual(2);
      expect(after).assertEqual(2);
      expect(ringIdSum(head, 2)).assertEqual(expectedIdSum(0, 2));
      expect(head.payload.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2300
     * @tc.name      testGraphRing0002
     * @tc.desc      Build a three node ring starting at id one with a single slot payload, hint GC and check the
     *               length, the id sum and the uniform payload of every node
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphRing0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: RingNode = buildRing(3, 1, 1);
      hintGC();
      const walked: number = ringLength(head, 4);
      const sum: number = ringIdSum(head, 3);
      const uniform: boolean = ringFull(head) && ringFull(head.next as RingNode);
      logCase('testGraphRing0002', `walked=${walked} sum=${sum} uniform=${uniform} headId=${head.id}`);
      expect(walked).assertEqual(3);
      expect(sum).assertEqual(expectedIdSum(1, 3));
      expect(uniform).assertTrue();
      expect(head.id).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2400
     * @tc.name      testGraphRing0003
     * @tc.desc      Build a five node ring with two slot payloads starting at id one hundred, hint GC and check the
     *               closure, the series sum and the payload width on every node
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphRing0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: RingNode = buildRing(5, 2, 100);
      hintGC();
      let current: RingNode = head;
      let wrongWidth: number = 0;
      for (let i = 0; i < 5; i++) {
        if (current.payload.length !== 2) {
          wrongWidth++;
        }
        current = current.next as RingNode;
      }
      const returnedToHead: boolean = current === head;
      logCase('testGraphRing0003', `walked=${ringLength(head, 6)} wrongWidth=${wrongWidth} ` +
        `sum=${ringIdSum(head, 5)} oracle=${expectedIdSum(100, 5)}`);
      expect(ringLength(head, 6)).assertEqual(5);
      expect(wrongWidth).assertEqual(0);
      expect(ringIdSum(head, 5)).assertEqual(expectedIdSum(100, 5));
      expect(returnedToHead).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2500
     * @tc.name      testGraphRing0004
     * @tc.desc      Build a sixteen node ring with four slot payloads, hint GC and check the walk, the id series and
     *               that every payload slot mirrors the owning node id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphRing0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const head: RingNode = buildRing(16, 4, 0);
      hintGC();
      let current: RingNode = head;
      let foreign: number = 0;
      for (let i = 0; i < 16; i++) {
        if (!ringFull(current)) {
          foreign++;
        }
        current = current.next as RingNode;
      }
      const sumsMatch: boolean = ringIdSum(head, 16) === expectedIdSum(0, 16);
      const returnedToHead: boolean = current === head;
      logCase('testGraphRing0004', `walked=${ringLength(head, 17)} foreign=${foreign} sumsMatch=${sumsMatch}`);
      expect(ringLength(head, 17)).assertEqual(16);
      expect(foreign).assertEqual(0);
      expect(sumsMatch).assertTrue();
      expect(returnedToHead).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2600
     * @tc.name      testGraphRing0005
     * @tc.desc      Build a sixty four node ring starting at id fifty with eight slot payloads, hint GC and check the
     *               closure, the id sum and the head payload width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphRing0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: RingNode = buildRing(64, 8, 50);
      const before: number = ringIdSum(head, 64);
      hintGC();
      const after: number = ringIdSum(head, 64);
      const stable: boolean = before === after;
      logCase('testGraphRing0005', `before=${before} after=${after} stable=${stable} ` +
        `walked=${ringLength(head, 65)}`);
      expect(stable).assertTrue();
      expect(ringLength(head, 65)).assertEqual(64);
      expect(after).assertEqual(expectedIdSum(50, 64));
      expect(head.payload.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2700
     * @tc.name      testGraphRing0006
     * @tc.desc      Build the canonical one hundred node ring starting at id seven, hint GC and check the walk, the
     *               series sum and the uniform payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphRing0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: RingNode = buildRing(100, 1, 7);
      hintGC();
      const walked: number = ringLength(head, 101);
      const sum: number = ringIdSum(head, 100);
      logCase('testGraphRing0006', `walked=${walked} sum=${sum} oracle=${expectedIdSum(7, 100)} ` +
        `headId=${head.id}`);
      expect(walked).assertEqual(100);
      expect(sum).assertEqual(expectedIdSum(7, 100));
      expect(ringFull(head)).assertTrue();
      expect(head.id).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2800
     * @tc.name      testGraphRing0007
     * @tc.desc      Build a two hundred fifty six node ring with sixteen slot payloads, hint GC twice around the walk
     *               and check the length and the id sum stay exact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphRing0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: RingNode = buildRing(256, 16, 0);
      hintGC();
      const first: number = ringIdSum(head, 256);
      hintGC();
      const second: number = ringIdSum(head, 256);
      const walked: number = ringLength(head, 257);
      logCase('testGraphRing0007', `first=${first} second=${second} walked=${walked}`);
      expect(first).assertEqual(second);
      expect(first).assertEqual(expectedIdSum(0, 256));
      expect(walked).assertEqual(256);
      expect(head.payload.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_2900
     * @tc.name      testGraphRing0008
     * @tc.desc      Build a one thousand node ring from id one hundred, hint GC and check the length, the id sum and
     *               that a second walk from the same head reports the same length
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphRing0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: RingNode = buildRing(1000, 4, 100);
      hintGC();
      const first: number = ringLength(head, 1001);
      const second: number = ringLength(head, 1001);
      const sums: number = ringIdSum(head, 1000);
      logCase('testGraphRing0008', `first=${first} second=${second} sum=${sums} ` +
        `oracle=${expectedIdSum(100, 1000)}`);
      expect(first).assertEqual(1000);
      expect(second).assertEqual(1000);
      expect(sums).assertEqual(expectedIdSum(100, 1000));
      expect(head.id).assertEqual(100);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3000
     * @tc.name      testGraphRing0009
     * @tc.desc      Build a two thousand forty eight node ring of payload free nodes, hint GC and check the closure,
     *               the id sum and that the walk never exceeds the requested size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphRing0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const head: RingNode = buildRing(2048, 0, 0);
      hintGC();
      const walked: number = ringLength(head, 2049);
      const sums: number = ringIdSum(head, 2048);
      logCase('testGraphRing0009', `walked=${walked} sum=${sums} oracle=${expectedIdSum(0, 2048)} ` +
        `payloadLength=${head.payload.length}`);
      expect(walked).assertEqual(2048);
      expect(sums).assertEqual(expectedIdSum(0, 2048));
      expect(head.payload.length).assertEqual(0);
      expect(walked <= 2048).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3100
     * @tc.name      testGraphRing0010
     * @tc.desc      Build a five thousand node ring, hint GC and check the walk returns without hitting the limit, the
     *               id sum matches the series and every node still points onward
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphRing0010', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const head: RingNode = buildRing(5000, 1, 10);
      hintGC();
      let current: RingNode = head;
      let open: number = 0;
      for (let i = 0; i < 5000; i++) {
        if (current.next === null) {
          open++;
        }
        current = current.next as RingNode;
      }
      const walked: number = ringLength(head, 5001);
      logCase('testGraphRing0010', `walked=${walked} open=${open} sum=${ringIdSum(head, 5000)}`);
      expect(walked).assertEqual(5000);
      expect(open).assertEqual(0);
      expect(ringIdSum(head, 5000)).assertEqual(expectedIdSum(10, 5000));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3200
     * @tc.name      testGraphRing0011
     * @tc.desc      Build a ten thousand node ring, hint GC and check the closure, the arithmetic id sum and the head
     *               payload width
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphRing0011', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const head: RingNode = buildRing(10000, 0, 0);
      hintGC();
      const walked: number = ringLength(head, 10001);
      const sums: number = ringIdSum(head, 10000);
      const expected: number = expectedIdSum(0, 10000);
      logCase('testGraphRing0011', `walked=${walked} sum=${sums} expected=${expected}`);
      expect(walked).assertEqual(10000);
      expect(sums).assertEqual(expected);
      expect(head.payload.length).assertEqual(0);
      expect(expected > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3300
     * @tc.name      testGraphRing0012
     * @tc.desc      Build one thirty two node ring per payload width from empty to one thousand twenty four slots,
     *               hint GC each time and check the walked length and payload widths match the matrix
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphRing0012', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const walked: number[] = [];
      const widths: number[] = [];
      const sumsOk: boolean[] = [];
      for (const width of PAYLOAD_WIDTHS) {
        const head: RingNode = buildRing(32, width, width);
        widths.push(head.payload.length);
        hintGC();
        walked.push(ringLength(head, 33));
        sumsOk.push(ringIdSum(head, 32) === expectedIdSum(width, 32));
      }
      const lengthsOk: boolean = walked.every((value: number) => value === 32);
      const widthsOk: boolean = sameNumbers(widths, PAYLOAD_WIDTHS);
      logCase('testGraphRing0012', `widths=${widths.join(',')} walked=${walked.join(',')} ` +
        `lengthsOk=${lengthsOk} widthsOk=${widthsOk}`);
      expect(lengthsOk).assertTrue();
      expect(widthsOk).assertTrue();
      expect(sumsOk.every((ok: boolean) => ok)).assertTrue();
      expect(walked.length).assertEqual(PAYLOAD_WIDTHS.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3400
     * @tc.name      testGraphRing0013
     * @tc.desc      Walk a matrix of ring sizes from two to two thousand forty eight nodes and check each ring closes
     *               on itself with the expected series id sum
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphRing0013', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const walked: number[] = [];
      const sumsOk: boolean[] = [];
      for (const size of RING_SIZES) {
        const head: RingNode = buildRing(size, 1, size);
        hintGC();
        walked.push(ringLength(head, size + 1));
        sumsOk.push(ringIdSum(head, size) === expectedIdSum(size, size));
      }
      const lengthsOk: boolean = sameNumbers(walked, RING_SIZES);
      logCase('testGraphRing0013', `sizes=${RING_SIZES.join(',')} walked=${walked.join(',')} ` +
        `sumsOk=${sumsOk.every((ok: boolean) => ok)}`);
      expect(lengthsOk).assertTrue();
      expect(sumsOk.every((ok: boolean) => ok)).assertTrue();
      expect(walked.length).assertEqual(RING_SIZES.length);
      expect(walked[0]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3500
     * @tc.name      testGraphRing0014
     * @tc.desc      Build twenty independent fifty node rings, hint GC once and check every ring is closed, the total
     *               walked node count and the total id sum match hand computed oracles
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphRing0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const heads: RingNode[] = [];
      for (let i = 0; i < 20; i++) {
        heads.push(buildRing(50, 2, i * 50));
      }
      hintGC();
      let totalNodes: number = 0;
      let totalSum: number = 0;
      let closed: number = 0;
      for (const head of heads) {
        const length: number = ringLength(head, 51);
        if (length === 50) {
          closed++;
        }
        totalNodes += length;
        totalSum += ringIdSum(head, 50);
      }
      let oracle: number = 0;
      for (let i = 0; i < 20; i++) {
        oracle += expectedIdSum(i * 50, 50);
      }
      logCase('testGraphRing0014', `closed=${closed} totalNodes=${totalNodes} totalSum=${totalSum} ` +
        `oracle=${oracle}`);
      expect(closed).assertEqual(20);
      expect(totalNodes).assertEqual(1000);
      expect(totalSum).assertEqual(oracle);
      expect(heads.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3600
     * @tc.name      testGraphRing0015
     * @tc.desc      Keep a three hundred node ring reachable during two forced collections and check the closure, the
     *               length and the payload of the head after the collections
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
