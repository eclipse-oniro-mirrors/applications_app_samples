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

const MAX_STEPS: number = 16;

const MIN_DURATION: number = 1;

const MAX_DURATION: number = 5000;

const MIN_DELAY: number = 0;

const MAX_DELAY: number = 2000;

interface AnimationStep {
  name: string;
  order: number;
  durationMs: number;
  delayMs: number;
}

// Compose ordered animation steps
class AnimationSequence {
  private steps: AnimationStep[] = [];

  public add(name: string, order: number, durationMs: number, delayMs: number = 0): boolean {
    if (name.length === 0 || this.has(name) || this.steps.length >= MAX_STEPS) {
      return false;
    }
    if (durationMs < MIN_DURATION || durationMs > MAX_DURATION) {
      return false;
    }
    if (delayMs < MIN_DELAY || delayMs > MAX_DELAY) {
      return false;
    }
    this.steps.push({
      name: name,
      order: order,
      durationMs: durationMs,
      delayMs: delayMs
    });
    return true;
  }

  public has(name: string): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].name === name) {
        return true;
      }
    }
    return false;
  }

  public sorted(): AnimationStep[] {
    return [...this.steps].sort((left: AnimationStep, right: AnimationStep) =>
      left.order - right.order);
  }

  public totalDuration(): number {
    let total: number = 0;
    const ordered = this.sorted();
    for (let i = 0; i < ordered.length; i++) {
      total += ordered[i].delayMs + ordered[i].durationMs;
    }
    return total;
  }

  public size(): number {
    return this.steps.length;
  }

  public isOrdered(): boolean {
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].order < this.steps[i - 1].order) {
        return false;
      }
    }
    return true;
  }

  public names(): string[] {
    return this.sorted().map((step: AnimationStep) => step.name);
  }

  public clear(): void {
    this.steps = [];
  }
}

// Plays steps sequentially and tracks progress
class SequencePlayer {
  private sequence: AnimationSequence;
  private current: number = 0;
  private elapsed: number = 0;
  private playing: boolean = false;

  constructor(sequence: AnimationSequence) {
    this.sequence = sequence;
  }

  public play(): boolean {
    if (this.playing || this.sequence.size() === 0) {
      return false;
    }
    this.playing = true;
    this.current = 0;
    this.elapsed = 0;
    return true;
  }

  public tick(deltaMs: number): boolean {
    if (!this.playing || deltaMs <= 0) {
      return false;
    }
    const ordered = this.sequence.sorted();
    this.elapsed += deltaMs;
    let accumulated: number = 0;
    for (let i = 0; i < ordered.length; i++) {
      accumulated += ordered[i].delayMs + ordered[i].durationMs;
      if (this.elapsed < accumulated) {
        this.current = i;
        return false;
      }
    }
    this.current = ordered.length;
    this.playing = false;
    return true;
  }

  public currentStep(): string {
    const ordered = this.sequence.sorted();
    return this.current >= ordered.length ? '' : ordered[this.current].name;
  }

  public getCurrentIndex(): number {
    return this.current;
  }

  public getElapsed(): number {
    return this.elapsed;
  }

  public isPlaying(): boolean {
    return this.playing;
  }

  public isComplete(): boolean {
    return this.current >= this.sequence.size();
  }

  public reset(): void {
    this.current = 0;
    this.elapsed = 0;
    this.playing = false;
  }
}

// Builds the default dialog enter/exit sequences
class SequenceFactory {
  public static enter(): AnimationSequence {
    const sequence = new AnimationSequence();
    sequence.add('fadeIn', 1, 150, 0);
    sequence.add('scaleUp', 2, 200, 50);
    sequence.add('focusRing', 3, 100, 0);
    return sequence;
  }

  public static exit(): AnimationSequence {
    const sequence = new AnimationSequence();
    sequence.add('scaleDown', 1, 150, 0);
    sequence.add('fadeOut', 2, 120, 30);
    return sequence;
  }

  public static names(): string[] {
    return ['enter', 'exit'];
  }
}

// Validates timing budgets for sequences
class SequenceTimingValidator {
  public static isWithinBudget(sequence: AnimationSequence, budgetMs: number): boolean {
    return sequence.totalDuration() <= budgetMs;
  }

  public static hasOverlap(sequence: AnimationSequence): boolean {
    let previousEnd: number = 0;
    const ordered = sequence.sorted();
    for (let i = 0; i < ordered.length; i++) {
      const start = previousEnd + ordered[i].delayMs;
      if (i > 0 && start < previousEnd) {
        return true;
      }
      previousEnd = start + ordered[i].durationMs;
    }
    return false;
  }

  public static averageStep(sequence: AnimationSequence): number {
    return sequence.size() === 0 ? 0 : sequence.totalDuration() / sequence.size();
  }

  public static frameCount(sequence: AnimationSequence, fps: number): number {
    return fps <= 0 ? 0 : Math.round(sequence.totalDuration() * fps / 1000);
  }
}

export default function animationSequencingTest() {
  describe('AnimationSequencingTest', () => {

    it('sequence_should_add_steps', 0, () => {
      const sequence = new AnimationSequence();
      expect(sequence.add('fade', 1, 150)).assertTrue();
      expect(sequence.add('fade', 2, 150)).assertFalse();
      expect(sequence.add('', 2, 150)).assertFalse();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.has('fade')).assertTrue();
      expect(sequence.has('missing')).assertFalse();
    });

    it('sequence_should_validate_timing', 0, () => {
      const sequence = new AnimationSequence();
      expect(sequence.add('zero', 1, 0)).assertFalse();
      expect(sequence.add('tooLong', 1, MAX_DURATION + 1)).assertFalse();
      expect(sequence.add('badDelay', 1, 100, MAX_DELAY + 1)).assertFalse();
      expect(sequence.add('ok', 1, MIN_DURATION, MIN_DELAY)).assertTrue();
      expect(sequence.size()).assertEqual(1);
    });

    it('sequence_should_sort_and_sum', 0, () => {
      const sequence = new AnimationSequence();
      sequence.add('second', 2, 200, 50);
      sequence.add('first', 1, 100, 0);
      expect(sequence.isOrdered()).assertFalse();
      expect(sequence.names()).assertDeepEquals(['first', 'second']);
      expect(sequence.totalDuration()).assertEqual(350);
      expect(sequence.size()).assertEqual(2);
    });

    it('sequence_should_enforce_capacity', 0, () => {
      const sequence = new AnimationSequence();
      for (let i = 0; i < MAX_STEPS; i++) {
        expect(sequence.add(`step-${i}`, i, 100)).assertTrue();
      }
      expect(sequence.add('overflow', MAX_STEPS, 100)).assertFalse();
      expect(sequence.size()).assertEqual(MAX_STEPS);
      sequence.clear();
      expect(sequence.size()).assertEqual(0);
    });

    it('player_should_play_sequence', 0, () => {
      const sequence = new AnimationSequence();
      sequence.add('first', 1, 100);
      sequence.add('second', 2, 100);
      const player = new SequencePlayer(sequence);
      expect(player.play()).assertTrue();
      expect(player.isPlaying()).assertTrue();
      expect(player.currentStep()).assertEqual('first');
      expect(player.tick(50)).assertFalse();
      expect(player.getElapsed()).assertEqual(50);
      expect(player.isComplete()).assertFalse();
    });

    it('player_should_advance_steps', 0, () => {
      const sequence = new AnimationSequence();
      sequence.add('first', 1, 100);
      sequence.add('second', 2, 100);
      const player = new SequencePlayer(sequence);
      player.play();
      expect(player.tick(100)).assertFalse();
      expect(player.currentStep()).assertEqual('second');
      expect(player.getCurrentIndex()).assertEqual(1);
      expect(player.tick(100)).assertTrue();
      expect(player.isComplete()).assertTrue();
      expect(player.currentStep()).assertEqual('');
    });

    it('player_should_reject_invalid_play', 0, () => {
      const empty = new AnimationSequence();
      const player = new SequencePlayer(empty);
      expect(player.play()).assertFalse();
      expect(player.isPlaying()).assertFalse();
      expect(player.tick(10)).assertFalse();
      const sequence = new AnimationSequence();
      sequence.add('step', 1, 100);
      player.play();
      expect(player.play()).assertFalse();
      expect(player.tick(0)).assertFalse();
      expect(player.tick(-1)).assertFalse();
    });

    it('player_should_reset', 0, () => {
      const sequence = SequenceFactory.enter();
      const player = new SequencePlayer(sequence);
      player.play();
      player.tick(100);
      expect(player.getElapsed()).assertEqual(100);
      player.reset();
      expect(player.getElapsed()).assertEqual(0);
      expect(player.getCurrentIndex()).assertEqual(0);
      expect(player.isPlaying()).assertFalse();
      expect(player.isComplete()).assertFalse();
    });

    it('factory_should_build_default_sequences', 0, () => {
      const enter = SequenceFactory.enter();
      const exit = SequenceFactory.exit();
      expect(enter.size()).assertEqual(3);
      expect(exit.size()).assertEqual(2);
      expect(SequenceFactory.names().length).assertEqual(2);
      expect(enter.totalDuration()).assertEqual(500);
      expect(exit.totalDuration()).assertEqual(300);
    });

    it('validator_should_check_timing_budget', 0, () => {
      const enter = SequenceFactory.enter();
      expect(SequenceTimingValidator.isWithinBudget(enter, 600)).assertTrue();
      expect(SequenceTimingValidator.isWithinBudget(enter, 400)).assertFalse();
      expect(SequenceTimingValidator.hasOverlap(enter)).assertFalse();
      expect(SequenceTimingValidator.averageStep(enter)).assertClose(166.667, 0.01);
      expect(SequenceTimingValidator.frameCount(enter, 60)).assertEqual(30);
      expect(SequenceTimingValidator.frameCount(enter, 0)).assertEqual(0);
    });

    it('sequence_flow_should_play_enter', 0, () => {
      const sequence = SequenceFactory.enter();
      const player = new SequencePlayer(sequence);
      expect(SequenceTimingValidator.isWithinBudget(sequence, 600)).assertTrue();
      player.play();
      const ticks: number[] = [100, 100, 100, 100, 100];
      let completed: boolean = false;
      for (let i = 0; i < ticks.length; i++) {
        completed = player.tick(ticks[i]);
      }
      expect(completed).assertTrue();
      expect(player.isComplete()).assertTrue();
      expect(player.getElapsed()).assertEqual(500);
      expect(SequenceTimingValidator.hasOverlap(sequence)).assertFalse();
    });

    it('animation_sequence_constants_should_be_stable', 0, () => {
      expect(MAX_STEPS).assertEqual(16);
      expect(MIN_DURATION).assertEqual(1);
      expect(MAX_DURATION).assertEqual(5000);
      expect(MIN_DELAY).assertEqual(0);
      expect(MAX_DELAY).assertEqual(2000);
    });
  });
}

