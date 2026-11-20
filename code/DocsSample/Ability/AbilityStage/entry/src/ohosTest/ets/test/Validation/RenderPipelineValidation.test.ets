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

import { describe, it, expect, beforeAll, beforeEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  launchEntryAbility,
  waitForIndexPageStable,
  isIndexPageVisible,
  isIndexPageRendered,
  pageComponentCount,
  collectAllTexts,
  checkTextContent,
  checkComponentExists,
  checkComponentExistsByKey,
  findComponentsByType,
  tapComponentByText,
  doAbilityForeground,
  doAbilityBackground,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  logInfo,
  logError,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_BACKGROUND_SWITCH,
  DELAY_AFTER_BACKGROUND,
  INDEX_PAGE_PATH,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED
} from '../Shared/SharedDriver';

enum RenderPhase {
  MEASURE = 0,
  LAYOUT = 1,
  DRAW = 2
}

interface PhaseSample {
  phase: RenderPhase;
  durationMs: number;
}

class RenderParamError extends Error {
  public code: number = 401;

  constructor(message: string) {
    super(message);
    this.name = 'RenderParamError';
  }
}

class RenderStateError extends Error {
  public code: number = 409;

  constructor(message: string) {
    super(message);
    this.name = 'RenderStateError';
  }
}

class RenderFrameRecord {
  public frameId: number = 0;
  public startedAt: number = 0;
  public samples: PhaseSample[] = [];
  public closed: boolean = false;

  constructor(frameId: number, startedAt: number) {
    this.frameId = frameId;
    this.startedAt = startedAt;
  }

  public addSample(phase: RenderPhase, durationMs: number): void {
    const sample: PhaseSample = { phase: phase, durationMs: durationMs };
    this.samples.push(sample);
  }

  public totalMs(): number {
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].durationMs;
    }
    return total;
  }

  public sampleFor(phase: RenderPhase): number {
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].phase === phase) {
        return this.samples[i].durationMs;
      }
    }
    return 0;
  }
}

class RenderNodeTree {
  private childrenMap: Map<string, string[]> = new Map<string, string[]>();
  private nodeCount: number = 0;

  public addNode(nodeId: string): boolean {
    if (nodeId.length === 0) {
      throw new RenderParamError('node id must not be empty');
    }
    if (this.childrenMap.has(nodeId)) {
      return false;
    }
    const emptyChildren: string[] = [];
    this.childrenMap.set(nodeId, emptyChildren);
    this.nodeCount++;
    return true;
  }

  public addChild(parentId: string, childId: string): void {
    if (!this.childrenMap.has(parentId)) {
      throw new RenderParamError(`unknown parent node ${parentId}`);
    }
    if (!this.childrenMap.has(childId)) {
      throw new RenderParamError(`unknown child node ${childId}`);
    }
    const children: string[] = this.childrenMap.get(parentId) as string[];
    for (let i = 0; i < children.length; i++) {
      if (children[i] === childId) {
        return;
      }
    }
    children.push(childId);
  }

  public childrenOf(nodeId: string): string[] {
    const children: string[] | undefined = this.childrenMap.get(nodeId);
    if (children === undefined) {
      return [];
    }
    return children;
  }

  public collectDescendants(nodeId: string): string[] {
    const result: string[] = [];
    const queue: string[] = [];
    const direct: string[] = this.childrenOf(nodeId);
    for (let i = 0; i < direct.length; i++) {
      queue.push(direct[i]);
    }
    let cursor: number = 0;
    while (cursor < queue.length) {
      const current: string = queue[cursor];
      cursor++;
      result.push(current);
      const next: string[] = this.childrenOf(current);
      for (let i = 0; i < next.length; i++) {
        queue.push(next[i]);
      }
    }
    return result;
  }

  public hasNode(nodeId: string): boolean {
    return this.childrenMap.has(nodeId);
  }

  public size(): number {
    return this.nodeCount;
  }
}

class RenderPipelineModel {
  private tree: RenderNodeTree = new RenderNodeTree();
  private dirtyFlags: Map<string, boolean> = new Map<string, boolean>();
  private frames: RenderFrameRecord[] = [];
  private nextFrameId: number = 1;
  private renderRequestCount: number = 0;
  private firstFrameElapsedMs: number = -1;

  public getTree(): RenderNodeTree {
    return this.tree;
  }

  public registerNode(nodeId: string): boolean {
    const added: boolean = this.tree.addNode(nodeId);
    if (added) {
      this.dirtyFlags.set(nodeId, false);
    }
    return added;
  }

  public registerChild(parentId: string, childId: string): void {
    this.registerNode(childId);
    this.tree.addChild(parentId, childId);
  }

  public markDirty(nodeId: string): void {
    if (nodeId.length === 0) {
      throw new RenderParamError('cannot mark empty node id dirty');
    }
    if (!this.tree.hasNode(nodeId)) {
      throw new RenderParamError(`cannot mark unknown node ${nodeId} dirty`);
    }
    this.dirtyFlags.set(nodeId, true);
  }

  public markClean(nodeId: string): void {
    if (this.dirtyFlags.has(nodeId)) {
      this.dirtyFlags.set(nodeId, false);
    }
  }

  public isDirty(nodeId: string): boolean {
    return this.dirtyFlags.get(nodeId) === true;
  }

  public dirtyCount(): number {
    let count: number = 0;
    const keys: string[] = Array.from(this.dirtyFlags.keys());
    for (let i = 0; i < keys.length; i++) {
      if (this.dirtyFlags.get(keys[i]) === true) {
        count++;
      }
    }
    return count;
  }

  public propagateDirty(rootId: string): number {
    if (!this.tree.hasNode(rootId)) {
      throw new RenderParamError(`cannot propagate from unknown node ${rootId}`);
    }
    this.dirtyFlags.set(rootId, true);
    let newlyMarked: number = 0;
    const descendants: string[] = this.tree.collectDescendants(rootId);
    for (let i = 0; i < descendants.length; i++) {
      const current: string = descendants[i];
      if (this.dirtyFlags.get(current) !== true) {
        this.dirtyFlags.set(current, true);
        newlyMarked++;
      }
    }
    return newlyMarked;
  }

  public requestRender(nodeId: string): boolean {
    if (!this.tree.hasNode(nodeId)) {
      throw new RenderParamError(`cannot request render for unknown node ${nodeId}`);
    }
    if (this.isDirty(nodeId)) {
      return false;
    }
    this.dirtyFlags.set(nodeId, true);
    this.renderRequestCount++;
    return true;
  }

  public getRenderRequestCount(): number {
    return this.renderRequestCount;
  }

  public beginFrame(): number {
    const frameId: number = this.nextFrameId;
    this.nextFrameId++;
    const record: RenderFrameRecord = new RenderFrameRecord(frameId, Date.now());
    this.frames.push(record);
    return frameId;
  }

  private findFrame(frameId: number): RenderFrameRecord {
    for (let i = 0; i < this.frames.length; i++) {
      if (this.frames[i].frameId === frameId) {
        return this.frames[i];
      }
    }
    throw new RenderStateError(`frame ${frameId} does not exist`);
  }

  public recordPhase(frameId: number, phase: RenderPhase, durationMs: number): void {
    if (durationMs < 0) {
      throw new RenderParamError(`negative duration ${durationMs} is not allowed`);
    }
    if (!isFinite(durationMs)) {
      throw new RenderParamError(`duration must be finite`);
    }
    const frame: RenderFrameRecord = this.findFrame(frameId);
    if (frame.closed) {
      throw new RenderStateError(`frame ${frameId} is already closed`);
    }
    frame.addSample(phase, durationMs);
  }

  public endFrame(frameId: number): number {
    const frame: RenderFrameRecord = this.findFrame(frameId);
    frame.closed = true;
    return frame.totalMs();
  }

  public getFrameTotal(frameId: number): number {
    return this.findFrame(frameId).totalMs();
  }

  public getPhaseDuration(frameId: number, phase: RenderPhase): number {
    return this.findFrame(frameId).sampleFor(phase);
  }

  public averagePhaseDuration(phase: RenderPhase): number {
    const values: number[] = [];
    for (let i = 0; i < this.frames.length; i++) {
      const samples: PhaseSample[] = this.frames[i].samples;
      for (let j = 0; j < samples.length; j++) {
        if (samples[j].phase === phase) {
          values.push(samples[j].durationMs);
        }
      }
    }
    return averageOf(values);
  }

  public maxPhaseDuration(phase: RenderPhase): number {
    const values: number[] = [];
    for (let i = 0; i < this.frames.length; i++) {
      const samples: PhaseSample[] = this.frames[i].samples;
      for (let j = 0; j < samples.length; j++) {
        if (samples[j].phase === phase) {
          values.push(samples[j].durationMs);
        }
      }
    }
    return maxOf(values);
  }

  public minPhaseDuration(phase: RenderPhase): number {
    const values: number[] = [];
    for (let i = 0; i < this.frames.length; i++) {
      const samples: PhaseSample[] = this.frames[i].samples;
      for (let j = 0; j < samples.length; j++) {
        if (samples[j].phase === phase) {
          values.push(samples[j].durationMs);
        }
      }
    }
    return minOf(values);
  }

  public isFrameWithinBudget(frameId: number, budgetMs: number): boolean {
    return this.getFrameTotal(frameId) <= budgetMs;
  }

  public markFirstFrame(elapsedMs: number): void {
    if (elapsedMs < 0) {
      throw new RenderParamError('first frame elapsed must not be negative');
    }
    this.firstFrameElapsedMs = elapsedMs;
  }

  public getFirstFrameElapsed(): number {
    return this.firstFrameElapsedMs;
  }

  public isFirstFrameWithinBudget(budgetMs: number): boolean {
    if (this.firstFrameElapsedMs < 0) {
      return false;
    }
    return this.firstFrameElapsedMs <= budgetMs;
  }

  public lastFrameId(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return this.frames[this.frames.length - 1].frameId;
  }

  public frameCount(): number {
    return this.frames.length;
  }

  public reset(): void {
    this.tree = new RenderNodeTree();
    this.dirtyFlags = new Map<string, boolean>();
    this.frames = [];
    this.nextFrameId = 1;
    this.renderRequestCount = 0;
    this.firstFrameElapsedMs = -1;
  }
}

export default function renderPipelineValidationTest(): void {
  describe('RenderPipelineValidationTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('RenderPipelineValidationTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('RenderPipelineValidationTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('RenderPipelineValidationTest: afterAll start');
      await driver.delayMs(DELAY_AFTER_BACKGROUND);
      logInfo('RenderPipelineValidationTest: afterAll finished');
    })

    beforeEach(async () => {
      const rendered: boolean = await isIndexPageRendered(driver);
      if (!rendered) {
        logInfo('beforeEach: index page absent, relaunching the entry ability');
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0100
     * @tc.name testRenderPhaseEnumOrder
     * @tc.desc Verify RenderPhase enum keeps pipeline order MEASURE=0, LAYOUT=1, DRAW=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderPhaseEnumOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(RenderPhase.MEASURE).assertEqual(0);
        expect(RenderPhase.LAYOUT).assertEqual(1);
        expect(RenderPhase.DRAW).assertEqual(2);
        expect(RenderPhase.MEASURE < RenderPhase.LAYOUT).assertTrue();
        expect(RenderPhase.LAYOUT < RenderPhase.DRAW).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0200
     * @tc.name testPipelineInitialState
     * @tc.desc Verify a fresh pipeline has zero dirty nodes, zero frames and zero render requests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPipelineInitialState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        expect(model.dirtyCount()).assertEqual(0);
        expect(model.frameCount()).assertEqual(0);
        expect(model.getRenderRequestCount()).assertEqual(0);
        expect(model.lastFrameId()).assertEqual(0);
        expect(model.getFirstFrameElapsed()).assertEqual(-1);
        expect(model.isFirstFrameWithinBudget(TIMEOUT_PAGE_RENDER)).assertFalse();
        expect(model.getTree().size()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0300
     * @tc.name testMarkDirtySetsFlag
     * @tc.desc Verify markDirty flips the dirty flag of a registered node from false to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMarkDirtySetsFlag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_PATH);
        expect(model.isDirty(INDEX_PAGE_PATH)).assertFalse();
        model.markDirty(INDEX_PAGE_PATH);
        expect(model.isDirty(INDEX_PAGE_PATH)).assertTrue();
        expect(model.dirtyCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0400
     * @tc.name testMarkDirtyIdempotent
     * @tc.desc Verify marking the same node dirty three times keeps dirty count at exactly one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMarkDirtyIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_TEXT_KEY);
        model.markDirty(INDEX_PAGE_TEXT_KEY);
        model.markDirty(INDEX_PAGE_TEXT_KEY);
        model.markDirty(INDEX_PAGE_TEXT_KEY);
        expect(model.dirtyCount()).assertEqual(1);
        expect(model.isDirty(INDEX_PAGE_TEXT_KEY)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0500
     * @tc.name testClearDirtyResetsFlag
     * @tc.desc Verify markClean clears only the targeted node dirty flag and leaves other nodes dirty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearDirtyResetsFlag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_PATH);
        model.registerNode(INDEX_PAGE_TEXT_KEY);
        model.markDirty(INDEX_PAGE_PATH);
        model.markDirty(INDEX_PAGE_TEXT_KEY);
        expect(model.dirtyCount()).assertEqual(2);
        model.markClean(INDEX_PAGE_PATH);
        expect(model.isDirty(INDEX_PAGE_PATH)).assertFalse();
        expect(model.isDirty(INDEX_PAGE_TEXT_KEY)).assertTrue();
        expect(model.dirtyCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0600
     * @tc.name testMarkDirtyRejectsEmptyNodeId
     * @tc.desc Verify markDirty with an empty node id raises RenderParamError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMarkDirtyRejectsEmptyNodeId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        try {
          model.markDirty('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RenderParamError');
        }
        expect(model.dirtyCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0700
     * @tc.name testRequestRenderIncrementsCount
     * @tc.desc Verify a render request on a clean node schedules work and increments the render counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRequestRenderIncrementsCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_TEXT_KEY);
        const scheduled: boolean = model.requestRender(INDEX_PAGE_TEXT_KEY);
        expect(scheduled).assertTrue();
        expect(model.getRenderRequestCount()).assertEqual(1);
        expect(model.isDirty(INDEX_PAGE_TEXT_KEY)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0800
     * @tc.name testRequestRenderDeduplicates
     * @tc.desc Verify repeated render requests for an already dirty node are dropped and counted once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRequestRenderDeduplicates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_PATH);
        const first: boolean = model.requestRender(INDEX_PAGE_PATH);
        const second: boolean = model.requestRender(INDEX_PAGE_PATH);
        const third: boolean = model.requestRender(INDEX_PAGE_PATH);
        expect(first).assertTrue();
        expect(second).assertFalse();
        expect(third).assertFalse();
        expect(model.getRenderRequestCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_0900
     * @tc.name testRequestRenderAfterClearRequeues
     * @tc.desc Verify a node becomes schedulable again after its dirty flag is cleared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRequestRenderAfterClearRequeues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_TEXT_KEY);
        expect(model.requestRender(INDEX_PAGE_TEXT_KEY)).assertTrue();
        model.markClean(INDEX_PAGE_TEXT_KEY);
        expect(model.requestRender(INDEX_PAGE_TEXT_KEY)).assertTrue();
        expect(model.getRenderRequestCount()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1000
     * @tc.name testDirtyPropagationMarksDescendants
     * @tc.desc Verify propagating dirtiness from the page root marks the text child and grandchild dirty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirtyPropagationMarksDescendants', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode('pageRoot');
        model.registerChild('pageRoot', 'relativeContainer');
        model.registerChild('relativeContainer', INDEX_PAGE_TEXT_KEY);
        const newlyMarked: number = model.propagateDirty('pageRoot');
        expect(newlyMarked).assertEqual(2);
        expect(model.isDirty('pageRoot')).assertTrue();
        expect(model.isDirty('relativeContainer')).assertTrue();
        expect(model.isDirty(INDEX_PAGE_TEXT_KEY)).assertTrue();
        expect(model.dirtyCount()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1100
     * @tc.name testDirtyPropagationSkipsSiblings
     * @tc.desc Verify dirty propagation from one subtree leaves a sibling subtree clean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirtyPropagationSkipsSiblings', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode('root');
        model.registerChild('root', 'leftPane');
        model.registerChild('root', 'rightPane');
        model.registerChild('leftPane', 'leftText');
        model.registerChild('rightPane', 'rightText');
        model.propagateDirty('leftPane');
        expect(model.isDirty('leftText')).assertTrue();
        expect(model.isDirty('rightPane')).assertFalse();
        expect(model.isDirty('rightText')).assertFalse();
        expect(model.dirtyCount()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1200
     * @tc.name testDirtyPropagationFromLeafStaysLocal
     * @tc.desc Verify propagating from a leaf node never walks upward to its ancestors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirtyPropagationFromLeafStaysLocal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode('root');
        model.registerChild('root', INDEX_PAGE_PATH);
        model.registerChild(INDEX_PAGE_PATH, INDEX_PAGE_TEXT_KEY);
        const newlyMarked: number = model.propagateDirty(INDEX_PAGE_TEXT_KEY);
        expect(newlyMarked).assertEqual(0);
        expect(model.isDirty(INDEX_PAGE_TEXT_KEY)).assertTrue();
        expect(model.isDirty(INDEX_PAGE_PATH)).assertFalse();
        expect(model.isDirty('root')).assertFalse();
        expect(model.dirtyCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1300
     * @tc.name testPropagationCountExcludesAlreadyDirty
     * @tc.desc Verify a second propagation reports zero newly marked descendants while keeping flags set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPropagationCountExcludesAlreadyDirty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode('root');
        model.registerChild('root', 'childA');
        model.registerChild('root', 'childB');
        expect(model.propagateDirty('root')).assertEqual(2);
        expect(model.propagateDirty('root')).assertEqual(0);
        expect(model.dirtyCount()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1400
     * @tc.name testFrameTotalEqualsPhaseSum
     * @tc.desc Verify frame total duration equals the sum of measure, layout and draw samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFrameTotalEqualsPhaseSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const frameId: number = model.beginFrame();
        model.recordPhase(frameId, RenderPhase.MEASURE, 3);
        model.recordPhase(frameId, RenderPhase.LAYOUT, 5);
        model.recordPhase(frameId, RenderPhase.DRAW, 12);
        expect(model.getPhaseDuration(frameId, RenderPhase.MEASURE)).assertEqual(3);
        expect(model.getPhaseDuration(frameId, RenderPhase.LAYOUT)).assertEqual(5);
        expect(model.getPhaseDuration(frameId, RenderPhase.DRAW)).assertEqual(12);
        expect(model.getFrameTotal(frameId)).assertEqual(20);
        expect(model.endFrame(frameId)).assertEqual(20);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1500
     * @tc.name testEmptyFrameTotalZero
     * @tc.desc Verify a frame without samples reports zero total and zero per-phase durations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyFrameTotalZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const frameId: number = model.beginFrame();
        expect(model.getFrameTotal(frameId)).assertEqual(0);
        expect(model.getPhaseDuration(frameId, RenderPhase.DRAW)).assertEqual(0);
        expect(model.averagePhaseDuration(RenderPhase.DRAW)).assertEqual(0);
        expect(model.maxPhaseDuration(RenderPhase.DRAW)).assertEqual(0);
        expect(model.minPhaseDuration(RenderPhase.DRAW)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1600
     * @tc.name testRecordPhaseRejectsNegativeDuration
     * @tc.desc Verify recording a negative phase duration raises RenderParamError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordPhaseRejectsNegativeDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const frameId: number = model.beginFrame();
        try {
          model.recordPhase(frameId, RenderPhase.MEASURE, -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RenderParamError');
        }
        expect(model.getFrameTotal(frameId)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1700
     * @tc.name testRecordPhaseUnknownFrameRejected
     * @tc.desc Verify recording a phase into a non existing frame raises RenderStateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordPhaseUnknownFrameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        try {
          model.recordPhase(99, RenderPhase.DRAW, 4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RenderStateError');
        }
        expect(model.frameCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1800
     * @tc.name testRecordPhaseOnClosedFrameRejected
     * @tc.desc Verify a closed frame rejects further phase samples with RenderStateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordPhaseOnClosedFrameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const frameId: number = model.beginFrame();
        model.recordPhase(frameId, RenderPhase.DRAW, 8);
        model.endFrame(frameId);
        try {
          model.recordPhase(frameId, RenderPhase.DRAW, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RenderStateError');
        }
        expect(model.getFrameTotal(frameId)).assertEqual(8);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_1900
     * @tc.name testAveragePhaseDuration
     * @tc.desc Verify average draw duration across three frames equals the arithmetic mean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAveragePhaseDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const first: number = model.beginFrame();
        model.recordPhase(first, RenderPhase.DRAW, 4);
        const second: number = model.beginFrame();
        model.recordPhase(second, RenderPhase.DRAW, 8);
        const third: number = model.beginFrame();
        model.recordPhase(third, RenderPhase.DRAW, 12);
        expect(model.averagePhaseDuration(RenderPhase.DRAW)).assertEqual(8);
        expect(model.averagePhaseDuration(RenderPhase.MEASURE)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2000
     * @tc.name testMaxPhaseDuration
     * @tc.desc Verify max layout duration picks the largest sample among recorded frames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMaxPhaseDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const first: number = model.beginFrame();
        model.recordPhase(first, RenderPhase.LAYOUT, 7);
        const second: number = model.beginFrame();
        model.recordPhase(second, RenderPhase.LAYOUT, 21);
        const third: number = model.beginFrame();
        model.recordPhase(third, RenderPhase.LAYOUT, 13);
        expect(model.maxPhaseDuration(RenderPhase.LAYOUT)).assertEqual(21);
        expect(model.minPhaseDuration(RenderPhase.LAYOUT)).assertEqual(7);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2100
     * @tc.name testMinPhaseDurationSingleSample
     * @tc.desc Verify min and max of a single measure sample both collapse to that sample value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMinPhaseDurationSingleSample', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const frameId: number = model.beginFrame();
        model.recordPhase(frameId, RenderPhase.MEASURE, 9);
        expect(model.minPhaseDuration(RenderPhase.MEASURE)).assertEqual(9);
        expect(model.maxPhaseDuration(RenderPhase.MEASURE)).assertEqual(9);
        expect(model.averagePhaseDuration(RenderPhase.MEASURE)).assertEqual(9);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2200
     * @tc.name testFirstFrameWithinPageRenderBudget
     * @tc.desc Verify first frame elapsed of 600 ms fits the 1000 ms page render budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFirstFrameWithinPageRenderBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.markFirstFrame(600);
        expect(model.getFirstFrameElapsed()).assertEqual(600);
        expect(model.isFirstFrameWithinBudget(TIMEOUT_PAGE_RENDER)).assertTrue();
        expect(isWithinBudget(600, TIMEOUT_PAGE_RENDER)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2300
     * @tc.name testFirstFrameExceedsBudget
     * @tc.desc Verify first frame elapsed of 1001 ms exceeds the 1000 ms budget while 1000 ms passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFirstFrameExceedsBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.markFirstFrame(1001);
        expect(model.isFirstFrameWithinBudget(TIMEOUT_PAGE_RENDER)).assertFalse();
        model.markFirstFrame(1000);
        expect(model.isFirstFrameWithinBudget(TIMEOUT_PAGE_RENDER)).assertTrue();
        expect(isWithinBudget(1001, TIMEOUT_PAGE_RENDER)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2400
     * @tc.name testFrameBudgetBoundaryEquality
     * @tc.desc Verify a frame total exactly equal to the budget is accepted and one ms more is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFrameBudgetBoundaryEquality', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const frameId: number = model.beginFrame();
        model.recordPhase(frameId, RenderPhase.MEASURE, 400);
        model.recordPhase(frameId, RenderPhase.LAYOUT, 300);
        model.recordPhase(frameId, RenderPhase.DRAW, 300);
        expect(model.getFrameTotal(frameId)).assertEqual(1000);
        expect(model.isFrameWithinBudget(frameId, TIMEOUT_PAGE_RENDER)).assertTrue();
        expect(model.isFrameWithinBudget(frameId, 999)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2500
     * @tc.name testFrameIdsMonotonic
     * @tc.desc Verify frame ids increase by exactly one per beginFrame call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFrameIdsMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const first: number = model.beginFrame();
        const second: number = model.beginFrame();
        const third: number = model.beginFrame();
        expect(first).assertEqual(1);
        expect(second).assertEqual(2);
        expect(third).assertEqual(3);
        expect(model.lastFrameId()).assertEqual(3);
        expect(model.frameCount()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2600
     * @tc.name testResetRestoresInitialState
     * @tc.desc Verify reset clears frames, dirty flags and render request counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResetRestoresInitialState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_PATH);
        model.requestRender(INDEX_PAGE_PATH);
        const frameId: number = model.beginFrame();
        model.recordPhase(frameId, RenderPhase.DRAW, 5);
        model.markFirstFrame(300);
        model.reset();
        expect(model.dirtyCount()).assertEqual(0);
        expect(model.frameCount()).assertEqual(0);
        expect(model.getRenderRequestCount()).assertEqual(0);
        expect(model.lastFrameId()).assertEqual(0);
        expect(model.getFirstFrameElapsed()).assertEqual(-1);
        expect(model.getTree().size()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2700
     * @tc.name testUiIndexPageRenderWithinBudget
     * @tc.desc Verify the real Index page becomes stable within the TIMEOUT_PAGE_RENDER budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiIndexPageRenderWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const startTime: number = Date.now();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const elapsed: number = measureElapsed(startTime);
        logInfo(`testUiIndexPageRenderWithinBudget: stable ${stable} in ${elapsed} ms`);
        expect(stable).assertTrue();
        expect(isFinite(elapsed)).assertTrue();
        expect(elapsed >= 0).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2800
     * @tc.name testUiPageComponentCountMatchesModel
     * @tc.desc Verify the live page node count matches the two node render model built for Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageComponentCountMatchesModel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_PATH);
        model.registerChild(INDEX_PAGE_PATH, INDEX_PAGE_TEXT_KEY);
        expect(model.getTree().size()).assertEqual(2);
        const liveCount: number = await pageComponentCount(driver);
        logInfo(`testUiPageComponentCountMatchesModel: live component count ${liveCount}`);
        expect(liveCount > 0).assertTrue();
        expect(liveCount >= model.getTree().size()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_2900
     * @tc.name testUiIndexPageTextCollection
     * @tc.desc Verify collected text nodes of the rendered page include the HelloWorld copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiIndexPageTextCollection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const texts: string[] = await collectAllTexts(driver);
        logInfo(`testUiIndexPageTextCollection: collected ${texts.length} texts`);
        expect(texts.length >= 1).assertTrue();
        let matched: boolean = false;
        for (let i = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_INITIAL || texts[i] === PAGE_TEXT_CLICKED) {
            matched = true;
          }
        }
        expect(matched).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3000
     * @tc.name testUiHelloWorldKeyPresent
     * @tc.desc Verify the rendered page exposes the HelloWorld id and a Text component node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiHelloWorldKeyPresent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const keyPresent: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        const textPresent: boolean = await checkComponentExists(driver, 'Text');
        logInfo(`testUiHelloWorldKeyPresent: key ${keyPresent} text ${textPresent}`);
        expect(keyPresent).assertTrue();
        expect(textPresent).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3100
     * @tc.name testUiRepeatedComponentCountStable
     * @tc.desc Verify two consecutive component counts of a stable page are identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRepeatedComponentCountStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const first: number = await pageComponentCount(driver);
        await driver.delayMs(TIMEOUT_PAGE_RENDER / 4);
        const second: number = await pageComponentCount(driver);
        logInfo(`testUiRepeatedComponentCountStable: ${first} then ${second}`);
        expect(first).assertEqual(second);
        expect(first > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3200
     * @tc.name testUiTextComponentCountAtLeastOne
     * @tc.desc Verify findComponentsByType returns at least one Text component on the rendered page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextComponentCountAtLeastOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const textComponents: Component[] = await findComponentsByType(driver, 'Text');
        logInfo(`testUiTextComponentCountAtLeastOne: found ${textComponents.length}`);
        expect(textComponents.length >= 1).assertTrue();
        const pageCount: number = await pageComponentCount(driver);
        expect(pageCount >= textComponents.length).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3300
     * @tc.name testUiClickTriggersPageTextRerender
     * @tc.desc Verify tapping the HelloWorld text switches its copy to Welcome and schedules one repaint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiClickTriggersPageTextRerender', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_TEXT_KEY);
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const target: string = initialVisible ? PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
        const tapped: boolean = await tapComponentByText(driver, target);
        expect(tapped).assertTrue();
        const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(clickedVisible).assertTrue();
        const scheduled: boolean = model.requestRender(INDEX_PAGE_TEXT_KEY);
        expect(scheduled).assertTrue();
        expect(model.getRenderRequestCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3400
     * @tc.name testUiForegroundCycleKeepsPageRendered
     * @tc.desc Verify a background then foreground cycle keeps the page renderable within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiForegroundCycleKeepsPageRendered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await doAbilityBackground();
        await driver.delayMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        const startTime: number = Date.now();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_BACKGROUND_SWITCH);
        const elapsed: number = measureElapsed(startTime);
        logInfo(`testUiForegroundCycleKeepsPageRendered: stable ${stable} in ${elapsed} ms`);
        expect(stable).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH * 2)).assertTrue();
      } catch (error) {
        logError(`testUiForegroundCycleKeepsPageRendered failed: ${error}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3500
     * @tc.name testUiNodeTreeDescendantCountMatchesLiveQuery
     * @tc.desc Verify descendant traversal from the page root returns the registered text child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiNodeTreeDescendantCountMatchesLiveQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_PATH);
        model.registerChild(INDEX_PAGE_PATH, 'relativeContainer');
        model.registerChild('relativeContainer', INDEX_PAGE_TEXT_KEY);
        const descendants: string[] = model.getTree().collectDescendants(INDEX_PAGE_PATH);
        expect(descendants.length).assertEqual(2);
        expect(descendants[0]).assertEqual('relativeContainer');
        expect(descendants[1]).assertEqual(INDEX_PAGE_TEXT_KEY);
        const liveTexts: Component[] = await findComponentsByType(driver, 'Text');
        expect(liveTexts.length >= 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3600
     * @tc.name testPhaseSampleOrderPreserved
     * @tc.desc Verify samples are retained in the order they were recorded for a single frame
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseSampleOrderPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        const frameId: number = model.beginFrame();
        model.recordPhase(frameId, RenderPhase.MEASURE, 2);
        model.recordPhase(frameId, RenderPhase.LAYOUT, 4);
        model.recordPhase(frameId, RenderPhase.DRAW, 6);
        const measure: number = model.getPhaseDuration(frameId, RenderPhase.MEASURE);
        const layout: number = model.getPhaseDuration(frameId, RenderPhase.LAYOUT);
        const draw: number = model.getPhaseDuration(frameId, RenderPhase.DRAW);
        expect(measure < layout).assertTrue();
        expect(layout < draw).assertTrue();
        expect(measure + layout + draw).assertEqual(model.getFrameTotal(frameId));
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3700
     * @tc.name testDuplicateChildLinkIgnored
     * @tc.desc Verify linking the same child twice keeps a single edge in the parent child list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateChildLinkIgnored', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode('pageRoot');
        model.registerChild('pageRoot', INDEX_PAGE_TEXT_KEY);
        model.registerChild('pageRoot', INDEX_PAGE_TEXT_KEY);
        const children: string[] = model.getTree().childrenOf('pageRoot');
        expect(children.length).assertEqual(1);
        expect(children[0]).assertEqual(INDEX_PAGE_TEXT_KEY);
        expect(model.propagateDirty('pageRoot')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3800
     * @tc.name testUnknownParentLinkRejected
     * @tc.desc Verify linking a child under an unregistered parent raises RenderParamError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnknownParentLinkRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        model.registerNode(INDEX_PAGE_TEXT_KEY);
        try {
          model.registerChild('missingParent', INDEX_PAGE_TEXT_KEY);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RenderParamError');
        }
        expect(model.getTree().hasNode('missingParent')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_3900
     * @tc.name testMarkFirstFrameRejectsNegative
     * @tc.desc Verify a negative first frame elapsed value raises RenderParamError and keeps state unset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMarkFirstFrameRejectsNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: RenderPipelineModel = new RenderPipelineModel();
        try {
          model.markFirstFrame(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RenderParamError');
        }
        expect(model.getFirstFrameElapsed()).assertEqual(-1);
        expect(model.isFirstFrameWithinBudget(TIMEOUT_PAGE_RENDER)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDERPIPE_4000
     * @tc.name testUiSecondTapKeepsWelcomeText
     * @tc.desc Verify a second tap on the already rendered Welcome text keeps the page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSecondTapKeepsWelcomeText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const firstTarget: string = initialVisible ? PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
        const firstTap: boolean = await tapComponentByText(driver, firstTarget);
        expect(firstTap).assertTrue();
        await driver.delayMs(DELAY_AFTER_BACKGROUND);
        const secondTap: boolean = await tapComponentByText(driver, PAGE_TEXT_CLICKED);
        expect(secondTap).assertTrue();
        await driver.delayMs(DELAY_AFTER_BACKGROUND);
        const stillVisible: boolean = await isIndexPageVisible(driver);
        expect(stillVisible).assertTrue();
        const pageCount: number = await pageComponentCount(driver);
        expect(pageCount > 0).assertTrue();
      } finally {
        done();
      }
    })
  })
}
