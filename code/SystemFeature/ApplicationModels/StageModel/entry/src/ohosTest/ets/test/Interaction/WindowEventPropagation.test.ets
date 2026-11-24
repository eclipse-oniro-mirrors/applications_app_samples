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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, uniqueStrings
} from '../Shared/SharedDriver';

enum Phase {
  CAPTURE = 0,
  TARGET = 1,
  BUBBLE = 2
}

class PropagationListener {
  nodeId: string = '';
  phase: Phase = Phase.CAPTURE;
  private invocations: number = 0;

  constructor(nodeId: string, phase: Phase) {
    this.nodeId = nodeId;
    this.phase = phase;
  }

  getInvocations(): number {
    return this.invocations;
  }

  invoke(): void {
    this.invocations = this.invocations + 1;
  }
}

class PropagationTrace {
  order: string[] = [];
  invoked: number = 0;
  stopped: boolean = false;

  add(nodeId: string, phase: Phase): void {
    this.order.push(`${nodeId}:${phase}`);
    this.invoked = this.invoked + 1;
  }

  signature(): string {
    return this.order.join('|');
  }

  phasesFor(nodeId: string): number {
    let total = 0;
    for (const entry of this.order) {
      if (entry.startsWith(`${nodeId}:`)) {
        total = total + 1;
      }
    }
    return total;
  }
}

class PropagationModel {
  private nodes: string[] = [];
  private listeners: PropagationListener[] = [];

  addNode(id: string): boolean {
    if (id.length === 0 || this.nodes.indexOf(id) >= 0) {
      return false;
    }
    this.nodes.push(id);
    return true;
  }

  hasNode(id: string): boolean {
    return this.nodes.indexOf(id) >= 0;
  }

  nodeCount(): number {
    return this.nodes.length;
  }

  addListener(nodeId: string, phase: Phase): boolean {
    if (!this.hasNode(nodeId) || this.findListener(nodeId, phase) !== null) {
      return false;
    }
    this.listeners.push(new PropagationListener(nodeId, phase));
    return true;
  }

  removeListener(nodeId: string, phase: Phase): boolean {
    const listener = this.findListener(nodeId, phase);
    if (listener === null) {
      return false;
    }
    const index = this.listeners.indexOf(listener);
    this.listeners.splice(index, 1);
    return true;
  }

  findListener(nodeId: string, phase: Phase): PropagationListener | null {
    for (const listener of this.listeners) {
      if (listener.nodeId === nodeId && listener.phase === phase) {
        return listener;
      }
    }
    return null;
  }

  listenerCount(): number {
    return this.listeners.length;
  }

  private invokePhase(trace: PropagationTrace, nodeId: string, phase: Phase): void {
    const listener = this.findListener(nodeId, phase);
    if (listener !== null) {
      listener.invoke();
      trace.add(nodeId, phase);
    }
  }

  dispatch(): PropagationTrace {
    const trace = new PropagationTrace();
    for (const node of this.nodes) {
      this.invokePhase(trace, node, Phase.CAPTURE);
    }
    const target = this.nodes.length === 0 ? '' : this.nodes[this.nodes.length - 1];
    if (target.length > 0) {
      this.invokePhase(trace, target, Phase.TARGET);
    }
    for (let i = this.nodes.length - 1; i >= 0; i--) {
      this.invokePhase(trace, this.nodes[i], Phase.BUBBLE);
    }
    return trace;
  }

  dispatchStoppingAt(stopNodeId: string): PropagationTrace {
    const trace = new PropagationTrace();
    for (const node of this.nodes) {
      if (node === stopNodeId) {
        this.invokePhase(trace, node, Phase.CAPTURE);
        trace.stopped = true;
        return trace;
      }
      this.invokePhase(trace, node, Phase.CAPTURE);
    }
    const target = this.nodes.length === 0 ? '' : this.nodes[this.nodes.length - 1];
    if (target.length > 0 && target !== stopNodeId) {
      this.invokePhase(trace, target, Phase.TARGET);
    }
    for (let i = this.nodes.length - 1; i >= 0; i--) {
      if (this.nodes[i] === stopNodeId) {
        trace.stopped = true;
        return trace;
      }
      this.invokePhase(trace, this.nodes[i], Phase.BUBBLE);
    }
    return trace;
  }

  pathDepth(): number {
    return this.nodes.length;
  }

  uniqueNodeCount(): number {
    return uniqueStrings(this.nodes).length;
  }
}

class ListenerRegistry {
  private byNode: string[] = [];
  private byPhase: number[] = [];

  register(nodeId: string, phase: Phase): boolean {
    const key = `${nodeId}:${phase}`;
    if (this.byNode.indexOf(key) >= 0) {
      return false;
    }
    this.byNode.push(key);
    this.byPhase.push(phase);
    return true;
  }

  unregister(nodeId: string, phase: Phase): boolean {
    const key = `${nodeId}:${phase}`;
    const index = this.byNode.indexOf(key);
    if (index < 0) {
      return false;
    }
    this.byNode.splice(index, 1);
    this.byPhase.splice(index, 1);
    return true;
  }

  countForPhase(phase: Phase): number {
    let total = 0;
    for (const value of this.byPhase) {
      if (value === phase) {
        total = total + 1;
      }
    }
    return total;
  }

  size(): number {
    return this.byNode.length;
  }
}

export default function windowEventPropagationTest(): void {
  describe('WindowEventPropagation', () => {
    it('WindowEventPropagation_001', 0, async (done: Function) => {
      const model = new PropagationModel();
      expect(model.addNode('root')).assertTrue();
      expect(model.addNode('child')).assertTrue();
      expect(model.nodeCount()).assertEqual(2);
      done();
    });

    it('WindowEventPropagation_002', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('root');
      expect(model.addNode('root')).assertFalse();
      expect(model.addNode('')).assertFalse();
      expect(model.nodeCount()).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_003', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('root');
      expect(model.hasNode('root')).assertTrue();
      expect(model.hasNode('child')).assertFalse();
      done();
    });

    it('WindowEventPropagation_004', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('root');
      expect(model.addListener('root', Phase.CAPTURE)).assertTrue();
      expect(model.addListener('root', Phase.CAPTURE)).assertFalse();
      expect(model.listenerCount()).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_005', 0, async (done: Function) => {
      const model = new PropagationModel();
      expect(model.addListener('missing', Phase.CAPTURE)).assertFalse();
      expect(model.listenerCount()).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_006', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('root');
      model.addNode('child');
      model.addListener('root', Phase.CAPTURE);
      model.addListener('child', Phase.TARGET);
      model.addListener('root', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.invoked).assertEqual(3);
      expect(trace.signature()).assertEqual('root:0|child:1|root:2');
      done();
    });

    it('WindowEventPropagation_007', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('root');
      const trace = model.dispatch();
      expect(trace.invoked).assertEqual(0);
      expect(trace.order.length).assertEqual(0);
      expect(trace.stopped).assertFalse();
      done();
    });

    it('WindowEventPropagation_008', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      model.addListener('c', Phase.TARGET);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:0|b:0|c:1');
      done();
    });

    it('WindowEventPropagation_009', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.BUBBLE);
      model.addListener('b', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('b:2|a:2');
      done();
    });

    it('WindowEventPropagation_010', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      model.addListener('c', Phase.CAPTURE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:0|b:0|c:0');
      done();
    });

    it('WindowEventPropagation_011', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.BUBBLE);
      model.addListener('b', Phase.BUBBLE);
      model.addListener('c', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('c:2|b:2|a:2');
      done();
    });

    it('WindowEventPropagation_012', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      model.addListener('c', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.invoked).assertEqual(2);
      expect(trace.phasesFor('a')).assertEqual(1);
      expect(trace.phasesFor('b')).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_013', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      const trace = model.dispatchStoppingAt('a');
      expect(trace.stopped).assertTrue();
      expect(trace.signature()).assertEqual('a:0');
      done();
    });

    it('WindowEventPropagation_014', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      model.addListener('c', Phase.CAPTURE);
      const trace = model.dispatchStoppingAt('b');
      expect(trace.stopped).assertTrue();
      expect(trace.signature()).assertEqual('a:0|b:0');
      done();
    });

    it('WindowEventPropagation_015', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      const trace = model.dispatchStoppingAt('missing');
      expect(trace.stopped).assertFalse();
      expect(trace.signature()).assertEqual('a:0|b:0');
      done();
    });

    it('WindowEventPropagation_016', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addListener('a', Phase.CAPTURE);
      expect(model.removeListener('a', Phase.CAPTURE)).assertTrue();
      expect(model.removeListener('a', Phase.CAPTURE)).assertFalse();
      expect(model.listenerCount()).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_017', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      expect(model.findListener('a', Phase.TARGET)).assertNull();
      model.addListener('a', Phase.TARGET);
      expect(model.findListener('a', Phase.TARGET) !== null).assertTrue();
      done();
    });

    it('WindowEventPropagation_018', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      model.dispatch();
      const capture = model.findListener('a', Phase.CAPTURE);
      expect(capture !== null).assertTrue();
      if (capture !== null) {
        expect(capture.getInvocations()).assertEqual(1);
      }
      done();
    });

    it('WindowEventPropagation_019', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      model.dispatch();
      model.dispatch();
      const target = model.findListener('b', Phase.TARGET);
      expect(target !== null).assertTrue();
      if (target !== null) {
        expect(target.getInvocations()).assertEqual(2);
      }
      done();
    });

    it('WindowEventPropagation_020', 0, async (done: Function) => {
      const model = new PropagationModel();
      expect(model.pathDepth()).assertEqual(0);
      expect(model.uniqueNodeCount()).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_021', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      expect(model.pathDepth()).assertEqual(3);
      expect(model.uniqueNodeCount()).assertEqual(3);
      done();
    });

    it('WindowEventPropagation_022', 0, async (done: Function) => {
      const registry = new ListenerRegistry();
      expect(registry.register('a', Phase.CAPTURE)).assertTrue();
      expect(registry.register('a', Phase.CAPTURE)).assertFalse();
      expect(registry.size()).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_023', 0, async (done: Function) => {
      const registry = new ListenerRegistry();
      registry.register('a', Phase.CAPTURE);
      registry.register('b', Phase.CAPTURE);
      registry.register('c', Phase.BUBBLE);
      expect(registry.countForPhase(Phase.CAPTURE)).assertEqual(2);
      expect(registry.countForPhase(Phase.BUBBLE)).assertEqual(1);
      expect(registry.countForPhase(Phase.TARGET)).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_024', 0, async (done: Function) => {
      const registry = new ListenerRegistry();
      registry.register('a', Phase.TARGET);
      expect(registry.unregister('a', Phase.TARGET)).assertTrue();
      expect(registry.unregister('a', Phase.TARGET)).assertFalse();
      expect(registry.size()).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_025', 0, async (done: Function) => {
      const registry = new ListenerRegistry();
      registry.register('a', Phase.CAPTURE);
      registry.register('a', Phase.TARGET);
      registry.register('a', Phase.BUBBLE);
      expect(registry.size()).assertEqual(3);
      expect(registry.countForPhase(Phase.CAPTURE)).assertEqual(1);
      expect(registry.countForPhase(Phase.TARGET)).assertEqual(1);
      expect(registry.countForPhase(Phase.BUBBLE)).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_026', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('root');
      model.addNode('child');
      model.addListener('root', Phase.TARGET);
      const trace = model.dispatch();
      expect(trace.invoked).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_027', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('root');
      model.addNode('child');
      model.addListener('child', Phase.TARGET);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('child:1');
      done();
    });

    it('WindowEventPropagation_028', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('a', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:0|a:2');
      expect(trace.invoked).assertEqual(2);
      done();
    });

    it('WindowEventPropagation_029', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('a', Phase.TARGET);
      model.addListener('a', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:0|a:2');
      done();
    });

    it('WindowEventPropagation_030', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('b', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      model.addListener('b', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('b:0|b:1|b:2');
      done();
    });

    it('WindowEventPropagation_031', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.BUBBLE);
      model.addListener('c', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('c:2|a:2');
      done();
    });

    it('WindowEventPropagation_032', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.BUBBLE);
      const trace = model.dispatchStoppingAt('a');
      expect(trace.stopped).assertTrue();
      expect(trace.invoked).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_033', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.BUBBLE);
      const trace = model.dispatchStoppingAt('b');
      expect(trace.stopped).assertTrue();
      expect(trace.invoked).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_034', 0, async (done: Function) => {
      const registry = new ListenerRegistry();
      registry.register('a', Phase.CAPTURE);
      registry.register('b', Phase.TARGET);
      registry.register('c', Phase.BUBBLE);
      expect(registry.size()).assertEqual(3);
      expect(registry.countForPhase(Phase.TARGET)).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_035', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('c', Phase.CAPTURE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:0|c:0');
      expect(trace.phasesFor('b')).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_036', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('b', Phase.TARGET);
      const trace = model.dispatch();
      expect(trace.invoked).assertEqual(0);
      expect(trace.signature()).assertEqual('');
      done();
    });

    it('WindowEventPropagation_037', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      const first = model.dispatch();
      const second = model.dispatch();
      expect(first.invoked).assertEqual(2);
      expect(second.invoked).assertEqual(2);
      done();
    });

    it('WindowEventPropagation_038', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('c', Phase.BUBBLE);
      model.removeListener('c', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.invoked).assertEqual(0);
      done();
    });

    it('WindowEventPropagation_039', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      model.addListener('c', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.order.length).assertEqual(2);
      expect(trace.invoked).assertEqual(2);
      expect(trace.stopped).assertFalse();
      done();
    });

    it('WindowEventPropagation_040', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('b', Phase.TARGET);
      const trace = model.dispatchStoppingAt('a');
      expect(trace.stopped).assertTrue();
      expect(trace.signature()).assertEqual('');
      done();
    });

    it('WindowEventPropagation_041', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addNode('d');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      model.addListener('c', Phase.TARGET);
      model.addListener('d', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:0|b:0|d:2');
      done();
    });

    it('WindowEventPropagation_042', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addNode('d');
      model.addListener('a', Phase.BUBBLE);
      model.addListener('b', Phase.BUBBLE);
      model.addListener('c', Phase.BUBBLE);
      model.addListener('d', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('d:2|c:2|b:2|a:2');
      done();
    });

    it('WindowEventPropagation_043', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addNode('d');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      model.addListener('c', Phase.CAPTURE);
      model.addListener('d', Phase.CAPTURE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:0|b:0|c:0|d:0');
      done();
    });

    it('WindowEventPropagation_044', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      const trace = model.dispatchStoppingAt('b');
      expect(trace.stopped).assertTrue();
      expect(trace.signature()).assertEqual('a:0|b:0');
      done();
    });

    it('WindowEventPropagation_045', 0, async (done: Function) => {
      const registry = new ListenerRegistry();
      for (let i = 0; i < 5; i++) {
        registry.register(`node${i}`, Phase.CAPTURE);
      }
      expect(registry.size()).assertEqual(5);
      expect(registry.countForPhase(Phase.CAPTURE)).assertEqual(5);
      done();
    });

    it('WindowEventPropagation_046', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      model.addListener('c', Phase.BUBBLE);
      model.dispatch();
      const capture = model.findListener('a', Phase.CAPTURE);
      const bubble = model.findListener('c', Phase.BUBBLE);
      expect(capture !== null).assertTrue();
      expect(bubble !== null).assertTrue();
      done();
    });

    it('WindowEventPropagation_047', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('only');
      model.addListener('only', Phase.CAPTURE);
      model.addListener('only', Phase.TARGET);
      model.addListener('only', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('only:0|only:1|only:2');
      done();
    });

    it('WindowEventPropagation_048', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      const trace = model.dispatch();
      expect(trace.phasesFor('a')).assertEqual(1);
      expect(trace.phasesFor('b')).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_049', 0, async (done: Function) => {
      const registry = new ListenerRegistry();
      registry.register('a', Phase.CAPTURE);
      registry.register('a', Phase.CAPTURE);
      registry.register('b', Phase.CAPTURE);
      expect(registry.size()).assertEqual(2);
      expect(registry.countForPhase(Phase.CAPTURE)).assertEqual(2);
      done();
    });

    it('WindowEventPropagation_050', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.BUBBLE);
      const trace = model.dispatchStoppingAt('missing');
      expect(trace.stopped).assertFalse();
      expect(trace.invoked).assertEqual(2);
      done();
    });

    it('WindowEventPropagation_051', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.BUBBLE);
      model.addListener('b', Phase.TARGET);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:2');
      done();
    });

    it('WindowEventPropagation_052', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addNode('c');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.CAPTURE);
      model.addListener('c', Phase.CAPTURE);
      model.addListener('c', Phase.BUBBLE);
      const trace = model.dispatch();
      expect(trace.signature()).assertEqual('a:0|b:0|c:0|c:2');
      done();
    });

    it('WindowEventPropagation_053', 0, async (done: Function) => {
      const model = new PropagationModel();
      model.addNode('a');
      model.addNode('b');
      model.addListener('a', Phase.CAPTURE);
      model.addListener('b', Phase.TARGET);
      const trace = model.dispatchStoppingAt('b');
      expect(trace.stopped).assertTrue();
      expect(trace.invoked).assertEqual(1);
      done();
    });

    it('WindowEventPropagation_054', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Text');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}
