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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { ACCOUNT_ID, RESULT_CODE, CONNECTION_NUMBER } from '../Shared/SharedDriver';

enum FlowNodeKind {
  ENTRY = 0,
  APP = 1,
  SERVICE = 2,
  PERMISSION = 3,
  MISSION = 4,
  EXIT = 5
}

enum FlowStatus {
  IDLE = 0,
  RUNNING = 1,
  DONE = 2,
  FAILED = 3,
  ABORTED = 4
}

class FlowNode {
  readonly nodeId: number;
  readonly kind: FlowNodeKind;
  readonly name: string;
  readonly nextId: number;
  readonly failId: number;
  readonly optional: boolean;

  constructor(nodeId: number, kind: FlowNodeKind, name: string, nextId: number, failId: number, optional: boolean) {
    this.nodeId = nodeId;
    this.kind = kind;
    this.name = name;
    this.nextId = nextId;
    this.failId = failId;
    this.optional = optional;
  }

  isTerminal(): boolean {
    return this.nextId < 0;
  }

  hasFailurePath(): boolean {
    return this.failId >= 0;
  }

  describe(): string {
    return `${this.nodeId}:${this.name}->${this.nextId}`;
  }
}

class FlowGraph {
  private nodes: FlowNode[] = [];

  add(node: FlowNode): FlowGraph {
    this.nodes.push(node);
    return this;
  }

  size(): number {
    return this.nodes.length;
  }

  all(): FlowNode[] {
    return this.nodes;
  }

  find(nodeId: number): FlowNode | null {
    for (const node of this.nodes) {
      if (node.nodeId === nodeId) {
        return node;
      }
    }
    return null;
  }

  entry(): FlowNode | null {
    if (this.nodes.length === 0) {
      return null;
    }
    return this.nodes[0];
  }

  terminals(): number {
    let count = 0;
    for (const node of this.nodes) {
      if (node.isTerminal()) {
        count += 1;
      }
    }
    return count;
  }

  countByKind(kind: FlowNodeKind): number {
    let count = 0;
    for (const node of this.nodes) {
      if (node.kind === kind) {
        count += 1;
      }
    }
    return count;
  }

  failurePaths(): number {
    let count = 0;
    for (const node of this.nodes) {
      if (node.hasFailurePath()) {
        count += 1;
      }
    }
    return count;
  }

  optionalNodes(): number {
    let count = 0;
    for (const node of this.nodes) {
      if (node.optional) {
        count += 1;
      }
    }
    return count;
  }
}

class FlowTrace {
  private visited: number[] = [];
  private outcomes: boolean[] = [];

  record(nodeId: number, outcome: boolean): FlowTrace {
    this.visited.push(nodeId);
    this.outcomes.push(outcome);
    return this;
  }

  length(): number {
    return this.visited.length;
  }

  visitedIds(): number[] {
    return this.visited;
  }

  outcomeAt(index: number): boolean {
    if (index < 0 || index >= this.outcomes.length) {
      return false;
    }
    return this.outcomes[index];
  }

  successCount(): number {
    let count = 0;
    for (const outcome of this.outcomes) {
      if (outcome) {
        count += 1;
      }
    }
    return count;
  }

  failureCount(): number {
    return this.outcomes.length - this.successCount();
  }

  allSucceeded(): boolean {
    if (this.outcomes.length === 0) {
      return false;
    }
    return this.failureCount() === 0;
  }
}

class FlowEngine {
  private graph: FlowGraph;
  private currentId: number;
  private status: FlowStatus;
  private traceData: FlowTrace = new FlowTrace();
  private failing: number[] = [];

  constructor(graph: FlowGraph) {
    this.graph = graph;
    this.currentId = 0;
    this.status = FlowStatus.IDLE;
  }

  failAt(nodeId: number): FlowEngine {
    this.failing.push(nodeId);
    return this;
  }

  private willFail(nodeId: number): boolean {
    for (const candidate of this.failing) {
      if (candidate === nodeId) {
        return true;
      }
    }
    return false;
  }

  run(): FlowStatus {
    this.traceData = new FlowTrace();
    this.status = FlowStatus.RUNNING;
    const entry = this.graph.entry();
    if (entry === null) {
      this.status = FlowStatus.ABORTED;
      return this.status;
    }
    let node: FlowNode | null = entry;
    let guard = 0;
    while (node !== null && guard < 100) {
      guard += 1;
      this.currentId = node.nodeId;
      const failed = this.willFail(node.nodeId);
      this.traceData.record(node.nodeId, !failed);
      if (failed) {
        if (node.failId >= 0) {
          node = this.graph.find(node.failId);
          continue;
        }
        this.status = node.optional ? FlowStatus.DONE : FlowStatus.FAILED;
        return this.status;
      }
      if (node.isTerminal()) {
        this.status = FlowStatus.DONE;
        return this.status;
      }
      node = this.graph.find(node.nextId);
    }
    this.status = FlowStatus.ABORTED;
    return this.status;
  }

  viewStatus(): FlowStatus {
    return this.status;
  }

  current(): number {
    return this.currentId;
  }

  trace(): FlowTrace {
    return this.traceData;
  }

  executed(): number {
    return this.traceData.length();
  }
}

class FlowBranch {
  private condition: boolean;
  private truePath: FlowGraph;
  private falsePath: FlowGraph;

  constructor(condition: boolean, truePath: FlowGraph, falsePath: FlowGraph) {
    this.condition = condition;
    this.truePath = truePath;
    this.falsePath = falsePath;
  }

  selected(): FlowGraph {
    return this.condition ? this.truePath : this.falsePath;
  }

  selectedSize(): number {
    return this.selected().size();
  }

  describe(): string {
    return `cond=${this.condition},true=${this.truePath.size()},false=${this.falsePath.size()}`;
  }
}

class FlowMetrics {
  private graph: FlowGraph;

  constructor(graph: FlowGraph) {
    this.graph = graph;
  }

  appNodes(): number {
    return this.graph.countByKind(FlowNodeKind.APP);
  }

  serviceNodes(): number {
    return this.graph.countByKind(FlowNodeKind.SERVICE);
  }

  describe(): string {
    return `nodes=${this.graph.size()},terminals=${this.graph.terminals()}`;
  }

  averageDegree(): number {
    if (this.graph.size() === 0) {
      return 0;
    }
    let edges = 0;
    for (const node of this.graph.all()) {
      if (node.nextId >= 0) {
        edges += 1;
      }
      if (node.failId >= 0) {
        edges += 1;
      }
    }
    return edges / this.graph.size();
  }

  isWellFormed(): boolean {
    if (this.graph.size() === 0) {
      return false;
    }
    for (const node of this.graph.all()) {
      if (node.nextId >= 0 && this.graph.find(node.nextId) === null) {
        return false;
      }
      if (node.failId >= 0 && this.graph.find(node.failId) === null) {
        return false;
      }
    }
    return true;
  }
}

function buildGraph(): FlowGraph {
  const graph = new FlowGraph();
  graph.add(new FlowNode(0, FlowNodeKind.ENTRY, 'startAbility', 1, -1, false));
  graph.add(new FlowNode(1, FlowNodeKind.APP, 'startAbilityForResult', 2, 5, false));
  graph.add(new FlowNode(2, FlowNodeKind.SERVICE, 'startServiceExtensionAbility', 3, 5, false));
  graph.add(new FlowNode(3, FlowNodeKind.PERMISSION, 'requestPermissionsFromUser', 4, 5, false));
  graph.add(new FlowNode(4, FlowNodeKind.MISSION, 'setMissionLabel', 6, -1, false));
  graph.add(new FlowNode(5, FlowNodeKind.SERVICE, 'disconnectServiceExtensionAbility', 6, -1, false));
  graph.add(new FlowNode(6, FlowNodeKind.EXIT, 'finish', -1, -1, false));
  return graph;
}

export default function abilityOperationFlowTest(): void {
  describe('AbilityOperationFlowSuite', () => {
    let graph: FlowGraph = buildGraph();

    beforeAll(() => {
      graph = buildGraph();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'operation flow suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'operation flow suite end');
    });

    it('AbilityOperationFlow_001', 0, async (done: Function) => {
      expect(graph.size()).assertEqual(7);
      expect(graph.all().length).assertEqual(7);
      expect(graph.terminals()).assertEqual(1);
      expect(graph.failurePaths()).assertEqual(3);
      expect(graph.optionalNodes()).assertEqual(0);
      done();
    });

    it('AbilityOperationFlow_002', 0, async (done: Function) => {
      expect(graph.countByKind(FlowNodeKind.ENTRY)).assertEqual(1);
      expect(graph.countByKind(FlowNodeKind.APP)).assertEqual(1);
      expect(graph.countByKind(FlowNodeKind.SERVICE)).assertEqual(2);
      expect(graph.countByKind(FlowNodeKind.PERMISSION)).assertEqual(1);
      expect(graph.countByKind(FlowNodeKind.MISSION)).assertEqual(1);
      expect(graph.countByKind(FlowNodeKind.EXIT)).assertEqual(1);
      done();
    });

    it('AbilityOperationFlow_003', 0, async (done: Function) => {
      const entry = graph.entry();
      expect(entry !== null).assertTrue();
      if (entry !== null) {
        expect(entry.nodeId).assertEqual(0);
        expect(entry.kind).assertEqual(FlowNodeKind.ENTRY);
        expect(entry.name).assertEqual('startAbility');
        expect(entry.isTerminal()).assertFalse();
      }
      done();
    });

    it('AbilityOperationFlow_004', 0, async (done: Function) => {
      const found = graph.find(3);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.kind).assertEqual(FlowNodeKind.PERMISSION);
        expect(found.nextId).assertEqual(4);
        expect(found.failId).assertEqual(5);
        expect(found.hasFailurePath()).assertTrue();
      }
      expect(graph.find(99)).assertNull();
      done();
    });

    it('AbilityOperationFlow_005', 0, async (done: Function) => {
      const exit = graph.find(6);
      expect(exit !== null).assertTrue();
      if (exit !== null) {
        expect(exit.isTerminal()).assertTrue();
        expect(exit.hasFailurePath()).assertFalse();
        expect(exit.describe()).assertEqual('6:finish->-1');
      }
      done();
    });

    it('AbilityOperationFlow_006', 0, async (done: Function) => {
      const node = new FlowNode(1, FlowNodeKind.APP, 'op', 2, -1, false);
      expect(node.isTerminal()).assertFalse();
      expect(node.hasFailurePath()).assertFalse();
      expect(node.describe()).assertEqual('1:op->2');
      done();
    });

    it('AbilityOperationFlow_007', 0, async (done: Function) => {
      const node = new FlowNode(2, FlowNodeKind.APP, 'end', -1, -1, false);
      expect(node.isTerminal()).assertTrue();
      const recovery = new FlowNode(3, FlowNodeKind.SERVICE, 'recover', 0, 4, true);
      expect(recovery.hasFailurePath()).assertTrue();
      expect(recovery.optional).assertTrue();
      done();
    });

    it('AbilityOperationFlow_008', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      expect(engine.viewStatus()).assertEqual(FlowStatus.IDLE);
      expect(engine.executed()).assertEqual(0);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      expect(engine.viewStatus()).assertEqual(FlowStatus.DONE);
      done();
    });

    it('AbilityOperationFlow_009', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      engine.run();
      expect(engine.executed()).assertEqual(6);
      expect(engine.trace().length()).assertEqual(6);
      expect(engine.trace().allSucceeded()).assertTrue();
      expect(engine.trace().failureCount()).assertEqual(0);
      done();
    });

    it('AbilityOperationFlow_010', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      engine.run();
      const ids = engine.trace().visitedIds();
      expect(ids[0]).assertEqual(0);
      expect(ids[1]).assertEqual(1);
      expect(ids[2]).assertEqual(2);
      expect(ids[3]).assertEqual(3);
      expect(ids[4]).assertEqual(4);
      expect(ids[5]).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_011', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(1);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      expect(engine.executed()).assertEqual(4);
      const ids = engine.trace().visitedIds();
      expect(ids[1]).assertEqual(1);
      expect(ids[2]).assertEqual(5);
      expect(ids[3]).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_012', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(2);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      expect(engine.executed()).assertEqual(5);
      expect(engine.trace().failureCount()).assertEqual(1);
      expect(engine.trace().successCount()).assertEqual(4);
      done();
    });

    it('AbilityOperationFlow_013', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(3);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      const ids = engine.trace().visitedIds();
      expect(ids[ids.length - 1]).assertEqual(6);
      expect(engine.trace().outcomeAt(3)).assertFalse();
      done();
    });

    it('AbilityOperationFlow_014', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(0);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.FAILED);
      expect(engine.executed()).assertEqual(1);
      expect(engine.trace().allSucceeded()).assertFalse();
      done();
    });

    it('AbilityOperationFlow_015', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(6);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.FAILED);
      expect(engine.executed()).assertEqual(6);
      expect(engine.trace().failureCount()).assertEqual(1);
      done();
    });

    it('AbilityOperationFlow_016', 0, async (done: Function) => {
      const empty = new FlowGraph();
      const engine = new FlowEngine(empty);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.ABORTED);
      expect(engine.executed()).assertEqual(0);
      expect(empty.entry()).assertNull();
      done();
    });

    it('AbilityOperationFlow_017', 0, async (done: Function) => {
      const empty = new FlowGraph();
      expect(empty.size()).assertEqual(0);
      expect(empty.terminals()).assertEqual(0);
      expect(empty.failurePaths()).assertEqual(0);
      expect(empty.optionalNodes()).assertEqual(0);
      done();
    });

    it('AbilityOperationFlow_018', 0, async (done: Function) => {
      const trace = new FlowTrace();
      expect(trace.length()).assertEqual(0);
      expect(trace.allSucceeded()).assertFalse();
      trace.record(1, true);
      trace.record(2, false);
      expect(trace.length()).assertEqual(2);
      expect(trace.successCount()).assertEqual(1);
      expect(trace.failureCount()).assertEqual(1);
      done();
    });

    it('AbilityOperationFlow_019', 0, async (done: Function) => {
      const trace = new FlowTrace();
      trace.record(1, true).record(2, true);
      expect(trace.allSucceeded()).assertTrue();
      expect(trace.outcomeAt(0)).assertTrue();
      expect(trace.outcomeAt(1)).assertTrue();
      expect(trace.outcomeAt(5)).assertFalse();
      done();
    });

    it('AbilityOperationFlow_020', 0, async (done: Function) => {
      const trace = new FlowTrace();
      trace.record(1, true);
      trace.record(2, false);
      expect(trace.outcomeAt(-1)).assertFalse();
      expect(trace.visitedIds()[0]).assertEqual(1);
      expect(trace.visitedIds()[1]).assertEqual(2);
      done();
    });

    it('AbilityOperationFlow_021', 0, async (done: Function) => {
      const truePath = new FlowGraph();
      truePath.add(new FlowNode(0, FlowNodeKind.APP, 'a', -1, -1, false));
      const falsePath = new FlowGraph();
      falsePath.add(new FlowNode(0, FlowNodeKind.SERVICE, 'b', -1, -1, false));
      falsePath.add(new FlowNode(1, FlowNodeKind.EXIT, 'c', -1, -1, false));
      const branch = new FlowBranch(true, truePath, falsePath);
      expect(branch.selectedSize()).assertEqual(1);
      expect(branch.selected().countByKind(FlowNodeKind.APP)).assertEqual(1);
      expect(branch.describe()).assertEqual('cond=true,true=1,false=2');
      done();
    });

    it('AbilityOperationFlow_022', 0, async (done: Function) => {
      const truePath = new FlowGraph();
      truePath.add(new FlowNode(0, FlowNodeKind.APP, 'a', -1, -1, false));
      const falsePath = new FlowGraph();
      falsePath.add(new FlowNode(0, FlowNodeKind.SERVICE, 'b', -1, -1, false));
      const branch = new FlowBranch(false, truePath, falsePath);
      expect(branch.selectedSize()).assertEqual(1);
      expect(branch.selected().countByKind(FlowNodeKind.SERVICE)).assertEqual(1);
      expect(branch.selected().countByKind(FlowNodeKind.APP)).assertEqual(0);
      done();
    });

    it('AbilityOperationFlow_023', 0, async (done: Function) => {
      const metrics = new FlowMetrics(graph);
      expect(metrics.appNodes()).assertEqual(1);
      expect(metrics.serviceNodes()).assertEqual(2);
      expect(metrics.describe()).assertEqual('nodes=7,terminals=1');
      expect(metrics.isWellFormed()).assertTrue();
      done();
    });

    it('AbilityOperationFlow_024', 0, async (done: Function) => {
      const metrics = new FlowMetrics(graph);
      expect(metrics.averageDegree()).assertEqual(9 / 7);
      expect(metrics.describe()).assertEqual('nodes=7,terminals=1');
      done();
    });

    it('AbilityOperationFlow_025', 0, async (done: Function) => {
      const broken = new FlowGraph();
      broken.add(new FlowNode(0, FlowNodeKind.APP, 'a', 5, -1, false));
      const metrics = new FlowMetrics(broken);
      expect(metrics.isWellFormed()).assertFalse();
      done();
    });

    it('AbilityOperationFlow_026', 0, async (done: Function) => {
      const empty = new FlowGraph();
      const metrics = new FlowMetrics(empty);
      expect(metrics.averageDegree()).assertEqual(0);
      expect(metrics.isWellFormed()).assertFalse();
      expect(metrics.appNodes()).assertEqual(0);
      done();
    });

    it('AbilityOperationFlow_027', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(1).failAt(2);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      expect(engine.trace().failureCount()).assertEqual(1);
      expect(engine.executed()).assertEqual(4);
      done();
    });

    it('AbilityOperationFlow_028', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      engine.run();
      const first = engine.run();
      expect(first).assertEqual(FlowStatus.DONE);
      expect(engine.executed()).assertEqual(6);
      expect(engine.trace().length()).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_029', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(0);
      engine.run();
      expect(engine.current()).assertEqual(0);
      const rerun = new FlowEngine(graph);
      rerun.run();
      expect(rerun.current()).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_030', 0, async (done: Function) => {
      let edgeCount = 0;
      for (const node of graph.all()) {
        if (node.nextId >= 0) {
          edgeCount += 1;
        }
        if (node.failId >= 0) {
          edgeCount += 1;
        }
      }
      expect(edgeCount).assertEqual(9);
      done();
    });

    it('AbilityOperationFlow_031', 0, async (done: Function) => {
      let nextSum = 0;
      for (const node of graph.all()) {
        if (node.nextId >= 0) {
          nextSum += node.nextId;
        }
      }
      expect(nextSum).assertEqual(22);
      done();
    });

    it('AbilityOperationFlow_032', 0, async (done: Function) => {
      const kinds: FlowNodeKind[] = [];
      for (const node of graph.all()) {
        kinds.push(node.kind);
      }
      expect(kinds.length).assertEqual(7);
      expect(kinds[0]).assertEqual(FlowNodeKind.ENTRY);
      expect(kinds[6]).assertEqual(FlowNodeKind.EXIT);
      done();
    });

    it('AbilityOperationFlow_033', 0, async (done: Function) => {
      const names: string[] = [];
      for (const node of graph.all()) {
        names.push(node.name);
      }
      expect(names[0]).assertEqual('startAbility');
      expect(names[1]).assertEqual('startAbilityForResult');
      expect(names[5]).assertEqual('disconnectServiceExtensionAbility');
      expect(names[6]).assertEqual('finish');
      done();
    });

    it('AbilityOperationFlow_034', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(1);
      engine.run();
      const outcomes = engine.trace();
      expect(outcomes.outcomeAt(1)).assertFalse();
      expect(outcomes.outcomeAt(2)).assertTrue();
      expect(outcomes.successCount()).assertEqual(3);
      done();
    });

    it('AbilityOperationFlow_035', 0, async (done: Function) => {
      const optional = new FlowGraph();
      optional.add(new FlowNode(0, FlowNodeKind.APP, 'a', 1, -1, false));
      optional.add(new FlowNode(1, FlowNodeKind.SERVICE, 'b', -1, -1, true));
      const engine = new FlowEngine(optional).failAt(1);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      expect(engine.executed()).assertEqual(2);
      done();
    });

    it('AbilityOperationFlow_036', 0, async (done: Function) => {
      const optional = new FlowGraph();
      optional.add(new FlowNode(0, FlowNodeKind.APP, 'a', 1, -1, false));
      optional.add(new FlowNode(1, FlowNodeKind.SERVICE, 'b', 2, -1, false));
      optional.add(new FlowNode(2, FlowNodeKind.EXIT, 'end', -1, -1, false));
      const engine = new FlowEngine(optional).failAt(1);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.FAILED);
      expect(engine.executed()).assertEqual(2);
      done();
    });

    it('AbilityOperationFlow_037', 0, async (done: Function) => {
      const explicit = new FlowGraph();
      explicit.add(new FlowNode(0, FlowNodeKind.APP, 'a', 1, -1, false));
      explicit.add(new FlowNode(1, FlowNodeKind.SERVICE, 'b', 2, 3, false));
      explicit.add(new FlowNode(2, FlowNodeKind.EXIT, 'ok', -1, -1, false));
      explicit.add(new FlowNode(3, FlowNodeKind.EXIT, 'bad', -1, -1, false));
      const engine = new FlowEngine(explicit).failAt(1);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      const ids = engine.trace().visitedIds();
      expect(ids[ids.length - 1]).assertEqual(3);
      expect(engine.executed()).assertEqual(3);
      done();
    });

    it('AbilityOperationFlow_038', 0, async (done: Function) => {
      const selfLoop = new FlowGraph();
      selfLoop.add(new FlowNode(0, FlowNodeKind.APP, 'loop', 0, -1, false));
      const engine = new FlowEngine(selfLoop);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.ABORTED);
      expect(engine.executed()).assertEqual(100);
      done();
    });

    it('AbilityOperationFlow_039', 0, async (done: Function) => {
      const metrics = new FlowMetrics(graph);
      expect(metrics.isWellFormed()).assertTrue();
      expect(metrics.averageDegree()).assertLarger(1);
      expect(metrics.averageDegree()).assertLess(2);
      done();
    });

    it('AbilityOperationFlow_040', 0, async (done: Function) => {
      let terminalIds = 0;
      for (const node of graph.all()) {
        if (node.isTerminal()) {
          terminalIds += node.nodeId;
        }
      }
      expect(terminalIds).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_041', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(1).failAt(1);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      expect(engine.trace().failureCount()).assertEqual(1);
      done();
    });

    it('AbilityOperationFlow_042', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      engine.run();
      let ok = 0;
      for (let i = 0; i < engine.trace().length(); i++) {
        if (engine.trace().outcomeAt(i)) {
          ok += 1;
        }
      }
      expect(ok).assertEqual(6);
      expect(engine.trace().successCount()).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_043', 0, async (done: Function) => {
      const single = new FlowGraph();
      single.add(new FlowNode(0, FlowNodeKind.EXIT, 'only', -1, -1, false));
      const engine = new FlowEngine(single);
      expect(engine.run()).assertEqual(FlowStatus.DONE);
      expect(engine.executed()).assertEqual(1);
      expect(single.terminals()).assertEqual(1);
      done();
    });

    it('AbilityOperationFlow_044', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(4);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.FAILED);
      expect(engine.executed()).assertEqual(5);
      expect(engine.trace().visitedIds()[4]).assertEqual(4);
      done();
    });

    it('AbilityOperationFlow_045', 0, async (done: Function) => {
      const graph2 = new FlowGraph();
      graph2.add(new FlowNode(0, FlowNodeKind.ENTRY, 'a', 1, -1, false));
      graph2.add(new FlowNode(1, FlowNodeKind.APP, 'b', 2, -1, false));
      graph2.add(new FlowNode(2, FlowNodeKind.APP, 'c', 3, -1, false));
      graph2.add(new FlowNode(3, FlowNodeKind.EXIT, 'd', -1, -1, false));
      const metrics = new FlowMetrics(graph2);
      expect(metrics.appNodes()).assertEqual(2);
      expect(metrics.serviceNodes()).assertEqual(0);
      expect(graph2.terminals()).assertEqual(1);
      done();
    });

    it('AbilityOperationFlow_046', 0, async (done: Function) => {
      const graph2 = new FlowGraph();
      graph2.add(new FlowNode(0, FlowNodeKind.ENTRY, 'a', 1, -1, false));
      graph2.add(new FlowNode(1, FlowNodeKind.APP, 'b', 2, -1, false));
      graph2.add(new FlowNode(2, FlowNodeKind.APP, 'c', 3, -1, false));
      graph2.add(new FlowNode(3, FlowNodeKind.EXIT, 'd', -1, -1, false));
      const engine = new FlowEngine(graph2);
      expect(engine.run()).assertEqual(FlowStatus.DONE);
      expect(engine.executed()).assertEqual(4);
      expect(engine.trace().allSucceeded()).assertTrue();
      done();
    });

    it('AbilityOperationFlow_047', 0, async (done: Function) => {
      const parallel = new FlowGraph();
      parallel.add(new FlowNode(0, FlowNodeKind.ENTRY, 'a', 1, -1, false));
      parallel.add(new FlowNode(1, FlowNodeKind.SERVICE, 'b', -1, -1, false));
      const engine = new FlowEngine(parallel);
      expect(engine.run()).assertEqual(FlowStatus.DONE);
      expect(engine.executed()).assertEqual(2);
      expect(parallel.failurePaths()).assertEqual(0);
      done();
    });

    it('AbilityOperationFlow_048', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      engine.run();
      const visited = engine.trace().visitedIds();
      let unique = true;
      for (let i = 0; i < visited.length; i++) {
        for (let j = i + 1; j < visited.length; j++) {
          if (visited[i] === visited[j]) {
            unique = false;
          }
        }
      }
      expect(unique).assertTrue();
      done();
    });

    it('AbilityOperationFlow_049', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(3);
      engine.run();
      const visited = engine.trace().visitedIds();
      expect(visited.length).assertEqual(6);
      expect(visited[3]).assertEqual(3);
      expect(visited[4]).assertEqual(5);
      expect(visited[5]).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_050', 0, async (done: Function) => {
      const graph2 = new FlowGraph();
      graph2.add(new FlowNode(0, FlowNodeKind.ENTRY, 'a', 1, -1, false));
      graph2.add(new FlowNode(1, FlowNodeKind.EXIT, 'end', -1, -1, false));
      const branch = new FlowBranch(true, graph2, graph);
      expect(branch.selectedSize()).assertEqual(2);
      expect(branch.selected().countByKind(FlowNodeKind.EXIT)).assertEqual(1);
      expect(branch.describe()).assertEqual('cond=true,true=2,false=7');
      done();
    });

    it('AbilityOperationFlow_051', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      engine.run();
      let firstId = -1;
      let lastId = -1;
      const ids = engine.trace().visitedIds();
      if (ids.length > 0) {
        firstId = ids[0];
        lastId = ids[ids.length - 1];
      }
      expect(firstId).assertEqual(0);
      expect(lastId).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_052', 0, async (done: Function) => {
      const metrics = new FlowMetrics(graph);
      expect(metrics.appNodes() + metrics.serviceNodes()).assertEqual(3);
      expect(graph.optionalNodes()).assertEqual(0);
      expect(graph.failurePaths()).assertLess(graph.size());
      done();
    });

    it('AbilityOperationFlow_053', 0, async (done: Function) => {
      const engine = new FlowEngine(graph).failAt(5);
      const status = engine.run();
      expect(status).assertEqual(FlowStatus.DONE);
      expect(engine.trace().failureCount()).assertEqual(0);
      expect(engine.trace().successCount()).assertEqual(6);
      done();
    });

    it('AbilityOperationFlow_054', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      engine.run();
      let ok = 0;
      let failed = 0;
      for (const outcome of [true, false, true]) {
        if (outcome) {
          ok += 1;
        } else {
          failed += 1;
        }
      }
      expect(ok).assertEqual(2);
      expect(failed).assertEqual(1);
      expect(engine.trace().failureCount()).assertEqual(0);
      done();
    });

    it('AbilityOperationFlow_055', 0, async (done: Function) => {
      const engine = new FlowEngine(graph);
      engine.run();
      const metrics = new FlowMetrics(graph);
      expect(metrics.describe()).assertEqual('nodes=7,terminals=1');
      expect(engine.executed()).assertEqual(graph.size() - 1);
      expect(graph.failurePaths()).assertEqual(3);
      done();
    });
  });
}




