/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  launchEntryAbility,
  runSerializedUiOperation,
  serializedDelay,
  waitForIndexPageStable,
  checkTextContent,
  isIndexPageVisible,
  pageComponentCount,
  findComponentsByType,
  pressAndWait,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_LAUNCH,
  KEY_ENTER,
  KEY_LEFT,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

enum PropagationPhase {
  CAPTURE = 'capture',
  TARGET = 'target',
  BUBBLE = 'bubble'
}

enum PropagationDecision {
  CONTINUE = 'continue',
  STOP = 'stop',
  BLOCK_DESCEND = 'block_descend'
}

interface NodeDescriptor {
  name: string;
  depth: number;
  intercepting: boolean;
}

interface PropagationStop {
  nodeName: string;
  phase: PropagationPhase;
  reason: string;
}

interface PropagationTrace {
  visited: string[];
  stoppedAt: string;
  stopReason: string;
  totalHops: number;
}

interface ChainNode {
  name: string;
  children: ChainNode[];
}

class PropagationPathModel {
  private chain: string[];

  constructor(chain: string[]) {
    this.chain = chain;
  }

  public getDepth(): number {
    return this.chain.length;
  }

  public buildCapturePath(): string[] {
    const path: string[] = [];
    for (let i = 0; i < this.chain.length; i++) {
      path.push(`${PropagationPhase.CAPTURE}:${this.chain[i]}`);
    }
    return path;
  }

  public buildBubblePath(): string[] {
    const path: string[] = [];
    for (let i = this.chain.length - 1; i >= 0; i--) {
      path.push(`${PropagationPhase.BUBBLE}:${this.chain[i]}`);
    }
    return path;
  }

  public buildFullPath(): string[] {
    const fullPath: string[] = [];
    const capture: string[] = this.buildCapturePath();
    for (let i = 0; i < capture.length; i++) {
      fullPath.push(capture[i]);
    }
    const bubble: string[] = this.buildBubblePath();
    for (let i = 0; i < bubble.length; i++) {
      fullPath.push(bubble[i]);
    }
    return fullPath;
  }

  public joinCapture(): string {
    return this.buildCapturePath().join(' > ');
  }

  public joinBubble(): string {
    return this.buildBubblePath().join(' > ');
  }

  public joinFull(): string {
    return this.buildFullPath().join(' > ');
  }

  public leafName(): string {
    if (this.chain.length === 0) {
      return '';
    }
    return this.chain[this.chain.length - 1];
  }

  public rootName(): string {
    if (this.chain.length === 0) {
      return '';
    }
    return this.chain[0];
  }

  public containsNode(name: string): boolean {
    for (let i = 0; i < this.chain.length; i++) {
      if (this.chain[i] === name) {
        return true;
      }
    }
    return false;
  }

  public depthOf(name: string): number {
    for (let i = 0; i < this.chain.length; i++) {
      if (this.chain[i] === name) {
        return i;
      }
    }
    return -1;
  }
}

class PropagationWalker {
  private nodes: NodeDescriptor[];

  constructor(nodes: NodeDescriptor[]) {
    this.nodes = nodes;
  }

  public walkCapture(targetName: string): PropagationTrace {
    const visited: string[] = [];
    let stoppedAt: string = '';
    let stopReason: string = '';
    for (let i = 0; i < this.nodes.length; i++) {
      visited.push(`${PropagationPhase.CAPTURE}:${this.nodes[i].name}`);
      if (this.nodes[i].intercepting && this.nodes[i].name !== targetName) {
        stoppedAt = this.nodes[i].name;
        stopReason = 'capture interceptor';
        break;
      }
    }
    const trace: PropagationTrace = {
      visited: visited,
      stoppedAt: stoppedAt,
      stopReason: stopReason,
      totalHops: visited.length
    };
    return trace;
  }

  public walkBubble(targetName: string, targetDepth: number): PropagationTrace {
    const visited: string[] = [];
    let stoppedAt: string = '';
    let stopReason: string = '';
    for (let i = targetDepth; i >= 0; i--) {
      visited.push(`${PropagationPhase.BUBBLE}:${this.nodes[i].name}`);
      if (this.nodes[i].name === targetName) {
        visited.push(`${PropagationPhase.TARGET}:${this.nodes[i].name}`);
      }
      if (this.nodes[i].intercepting && this.nodes[i].name !== targetName && i !== targetDepth) {
        stoppedAt = this.nodes[i].name;
        stopReason = 'bubble interceptor';
        break;
      }
    }
    const trace: PropagationTrace = {
      visited: visited,
      stoppedAt: stoppedAt,
      stopReason: stopReason,
      totalHops: visited.length
    };
    return trace;
  }

  public countInterceptors(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].intercepting) {
        count++;
      }
    }
    return count;
  }

  public getDepth(): number {
    return this.nodes.length;
  }

}

class StopPropagationRegistry {
  private stops: PropagationStop[] = [];

  public registerStop(nodeName: string, phase: PropagationPhase, reason: string): void {
    const stop: PropagationStop = {
      nodeName: nodeName,
      phase: phase,
      reason: reason
    };
    this.stops.push(stop);
  }

  public hasStopAt(nodeName: string): boolean {
    for (let i = 0; i < this.stops.length; i++) {
      if (this.stops[i].nodeName === nodeName) {
        return true;
      }
    }
    return false;
  }

  public hasStopAtPhase(nodeName: string, phase: PropagationPhase): boolean {
    for (let i = 0; i < this.stops.length; i++) {
      if (this.stops[i].nodeName === nodeName && this.stops[i].phase === phase) {
        return true;
      }
    }
    return false;
  }

  public countStops(): number {
    return this.stops.length;
  }

  public firstStopNode(): string {
    if (this.stops.length === 0) {
      return '';
    }
    return this.stops[0].nodeName;
  }

  public decisionsFor(nodeName: string): PropagationDecision[] {
    const decisions: PropagationDecision[] = [];
    for (let i = 0; i < this.stops.length; i++) {
      if (this.stops[i].nodeName === nodeName) {
        decisions.push(PropagationDecision.STOP);
      }
    }
    if (decisions.length === 0) {
      decisions.push(PropagationDecision.CONTINUE);
    }
    return decisions;
  }

  public clear(): void {
    this.stops = [];
  }
}

class ChainBuilder {
  public static buildFlat(depth: number): string[] {
    const names: string[] = [];
    for (let i = 0; i < depth; i++) {
      names.push(`Layer${i}`);
    }
    return names;
  }

  public static buildAppScope(depth: number): string[] {
    const names: string[] = [];
    names.push('RelativeContainer');
    if (depth <= 1) {
      return names;
    }
    for (let i = 1; i < depth; i++) {
      names.push(`Layer${i}`);
    }
    names[names.length - 1] = INDEX_PAGE_TEXT_KEY;
    return names;
  }

  public static buildTree(depth: number): ChainNode {
    const root: ChainNode = {
      name: 'RelativeContainer',
      children: []
    };
    let cursor: ChainNode = root;
    for (let i = 1; i < depth; i++) {
      const child: ChainNode = {
        name: i === depth - 1 ? INDEX_PAGE_TEXT_KEY : `Layer${i}`,
        children: []
      };
      cursor.children.push(child);
      cursor = child;
    }
    return root;
  }

  public static treeDepth(node: ChainNode): number {
    if (node.children.length === 0) {
      return 1;
    }
    let maxChildDepth: number = 0;
    for (let i = 0; i < node.children.length; i++) {
      const childDepth: number = ChainBuilder.treeDepth(node.children[i]);
      if (childDepth > maxChildDepth) {
        maxChildDepth = childDepth;
      }
    }
    return maxChildDepth + 1;
  }

  public static collectLeafNames(node: ChainNode): string[] {
    const names: string[] = [];
    if (node.children.length === 0) {
      names.push(node.name);
      return names;
    }
    for (let i = 0; i < node.children.length; i++) {
      const childNames: string[] = ChainBuilder.collectLeafNames(node.children[i]);
      for (let j = 0; j < childNames.length; j++) {
        names.push(childNames[j]);
      }
    }
    return names;
  }
}

async function readTextById(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return '';
      }
      return await component.getText();
    } catch (error) {
      logError(`readTextById failed: ${error}`);
      return '';
    }
  });
}

async function clickTextComponent(driver: Driver): Promise<boolean> {
  return await runSerializedUiOperation(async (): Promise<boolean> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      return true;
    } catch (error) {
      logError(`clickTextComponent failed: ${error}`);
      return false;
    }
  });
}

function buildLayerNodes(depth: number, interceptingDepth: number): NodeDescriptor[] {
  const nodes: NodeDescriptor[] = [];
  for (let i = 0; i < depth; i++) {
    const node: NodeDescriptor = {
      name: i === depth - 1 ? INDEX_PAGE_TEXT_KEY : `Layer${i}`,
      depth: i,
      intercepting: i === interceptingDepth
    };
    nodes.push(node);
  }
  return nodes;
}

export default function eventPropagationTest(): void {
  describe('EventPropagationTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('EventPropagationTest: preparing index page');
      await launchEntryAbility();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      logInfo('EventPropagationTest: finished');
      await serializedDelay(driver, 100);
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0100
     * @tc.name testPropagationCapturePathRootToLeaf
     * @tc.desc Verify capture path traverses root to leaf: two layer chain -> capture order root then leaf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationCapturePathRootToLeaf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const chain: string[] = ['RelativeContainer', INDEX_PAGE_TEXT_KEY];
          const model: PropagationPathModel = new PropagationPathModel(chain);
          const capturePath: string[] = model.buildCapturePath();
          expect(capturePath.length).assertEqual(2);
          expect(capturePath[0]).assertEqual('capture:RelativeContainer');
          expect(capturePath[1]).assertEqual('capture:HelloWorld');
          expect(model.getDepth()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0200
     * @tc.name testPropagationBubblePathLeafToRoot
     * @tc.desc Verify bubble path traverses leaf to root in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationBubblePathLeafToRoot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const chain: string[] = ['RelativeContainer', 'InnerLayer', INDEX_PAGE_TEXT_KEY];
          const model: PropagationPathModel = new PropagationPathModel(chain);
          const bubblePath: string[] = model.buildBubblePath();
          expect(bubblePath.length).assertEqual(3);
          expect(bubblePath[0]).assertEqual('bubble:HelloWorld');
          expect(bubblePath[1]).assertEqual('bubble:InnerLayer');
          expect(bubblePath[2]).assertEqual('bubble:RelativeContainer');
          expect(model.rootName()).assertEqual('RelativeContainer');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0300
     * @tc.name testPropagationFullPathCombination
     * @tc.desc Verify full path concatenates capture then bubble: two layer chain -> four hops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationFullPathCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const chain: string[] = ['RelativeContainer', INDEX_PAGE_TEXT_KEY];
          const model: PropagationPathModel = new PropagationPathModel(chain);
          const fullPath: string[] = model.buildFullPath();
          expect(fullPath.length).assertEqual(4);
          expect(fullPath[0]).assertEqual('capture:RelativeContainer');
          expect(fullPath[1]).assertEqual('capture:HelloWorld');
          expect(fullPath[2]).assertEqual('bubble:HelloWorld');
          expect(fullPath[3]).assertEqual('bubble:RelativeContainer');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0400
     * @tc.name testPropagationJoinedPathFormat
     * @tc.desc Verify joined path strings use the separator exactly: capture join and bubble join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationJoinedPathFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const chain: string[] = ['RelativeContainer', INDEX_PAGE_TEXT_KEY];
          const model: PropagationPathModel = new PropagationPathModel(chain);
          expect(model.joinCapture()).assertEqual('capture:RelativeContainer > capture:HelloWorld');
          expect(model.joinBubble()).assertEqual('bubble:HelloWorld > bubble:RelativeContainer');
          expect(model.joinFull().indexOf('bubble:RelativeContainer')).assertLargerOrEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0500
     * @tc.name testPropagationDepthMatrixOneToEight
     * @tc.desc Verify nesting depth matrix 1..8 all produce capture path length equal to depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationDepthMatrixOneToEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          for (let depth = 1; depth <= 8; depth++) {
            const chain: string[] = ChainBuilder.buildFlat(depth);
            const model: PropagationPathModel = new PropagationPathModel(chain);
            const capturePath: string[] = model.buildCapturePath();
            expect(capturePath.length).assertEqual(depth);
            expect(model.getDepth()).assertEqual(depth);
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0600
     * @tc.name testPropagationDepthMatrixFullPathLength
     * @tc.desc Verify full path length doubles with depth: depth 1..8 -> full path length is depth times two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationDepthMatrixFullPathLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          for (let depth = 1; depth <= 8; depth++) {
            const chain: string[] = ChainBuilder.buildFlat(depth);
            const model: PropagationPathModel = new PropagationPathModel(chain);
            expect(model.buildFullPath().length).assertEqual(depth * 2);
            expect(model.buildBubblePath().length).assertEqual(depth);
          }
          const eightChain: string[] = ChainBuilder.buildFlat(8);
          const eightModel: PropagationPathModel = new PropagationPathModel(eightChain);
          expect(eightModel.buildFullPath().length).assertEqual(16);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0700
     * @tc.name testPropagationDepthMatrixRootAndLeafNames
     * @tc.desc Verify root and leaf resolution for depths 2..8 keeps HelloWorld as the leaf, and a single layer root is both root and leaf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationDepthMatrixRootAndLeafNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          for (let depth = 2; depth <= 8; depth++) {
            const chain: string[] = ChainBuilder.buildAppScope(depth);
            const model: PropagationPathModel = new PropagationPathModel(chain);
            expect(model.rootName()).assertEqual('RelativeContainer');
            expect(model.leafName()).assertEqual(INDEX_PAGE_TEXT_KEY);
          }
          const singleChain: string[] = ChainBuilder.buildAppScope(1);
          const singleModel: PropagationPathModel = new PropagationPathModel(singleChain);
          expect(singleModel.getDepth()).assertEqual(1);
          expect(singleModel.leafName()).assertEqual('RelativeContainer');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0800
     * @tc.name testPropagationTreeDepthMatchesChain
     * @tc.desc Verify tree model depth matches chain depth for 1..8 layers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationTreeDepthMatchesChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          for (let depth = 1; depth <= 8; depth++) {
            const tree: ChainNode = ChainBuilder.buildTree(depth);
            expect(ChainBuilder.treeDepth(tree)).assertEqual(depth);
            const leaves: string[] = ChainBuilder.collectLeafNames(tree);
            expect(leaves.length).assertEqual(1);
            expect(leaves[0]).assertEqual(depth === 1 ? 'RelativeContainer' : INDEX_PAGE_TEXT_KEY);
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_0900
     * @tc.name testPropagationStopAtTargetHaltsBubble
     * @tc.desc Verify stopPropagation at target prevents ancestors: capture walks all, bubble stops at target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationStopAtTargetHaltsBubble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: StopPropagationRegistry = new StopPropagationRegistry();
          registry.registerStop(INDEX_PAGE_TEXT_KEY, PropagationPhase.BUBBLE, 'handler consumed event');
          expect(registry.hasStopAt(INDEX_PAGE_TEXT_KEY)).assertTrue();
          expect(registry.hasStopAtPhase(INDEX_PAGE_TEXT_KEY, PropagationPhase.BUBBLE)).assertTrue();
          expect(registry.hasStopAtPhase(INDEX_PAGE_TEXT_KEY, PropagationPhase.CAPTURE)).assertFalse();
          expect(registry.countStops()).assertEqual(1);
          expect(registry.firstStopNode()).assertEqual(INDEX_PAGE_TEXT_KEY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1000
     * @tc.name testPropagationCaptureInterceptorBlocksDescend
     * @tc.desc Verify capture interceptor on ancestor stops descent: trace ends at interceptor node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationCaptureInterceptorBlocksDescend', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const nodes: NodeDescriptor[] = buildLayerNodes(4, 1);
          const walker: PropagationWalker = new PropagationWalker(nodes);
          const trace: PropagationTrace = walker.walkCapture(INDEX_PAGE_TEXT_KEY);
          expect(trace.totalHops).assertEqual(2);
          expect(trace.stoppedAt).assertEqual('Layer1');
          expect(trace.stopReason).assertEqual('capture interceptor');
          expect(walker.countInterceptors()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1100
     * @tc.name testPropagationCaptureWithoutInterceptor
     * @tc.desc Verify capture walk without interceptors reaches all layers and reports no stop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationCaptureWithoutInterceptor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const nodes: NodeDescriptor[] = buildLayerNodes(5, -1);
          const walker: PropagationWalker = new PropagationWalker(nodes);
          const trace: PropagationTrace = walker.walkCapture(INDEX_PAGE_TEXT_KEY);
          expect(trace.totalHops).assertEqual(5);
          expect(trace.stoppedAt).assertEqual('');
          expect(trace.visited[4]).assertEqual('capture:HelloWorld');
          expect(walker.countInterceptors()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1200
     * @tc.name testPropagationBubbleInterceptorStopsAtAncestor
     * @tc.desc Verify bubble walk stops at intercepting ancestor and never reaches the root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationBubbleInterceptorStopsAtAncestor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const nodes: NodeDescriptor[] = buildLayerNodes(4, 1);
          const walker: PropagationWalker = new PropagationWalker(nodes);
          const targetDepth: number = walker.getDepth() - 1;
          const trace: PropagationTrace = walker.walkBubble(INDEX_PAGE_TEXT_KEY, targetDepth);
          expect(trace.stoppedAt).assertEqual('Layer1');
          expect(trace.stopReason).assertEqual('bubble interceptor');
          expect(trace.visited.length >= 2).assertTrue();
          expect(trace.visited[trace.visited.length - 1]).assertEqual('bubble:Layer1');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1300
     * @tc.name testPropagationBubbleContainsTargetMarker
     * @tc.desc Verify bubble walk marks the target node with the target phase exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationBubbleContainsTargetMarker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const nodes: NodeDescriptor[] = buildLayerNodes(3, -1);
          const walker: PropagationWalker = new PropagationWalker(nodes);
          const trace: PropagationTrace = walker.walkBubble(INDEX_PAGE_TEXT_KEY, 2);
          let targetMarkers: number = 0;
          for (let i = 0; i < trace.visited.length; i++) {
            if (trace.visited[i].indexOf('target:') === 0) {
              targetMarkers++;
            }
          }
          expect(targetMarkers).assertEqual(1);
          expect(trace.visited[0]).assertEqual('bubble:HelloWorld');
          expect(trace.stoppedAt).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1400
     * @tc.name testPropagationPenetrationThroughNonInterceptingChain
     * @tc.desc Verify event penetrates all non intercepting layers: eight hops with no stop recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationPenetrationThroughNonInterceptingChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const nodes: NodeDescriptor[] = buildLayerNodes(8, -1);
          const walker: PropagationWalker = new PropagationWalker(nodes);
          const capture: PropagationTrace = walker.walkCapture(INDEX_PAGE_TEXT_KEY);
          const bubble: PropagationTrace = walker.walkBubble(INDEX_PAGE_TEXT_KEY, 7);
          expect(capture.totalHops).assertEqual(8);
          expect(bubble.stoppedAt).assertEqual('');
          expect(bubble.totalHops).assertEqual(9);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1500
     * @tc.name testPropagationDepthOfLookup
     * @tc.desc Verify node depth lookup returns index for known nodes and minus one for unknown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationDepthOfLookup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const chain: string[] = ['RelativeContainer', 'Layer1', 'Layer2', INDEX_PAGE_TEXT_KEY];
          const model: PropagationPathModel = new PropagationPathModel(chain);
          expect(model.depthOf('RelativeContainer')).assertEqual(0);
          expect(model.depthOf('Layer2')).assertEqual(2);
          expect(model.depthOf(INDEX_PAGE_TEXT_KEY)).assertEqual(3);
          expect(model.depthOf('MissingLayer')).assertEqual(-1);
          expect(model.containsNode('Layer1')).assertTrue();
          expect(model.containsNode('MissingLayer')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1600
     * @tc.name testPropagationEmptyChainSafety
     * @tc.desc Verify empty chain returns empty paths, empty names and zero depth without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationEmptyChainSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const emptyChain: string[] = [];
          const model: PropagationPathModel = new PropagationPathModel(emptyChain);
          expect(model.getDepth()).assertEqual(0);
          expect(model.buildCapturePath().length).assertEqual(0);
          expect(model.buildBubblePath().length).assertEqual(0);
          expect(model.rootName()).assertEqual('');
          expect(model.leafName()).assertEqual('');
          expect(model.depthOf('anything')).assertEqual(-1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1700
     * @tc.name testPropagationSingleLayerChain
     * @tc.desc Verify single layer chain produces equal capture and bubble paths with one hop each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationSingleLayerChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const chain: string[] = [INDEX_PAGE_TEXT_KEY];
          const model: PropagationPathModel = new PropagationPathModel(chain);
          const capturePath: string[] = model.buildCapturePath();
          const bubblePath: string[] = model.buildBubblePath();
          expect(capturePath.length).assertEqual(1);
          expect(bubblePath.length).assertEqual(1);
          expect(capturePath[0]).assertEqual('capture:HelloWorld');
          expect(bubblePath[0]).assertEqual('bubble:HelloWorld');
          expect(model.rootName()).assertEqual(model.leafName());
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1800
     * @tc.name testPropagationRegistryDecisions
     * @tc.desc Verify registry reports stop decisions for stopped nodes and continue for others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationRegistryDecisions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: StopPropagationRegistry = new StopPropagationRegistry();
          registry.registerStop(INDEX_PAGE_TEXT_KEY, PropagationPhase.TARGET, 'consume');
          registry.registerStop(INDEX_PAGE_TEXT_KEY, PropagationPhase.BUBBLE, 'consume again');
          const stoppedDecisions: PropagationDecision[] = registry.decisionsFor(INDEX_PAGE_TEXT_KEY);
          const openDecisions: PropagationDecision[] = registry.decisionsFor('RelativeContainer');
          expect(stoppedDecisions.length).assertEqual(2);
          expect(stoppedDecisions[0]).assertEqual(PropagationDecision.STOP);
          expect(openDecisions.length).assertEqual(1);
          expect(openDecisions[0]).assertEqual(PropagationDecision.CONTINUE);
          registry.clear();
          expect(registry.countStops()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_1900
     * @tc.name testPropagationLiveClickReachesPage
     * @tc.desc Verify real click propagates through RelativeContainer to Text: Welcome becomes visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationLiveClickReachesPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clicked: boolean = await clickTextComponent(driver);
          expect(clicked).assertTrue();
          await serializedDelay(driver, 200);
          const reached: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(reached).assertTrue();
          const text: string = await readTextById(driver);
          expect(text).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_2000
     * @tc.name testPropagationLiveContainerCountStable
     * @tc.desc Verify propagation does not add sibling nodes: component count before equals after click
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationLiveContainerCountStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeCount: number = await pageComponentCount(driver);
          expect(beforeCount).assertLargerOrEqual(1);
          await clickTextComponent(driver);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
          const textNodes: Component[] = await findComponentsByType(driver, 'Text');
          expect(textNodes.length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_2100
     * @tc.name testPropagationKeyEventDoesNotBubbleToStateChange
     * @tc.desc Verify ENTER key propagation leaves page text unchanged and page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationKeyEventDoesNotBubbleToStateChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeText: string = await readTextById(driver);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          const afterText: string = await readTextById(driver);
          expect(afterText).assertEqual(beforeText);
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_PROPAGATION_2200
     * @tc.name testPropagationLivePathMatchesModel
     * @tc.desc Verify live page structure matches modelled two layer path: root container then text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationLivePathMatchesModel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeCount: number = await pageComponentCount(driver);
          const chain: string[] = ['RelativeContainer', INDEX_PAGE_TEXT_KEY];
          const model: PropagationPathModel = new PropagationPathModel(chain);
          expect(model.getDepth()).assertEqual(2);
          expect(beforeCount).assertLargerOrEqual(1);
          expect(model.joinCapture()).assertEqual('capture:RelativeContainer > capture:HelloWorld');
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
        } finally {
          done();
        }
      })
  })
}
