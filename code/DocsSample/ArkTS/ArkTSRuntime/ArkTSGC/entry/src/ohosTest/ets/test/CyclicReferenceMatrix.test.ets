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
  allCleared,
  collectUntil,
  COLLECT_ROUNDS,
  CycleChild,
  CycleParent,
  expectedIdSum,
  FinalizeTracker,
  GcSnapshot,
  isCleared,
  linkPair,
  range,
  releasedRing,
  RingProbe,
  sameNumbers
} from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const RING_SIZES: number[] = [2, 3, 10, 100, 1000, 10000];
const PAYLOAD_LENGTHS: number[] = [0, 1, 64, 1024];
const PAYLOAD_RING_SIZE: number = 100;
const MESH_SIZE: number = 20;
const TREE_DEPTH: number = 6;
const MANY_PAIRS: number = 1000;
const CHURN_ROUNDS: number = 8;
const CHURN_RINGS: number = 200;
const CHURN_RING_SIZE: number = 50;

class MeshNode {
  id: number;
  peers: MeshNode[] = [];

  constructor(id: number) {
    this.id = id;
  }
}

class TreeNode {
  depth: number;
  parent: TreeNode | null = null;
  children: TreeNode[] = [];

  constructor(depth: number) {
    this.depth = depth;
  }
}

class ClosureHolder {
  name: string;
  reader: () => string = () => '';

  constructor(name: string) {
    this.name = name;
  }
}

class MapHolder {
  table: Map<string, MapHolder> = new Map<string, MapHolder>();
}

class ArrayHolder {
  items: Object[] = [];
}

class MeshProbe {
  refs: WeakRef<MeshNode>[];
  edges: number;

  constructor(refs: WeakRef<MeshNode>[], edges: number) {
    this.refs = refs;
    this.edges = edges;
  }
}

class TreeProbe {
  rootRef: WeakRef<TreeNode>;
  leafRef: WeakRef<TreeNode>;
  nodes: number;
  backLinks: number;

  constructor(rootRef: WeakRef<TreeNode>, leafRef: WeakRef<TreeNode>, nodes: number, backLinks: number) {
    this.rootRef = rootRef;
    this.leafRef = leafRef;
    this.nodes = nodes;
    this.backLinks = backLinks;
  }
}

function releasedMesh(size: number, tracker: FinalizeTracker): MeshProbe {
  const nodes: MeshNode[] = [];
  for (let i = 0; i < size; i++) {
    nodes.push(new MeshNode(i));
  }
  let edges: number = 0;
  for (let i = 0; i < size; i++) {
    for (let j = 0; j < size; j++) {
      if (i !== j) {
        nodes[i].peers.push(nodes[j]);
        edges++;
      }
    }
  }
  // only three weak views: creating many WeakRefs in one job keeps their targets alive on this runtime
  const refs: WeakRef<MeshNode>[] = [nodes[0], nodes[size >> 1], nodes[size - 1]]
    .map((node: MeshNode) => new WeakRef<MeshNode>(node));
  for (let i = 0; i < size; i++) {
    tracker.registry.register(nodes[i], i);
  }
  return new MeshProbe(refs, edges);
}

function growTree(node: TreeNode, maxDepth: number): void {
  if (node.depth >= maxDepth) {
    return;
  }
  for (let i = 0; i < 2; i++) {
    const child: TreeNode = new TreeNode(node.depth + 1);
    child.parent = node;
    node.children.push(child);
    growTree(child, maxDepth);
  }
}

function countTree(node: TreeNode): number {
  let total: number = 1;
  for (const child of node.children) {
    total += countTree(child);
  }
  return total;
}

function countBackLinks(node: TreeNode): number {
  let total: number = 0;
  for (const child of node.children) {
    total += (child.parent === node ? 1 : 0) + countBackLinks(child);
  }
  return total;
}

function releasedTree(maxDepth: number): TreeProbe {
  const root: TreeNode = new TreeNode(0);
  growTree(root, maxDepth);
  let leaf: TreeNode = root;
  while (leaf.children.length > 0) {
    leaf = leaf.children[leaf.children.length - 1];
  }
  return new TreeProbe(new WeakRef<TreeNode>(root), new WeakRef<TreeNode>(leaf), countTree(root), countBackLinks(root));
}

function releasedClosureHolder(name: string): WeakRef<ClosureHolder> {
  const holder: ClosureHolder = new ClosureHolder(name);
  holder.reader = () => holder.name;
  return new WeakRef<ClosureHolder>(holder);
}

function releasedMapHolder(): WeakRef<MapHolder> {
  const holder: MapHolder = new MapHolder();
  holder.table.set('self', holder);
  return new WeakRef<MapHolder>(holder);
}

function releasedArrayHolder(): WeakRef<ArrayHolder> {
  const holder: ArrayHolder = new ArrayHolder();
  holder.items.push(holder);
  holder.items.push(holder.items);
  return new WeakRef<ArrayHolder>(holder);
}

// reads happen in a plain function so no dereferenced object stays in the async frame
function readClosure(ref: WeakRef<ClosureHolder>): string {
  return (ref.deref() as ClosureHolder).reader();
}

function mapStoresOwner(ref: WeakRef<MapHolder>): boolean {
  const holder: MapHolder = ref.deref() as MapHolder;
  return holder.table.get('self') === holder;
}

function arrayItemCount(ref: WeakRef<ArrayHolder>): number {
  const holder: ArrayHolder = ref.deref() as ArrayHolder;
  return holder.items.length + (holder.items[0] === holder ? 0 : 100);
}

function brokenPairRefs(tag: number): WeakRef<Object>[] {
  const parent: CycleParent = linkPair(tag);
  const child: CycleChild = parent.child as CycleChild;
  parent.child = null;
  return [new WeakRef<Object>(parent), new WeakRef<Object>(child)];
}

function exactPairRefs(tag: number): WeakRef<Object>[] {
  const parent: CycleParent = new CycleParent(tag);
  const child: CycleChild = new CycleChild(tag);
  parent.child = child;
  child.parent = parent;
  return [new WeakRef<Object>(parent), new WeakRef<Object>(child)];
}

function churnRings(count: number, size: number): number {
  let built: number = 0;
  for (let i = 0; i < count; i++) {
    built += releasedRing(size, 8, i).length;
  }
  return built;
}

export default function cyclicReferenceMatrixTest() {
  describe('CyclicReferenceMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0100
     * @tc.name      testCyclicPairCollect0001
     * @tc.desc      Build the Parent and Child cycle from ReferenceCounting main(), drop it and check the tracing GC
     *               reclaims both objects
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCyclicPairCollect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const refs: WeakRef<Object>[] = exactPairRefs(1);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      logCase('testCyclicPairCollect0001', `refs=${refs.length} rounds=${rounds}`);
      expect(refs.length).assertEqual(2);
      expect(rounds > 0 && rounds <= COLLECT_ROUNDS).assertTrue();
      expect(isCleared(refs[0]) && isCleared(refs[1])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0200
     * @tc.name      testCyclicSelfLoop0001
     * @tc.desc      Drop a single node whose next field points to itself and check the self loop does not keep it alive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicSelfLoop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: RingProbe = releasedRing(1, 4, 42);
      const rounds: number = await collectUntil(() => isCleared(probe.ref), COLLECT_ROUNDS);
      logCase('testCyclicSelfLoop0001', `length=${probe.length} idSum=${probe.idSum} rounds=${rounds}`);
      expect(probe.length).assertEqual(1);
      expect(probe.idSum).assertEqual(42);
      expect(rounds > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0300
     * @tc.name      testCyclicRingSizes0001
     * @tc.desc      Drop rings of 2 to 10000 nodes and check each closes on itself before release and is reclaimed
     *               afterwards
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicRingSizes0001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const collected: number[] = [];
      const shapeOk: boolean[] = [];
      for (const size of RING_SIZES) {
        const probe: RingProbe = releasedRing(size, 2, size);
        shapeOk.push(probe.length === size && probe.idSum === expectedIdSum(size, size));
        const rounds: number = await collectUntil(() => isCleared(probe.ref), COLLECT_ROUNDS);
        collected.push(rounds);
      }
      logCase('testCyclicRingSizes0001', `shapeOk=${shapeOk.join(',')} collected=${collected.join(',')} ` +
        `beforeCount=${before.count}`);
      expect(shapeOk.every((ok: boolean) => ok)).assertTrue();
      expect(new GcSnapshot().count > before.count).assertTrue();
      expect(collected.every((rounds: number) => rounds > 0 && rounds <= COLLECT_ROUNDS)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0400
     * @tc.name      testCyclicPayloadSizes0001
     * @tc.desc      Drop one hundred node rings whose nodes carry empty, small and large arrays and check every ring is
     *               reclaimed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCyclicPayloadSizes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const collected: number[] = [];
      const lengths: number[] = [];
      for (const payload of PAYLOAD_LENGTHS) {
        const probe: RingProbe = releasedRing(PAYLOAD_RING_SIZE, payload, payload);
        lengths.push(probe.length);
        collected.push(await collectUntil(() => isCleared(probe.ref), COLLECT_ROUNDS));
      }
      logCase('testCyclicPayloadSizes0001', `lengths=${lengths.join(',')} collected=${collected.join(',')} ` +
        `beforeFreed=${before.freed}`);
      expect(lengths.every((length: number) => length === PAYLOAD_RING_SIZE)).assertTrue();
      expect(new GcSnapshot().freed > before.freed).assertTrue();
      expect(collected.every((rounds: number) => rounds > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0500
     * @tc.name      testCyclicBrokenCycle0001
     * @tc.desc      Break the Parent to Child link before dropping the pair and check both halves are reclaimed
     *               independently
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCyclicBrokenCycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: WeakRef<Object>[] = brokenPairRefs(5);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      logCase('testCyclicBrokenCycle0001', `rounds=${rounds} refs=${refs.length}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(refs[0])).assertTrue();
      expect(isCleared(refs[1])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0600
     * @tc.name      testCyclicMeshCollect0001
     * @tc.desc      Drop a fully connected graph of twenty nodes and check all 380 mutual references do not keep any of
     *               its nodes from being finalized
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicMeshCollect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const probe: MeshProbe = releasedMesh(MESH_SIZE, tracker);
      const rounds: number =
        await collectUntil(() => tracker.count() >= MESH_SIZE && allCleared(probe.refs), COLLECT_ROUNDS);
      logCase('testCyclicMeshCollect0001', `rounds=${rounds} finalized=${tracker.count()} edges=${probe.edges}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tracker.sortedTokens(), range(0, MESH_SIZE))).assertTrue();
      expect(probe.edges).assertEqual(MESH_SIZE * (MESH_SIZE - 1));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0700
     * @tc.name      testCyclicTreeBackRefs0001
     * @tc.desc      Drop a binary tree whose children point back to their parents and check both root and deepest leaf
     *               are reclaimed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicTreeBackRefs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: TreeProbe = releasedTree(TREE_DEPTH);
      const rounds: number =
        await collectUntil(() => isCleared(probe.rootRef) && isCleared(probe.leafRef), COLLECT_ROUNDS);
      logCase('testCyclicTreeBackRefs0001', `nodes=${probe.nodes} backLinks=${probe.backLinks} rounds=${rounds}`);
      expect(probe.nodes).assertEqual(Math.pow(2, TREE_DEPTH + 1) - 1);
      expect(probe.backLinks).assertEqual(probe.nodes - 1);
      expect(rounds > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0800
     * @tc.name      testCyclicClosureCycle0001
     * @tc.desc      Drop an object that stores a closure capturing the object itself and check the closure cycle is
     *               reclaimed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCyclicClosureCycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ref: WeakRef<ClosureHolder> = releasedClosureHolder('closure');
      const readBack: string = readClosure(ref);
      await paceTurn();
      const rounds: number = await collectUntil(() => isCleared(ref), COLLECT_ROUNDS);
      logCase('testCyclicClosureCycle0001', `readBack=${readBack} rounds=${rounds}`);
      expect(readBack).assertEqual('closure');
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_0900
     * @tc.name      testCyclicContainerCycle0001
     * @tc.desc      Drop a Map that stores its owner and an array that stores itself and check both container cycles
     *               are reclaimed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCyclicContainerCycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mapRef: WeakRef<MapHolder> = releasedMapHolder();
      const arrayRef: WeakRef<ArrayHolder> = releasedArrayHolder();
      const selfStored: boolean = mapStoresOwner(mapRef);
      const itemCount: number = arrayItemCount(arrayRef);
      await paceTurn();
      const rounds: number = await collectUntil(() => isCleared(mapRef) && isCleared(arrayRef), COLLECT_ROUNDS);
      logCase('testCyclicContainerCycle0001', `selfStored=${selfStored} itemCount=${itemCount} rounds=${rounds}`);
      expect(selfStored).assertTrue();
      expect(itemCount).assertEqual(2);
      expect(rounds > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_1000
     * @tc.name      testCyclicFreedBytes0001
     * @tc.desc      Keep creating and dropping rings and check the freed byte counter covers at least half of the bytes
     *               allocated
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicFreedBytes0001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      let built: number = 0;
      for (let round = 0; round < CHURN_ROUNDS; round++) {
        built += churnRings(CHURN_RINGS, CHURN_RING_SIZE);
        await paceTurn();
      }
      await collectUntil(() => new GcSnapshot().count - before.count >= 2, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const allocatedDelta: number = after.allocated - before.allocated;
      const freedDelta: number = after.freed - before.freed;
      logCase('testCyclicFreedBytes0001', `built=${built} countDelta=${after.count - before.count} ` +
        `allocatedDelta=${allocatedDelta} freedDelta=${freedDelta}`);
      expect(built).assertEqual(CHURN_ROUNDS * CHURN_RINGS * CHURN_RING_SIZE);
      expect(after.count - before.count >= 2).assertTrue();
      expect(allocatedDelta > 0).assertTrue();
      expect(freedDelta * 2 >= allocatedDelta).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_1100
     * @tc.name      testCyclicManyPairs0001
     * @tc.desc      Drop one thousand Parent and Child cycles and check the finalizer reports each token once and no
     *               others
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicManyPairs0001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedPairs(MANY_PAIRS, 0);
      const rounds: number = await collectUntil(() => tracker.count() >= MANY_PAIRS, COLLECT_ROUNDS);
      logCase('testCyclicManyPairs0001', `rounds=${rounds} finalized=${tracker.count()} expected=${MANY_PAIRS}`);
      expect(rounds > 0).assertTrue();
      expect(tracker.count()).assertEqual(MANY_PAIRS);
      expect(sameNumbers(tracker.sortedTokens(), range(0, MANY_PAIRS))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICMATRIX_1200
     * @tc.name      testCyclicRingFinalize0001
     * @tc.desc      Drop fifty rings of different lengths through the finalizer and check every ring head is finalized
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCyclicRingFinalize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      for (let size = 1; size <= 5; size++) {
        tracker.registerReleasedRings(10, size * 7, size * 100);
      }
      const rounds: number = await collectUntil(() => tracker.count() >= 50, COLLECT_ROUNDS);
      const expected: number[] = [];
      for (let size = 1; size <= 5; size++) {
        range(size * 100, 10).forEach((token: number) => expected.push(token));
      }
      logCase('testCyclicRingFinalize0001', `rounds=${rounds} finalized=${tracker.count()} ` +
        `expected=${expected.length}`);
      expect(rounds > 0).assertTrue();
      expect(tracker.count()).assertEqual(50);
      expect(sameNumbers(tracker.sortedTokens(), expected)).assertTrue();
    });
  });
}
