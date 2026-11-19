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
    it('testGraphRing0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const head: RingNode = buildRing(300, 4, 900);
      hintGC();
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      const walked: number = ringLength(head, 301);
      logCase('testGraphRing0015', `cycles=${cycles} walked=${walked} sum=${ringIdSum(head, 300)} ` +
        `headId=${head.id}`);
      expect(cycles >= 2).assertTrue();
      expect(walked).assertEqual(300);
      expect(ringIdSum(head, 300)).assertEqual(expectedIdSum(900, 300));
      expect(ringFull(head)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3700
     * @tc.name      testGraphRing0016
     * @tc.desc      Hold a four thousand node ring across ten hintGC calls and check the closure and id sum after each
     *               hint while the GC counters stay ordered
     * @tc.size      LARGETEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testGraphRing0016', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL2, () => {
      const head: RingNode = buildRing(4000, 2, 0);
      const before: GcSnapshot = new GcSnapshot();
      let closed: number = 0;
      let sumsOk: boolean = true;
      for (let round = 0; round < HINT_REPEATS; round++) {
        hintGC();
        if (ringLength(head, 4001) === 4000) {
          closed++;
        }
        sumsOk = sumsOk && ringIdSum(head, 4000) === expectedIdSum(0, 4000);
      }
      const after: GcSnapshot = new GcSnapshot();
      logCase('testGraphRing0016', `closed=${closed} sumsOk=${sumsOk} ordered=${after.notBefore(before)} ` +
        `countDelta=${after.count - before.count}`);
      expect(closed).assertEqual(HINT_REPEATS);
      expect(sumsOk).assertTrue();
      expect(after.notBefore(before)).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3800
     * @tc.name      testGraphMesh0001
     * @tc.desc      Build the smallest full mesh of two mutually referencing nodes, hint GC and check both edge
     *               directions survive and the edge total matches the hand computed value
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphMesh0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nodes: MeshNode[] = buildMesh(2, 0, 0);
      hintGC();
      const edges: number = meshEdgeTotal(nodes);
      const intact: boolean = meshPeersIntact(nodes, 2);
      const mutual: boolean = nodes[0].peers[0] === nodes[1] && nodes[1].peers[0] === nodes[0];
      logCase('testGraphMesh0001', `edges=${edges} intact=${intact} mutual=${mutual} nodes=${nodes.length}`);
      expect(edges).assertEqual(2);
      expect(intact).assertTrue();
      expect(mutual).assertTrue();
      expect(meshPayloadOk(nodes)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_3900
     * @tc.name      testGraphMesh0002
     * @tc.desc      Build a three node full mesh, hint GC and check each node holds two distinct peers, the edge total
     *               is six and the id sum matches the series
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphMesh0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nodes: MeshNode[] = buildMesh(3, 1, 10);
      hintGC();
      const intact: boolean = meshPeersIntact(nodes, 3);
      const edges: number = meshEdgeTotal(nodes);
      const sum: number = meshIdSum(nodes);
      logCase('testGraphMesh0002', `intact=${intact} edges=${edges} sum=${sum} oracle=${expectedIdSum(10, 3)}`);
      expect(intact).assertTrue();
      expect(edges).assertEqual(6);
      expect(sum).assertEqual(expectedIdSum(10, 3));
      expect(nodes[0].peers.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4000
     * @tc.name      testGraphMesh0003
     * @tc.desc      Build a five node full mesh with two slot payloads, hint GC and check the peer counts, the twenty
     *               directed edges and the payload of every node
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphMesh0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nodes: MeshNode[] = buildMesh(5, 2, 0);
      hintGC();
      const edges: number = meshEdgeTotal(nodes);
      const payloadOk: boolean = meshPayloadOk(nodes);
      const expected: number = 5 * 4;
      logCase('testGraphMesh0003', `edges=${edges} expected=${expected} payloadOk=${payloadOk} ` +
        `intact=${meshPeersIntact(nodes, 5)}`);
      expect(edges).assertEqual(expected);
      expect(payloadOk).assertTrue();
      expect(meshPeersIntact(nodes, 5)).assertTrue();
      expect(meshIdSum(nodes)).assertEqual(expectedIdSum(0, 5));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4100
     * @tc.name      testGraphMesh0004
     * @tc.desc      Build an eight node full mesh of payload free nodes, hint GC twice and check the edge total, the
     *               distinct peer count and the id sum stay exact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphMesh0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nodes: MeshNode[] = buildMesh(8, 0, 100);
      hintGC();
      const first: number = meshEdgeTotal(nodes);
      hintGC();
      const second: number = meshEdgeTotal(nodes);
      const stable: boolean = first === second;
      logCase('testGraphMesh0004', `first=${first} second=${second} stable=${stable} ` +
        `payloadWidth=${nodes[0].payload.length}`);
      expect(first).assertEqual(56);
      expect(stable).assertTrue();
      expect(meshPeersIntact(nodes, 8)).assertTrue();
      expect(meshIdSum(nodes)).assertEqual(expectedIdSum(100, 8));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4200
     * @tc.name      testGraphMesh0005
     * @tc.desc      Build a ten node full mesh with four slot payloads, hint GC and check ninety directed edges, the
     *               intact peer sets and the payload mirroring
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphMesh0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nodes: MeshNode[] = buildMesh(10, 4, 0);
      hintGC();
      const edges: number = meshEdgeTotal(nodes);
      const expected: number = 10 * 9;
      const intact: boolean = meshPeersIntact(nodes, 10);
      logCase('testGraphMesh0005', `edges=${edges} expected=${expected} intact=${intact} ` +
        `sum=${meshIdSum(nodes)}`);
      expect(edges).assertEqual(expected);
      expect(intact).assertTrue();
      expect(meshPayloadOk(nodes)).assertTrue();
      expect(meshIdSum(nodes)).assertEqual(expectedIdSum(0, 10));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4300
     * @tc.name      testGraphMesh0006
     * @tc.desc      Build a twelve node full mesh, hint GC and check one hundred thirty two directed edges, the intact
     *               peer sets and the arithmetic id sum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphMesh0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nodes: MeshNode[] = buildMesh(12, 1, 200);
      hintGC();
      const edges: number = meshEdgeTotal(nodes);
      const expected: number = 12 * 11;
      logCase('testGraphMesh0006', `edges=${edges} expected=${expected} nodes=${nodes.length} ` +
        `intact=${meshPeersIntact(nodes, 12)}`);
      expect(edges).assertEqual(expected);
      expect(meshPeersIntact(nodes, 12)).assertTrue();
      expect(nodes.length).assertEqual(12);
      expect(meshIdSum(nodes)).assertEqual(expectedIdSum(200, 12));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4400
     * @tc.name      testGraphMesh0007
     * @tc.desc      Build full meshes of two to ten nodes, hint GC once per mesh and check the edge total of each one
     *               equals size times size minus one
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphMesh0007', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const edges: number[] = [];
      const oracles: number[] = [];
      const intact: boolean[] = [];
      for (const size of MESH_SIZES) {
        const nodes: MeshNode[] = buildMesh(size, 1, 0);
        hintGC();
        edges.push(meshEdgeTotal(nodes));
        oracles.push(size * (size - 1));
        intact.push(meshPeersIntact(nodes, size));
      }
      const edgesOk: boolean = sameNumbers(edges, oracles);
      logCase('testGraphMesh0007', `sizes=${MESH_SIZES.join(',')} edges=${edges.join(',')} ` +
        `oracles=${oracles.join(',')} edgesOk=${edgesOk}`);
      expect(edgesOk).assertTrue();
      expect(intact.every((ok: boolean) => ok)).assertTrue();
      expect(edges.length).assertEqual(MESH_SIZES.length);
      expect(oracles[0]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4500
     * @tc.name      testGraphMesh0008
     * @tc.desc      Build a six node full mesh per payload width from empty to one thousand twenty four slots, hint GC
     *               each time and check the payload widths and edge totals are unchanged
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphMesh0008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const widths: number[] = [];
      const edges: number[] = [];
      const payloadOk: boolean[] = [];
      for (const width of PAYLOAD_WIDTHS) {
        const nodes: MeshNode[] = buildMesh(6, width, 0);
        widths.push(nodes[0].payload.length);
        hintGC();
        edges.push(meshEdgeTotal(nodes));
        payloadOk.push(meshPayloadOk(nodes));
      }
      const widthsOk: boolean = sameNumbers(widths, PAYLOAD_WIDTHS);
      const edgesFixed: boolean = edges.every((value: number) => value === 30);
      logCase('testGraphMesh0008', `widths=${widths.join(',')} edges=${edges.join(',')} ` +
        `widthsOk=${widthsOk} edgesFixed=${edgesFixed}`);
      expect(widthsOk).assertTrue();
      expect(edgesFixed).assertTrue();
      expect(payloadOk.every((ok: boolean) => ok)).assertTrue();
      expect(edges.length).assertEqual(PAYLOAD_WIDTHS.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4600
     * @tc.name      testGraphGrid0001
     * @tc.desc      Build a single row grid of twelve cells, hint GC and check the neighbour edge count, the row
     *               layout and the intact adjacency
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const rows: number = 1;
      const cols: number = 12;
      const cells: GridCell[] = buildGrid(rows, cols, 0, 0);
      hintGC();
      let edges: number = 0;
      for (const cell of cells) {
        edges += cell.peers.length;
      }
      const oracle: number = gridNeighborEdges(rows, cols);
      logCase('testGraphGrid0001', `cells=${cells.length} edges=${edges} oracle=${oracle} rows=${rows} cols=${cols}`);
      expect(cells.length).assertEqual(12);
      expect(edges).assertEqual(oracle);
      expect(gridEdgesIntact(cells, rows, cols)).assertTrue();
      expect(cells[0].peers.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4700
     * @tc.name      testGraphGrid0002
     * @tc.desc      Build a single column grid of twelve cells, hint GC and check the neighbour edge count, the
     *               column layout and the intact vertical adjacency
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const rows: number = 12;
      const cols: number = 1;
      const cells: GridCell[] = buildGrid(rows, cols, 1, 0);
      hintGC();
      let edges: number = 0;
      for (const cell of cells) {
        edges += cell.peers.length;
      }
      const oracle: number = gridNeighborEdges(rows, cols);
      const corner: number = cells[0].peers.length;
      logCase('testGraphGrid0002', `cells=${cells.length} edges=${edges} oracle=${oracle} corner=${corner}`);
      expect(cells.length).assertEqual(12);
      expect(edges).assertEqual(oracle);
      expect(corner).assertEqual(1);
      expect(gridEdgesIntact(cells, rows, cols)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4800
     * @tc.name      testGraphGrid0003
     * @tc.desc      Build an eight by eight square grid, hint GC and check the cell count, the one hundred twelve
     *               neighbour edges and the interior cell degree of four
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphGrid0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rows: number = 8;
      const cols: number = 8;
      const cells: GridCell[] = buildGrid(rows, cols, 2, 0);
      hintGC();
      let edges: number = 0;
      for (const cell of cells) {
        edges += cell.peers.length;
      }
      const interior: GridCell = cells[3 * cols + 3];
      logCase('testGraphGrid0003', `cells=${cells.length} edges=${edges} oracle=${gridNeighborEdges(rows, cols)} ` +
        `interiorDegree=${interior.peers.length}`);
      expect(cells.length).assertEqual(64);
      expect(edges).assertEqual(112);
      expect(interior.peers.length).assertEqual(4);
      expect(gridEdgesIntact(cells, rows, cols)).assertTrue();
      expect(gridPayloadOk(cells)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_4900
     * @tc.name      testGraphGrid0004
     * @tc.desc      Build a six by eleven rectangular grid plus a two by three grid, hint GC between them and check
     *               each edge total and id sum against the neighbour and series oracles
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphGrid0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const wideCells: GridCell[] = buildGrid(6, 11, 0, 0);
      hintGC();
      let wideEdges: number = 0;
      for (const cell of wideCells) {
        wideEdges += cell.peers.length;
      }
      const tallCells: GridCell[] = buildGrid(2, 3, 1, 500);
      hintGC();
      let tallEdges: number = 0;
      for (const cell of tallCells) {
        tallEdges += cell.peers.length;
      }
      logCase('testGraphGrid0004', `wideCells=${wideCells.length} wideEdges=${wideEdges} ` +
        `tallCells=${tallCells.length} tallEdges=${tallEdges}`);
      expect(wideCells.length).assertEqual(66);
      expect(wideEdges).assertEqual(gridNeighborEdges(6, 11));
      expect(tallEdges).assertEqual(gridNeighborEdges(2, 3));
      expect(gridIdSum(wideCells)).assertEqual(expectedIdSum(0, 66));
      expect(gridEdgesIntact(tallCells, 2, 3)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5000
     * @tc.name      testGraphTree0001
     * @tc.desc      Build a tree with only the root, hint GC and check the node count, the leaf count and the absence
     *               of any child pointer or back reference
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphTree0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const root: BranchNode = buildBranchTree(1, 0, 0);
      hintGC();
      const nodes: number = countBranch(root);
      const leaves: number = countBranchLeaves(root);
      const bare: boolean = root.left === null && root.right === null && root.parent === null;
      logCase('testGraphTree0001', `nodes=${nodes} leaves=${leaves} bare=${bare} level=${root.level}`);
      expect(nodes).assertEqual(1);
      expect(leaves).assertEqual(1);
      expect(bare).assertTrue();
      expect(root.level).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5100
     * @tc.name      testGraphTree0002
     * @tc.desc      Build a two level tree with one slot payloads, hint GC and check three nodes, two back links and
     *               the sequential ids of the two children
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphTree0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const root: BranchNode = buildBranchTree(2, 1, 0);
      hintGC();
      const nodes: number = countBranch(root);
      const backLinks: number = countBranchBackLinks(root);
      const left: BranchNode = root.left as BranchNode;
      const right: BranchNode = root.right as BranchNode;
      const childrenPointBack: boolean = left.parent === root && right.parent === root;
      logCase('testGraphTree0002', `nodes=${nodes} backLinks=${backLinks} leftId=${left.id} rightId=${right.id}`);
      expect(nodes).assertEqual(3);
      expect(backLinks).assertEqual(2);
      expect(left.id).assertEqual(1);
      expect(right.id).assertEqual(2);
      expect(childrenPointBack).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5200
     * @tc.name      testGraphTree0003
     * @tc.desc      Build a four level tree of payload free nodes, hint GC and check fifteen nodes, fourteen back
     *               links and eight leaves against the perfect tree formulas
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphTree0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const root: BranchNode = buildBranchTree(4, 0, 0);
      hintGC();
      const nodes: number = countBranch(root);
      const backLinks: number = countBranchBackLinks(root);
      const leaves: number = countBranchLeaves(root);
      logCase('testGraphTree0003', `nodes=${nodes} backLinks=${backLinks} leaves=${leaves} ` +
        `oracleNodes=${Math.pow(2, 4) - 1}`);
      expect(nodes).assertEqual(15);
      expect(backLinks).assertEqual(14);
      expect(leaves).assertEqual(8);
      expect(branchIdSum(root)).assertEqual(expectedIdSum(0, 15));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5300
     * @tc.name      testGraphTree0004
     * @tc.desc      Build a six level tree with two slot payloads, hint GC and check sixty three nodes, sixty two back
     *               links and the uniform payload across every node
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphTree0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const root: BranchNode = buildBranchTree(6, 2, 0);
      hintGC();
      const nodes: number = countBranch(root);
      const backLinks: number = countBranchBackLinks(root);
      const payloadOk: boolean = branchPayloadOk(root);
      logCase('testGraphTree0004', `nodes=${nodes} backLinks=${backLinks} payloadOk=${payloadOk} ` +
        `leaves=${countBranchLeaves(root)}`);
      expect(nodes).assertEqual(63);
      expect(backLinks).assertEqual(62);
      expect(payloadOk).assertTrue();
      expect(countBranchLeaves(root)).assertEqual(32);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5400
     * @tc.name      testGraphTree0005
     * @tc.desc      Build an eight level tree of payload free nodes, hint GC twice and check two hundred fifty five
     *               nodes, one hundred twenty eight leaves and the first level ids
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphTree0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const root: BranchNode = buildBranchTree(8, 0, 0);
      hintGC();
      const firstCount: number = countBranch(root);
      hintGC();
      const secondCount: number = countBranch(root);
      const firstLeft: BranchNode = root.left as BranchNode;
      logCase('testGraphTree0005', `firstCount=${firstCount} secondCount=${secondCount} ` +
        `leaves=${countBranchLeaves(root)} firstLeftId=${firstLeft.id}`);
      expect(firstCount).assertEqual(255);
      expect(secondCount).assertEqual(255);
      expect(countBranchLeaves(root)).assertEqual(128);
      expect(firstLeft.id).assertEqual(1);
      expect(firstLeft.level).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5500
     * @tc.name      testGraphTree0006
     * @tc.desc      Build perfect trees from one to eight levels, hint GC after each build and check the node count of
     *               every tree equals two to the level minus one
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphTree0006', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const counts: number[] = [];
      const oracles: number[] = [];
      for (const levels of TREE_LEVELS) {
        const root: BranchNode = buildBranchTree(levels, 0, 0);
        hintGC();
        counts.push(countBranch(root));
        oracles.push(Math.pow(2, levels) - 1);
      }
      const countsOk: boolean = sameNumbers(counts, oracles);
      logCase('testGraphTree0006', `levels=${TREE_LEVELS.join(',')} counts=${counts.join(',')} ` +
        `oracles=${oracles.join(',')} countsOk=${countsOk}`);
      expect(countsOk).assertTrue();
      expect(counts.length).assertEqual(TREE_LEVELS.length);
      expect(counts[7]).assertEqual(255);
      expect(oracles[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5600
     * @tc.name      testGraphTree0007
     * @tc.desc      Build a seven level tree, hint GC and check the back link count equals node count minus one while
     *               every child reports the same parent from both directions
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphTree0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const root: BranchNode = buildBranchTree(7, 1, 0);
      hintGC();
      const nodes: number = countBranch(root);
      const backLinks: number = countBranchBackLinks(root);
      const consistent: boolean = backLinks === nodes - 1;
      const depths: boolean = branchDepthsOk(root);
      logCase('testGraphTree0007', `nodes=${nodes} backLinks=${backLinks} consistent=${consistent} ` +
        `depths=${depths}`);
      expect(nodes).assertEqual(127);
      expect(consistent).assertTrue();
      expect(depths).assertTrue();
      expect(branchPayloadOk(root)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5700
     * @tc.name      testGraphTree0008
     * @tc.desc      Build trees of three to seven levels, hint GC between them and check the leaf count of each tree
     *               equals two to the level minus one power
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphTree0008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const leaves: number[] = [];
      const oracles: number[] = [];
      for (let levels = 3; levels <= 7; levels++) {
        const root: BranchNode = buildBranchTree(levels, 0, 0);
        hintGC();
        leaves.push(countBranchLeaves(root));
        oracles.push(Math.pow(2, levels - 1));
      }
      const leavesOk: boolean = sameNumbers(leaves, oracles);
      logCase('testGraphTree0008', `leaves=${leaves.join(',')} oracles=${oracles.join(',')} leavesOk=${leavesOk}`);
      expect(leavesOk).assertTrue();
      expect(leaves.length).assertEqual(5);
      expect(leaves[4]).assertEqual(64);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5800
     * @tc.name      testGraphTree0009
     * @tc.desc      Build a five level tree per payload width from empty to one thousand twenty four slots, hint GC
     *               each time and check the payload width set and the uniform payload rule
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphTree0009', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const widths: number[] = [];
      const payloadOk: boolean[] = [];
      const counts: number[] = [];
      for (const width of PAYLOAD_WIDTHS) {
        const root: BranchNode = buildBranchTree(5, width, 0);
        widths.push(root.payload.length);
        hintGC();
        payloadOk.push(branchPayloadOk(root));
        counts.push(countBranch(root));
      }
      const widthsOk: boolean = sameNumbers(widths, PAYLOAD_WIDTHS);
      const countsFixed: boolean = counts.every((value: number) => value === 31);
      logCase('testGraphTree0009', `widths=${widths.join(',')} counts=${counts.join(',')} ` +
        `widthsOk=${widthsOk} countsFixed=${countsFixed}`);
      expect(widthsOk).assertTrue();
      expect(countsFixed).assertTrue();
      expect(payloadOk.every((ok: boolean) => ok)).assertTrue();
      expect(widths.length).assertEqual(PAYLOAD_WIDTHS.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_5900
     * @tc.name      testGraphTree0010
     * @tc.desc      Build a six level tree from id one thousand, hint GC and check the recursive id sum against the
     *               series oracle and the root id itself
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphTree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: number = 1000;
      const root: BranchNode = buildBranchTree(6, 0, first);
      hintGC();
      const sum: number = branchIdSum(root);
      const nodes: number = countBranch(root);
      logCase('testGraphTree0010', `sum=${sum} nodes=${nodes} oracle=${expectedIdSum(first, 63)} ` +
        `rootId=${root.id}`);
      expect(sum).assertEqual(expectedIdSum(first, 63));
      expect(nodes).assertEqual(63);
      expect(root.id).assertEqual(first);
      expect(branchDepthsOk(root)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6000
     * @tc.name      testGraphFork0001
     * @tc.desc      Build a three level tree with fanout three, hint GC and check thirteen nodes, twelve back links
     *               and the four leaf parents pointing back
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphFork0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const root: ForkNode = buildForkTree(3, 3, 0, 0);
      hintGC();
      const nodes: number = countFork(root);
      const backLinks: number = countForkBackLinks(root);
      const oneLinkPerChild: boolean = countForkBackLinks(root) === nodes - 1;
      logCase('testGraphFork0001', `nodes=${nodes} backLinks=${backLinks} rootChildren=${root.children.length}`);
      expect(nodes).assertEqual(13);
      expect(backLinks).assertEqual(12);
      expect(root.children.length).assertEqual(3);
      expect(oneLinkPerChild).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6100
     * @tc.name      testGraphFork0002
     * @tc.desc      Build a four level tree with fanout two and one slot payloads, hint GC and check fifteen nodes,
     *               fourteen back links and the uniform payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphFork0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const root: ForkNode = buildForkTree(4, 2, 1, 0);
      hintGC();
      const nodes: number = countFork(root);
      const backLinks: number = countForkBackLinks(root);
      const payloadOk: boolean = forkPayloadOk(root);
      logCase('testGraphFork0002', `nodes=${nodes} backLinks=${backLinks} payloadOk=${payloadOk} ` +
        `childCount=${root.children.length}`);
      expect(nodes).assertEqual(15);
      expect(backLinks).assertEqual(14);
      expect(payloadOk).assertTrue();
      expect(root.children.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6200
     * @tc.name      testGraphFork0003
     * @tc.desc      Build a four level tree with fanout four, hint GC and check eighty five nodes, eighty four back
     *               links and the sixteen leaf nodes at the last level
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphFork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const root: ForkNode = buildForkTree(4, 4, 0, 0);
      hintGC();
      const nodes: number = countFork(root);
      const backLinks: number = countForkBackLinks(root);
      let oracle: number = 0;
      for (let level = 0; level < 4; level++) {
        oracle += Math.pow(4, level);
      }
      logCase('testGraphFork0003', `nodes=${nodes} backLinks=${backLinks} oracle=${oracle} ` +
        `payloadOk=${forkPayloadOk(root)}`);
      expect(nodes).assertEqual(oracle);
      expect(backLinks).assertEqual(84);
      expect(oracle).assertEqual(85);
      expect(forkPayloadOk(root)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6300
     * @tc.name      testGraphTree0011
     * @tc.desc      Keep a six level tree reachable during two forced collections and check the node count, the back
     *               links and the id sum are unchanged after the collections
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphTree0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const root: BranchNode = buildBranchTree(6, 2, 0);
      hintGC();
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      const nodes: number = countBranch(root);
      logCase('testGraphTree0011', `cycles=${cycles} nodes=${nodes} backLinks=${countBranchBackLinks(root)} ` +
        `sum=${branchIdSum(root)}`);
      expect(cycles >= 2).assertTrue();
      expect(nodes).assertEqual(63);
      expect(countBranchBackLinks(root)).assertEqual(62);
      expect(branchIdSum(root)).assertEqual(expectedIdSum(0, 63));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6400
     * @tc.name      testGraphList0001
     * @tc.desc      Build a doubly linked list of one node, hint GC and check the forward and backward walks both
     *               return one node while both link fields stay empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: LinkNode = buildDoubleList(1, 0, 0);
      hintGC();
      const forward: number = doubleForwardLength(head, 10);
      const backward: number = doubleBackwardLength(head, 10);
      const bare: boolean = head.next === null && head.prev === null;
      logCase('testGraphList0001', `forward=${forward} backward=${backward} bare=${bare} id=${head.id}`);
      expect(forward).assertEqual(1);
      expect(backward).assertEqual(1);
      expect(bare).assertTrue();
      expect(head.id).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6500
     * @tc.name      testGraphList0002
     * @tc.desc      Build a two node doubly linked list from id ten, hint GC and check the forward length, the backward
     *               length from the tail and the mutual prev and next agreement
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphList0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: LinkNode = buildDoubleList(2, 1, 10);
      hintGC();
      const tail: LinkNode | null = doubleTail(head, 10);
      const tailLength: number = tail === null ? -1 : doubleBackwardLength(tail, 10);
      const mutual: boolean = (head.next as LinkNode).prev === head;
      logCase('testGraphList0002', `forward=${doubleForwardLength(head, 10)} tailLength=${tailLength} ` +
        `mutual=${mutual} ids=${head.id},${(head.next as LinkNode).id}`);
      expect(doubleForwardLength(head, 10)).assertEqual(2);
      expect(tailLength).assertEqual(2);
      expect(mutual).assertTrue();
      expect(doubleBackLinksOk(head, 2)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6600
     * @tc.name      testGraphList0003
     * @tc.desc      Build a ten node doubly linked list with four slot payloads, hint GC and check the forward length,
     *               the back link rule and the uniform payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphList0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const head: LinkNode = buildDoubleList(10, 4, 0);
      hintGC();
      const forward: number = doubleForwardLength(head, 10);
      const backLinks: boolean = doubleBackLinksOk(head, 10);
      const payload: boolean = doublePayloadUniform(head, 10);
      logCase('testGraphList0003', `forward=${forward} backLinks=${backLinks} payload=${payload} ` +
        `sum=${doubleIdSum(head, 10)}`);
      expect(forward).assertEqual(10);
      expect(backLinks).assertTrue();
      expect(payload).assertTrue();
      expect(doubleIdSum(head, 10)).assertEqual(expectedIdSum(0, 10));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6700
     * @tc.name      testGraphList0004
     * @tc.desc      Build a sixty four node doubly linked list of payload free nodes, hint GC twice and check the
     *               forward and backward lengths stay equal to the requested size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphList0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: LinkNode = buildDoubleList(64, 0, 0);
      hintGC();
      const first: number = doubleForwardLength(head, 64);
      hintGC();
      const second: number = doubleForwardLength(head, 64);
      const tail: LinkNode | null = doubleTail(head, 64);
      const backward: number = tail === null ? -1 : doubleBackwardLength(tail, 64);
      logCase('testGraphList0004', `first=${first} second=${second} backward=${backward} ` +
        `payloadWidth=${head.payload.length}`);
      expect(first).assertEqual(64);
      expect(second).assertEqual(64);
      expect(backward).assertEqual(64);
      expect(head.payload.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6800
     * @tc.name      testGraphList0005
     * @tc.desc      Build a two hundred fifty six node doubly linked list with two slot payloads, hint GC and check
     *               the forward length, the back link rule and the id sum against the series
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphList0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: LinkNode = buildDoubleList(256, 2, 50);
      hintGC();
      const forward: number = doubleForwardLength(head, 256);
      const backLinks: boolean = doubleBackLinksOk(head, 256);
      const sum: number = doubleIdSum(head, 256);
      logCase('testGraphList0005', `forward=${forward} backLinks=${backLinks} sum=${sum} ` +
        `oracle=${expectedIdSum(50, 256)}`);
      expect(forward).assertEqual(256);
      expect(backLinks).assertTrue();
      expect(sum).assertEqual(expectedIdSum(50, 256));
      expect(doublePayloadUniform(head, 256)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_6900
     * @tc.name      testGraphList0006
     * @tc.desc      Build a one thousand node doubly linked list, hint GC and check the forward walk does not hit the
     *               limit, the tail reports the closing id and the id sum matches the series
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphList0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const head: LinkNode = buildDoubleList(1000, 1, 0);
      hintGC();
      const forward: number = doubleForwardLength(head, 1000);
      const tail: LinkNode | null = doubleTail(head, 1000);
      const tailId: number = tail === null ? -1 : tail.id;
      const tailFound: number = tail === null ? 0 : 1;
      logCase('testGraphList0006', `forward=${forward} tailId=${tailId} sum=${doubleIdSum(head, 1000)}`);
      expect(forward).assertEqual(1000);
      expect(tailId).assertEqual(999);
      expect(doubleIdSum(head, 1000)).assertEqual(expectedIdSum(0, 1000));
      expect(tailFound).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7000
     * @tc.name      testGraphList0007
     * @tc.desc      Build a one hundred twenty eight node list, hint GC and check every next pointer agrees with the
     *               following prev pointer while the head and tail stay open
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphList0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const head: LinkNode = buildDoubleList(128, 3, 0);
      hintGC();
      let mismatched: number = 0;
      let current: LinkNode | null = head;
      while (current !== null) {
        const node: LinkNode = current;
        const nextNode: LinkNode | null = node.next;
        if (nextNode !== null && nextNode.prev !== node) {
          mismatched++;
        }
        current = nextNode;
      }
      const backLinks: boolean = doubleBackLinksOk(head, 128);
      const headOpen: boolean = head.prev === null;
      logCase('testGraphList0007', `mismatched=${mismatched} backLinks=${backLinks} headOpen=${headOpen}`);
      expect(mismatched).assertEqual(0);
      expect(backLinks).assertTrue();
      expect(headOpen).assertTrue();
      expect(doubleForwardLength(head, 128)).assertEqual(128);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7100
     * @tc.name      testGraphList0008
     * @tc.desc      Build a two hundred node list, hint GC and check a forward walk followed by a backward walk from
     *               the tail both report the same length and the same id sum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphList0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const head: LinkNode = buildDoubleList(200, 1, 600);
      const forwardBefore: number = doubleForwardLength(head, 200);
      hintGC();
      const tail: LinkNode | null = doubleTail(head, 200);
      let backward: number = 0;
      let backwardSum: number = 0;
      let cursor: LinkNode | null = tail;
      while (cursor !== null) {
        backward++;
        backwardSum += cursor.id;
        cursor = cursor.prev;
      }
      const sameLength: boolean = forwardBefore === backward;
      logCase('testGraphList0008', `forwardBefore=${forwardBefore} backward=${backward} ` +
        `backwardSum=${backwardSum} sameLength=${sameLength}`);
      expect(forwardBefore).assertEqual(200);
      expect(sameLength).assertTrue();
      expect(backwardSum).assertEqual(expectedIdSum(600, 200));
      expect(doubleBackLinksOk(head, 200)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7200
     * @tc.name      testGraphList0009
     * @tc.desc      Build a thirty two node list per payload width from empty to one thousand twenty four slots, hint
     *               GC each time and check the payload widths and the forward lengths
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphList0009', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const widths: number[] = [];
      const lengths: number[] = [];
      const backLinks: boolean[] = [];
      for (const width of PAYLOAD_WIDTHS) {
        const head: LinkNode = buildDoubleList(32, width, 0);
        widths.push(head.payload.length);
        hintGC();
        lengths.push(doubleForwardLength(head, 32));
        backLinks.push(doubleBackLinksOk(head, 32));
      }
      const widthsOk: boolean = sameNumbers(widths, PAYLOAD_WIDTHS);
      const lengthsOk: boolean = lengths.every((value: number) => value === 32);
      logCase('testGraphList0009', `widths=${widths.join(',')} lengths=${lengths.join(',')} ` +
        `widthsOk=${widthsOk} lengthsOk=${lengthsOk}`);
      expect(widthsOk).assertTrue();
      expect(lengthsOk).assertTrue();
      expect(backLinks.every((ok: boolean) => ok)).assertTrue();
      expect(widths.length).assertEqual(PAYLOAD_WIDTHS.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7300
     * @tc.name      testGraphList0010
     * @tc.desc      Build lists from one to one thousand twenty four nodes, hint GC after each build and check every
     *               forward length equals its requested size and every backward length matches
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphList0010', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const forward: number[] = [];
      const backward: number[] = [];
      for (const size of LIST_LENGTHS) {
        const head: LinkNode = buildDoubleList(size, 1, 0);
        hintGC();
        forward.push(doubleForwardLength(head, size));
        const tail: LinkNode | null = doubleTail(head, size);
        backward.push(tail === null ? -1 : doubleBackwardLength(tail, size));
      }
      const forwardOk: boolean = sameNumbers(forward, LIST_LENGTHS);
      const backwardOk: boolean = sameNumbers(backward, LIST_LENGTHS);
      logCase('testGraphList0010', `sizes=${LIST_LENGTHS.join(',')} forward=${forward.join(',')} ` +
        `backward=${backward.join(',')} forwardOk=${forwardOk} backwardOk=${backwardOk}`);
      expect(forwardOk).assertTrue();
      expect(backwardOk).assertTrue();
      expect(forward.length).assertEqual(LIST_LENGTHS.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7400
     * @tc.name      testGraphList0011
     * @tc.desc      Build a three hundred node list from id one hundred, hint GC and check the forward id sum against
     *               an independent series while the head and tail ids stay exact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphList0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: number = 100;
      const head: LinkNode = buildDoubleList(300, 0, first);
      hintGC();
      const sum: number = doubleIdSum(head, 300);
      const tail: LinkNode | null = doubleTail(head, 300);
      const tailId: number = tail === null ? -1 : tail.id;
      logCase('testGraphList0011', `sum=${sum} oracle=${expectedIdSum(first, 300)} tailId=${tailId} ` +
        `headId=${head.id}`);
      expect(sum).assertEqual(expectedIdSum(first, 300));
      expect(tailId).assertEqual(399);
      expect(head.id).assertEqual(100);
      expect(doubleForwardLength(head, 300)).assertEqual(300);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7500
     * @tc.name      testGraphList0012
     * @tc.desc      Keep a four hundred node list reachable across two forced collections plus ten hintGC calls and
     *               check the forward length, the back link rule and the id sum after every hint
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testGraphList0012', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const head: LinkNode = buildDoubleList(400, 2, 0);
      const before: GcSnapshot = new GcSnapshot();
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      let lengths: number = 0;
      let sumsOk: boolean = true;
      for (let round = 0; round < HINT_REPEATS; round++) {
        hintGC();
        lengths = doubleForwardLength(head, 400);
        sumsOk = sumsOk && doubleIdSum(head, 400) === expectedIdSum(0, 400);
      }
      const after: GcSnapshot = new GcSnapshot();
      logCase('testGraphList0012', `cycles=${cycles} lengths=${lengths} sumsOk=${sumsOk} ` +
        `backLinks=${doubleBackLinksOk(head, 400)} ordered=${after.notBefore(before)}`);
      expect(cycles >= 2).assertTrue();
      expect(lengths).assertEqual(400);
      expect(sumsOk).assertTrue();
      expect(doubleBackLinksOk(head, 400)).assertTrue();
      expect(after.notBefore(before)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7600
     * @tc.name      testGraphNest0001
     * @tc.desc      Build a nested container of depth one, hint GC and check the node count is one, the map holds no
     *               entry and no ring payload was attached at zero width
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphNest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bag: BagNode = buildBagTree(1, 3, 0, new IdCounter(0));
      hintGC();
      const nodes: number = countBag(bag);
      const entries: number = countBagEntries(bag);
      const rings: number = countBagRings(bag);
      logCase('testGraphNest0001', `nodes=${nodes} entries=${entries} rings=${rings} items=${bag.items.length}`);
      expect(nodes).assertEqual(1);
      expect(entries).assertEqual(0);
      expect(rings).assertEqual(0);
      expect(bag.items.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7700
     * @tc.name      testGraphNest0002
     * @tc.desc      Build a depth two container with fanout two and one slot payloads, hint GC and check three nodes,
     *               two map entries and one ring payload per node
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphNest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bag: BagNode = buildBagTree(2, 2, 1, new IdCounter(0));
      hintGC();
      const nodes: number = countBag(bag);
      const entries: number = countBagEntries(bag);
      const rings: number = countBagRings(bag);
      logCase('testGraphNest0002', `nodes=${nodes} entries=${entries} rings=${rings} ` +
        `agree=${bagMapsAgree(bag)}`);
      expect(nodes).assertEqual(3);
      expect(entries).assertEqual(2);
      expect(rings).assertEqual(3);
      expect(bagMapsAgree(bag)).assertTrue();
      expect(bagRingsUniform(bag)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7800
     * @tc.name      testGraphNest0003
     * @tc.desc      Build a depth three container with payload free nodes, hint GC and check seven nodes, six map
     *               entries and the absence of any ring payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphNest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bag: BagNode = buildBagTree(3, 2, 0, new IdCounter(0));
      hintGC();
      const nodes: number = countBag(bag);
      const entries: number = countBagEntries(bag);
      const rings: number = countBagRings(bag);
      logCase('testGraphNest0003', `nodes=${nodes} entries=${entries} rings=${rings} ` +
        `idSum=${bagIdSum(bag)}`);
      expect(nodes).assertEqual(7);
      expect(entries).assertEqual(6);
      expect(rings).assertEqual(0);
      expect(bagIdSum(bag)).assertEqual(expectedIdSum(0, 7));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_7900
     * @tc.name      testGraphNest0004
     * @tc.desc      Build a depth four container with one slot payloads, hint GC and check fifteen nodes, fourteen
     *               entries and fifteen ring payloads with matching ids
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphNest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bag: BagNode = buildBagTree(4, 2, 1, new IdCounter(0));
      hintGC();
      const nodes: number = countBag(bag);
      const entries: number = countBagEntries(bag);
      const rings: number = countBagRings(bag);
      logCase('testGraphNest0004', `nodes=${nodes} entries=${entries} rings=${rings} ` +
        `uniform=${bagRingsUniform(bag)}`);
      expect(nodes).assertEqual(15);
      expect(entries).assertEqual(14);
      expect(rings).assertEqual(15);
      expect(bagRingsUniform(bag)).assertTrue();
      expect(bagMapsAgree(bag)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8000
     * @tc.name      testGraphNest0005
     * @tc.desc      Build a depth four container with fanout three, hint GC and check forty nodes, thirty nine map
     *               entries and the summed ids against the series oracle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphNest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bag: BagNode = buildBagTree(4, 3, 0, new IdCounter(0));
      hintGC();
      const nodes: number = countBag(bag);
      const entries: number = countBagEntries(bag);
      logCase('testGraphNest0005', `nodes=${nodes} entries=${entries} idSum=${bagIdSum(bag)} ` +
        `oracle=${expectedIdSum(0, 40)}`);
      expect(nodes).assertEqual(40);
      expect(entries).assertEqual(39);
      expect(bagIdSum(bag)).assertEqual(expectedIdSum(0, 40));
      expect(bagMapsAgree(bag)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8100
     * @tc.name      testGraphNest0006
     * @tc.desc      Build a depth five container with fanout two and no payload, hint GC twice and check sixty three
     *               nodes with sixty two map entries both times
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphNest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bag: BagNode = buildBagTree(5, 2, 0, new IdCounter(0));
      hintGC();
      const first: number = countBag(bag);
      hintGC();
      const second: number = countBag(bag);
      const entries: number = countBagEntries(bag);
      logCase('testGraphNest0006', `first=${first} second=${second} entries=${entries} ` +
        `oracle=${Math.pow(2, 5) - 1}`);
      expect(first).assertEqual(63);
      expect(second).assertEqual(63);
      expect(entries).assertEqual(62);
      expect(countBagRings(bag)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8200
     * @tc.name      testGraphNest0007
     * @tc.desc      Build a depth four container and check the total map entry count equals the node count minus one
     *               while every map value is the same object as the parallel array entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphNest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bag: BagNode = buildBagTree(4, 2, 2, new IdCounter(0));
      hintGC();
      const nodes: number = countBag(bag);
      const entries: number = countBagEntries(bag);
      const entriesMatch: boolean = entries === nodes - 1;
      logCase('testGraphNest0007', `nodes=${nodes} entries=${entries} entriesMatch=${entriesMatch} ` +
        `agree=${bagMapsAgree(bag)}`);
      expect(entriesMatch).assertTrue();
      expect(bagMapsAgree(bag)).assertTrue();
      expect(bag.table.size).assertEqual(bag.items.length);
      expect(countBagRings(bag)).assertEqual(nodes);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8300
     * @tc.name      testGraphNest0008
     * @tc.desc      Build a depth three container, hint GC and check that each map key resolves to the array entry at
     *               the same position for every level of the tree
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphNest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bag: BagNode = buildBagTree(3, 4, 0, new IdCounter(0));
      hintGC();
      let lookups: number = 0;
      let hits: number = 0;
      const stack: BagNode[] = [bag];
      while (stack.length > 0) {
        const node: BagNode = stack[stack.length - 1];
        stack.pop();
        for (let i = 0; i < node.items.length; i++) {
          lookups++;
          if (node.table.get('k' + i) === node.items[i]) {
            hits++;
          }
          stack.push(node.items[i]);
        }
      }
      logCase('testGraphNest0008', `lookups=${lookups} hits=${hits} idSum=${bagIdSum(bag)}`);
      expect(lookups).assertEqual(20);
      expect(hits).assertEqual(20);
      expect(lookups).assertEqual(hits);
      expect(countBag(bag)).assertEqual(21);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8400
     * @tc.name      testGraphNest0009
     * @tc.desc      Build a depth three container per payload width, hint GC each time and check the ring node count
     *               is either zero or equal to the node count and the ids stay uniform
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphNest0009', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const widths: number[] = [0, 1, 4, 64];
      const rings: number[] = [];
      const nodes: number[] = [];
      const uniform: boolean[] = [];
      for (const width of widths) {
        const bag: BagNode = buildBagTree(3, 2, width, new IdCounter(0));
        hintGC();
        nodes.push(countBag(bag));
        rings.push(countBagRings(bag));
        uniform.push(bagRingsUniform(bag));
      }
      const ringRuleOk: boolean = rings[0] === 0 && rings[1] === 7 && rings[2] === 7 && rings[3] === 7;
      logCase('testGraphNest0009', `widths=${widths.join(',')} nodes=${nodes.join(',')} ` +
        `rings=${rings.join(',')} ringRuleOk=${ringRuleOk}`);
      expect(ringRuleOk).assertTrue();
      expect(uniform.every((ok: boolean) => ok)).assertTrue();
      expect(nodes.every((value: number) => value === 7)).assertTrue();
      expect(rings.length).assertEqual(widths.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8500
     * @tc.name      testGraphNest0010
     * @tc.desc      Build depth one to five containers with fanout two, hint GC after each build and check the node
     *               count of every depth equals two to the depth minus one
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphNest0010', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const counts: number[] = [];
      const oracles: number[] = [];
      for (const depth of BAG_DEPTHS) {
        const bag: BagNode = buildBagTree(depth, 2, 0, new IdCounter(0));
        hintGC();
        counts.push(countBag(bag));
        oracles.push(Math.pow(2, depth) - 1);
      }
      const countsOk: boolean = sameNumbers(counts, oracles);
      logCase('testGraphNest0010', `depths=${BAG_DEPTHS.join(',')} counts=${counts.join(',')} ` +
        `oracles=${oracles.join(',')} countsOk=${countsOk}`);
      expect(countsOk).assertTrue();
      expect(counts.length).assertEqual(BAG_DEPTHS.length);
      expect(counts[4]).assertEqual(31);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8600
     * @tc.name      testGraphNest0011
     * @tc.desc      Store twenty five node chains in a string keyed Map, hint GC and check the table size, the summed
     *               chain lengths and the series id sum of every chain
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphNest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const table: Map<string, ChainNode> = new Map<string, ChainNode>();
      for (let i = 0; i < 20; i++) {
        table.set('c' + i, buildChain(5, 2, i * 5));
      }
      hintGC();
      let walked: number = 0;
      let sumsOk: boolean = true;
      table.forEach((head: ChainNode) => {
        walked += chainLength(head, 5);
        let chainSum: number = 0;
        let cursor: ChainNode | null = head;
        while (cursor !== null) {
          chainSum += cursor.id;
          cursor = cursor.next;
        }
        sumsOk = sumsOk && chainSum === expectedIdSum(head.id, 5);
      });
      logCase('testGraphNest0011', `size=${table.size} walked=${walked} sumsOk=${sumsOk} ` +
        `firstKey=${table.has('c0')}`);
      expect(table.size).assertEqual(20);
      expect(walked).assertEqual(100);
      expect(sumsOk).assertTrue();
      expect(table.has('c19')).assertTrue();
      expect(table.has('c20')).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8700
     * @tc.name      testGraphNest0012
     * @tc.desc      Keep a depth four container reachable across two forced collections and check the node count, the
     *               map agreement and the ring payload rule afterwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphNest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bag: BagNode = buildBagTree(4, 3, 2, new IdCounter(100));
      hintGC();
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      const nodes: number = countBag(bag);
      logCase('testGraphNest0012', `cycles=${cycles} nodes=${nodes} entries=${countBagEntries(bag)} ` +
        `rings=${countBagRings(bag)} idSum=${bagIdSum(bag)}`);
      expect(cycles >= 2).assertTrue();
      expect(nodes).assertEqual(40);
      expect(countBagEntries(bag)).assertEqual(39);
      expect(countBagRings(bag)).assertEqual(40);
      expect(bagIdSum(bag)).assertEqual(expectedIdSum(100, 40));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8800
     * @tc.name      testGraphShare0001
     * @tc.desc      Build two owners sharing two leaves, hint GC and check the owner edges, the leaf back reference
     *               count and the object identity of the shared leaves
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphShare0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const owners: SharedOwner[] = buildSharedGraph(2, 2, 0, 0);
      hintGC();
      const edges: number = sharedEdgeTotal(owners);
      const countsOk: boolean = sharedOwnerCountsOk(owners, 2, 2);
      const sharedIdentity: boolean = owners[0].leaves[0] === owners[1].leaves[0];
      logCase('testGraphShare0001', `edges=${edges} countsOk=${countsOk} sharedIdentity=${sharedIdentity}`);
      expect(edges).assertEqual(4);
      expect(countsOk).assertTrue();
      expect(sharedIdentity).assertTrue();
      expect(owners.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_8900
     * @tc.name      testGraphShare0002
     * @tc.desc      Build three owners sharing five leaves with one slot payloads, hint GC and check the fifteen owner
     *               edges, the leaf back references and the uniform payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphShare0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const owners: SharedOwner[] = buildSharedGraph(3, 5, 1, 0);
      hintGC();
      const edges: number = sharedEdgeTotal(owners);
      let payloadOk: boolean = true;
      for (const leaf of owners[0].leaves) {
        payloadOk = payloadOk && leaf.payload.every((value: number) => value === leaf.id);
      }
      logCase('testGraphShare0002', `edges=${edges} countsOk=${sharedOwnerCountsOk(owners, 3, 5)} ` +
        `payloadOk=${payloadOk}`);
      expect(edges).assertEqual(15);
      expect(sharedOwnerCountsOk(owners, 3, 5)).assertTrue();
      expect(payloadOk).assertTrue();
      expect(owners[0].leaves.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9000
     * @tc.name      testGraphShare0003
     * @tc.desc      Build ten owners sharing twenty leaves, hint GC and check two hundred owner edges, ten back
     *               references on every leaf and the distinct leaf count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphShare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const owners: SharedOwner[] = buildSharedGraph(10, 20, 0, 0);
      hintGC();
      const edges: number = sharedEdgeTotal(owners);
      const distinct: number = owners[0].leaves.length;
      logCase('testGraphShare0003', `owners=${owners.length} edges=${edges} distinct=${distinct} ` +
        `leafOwners=${owners[0].leaves[0].owners.length}`);
      expect(edges).assertEqual(200);
      expect(distinct).assertEqual(20);
      expect(owners[0].leaves[0].owners.length).assertEqual(10);
      expect(sharedOwnerCountsOk(owners, 10, 20)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9100
     * @tc.name      testGraphShare0004
     * @tc.desc      Build owner and leaf count combinations, hint GC after each build and check the edge total of each
     *               combination equals owner count times leaf count
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphShare0004', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const edges: number[] = [];
      const oracles: number[] = [];
      for (let i = 0; i < OWNER_COUNTS.length; i++) {
        const owners: SharedOwner[] = buildSharedGraph(OWNER_COUNTS[i], LEAF_COUNTS[i], 1, 0);
        hintGC();
        edges.push(sharedEdgeTotal(owners));
        oracles.push(OWNER_COUNTS[i] * LEAF_COUNTS[i]);
      }
      const edgesOk: boolean = sameNumbers(edges, oracles);
      logCase('testGraphShare0004', `owners=${OWNER_COUNTS.join(',')} leaves=${LEAF_COUNTS.join(',')} ` +
        `edges=${edges.join(',')} oracles=${oracles.join(',')} edgesOk=${edgesOk}`);
      expect(edgesOk).assertTrue();
      expect(edges.length).assertEqual(OWNER_COUNTS.length);
      expect(oracles[4]).assertEqual(96);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9200
     * @tc.name      testGraphShare0005
     * @tc.desc      Build five owners sharing eight leaves, hint GC and check every leaf lists all five owners in the
     *               same order and each owner lists every leaf object
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphShare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const owners: SharedOwner[] = buildSharedGraph(5, 8, 2, 100);
      hintGC();
      let ordered: number = 0;
      const probeLeaf: SharedLeaf = owners[0].leaves[0];
      for (let i = 0; i < owners.length; i++) {
        if (probeLeaf.owners[i] === owners[i]) {
          ordered++;
        }
      }
      const allListed: boolean = owners[4].leaves.length === 8 && owners[4].leaves[7] === probeLeaf;
      logCase('testGraphShare0005', `ordered=${ordered} allListed=${allListed} ` +
        `probeOwners=${probeLeaf.owners.length} leafId=${probeLeaf.id}`);
      expect(ordered).assertEqual(5);
      expect(allListed).assertTrue();
      expect(probeLeaf.owners.length).assertEqual(5);
      expect(probeLeaf.id).assertEqual(105);
      expect(sharedEdgeTotal(owners)).assertEqual(40);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9300
     * @tc.name      testGraphDiamond0001
     * @tc.desc      Build the smallest diamond of one root, two middle nodes and one sink, hint GC and check the reach
     *               count, the four edges and the shared sink identity
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testGraphDiamond0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const widths: number[] = [1, 2, 1];
      const first: DiamondNode[] = buildDiamond(widths, 0, 0);
      hintGC();
      const reach: number = diamondReachCount(first);
      const edges: number = diamondEdgeTotal(first);
      const sharedSink: boolean = first[0].children[0].children[0] === first[0].children[1].children[0];
      logCase('testGraphDiamond0001', `reach=${reach} edges=${edges} sharedSink=${sharedSink} ` +
        `oracleEdges=${diamondEdgeOracle(widths)}`);
      expect(reach).assertEqual(4);
      expect(edges).assertEqual(4);
      expect(sharedSink).assertTrue();
      expect(edges).assertEqual(diamondEdgeOracle(widths));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9400
     * @tc.name      testGraphDiamond0002
     * @tc.desc      Build a four layer diamond with one slot payloads, hint GC and check eight nodes, ten edges, the
     *               back reference rule and the uniform payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphDiamond0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const widths: number[] = [1, 3, 3, 1];
      const first: DiamondNode[] = buildDiamond(widths, 1, 0);
      hintGC();
      const reach: number = diamondReachCount(first);
      const edges: number = diamondEdgeTotal(first);
      const backRefs: boolean = diamondBackRefsOk(first);
      logCase('testGraphDiamond0002', `reach=${reach} edges=${edges} backRefs=${backRefs} ` +
        `payloadOk=${diamondPayloadOk(first)}`);
      expect(reach).assertEqual(8);
      expect(edges).assertEqual(15);
      expect(backRefs).assertTrue();
      expect(diamondPayloadOk(first)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9500
     * @tc.name      testGraphDiamond0003
     * @tc.desc      Build the widening then narrowing diamond over seven layers, hint GC and check twenty two nodes,
     *               the edge oracle and the layer of the sink
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphDiamond0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const widths: number[] = [1, 2, 4, 8, 4, 2, 1];
      const first: DiamondNode[] = buildDiamond(widths, 0, 0);
      hintGC();
      const reach: number = diamondReachCount(first);
      const edges: number = diamondEdgeTotal(first);
      const sink: DiamondNode = first[0].children[0].children[0].children[0];
      logCase('testGraphDiamond0003', `reach=${reach} edges=${edges} oracle=${diamondEdgeOracle(widths)} ` +
        `sinkLayer=${sink.layer}`);
      expect(reach).assertEqual(diamondWidthTotal(widths));
      expect(reach).assertEqual(22);
      expect(edges).assertEqual(diamondEdgeOracle(widths));
      expect(sink.layer).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9600
     * @tc.name      testGraphDiamond0004
     * @tc.desc      Build four diamond shapes, hint GC after each build and check the edge total of every shape equals
     *               the neighbouring width products summed by hand
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphDiamond0004', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const edges: number[] = [];
      const oracles: number[] = [];
      const reaches: number[] = [];
      for (const shape of DIAMOND_SHAPES) {
        const first: DiamondNode[] = buildDiamond(shape, 0, 0);
        hintGC();
        edges.push(diamondEdgeTotal(first));
        oracles.push(diamondEdgeOracle(shape));
        reaches.push(diamondReachCount(first));
      }
      const edgesOk: boolean = sameNumbers(edges, oracles);
      logCase('testGraphDiamond0004', `edges=${edges.join(',')} oracles=${oracles.join(',')} ` +
        `reaches=${reaches.join(',')} edgesOk=${edgesOk}`);
      expect(edgesOk).assertTrue();
      expect(edges.length).assertEqual(DIAMOND_SHAPES.length);
      expect(reaches[0]).assertEqual(4);
      expect(reaches[3]).assertEqual(10);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9700
     * @tc.name      testGraphDiamond0005
     * @tc.desc      Build a wide diamond of one root, eight middle nodes and one sink, hint GC and check the reach
     *               count, the sixteen edges and the sink parent count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphDiamond0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [1, 8, 8, 1];
      const first: DiamondNode[] = buildDiamond(widths, 0, 0);
      hintGC();
      const reach: number = diamondReachCount(first);
      const edges: number = diamondEdgeTotal(first);
      const sink: DiamondNode = first[0].children[0].children[0];
      logCase('testGraphDiamond0005', `reach=${reach} edges=${edges} sinkParents=${sink.parents.length} ` +
        `rootChildren=${first[0].children.length}`);
      expect(reach).assertEqual(18);
      expect(edges).assertEqual(80);
      expect(sink.parents.length).assertEqual(8);
      expect(first[0].children.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9800
     * @tc.name      testGraphDiamond0006
     * @tc.desc      Build a six layer diamond, hint GC and check the reach count equals the width sum while every
     *               reachable node reports its layer and the payload mirrors its id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphDiamond0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [1, 3, 5, 5, 3, 1];
      const first: DiamondNode[] = buildDiamond(widths, 2, 0);
      hintGC();
      const reach: number = diamondReachCount(first);
      const widthSum: number = diamondWidthTotal(widths);
      const reachOk: boolean = reach === widthSum;
      logCase('testGraphDiamond0006', `reach=${reach} widthSum=${widthSum} reachOk=${reachOk} ` +
        `edges=${diamondEdgeTotal(first)}`);
      expect(reachOk).assertTrue();
      expect(reach).assertEqual(18);
      expect(diamondEdgeTotal(first)).assertEqual(diamondEdgeOracle(widths));
      expect(diamondPayloadOk(first)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_9900
     * @tc.name      testGraphDiamond0007
     * @tc.desc      Build a five layer diamond, hint GC and check every child lists the parent that reaches it while
     *               the root keeps no parent and the sink keeps no child
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphDiamond0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [1, 4, 6, 4, 1];
      const first: DiamondNode[] = buildDiamond(widths, 1, 0);
      hintGC();
      const backRefs: boolean = diamondBackRefsOk(first);
      const root: DiamondNode = first[0];
      const sink: DiamondNode = root.children[0].children[0].children[0].children[0];
      logCase('testGraphDiamond0007', `backRefs=${backRefs} rootParents=${root.parents.length} ` +
        `sinkChildren=${sink.children.length} sinkParents=${sink.parents.length}`);
      expect(backRefs).assertTrue();
      expect(root.parents.length).assertEqual(0);
      expect(sink.children.length).assertEqual(0);
      expect(sink.parents.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10000
     * @tc.name      testGraphDiamond0008
     * @tc.desc      Keep a five layer diamond reachable across two forced collections and check the reach count, the
     *               edge total and the back reference rule afterwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphDiamond0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const widths: number[] = [1, 2, 4, 4, 2, 1];
      const first: DiamondNode[] = buildDiamond(widths, 2, 0);
      hintGC();
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      const reach: number = diamondReachCount(first);
      logCase('testGraphDiamond0008', `cycles=${cycles} reach=${reach} edges=${diamondEdgeTotal(first)} ` +
        `backRefs=${diamondBackRefsOk(first)}`);
      expect(cycles >= 2).assertTrue();
      expect(reach).assertEqual(14);
      expect(diamondEdgeTotal(first)).assertEqual(diamondEdgeOracle(widths));
      expect(diamondBackRefsOk(first)).assertTrue();
      expect(diamondPayloadOk(first)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10100
     * @tc.name      testGraphMix0001
     * @tc.desc      Hold a chain and a ring of the same size in one test, hint GC and check both independent walks and
     *               both id sums match the series oracle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphMix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const size: number = 120;
      const head: ChainNode = buildChain(size, 2, 0);
      const ring: RingNode = buildRing(size, 2, 0);
      hintGC();
      const chainWalk: number = chainLength(head, WALK_LIMIT);
      const ringWalk: number = ringLength(ring, size + 1);
      logCase('testGraphMix0001', `chainWalk=${chainWalk} ringWalk=${ringWalk} ` +
        `chainSum=${chainIdSum(head, size)} ringSum=${ringIdSum(ring, size)}`);
      expect(chainWalk).assertEqual(size);
      expect(ringWalk).assertEqual(size);
      expect(chainIdSum(head, size)).assertEqual(expectedIdSum(0, size));
      expect(ringIdSum(ring, size)).assertEqual(expectedIdSum(0, size));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10200
     * @tc.name      testGraphMix0002
     * @tc.desc      Hold a five level tree and a two hundred node list together, hint GC and check the tree node count,
     *               the tree back links and the list length and back link rule
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGraphMix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const root: BranchNode = buildBranchTree(5, 0, 0);
      const listHead: LinkNode = buildDoubleList(200, 0, 0);
      hintGC();
      const nodes: number = countBranch(root);
      const listLength: number = doubleForwardLength(listHead, 200);
      logCase('testGraphMix0002', `nodes=${nodes} backLinks=${countBranchBackLinks(root)} ` +
        `listLength=${listLength} listBackLinks=${doubleBackLinksOk(listHead, 200)}`);
      expect(nodes).assertEqual(31);
      expect(countBranchBackLinks(root)).assertEqual(30);
      expect(listLength).assertEqual(200);
      expect(doubleBackLinksOk(listHead, 200)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10300
     * @tc.name      testGraphMix0003
     * @tc.desc      Hold a six node mesh and a five layer diamond together, hint GC and check the mesh edge total, the
     *               diamond edge total and both reachable node counts
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphMix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nodes: MeshNode[] = buildMesh(6, 0, 0);
      const widths: number[] = [1, 3, 3, 1];
      const first: DiamondNode[] = buildDiamond(widths, 0, 0);
      hintGC();
      const meshEdges: number = meshEdgeTotal(nodes);
      const diamondEdges: number = diamondEdgeTotal(first);
      logCase('testGraphMix0003', `meshNodes=${nodes.length} meshEdges=${meshEdges} ` +
        `diamondReach=${diamondReachCount(first)} diamondEdges=${diamondEdges}`);
      expect(meshEdges).assertEqual(30);
      expect(diamondEdges).assertEqual(diamondEdgeOracle(widths));
      expect(diamondReachCount(first)).assertEqual(8);
      expect(meshPeersIntact(nodes, 6)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10400
     * @tc.name      testGraphMix0004
     * @tc.desc      Hold a nested bag and a shared leaf graph together, hint GC and check the bag node count, the bag
     *               entry count and the shared graph edge total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphMix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bag: BagNode = buildBagTree(3, 3, 1, new IdCounter(0));
      const owners: SharedOwner[] = buildSharedGraph(4, 6, 1, 0);
      hintGC();
      const nodes: number = countBag(bag);
      const entries: number = countBagEntries(bag);
      logCase('testGraphMix0004', `nodes=${nodes} entries=${entries} rings=${countBagRings(bag)} ` +
        `sharedEdges=${sharedEdgeTotal(owners)}`);
      expect(nodes).assertEqual(13);
      expect(entries).assertEqual(12);
      expect(sharedEdgeTotal(owners)).assertEqual(24);
      expect(sharedOwnerCountsOk(owners, 4, 6)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10500
     * @tc.name      testGraphMix0005
     * @tc.desc      Hold a grid, a fanout tree and a ring at the same time, hint GC and check each structure against
     *               its own oracle in a single assertion sweep
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphMix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cells: GridCell[] = buildGrid(5, 7, 0, 0);
      const fork: ForkNode = buildForkTree(3, 3, 0, 0);
      const ring: RingNode = buildRing(64, 1, 0);
      hintGC();
      let gridEdges: number = 0;
      for (const cell of cells) {
        gridEdges += cell.peers.length;
      }
      const forkNodes: number = countFork(fork);
      const ringWalk: number = ringLength(ring, 65);
      logCase('testGraphMix0005', `gridCells=${cells.length} gridEdges=${gridEdges} forkNodes=${forkNodes} ` +
        `ringWalk=${ringWalk}`);
      expect(gridEdges).assertEqual(gridNeighborEdges(5, 7));
      expect(forkNodes).assertEqual(13);
      expect(ringWalk).assertEqual(64);
      expect(gridEdgesIntact(cells, 5, 7)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10600
     * @tc.name      testGraphMix0006
     * @tc.desc      Hold a chain and a ring across ten hintGC calls and check both walks stay complete on every round
     *               while the snapshot stays ordered
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testGraphMix0006', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const head: ChainNode = buildChain(150, 1, 0);
      const ring: RingNode = buildRing(150, 1, 0);
      const before: GcSnapshot = new GcSnapshot();
      let chainClosed: number = 0;
      let ringClosed: number = 0;
      for (let round = 0; round < HINT_REPEATS; round++) {
        hintGC();
        if (chainLength(head, WALK_LIMIT) === 150) {
          chainClosed++;
        }
        if (ringLength(ring, 151) === 150) {
          ringClosed++;
        }
      }
      const after: GcSnapshot = new GcSnapshot();
      logCase('testGraphMix0006', `chainClosed=${chainClosed} ringClosed=${ringClosed} ` +
        `ordered=${after.notBefore(before)}`);
      expect(chainClosed).assertEqual(HINT_REPEATS);
      expect(ringClosed).assertEqual(HINT_REPEATS);
      expect(after.notBefore(before)).assertTrue();
      expect(chainIdSum(head, 150)).assertEqual(ringIdSum(ring, 150));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10700
     * @tc.name      testGraphMix0007
     * @tc.desc      Interleave forced collections and pressure allocation while a tree, a list and a bag stay
     *               reachable and check each structure against its oracle afterwards
     * @tc.size      LARGETEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testGraphMix0007', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL2, async () => {
      const root: BranchNode = buildBranchTree(6, 1, 0);
      const listHead: LinkNode = buildDoubleList(300, 1, 0);
      const bag: BagNode = buildBagTree(3, 2, 1, new IdCounter(0));
      let sink: number = 0;
      for (let round = 0; round < 3; round++) {
        sink += allocatePressure();
        hintGC();
      }
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      logCase('testGraphMix0007', `sink=${sink} cycles=${cycles} treeNodes=${countBranch(root)} ` +
        `listLength=${doubleForwardLength(listHead, 300)} bagNodes=${countBag(bag)}`);
      expect(sink > 0).assertTrue();
      expect(cycles >= 2).assertTrue();
      expect(countBranch(root)).assertEqual(63);
      expect(doubleForwardLength(listHead, 300)).assertEqual(300);
      expect(countBag(bag)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_GRAPH_10800
     * @tc.name      testGraphMix0008
     * @tc.desc      Build every supported structure in one case, hint GC five times and run the full oracle sweep over
     *               the chain, ring, mesh, tree, list, bag, shared graph and diamond
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGraphMix0008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const chainHead: ChainNode = buildChain(64, 1, 0);
      const ring: RingNode = buildRing(64, 1, 0);
      const mesh: MeshNode[] = buildMesh(5, 1, 0);
      const tree: BranchNode = buildBranchTree(5, 1, 0);
      const listHead: LinkNode = buildDoubleList(64, 1, 0);
      const bag: BagNode = buildBagTree(2, 3, 1, new IdCounter(0));
      const owners: SharedOwner[] = buildSharedGraph(3, 3, 1, 0);
      const widths: number[] = [1, 2, 1];
      const diamond: DiamondNode[] = buildDiamond(widths, 1, 0);
      const before: GcSnapshot = new GcSnapshot();
      for (let round = 0; round < 5; round++) {
        hintGC();
      }
      const after: GcSnapshot = new GcSnapshot();
      const checks: boolean[] = [];
      checks.push(chainLength(chainHead, 64) === 64);
      checks.push(ringLength(ring, 65) === 64);
      checks.push(meshEdgeTotal(mesh) === 20);
      checks.push(countBranch(tree) === 31);
      checks.push(doubleForwardLength(listHead, 64) === 64);
      checks.push(countBag(bag) === 4);
      checks.push(sharedEdgeTotal(owners) === 9);
      checks.push(diamondReachCount(diamond) === 4);
      const allOk: boolean = checks.every((ok: boolean) => ok);
      logCase('testGraphMix0008', `checks=${checks.length} allOk=${allOk} ` +
        `ordered=${after.notBefore(before)} freed=${after.freed} allocated=${after.allocated}`);
      expect(checks.length).assertEqual(8);
      expect(allOk).assertTrue();
      expect(after.notBefore(before)).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
      expect(branchPayloadOk(tree)).assertTrue();
    });
  });
}
