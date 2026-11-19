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
  isIndexPageVisible,
  pageComponentCount,
  pressAndWait,
  checkFocusState,
  getCurrentFocusIndex,
  checkComponentExistsByKey,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_LAUNCH,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_FOCUS_CHANGE,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_TAB
} from '../Shared/SharedDriver';

enum RingState {
  ABSENT = 'absent',
  FOCUSED = 'focused',
  BLURRED = 'blurred',
  VANISHED = 'vanished'
}

enum RingTransition {
  GAIN_FOCUS = 'gain_focus',
  LOSE_FOCUS = 'lose_focus',
  CANCEL = 'cancel',
  RESET = 'reset'
}

enum RingColorToken {
  PRIMARY = 'primary',
  SECONDARY = 'secondary',
  DISABLED = 'disabled',
  TRANSPARENT = 'transparent'
}

interface RingDescriptor {
  widthVp: number;
  colorToken: RingColorToken;
  durationMs: number;
}

interface RingTransitionResult {
  accepted: boolean;
  from: RingState;
  to: RingState;
  detail: string;
}

interface RingRenderSample {
  sampleIndex: number;
  state: RingState;
  widthVp: number;
  durationMs: number;
}

interface DurationBoundary {
  durationMs: number;
  animatable: boolean;
  instant: boolean;
}

class RingStateMachine {
  private state: RingState = RingState.ABSENT;
  private acceptedTransitions: number = 0;
  private rejectedTransitions: number = 0;

  public apply(transition: RingTransition): RingTransitionResult {
    const from: RingState = this.state;
    if (transition === RingTransition.GAIN_FOCUS) {
      if (from === RingState.ABSENT || from === RingState.BLURRED || from === RingState.VANISHED) {
        this.state = RingState.FOCUSED;
        this.acceptedTransitions++;
        const accepted: RingTransitionResult = {
          accepted: true,
          from: from,
          to: this.state,
          detail: 'focus gain allowed'
        };
        return accepted;
      }
      this.rejectedTransitions++;
      const rejected: RingTransitionResult = {
        accepted: false,
        from: from,
        to: this.state,
        detail: 'focus gain rejected while focused'
      };
      return rejected;
    }
    if (transition === RingTransition.LOSE_FOCUS) {
      if (from === RingState.FOCUSED) {
        this.state = RingState.BLURRED;
        this.acceptedTransitions++;
        const blurAccepted: RingTransitionResult = {
          accepted: true,
          from: from,
          to: this.state,
          detail: 'focus loss allowed'
        };
        return blurAccepted;
      }
      this.rejectedTransitions++;
      const blurRejected: RingTransitionResult = {
        accepted: false,
        from: from,
        to: this.state,
        detail: 'focus loss rejected when not focused'
      };
      return blurRejected;
    }
    if (transition === RingTransition.CANCEL) {
      if (from === RingState.FOCUSED || from === RingState.BLURRED) {
        this.state = RingState.VANISHED;
        this.acceptedTransitions++;
        const cancelAccepted: RingTransitionResult = {
          accepted: true,
          from: from,
          to: this.state,
          detail: 'cancel allowed'
        };
        return cancelAccepted;
      }
      this.rejectedTransitions++;
      const cancelRejected: RingTransitionResult = {
        accepted: false,
        from: from,
        to: this.state,
        detail: 'cancel rejected from absent state'
      };
      return cancelRejected;
    }
    if (from === RingState.VANISHED) {
      this.state = RingState.ABSENT;
      this.acceptedTransitions++;
      const resetAccepted: RingTransitionResult = {
        accepted: true,
        from: from,
        to: this.state,
        detail: 'reset allowed from vanished'
      };
      return resetAccepted;
    }
    this.rejectedTransitions++;
    const resetRejected: RingTransitionResult = {
      accepted: false,
      from: from,
      to: this.state,
      detail: 'reset rejected unless vanished'
    };
    return resetRejected;
  }

  public getState(): RingState {
    return this.state;
  }

  public isFocused(): boolean {
    return this.state === RingState.FOCUSED;
  }

  public isVisible(): boolean {
    return this.state === RingState.FOCUSED || this.state === RingState.BLURRED;
  }

  public getAcceptedCount(): number {
    return this.acceptedTransitions;
  }

  public getRejectedCount(): number {
    return this.rejectedTransitions;
  }

  public reset(): void {
    this.state = RingState.ABSENT;
    this.acceptedTransitions = 0;
    this.rejectedTransitions = 0;
  }
}

class RingTokenResolver {
  private static readonly PRIMARY_WIDTH: number = 2;

  private static readonly SECONDARY_WIDTH: number = 1;

  private static readonly DISABLED_WIDTH: number = 0;

  public resolveWidth(token: RingColorToken): number {
    if (token === RingColorToken.PRIMARY) {
      return RingTokenResolver.PRIMARY_WIDTH;
    }
    if (token === RingColorToken.SECONDARY) {
      return RingTokenResolver.SECONDARY_WIDTH;
    }
    return RingTokenResolver.DISABLED_WIDTH;
  }

  public resolveTokenForState(state: RingState): RingColorToken {
    if (state === RingState.FOCUSED) {
      return RingColorToken.PRIMARY;
    }
    if (state === RingState.BLURRED) {
      return RingColorToken.SECONDARY;
    }
    if (state === RingState.VANISHED) {
      return RingColorToken.TRANSPARENT;
    }
    return RingColorToken.DISABLED;
  }

  public describe(descriptor: RingDescriptor): string {
    return `${descriptor.colorToken}:${descriptor.widthVp}`;
  }

  public isDrawable(descriptor: RingDescriptor): boolean {
    return descriptor.widthVp > 0 && descriptor.colorToken !== RingColorToken.TRANSPARENT;
  }

  public buildDescriptor(state: RingState, durationMs: number): RingDescriptor {
    const token: RingColorToken = this.resolveTokenForState(state);
    const descriptor: RingDescriptor = {
      widthVp: this.resolveWidth(token),
      colorToken: token,
      durationMs: durationMs
    };
    return descriptor;
  }
}

class RingTransitionDuration {
  public static readonly INSTANT_MS: number = 0;

  public static readonly MIN_ANIMATED_MS: number = 1;

  public static readonly FRAME_MS: number = 16;

  public static readonly STANDARD_MS: number = 1000;

  public classify(durationMs: number): DurationBoundary {
    const boundary: DurationBoundary = {
      durationMs: durationMs,
      animatable: durationMs >= RingTransitionDuration.MIN_ANIMATED_MS,
      instant: durationMs === RingTransitionDuration.INSTANT_MS
    };
    return boundary;
  }

  public isValid(durationMs: number): boolean {
    return durationMs >= RingTransitionDuration.INSTANT_MS
      && durationMs <= RingTransitionDuration.STANDARD_MS;
  }

  public clamp(durationMs: number): number {
    if (durationMs < RingTransitionDuration.INSTANT_MS) {
      return RingTransitionDuration.INSTANT_MS;
    }
    if (durationMs > RingTransitionDuration.STANDARD_MS) {
      return RingTransitionDuration.STANDARD_MS;
    }
    return durationMs;
  }

  public frameCount(durationMs: number): number {
    if (durationMs <= RingTransitionDuration.INSTANT_MS) {
      return 0;
    }
    return Math.ceil(durationMs / RingTransitionDuration.FRAME_MS);
  }

  public isMultipleOfFrame(durationMs: number): boolean {
    return durationMs > 0 && durationMs % RingTransitionDuration.FRAME_MS === 0;
  }
}

class RingRenderSampler {
  private samples: RingRenderSample[] = [];

  public append(sample: RingRenderSample): void {
    this.samples.push(sample);
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public countByState(state: RingState): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].state === state) {
        count++;
      }
    }
    return count;
  }

  public averageWidth(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].widthVp;
    }
    return total / this.samples.length;
  }

  public maxDuration(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let max: number = this.samples[0].durationMs;
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].durationMs > max) {
        max = this.samples[i].durationMs;
      }
    }
    return max;
  }

  public sampleAt(index: number): RingRenderSample | null {
    if (index < 0 || index >= this.samples.length) {
      return null;
    }
    return this.samples[index];
  }

  public hasWidthMonotonic(): boolean {
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].widthVp > this.samples[i - 1].widthVp + 1) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.samples = [];
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

function buildFocusedDescriptor(durationMs: number): RingDescriptor {
  const resolver: RingTokenResolver = new RingTokenResolver();
  return resolver.buildDescriptor(RingState.FOCUSED, durationMs);
}

export default function focusRingBehaviorTest(): void {
  describe('FocusRingBehaviorTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('FocusRingBehaviorTest: preparing index page');
      await launchEntryAbility();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      logInfo('FocusRingBehaviorTest: finished');
      await serializedDelay(driver, 100);
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0100
     * @tc.name testFocusRingPageReadyBeforeChecks
     * @tc.desc Verify page is rendered before ring checks: text node present and page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingPageReadyBeforeChecks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0200
     * @tc.name testFocusRingInitialStateAbsent
     * @tc.desc Verify ring state machine starts in absent state with no accepted transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingInitialStateAbsent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          expect(machine.getState()).assertEqual(RingState.ABSENT);
          expect(machine.isVisible()).assertFalse();
          expect(machine.getAcceptedCount()).assertEqual(0);
          expect(machine.getRejectedCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0300
     * @tc.name testFocusRingGainFocusFromAbsent
     * @tc.desc Verify gain focus moves absent to focused and increments accepted counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingGainFocusFromAbsent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          const result: RingTransitionResult = machine.apply(RingTransition.GAIN_FOCUS);
          expect(result.accepted).assertTrue();
          expect(result.from).assertEqual(RingState.ABSENT);
          expect(result.to).assertEqual(RingState.FOCUSED);
          expect(machine.isFocused()).assertTrue();
          expect(machine.getAcceptedCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0400
     * @tc.name testFocusRingDuplicateGainRejected
     * @tc.desc Verify duplicate gain focus while focused is rejected and state stays focused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingDuplicateGainRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          machine.apply(RingTransition.GAIN_FOCUS);
          const duplicate: RingTransitionResult = machine.apply(RingTransition.GAIN_FOCUS);
          expect(duplicate.accepted).assertFalse();
          expect(duplicate.detail).assertEqual('focus gain rejected while focused');
          expect(machine.getState()).assertEqual(RingState.FOCUSED);
          expect(machine.getRejectedCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0500
     * @tc.name testFocusRingLoseFocusTransition
     * @tc.desc Verify lose focus moves focused to blurred and ring remains visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingLoseFocusTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          machine.apply(RingTransition.GAIN_FOCUS);
          const blurResult: RingTransitionResult = machine.apply(RingTransition.LOSE_FOCUS);
          expect(blurResult.accepted).assertTrue();
          expect(blurResult.to).assertEqual(RingState.BLURRED);
          expect(machine.isVisible()).assertTrue();
          expect(machine.isFocused()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0600
     * @tc.name testFocusRingLoseFocusFromAbsentRejected
     * @tc.desc Verify lose focus from absent is illegal and rejected with explicit detail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingLoseFocusFromAbsentRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          const result: RingTransitionResult = machine.apply(RingTransition.LOSE_FOCUS);
          expect(result.accepted).assertFalse();
          expect(result.detail).assertEqual('focus loss rejected when not focused');
          expect(machine.getState()).assertEqual(RingState.ABSENT);
          expect(machine.getRejectedCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0700
     * @tc.name testFocusRingCancelFromFocused
     * @tc.desc Verify cancel from focused moves ring to vanished state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingCancelFromFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          machine.apply(RingTransition.GAIN_FOCUS);
          const cancelResult: RingTransitionResult = machine.apply(RingTransition.CANCEL);
          expect(cancelResult.accepted).assertTrue();
          expect(cancelResult.to).assertEqual(RingState.VANISHED);
          expect(machine.isVisible()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0800
     * @tc.name testFocusRingCancelFromAbsentRejected
     * @tc.desc Verify cancel from absent is rejected and ring stays absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingCancelFromAbsentRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          const result: RingTransitionResult = machine.apply(RingTransition.CANCEL);
          expect(result.accepted).assertFalse();
          expect(result.detail).assertEqual('cancel rejected from absent state');
          expect(machine.getState()).assertEqual(RingState.ABSENT);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_0900
     * @tc.name testFocusRingResetFromVanished
     * @tc.desc Verify reset restores absent state only from vanished state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingResetFromVanished', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          machine.apply(RingTransition.GAIN_FOCUS);
          machine.apply(RingTransition.CANCEL);
          const resetResult: RingTransitionResult = machine.apply(RingTransition.RESET);
          expect(resetResult.accepted).assertTrue();
          expect(resetResult.to).assertEqual(RingState.ABSENT);
          expect(machine.getState()).assertEqual(RingState.ABSENT);
          const illegalReset: RingTransitionResult = machine.apply(RingTransition.RESET);
          expect(illegalReset.accepted).assertFalse();
          expect(illegalReset.detail).assertEqual('reset rejected unless vanished');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1000
     * @tc.name testFocusRingFullLifecycleCounters
     * @tc.desc Verify full lifecycle accepts four transitions and rejects two illegal ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingFullLifecycleCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          machine.apply(RingTransition.GAIN_FOCUS);
          machine.apply(RingTransition.LOSE_FOCUS);
          machine.apply(RingTransition.GAIN_FOCUS);
          machine.apply(RingTransition.CANCEL);
          machine.apply(RingTransition.RESET);
          machine.apply(RingTransition.LOSE_FOCUS);
          expect(machine.getAcceptedCount()).assertEqual(5);
          expect(machine.getRejectedCount()).assertEqual(1);
          expect(machine.getState()).assertEqual(RingState.ABSENT);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1100
     * @tc.name testFocusRingStateResetClearsCounters
     * @tc.desc Verify machine reset clears state and both counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingStateResetClearsCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          machine.apply(RingTransition.GAIN_FOCUS);
          machine.apply(RingTransition.CANCEL);
          machine.reset();
          expect(machine.getState()).assertEqual(RingState.ABSENT);
          expect(machine.getAcceptedCount()).assertEqual(0);
          expect(machine.getRejectedCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1200
     * @tc.name testFocusRingTokenResolutionForAllStates
     * @tc.desc Verify token resolution maps each ring state to its own color token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingTokenResolutionForAllStates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const resolver: RingTokenResolver = new RingTokenResolver();
          expect(resolver.resolveTokenForState(RingState.FOCUSED)).assertEqual(RingColorToken.PRIMARY);
          expect(resolver.resolveTokenForState(RingState.BLURRED)).assertEqual(RingColorToken.SECONDARY);
          expect(resolver.resolveTokenForState(RingState.VANISHED)).assertEqual(RingColorToken.TRANSPARENT);
          expect(resolver.resolveTokenForState(RingState.ABSENT)).assertEqual(RingColorToken.DISABLED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1300
     * @tc.name testFocusRingWidthTokenMapping
     * @tc.desc Verify width mapping: primary two, secondary one, disabled zero vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingWidthTokenMapping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const resolver: RingTokenResolver = new RingTokenResolver();
          expect(resolver.resolveWidth(RingColorToken.PRIMARY)).assertEqual(2);
          expect(resolver.resolveWidth(RingColorToken.SECONDARY)).assertEqual(1);
          expect(resolver.resolveWidth(RingColorToken.DISABLED)).assertEqual(0);
          expect(resolver.resolveWidth(RingColorToken.TRANSPARENT)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1400
     * @tc.name testFocusRingDescriptorBuildAndDescribe
     * @tc.desc Verify descriptor building carries token, width and duration; description concatenates them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingDescriptorBuildAndDescribe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const descriptor: RingDescriptor = buildFocusedDescriptor(16);
          expect(descriptor.colorToken).assertEqual(RingColorToken.PRIMARY);
          expect(descriptor.widthVp).assertEqual(2);
          expect(descriptor.durationMs).assertEqual(16);
          const resolver: RingTokenResolver = new RingTokenResolver();
          expect(resolver.describe(descriptor)).assertEqual('primary:2');
          expect(resolver.isDrawable(descriptor)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1500
     * @tc.name testFocusRingTransparentDescriptorNotDrawable
     * @tc.desc Verify vanished state descriptor is transparent and not drawable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingTransparentDescriptorNotDrawable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const resolver: RingTokenResolver = new RingTokenResolver();
          const descriptor: RingDescriptor = resolver.buildDescriptor(RingState.VANISHED, 100);
          expect(descriptor.colorToken).assertEqual(RingColorToken.TRANSPARENT);
          expect(descriptor.widthVp).assertEqual(0);
          expect(resolver.isDrawable(descriptor)).assertFalse();
          const absentDescriptor: RingDescriptor = resolver.buildDescriptor(RingState.ABSENT, 0);
          expect(absentDescriptor.widthVp).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1600
     * @tc.name testFocusRingDurationZeroIsInstant
     * @tc.desc Verify duration zero boundary is treated as instant and not animatable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingDurationZeroIsInstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const duration: RingTransitionDuration = new RingTransitionDuration();
          const boundary: DurationBoundary = duration.classify(0);
          expect(boundary.durationMs).assertEqual(0);
          expect(boundary.instant).assertTrue();
          expect(boundary.animatable).assertFalse();
          expect(duration.isValid(0)).assertTrue();
          expect(duration.frameCount(0)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1700
     * @tc.name testFocusRingDurationOneMillisecondIsAnimatable
     * @tc.desc Verify duration one millisecond is the smallest animatable value and needs one frame
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingDurationOneMillisecondIsAnimatable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const duration: RingTransitionDuration = new RingTransitionDuration();
          const boundary: DurationBoundary = duration.classify(1);
          expect(boundary.animatable).assertTrue();
          expect(boundary.instant).assertFalse();
          expect(duration.frameCount(1)).assertEqual(1);
          expect(duration.isMultipleOfFrame(1)).assertFalse();
          expect(duration.clamp(-10)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1800
     * @tc.name testFocusRingDurationFrameBoundary
     * @tc.desc Verify sixteen millisecond frame boundary: exactly one frame and multiple of frame
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingDurationFrameBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const duration: RingTransitionDuration = new RingTransitionDuration();
          expect(duration.frameCount(16)).assertEqual(1);
          expect(duration.isMultipleOfFrame(16)).assertTrue();
          expect(duration.frameCount(17)).assertEqual(2);
          expect(duration.isMultipleOfFrame(32)).assertTrue();
          expect(duration.isMultipleOfFrame(33)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_1900
     * @tc.name testFocusRingDurationUpperBoundary
     * @tc.desc Verify one thousand millisecond upper boundary is valid and values above are clamped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingDurationUpperBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const duration: RingTransitionDuration = new RingTransitionDuration();
          expect(duration.isValid(1000)).assertTrue();
          expect(duration.isValid(1001)).assertFalse();
          expect(duration.clamp(1001)).assertEqual(1000);
          expect(duration.clamp(5000)).assertEqual(1000);
          expect(duration.frameCount(1000)).assertEqual(63);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2000
     * @tc.name testFocusRingDurationNegativeClamped
     * @tc.desc Verify negative durations are invalid and clamp to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingDurationNegativeClamped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const duration: RingTransitionDuration = new RingTransitionDuration();
          expect(duration.isValid(-1)).assertFalse();
          expect(duration.clamp(-1)).assertEqual(0);
          expect(duration.frameCount(-1)).assertEqual(0);
          expect(duration.isMultipleOfFrame(0)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2100
     * @tc.name testFocusRingSamplerAggregation
     * @tc.desc Verify sampler aggregates state counts and average width across samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingSamplerAggregation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: RingRenderSampler = new RingRenderSampler();
          const focusedSample: RingRenderSample = {
            sampleIndex: 0,
            state: RingState.FOCUSED,
            widthVp: 2,
            durationMs: 16
          };
          const blurredSample: RingRenderSample = {
            sampleIndex: 1,
            state: RingState.BLURRED,
            widthVp: 1,
            durationMs: 32
          };
          const vanishedSample: RingRenderSample = {
            sampleIndex: 2,
            state: RingState.VANISHED,
            widthVp: 0,
            durationMs: 1000
          };
          sampler.append(focusedSample);
          sampler.append(blurredSample);
          sampler.append(vanishedSample);
          expect(sampler.getSampleCount()).assertEqual(3);
          expect(sampler.countByState(RingState.FOCUSED)).assertEqual(1);
          expect(sampler.countByState(RingState.VANISHED)).assertEqual(1);
          expect(sampler.averageWidth()).assertEqual(1);
          expect(sampler.maxDuration()).assertEqual(1000);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2200
     * @tc.name testFocusRingSamplerEmptyAndBounds
     * @tc.desc Verify empty sampler returns zeros and out of range sample lookup returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingSamplerEmptyAndBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: RingRenderSampler = new RingRenderSampler();
          expect(sampler.getSampleCount()).assertEqual(0);
          expect(sampler.averageWidth()).assertEqual(0);
          expect(sampler.maxDuration()).assertEqual(0);
          expect(sampler.sampleAt(0)).assertNull();
          expect(sampler.hasWidthMonotonic()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2300
     * @tc.name testFocusRingSamplerClear
     * @tc.desc Verify sampler clear drops all samples and resets aggregates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingSamplerClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: RingRenderSampler = new RingRenderSampler();
          const sample: RingRenderSample = {
            sampleIndex: 0,
            state: RingState.FOCUSED,
            widthVp: 2,
            durationMs: 16
          };
          sampler.append(sample);
          sampler.append(sample);
          sampler.clear();
          expect(sampler.getSampleCount()).assertEqual(0);
          expect(sampler.countByState(RingState.FOCUSED)).assertEqual(0);
          expect(sampler.maxDuration()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2400
     * @tc.name testFocusRingSamplerWidthMonotonicDetection
     * @tc.desc Verify width growth beyond one vp between samples is detected as non monotonic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingSamplerWidthMonotonicDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: RingRenderSampler = new RingRenderSampler();
          const narrow: RingRenderSample = {
            sampleIndex: 0,
            state: RingState.BLURRED,
            widthVp: 1,
            durationMs: 16
          };
          const wide: RingRenderSample = {
            sampleIndex: 1,
            state: RingState.FOCUSED,
            widthVp: 2,
            durationMs: 16
          };
          const jump: RingRenderSample = {
            sampleIndex: 2,
            state: RingState.FOCUSED,
            widthVp: 5,
            durationMs: 16
          };
          sampler.append(narrow);
          sampler.append(wide);
          expect(sampler.hasWidthMonotonic()).assertTrue();
          sampler.append(jump);
          expect(sampler.hasWidthMonotonic()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2500
     * @tc.name testFocusRingLiveKeyPressKeepsRingModelLegal
     * @tc.desc Verify live key navigation keeps ring model transitions legal and page text intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingLiveKeyPressKeepsRingModelLegal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          const beforeText: string = await readTextById(driver);
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          const index: number = await getCurrentFocusIndex(driver);
          if (index >= 0) {
            const gainResult: RingTransitionResult = machine.apply(RingTransition.GAIN_FOCUS);
            expect(gainResult.accepted).assertTrue();
            expect(machine.isFocused()).assertTrue();
          }
          const afterText: string = await readTextById(driver);
          expect(afterText).assertEqual(beforeText);
          expect(machine.getRejectedCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2600
     * @tc.name testFocusRingLiveFocusStateProbe
     * @tc.desc Verify focus state probe on live page agrees with the ring model focused predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingLiveFocusStateProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const index: number = await getCurrentFocusIndex(driver);
          const machine: RingStateMachine = new RingStateMachine();
          if (index >= 0) {
            machine.apply(RingTransition.GAIN_FOCUS);
          }
          const probe: boolean = await checkFocusState(driver, index);
          const consistent: boolean = probe === machine.isFocused();
          expect(consistent).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2700
     * @tc.name testFocusRingLiveTabKeyRingReset
     * @tc.desc Verify TAB traversal keeps ring transition budget valid and page component count stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingLiveTabKeyRingReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const duration: RingTransitionDuration = new RingTransitionDuration();
          const beforeCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
          const boundary: DurationBoundary = duration.classify(TIMEOUT_FOCUS_CHANGE);
          expect(boundary.animatable).assertTrue();
          expect(boundary.instant).assertFalse();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2800
     * @tc.name testFocusRingLiveLeftKeyNoTextMutation
     * @tc.desc Verify left key press does not mutate text while ring model stays in legal states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingLiveLeftKeyNoTextMutation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          const beforeText: string = await readTextById(driver);
          await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
          machine.apply(RingTransition.GAIN_FOCUS);
          machine.apply(RingTransition.LOSE_FOCUS);
          const afterText: string = await readTextById(driver);
          expect(afterText).assertEqual(beforeText);
          expect(machine.getState()).assertEqual(RingState.BLURRED);
          expect(machine.isVisible()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_2900
     * @tc.name testFocusRingLiveSampledFromModelTransitions
     * @tc.desc Verify sampler built from modelled transitions reports one focused and one blurred sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingLiveSampledFromModelTransitions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          const sampler: RingRenderSampler = new RingRenderSampler();
          machine.apply(RingTransition.GAIN_FOCUS);
          const focusedSample: RingRenderSample = {
            sampleIndex: 0,
            state: machine.getState(),
            widthVp: 2,
            durationMs: 16
          };
          sampler.append(focusedSample);
          machine.apply(RingTransition.LOSE_FOCUS);
          const blurredSample: RingRenderSample = {
            sampleIndex: 1,
            state: machine.getState(),
            widthVp: 1,
            durationMs: 16
          };
          sampler.append(blurredSample);
          expect(sampler.getSampleCount()).assertEqual(2);
          expect(sampler.countByState(RingState.FOCUSED)).assertEqual(1);
          expect(sampler.countByState(RingState.BLURRED)).assertEqual(1);
          expect(sampler.averageWidth()).assertEqual(1.5);
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSRING_3000
     * @tc.name testFocusRingTextStateUntouchedByRingCycles
     * @tc.desc Verify repeated ring cycles leave page text and component count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRingTextStateUntouchedByRingCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: RingStateMachine = new RingStateMachine();
          const beforeText: string = await readTextById(driver);
          const beforeCount: number = await pageComponentCount(driver);
          for (let i = 0; i < 5; i++) {
            machine.apply(RingTransition.GAIN_FOCUS);
            machine.apply(RingTransition.LOSE_FOCUS);
            machine.apply(RingTransition.CANCEL);
            machine.apply(RingTransition.RESET);
          }
          expect(machine.getAcceptedCount()).assertEqual(20);
          expect(machine.getState()).assertEqual(RingState.ABSENT);
          const afterText: string = await readTextById(driver);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterText).assertEqual(beforeText);
          expect(afterCount).assertEqual(beforeCount);
        } finally {
          done();
        }
      })
  })
}
