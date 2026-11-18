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

const GESTURE_TAP: string = 'tap';

const GESTURE_LONG_PRESS: string = 'longPress';

const GESTURE_SWIPE_LEFT: string = 'swipeLeft';

const GESTURE_SWIPE_RIGHT: string = 'swipeRight';

const GESTURE_SWIPE_UP: string = 'swipeUp';

const GESTURE_SWIPE_DOWN: string = 'swipeDown';

const MAX_SEQUENCE_STEPS: number = 10;

const MAX_STEP_GAP_MS: number = 1000;

const KNOWN_GESTURES: string[] = [
  GESTURE_TAP, GESTURE_LONG_PRESS,
  GESTURE_SWIPE_LEFT, GESTURE_SWIPE_RIGHT,
  GESTURE_SWIPE_UP, GESTURE_SWIPE_DOWN
];

interface GestureStep {
  gesture: string;
  gapMs: number;
}

// Builds and validates gesture sequences
class GestureSequence {
  private steps: GestureStep[] = [];

  public add(gesture: string, gapMs: number = 0): boolean {
    if (!GestureSequence.isKnown(gesture) || this.steps.length >= MAX_SEQUENCE_STEPS) {
      return false;
    }
    if (gapMs < 0 || gapMs > MAX_STEP_GAP_MS) {
      return false;
    }
    this.steps.push({ gesture: gesture, gapMs: gapMs });
    return true;
  }

  public static isKnown(gesture: string): boolean {
    return KNOWN_GESTURES.includes(gesture);
  }

  public size(): number {
    return this.steps.length;
  }

  public getSteps(): GestureStep[] {
    return this.steps.map((step: GestureStep) => {
      return { gesture: step.gesture, gapMs: step.gapMs } as GestureStep;
    });
  }

  public totalGap(): number {
    let total: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      total += this.steps[i].gapMs;
    }
    return total;
  }

  public gestures(): string[] {
    return this.steps.map((step: GestureStep) => step.gesture);
  }

  public countOf(gesture: string): number {
    return this.steps.filter((step: GestureStep) => step.gesture === gesture).length;
  }

  public isDirectional(): boolean {
    if (this.steps.length === 0) {
      return false;
    }
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].gesture === GESTURE_TAP || this.steps[i].gesture === GESTURE_LONG_PRESS) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.steps = [];
  }
}

// Matches expected sequences against recorded ones
class GestureMatcher {
  public static matches(expected: GestureSequence, recorded: string[]): boolean {
    const gestures = expected.gestures();
    if (gestures.length !== recorded.length) {
      return false;
    }
    for (let i = 0; i < gestures.length; i++) {
      if (gestures[i] !== recorded[i]) {
        return false;
      }
    }
    return true;
  }

  public static matchesPrefix(expected: GestureSequence, recorded: string[]): boolean {
    const gestures = expected.gestures();
    if (recorded.length > gestures.length) {
      return false;
    }
    for (let i = 0; i < recorded.length; i++) {
      if (gestures[i] !== recorded[i]) {
        return false;
      }
    }
    return true;
  }

  public static firstMismatch(expected: GestureSequence, recorded: string[]): number {
    const gestures = expected.gestures();
    const count = Math.min(gestures.length, recorded.length);
    for (let i = 0; i < count; i++) {
      if (gestures[i] !== recorded[i]) {
        return i;
      }
    }
    return gestures.length === recorded.length ? -1 : count;
  }

  public static contains(expected: GestureSequence, recorded: string[]): boolean {
    const gestures = expected.gestures();
    if (gestures.length === 0 || recorded.length < gestures.length) {
      return false;
    }
    for (let start = 0; start <= recorded.length - gestures.length; start++) {
      let matched: boolean = true;
      for (let i = 0; i < gestures.length; i++) {
        if (recorded[start + i] !== gestures[i]) {
          matched = false;
          break;
        }
      }
      if (matched) {
        return true;
      }
    }
    return false;
  }
}

// Plays a gesture sequence step by step
class GesturePlayer {
  private sequence: GestureSequence;
  private index: number = 0;
  private elapsed: number = 0;
  private playing: boolean = false;

  constructor(sequence: GestureSequence) {
    this.sequence = sequence;
  }

  public start(): boolean {
    if (this.playing || this.sequence.size() === 0) {
      return false;
    }
    this.playing = true;
    this.index = 0;
    this.elapsed = 0;
    return true;
  }

  public advance(): string {
    if (!this.playing) {
      return '';
    }
    const steps = this.sequence.getSteps();
    if (this.index >= steps.length) {
      this.playing = false;
      return '';
    }
    const gesture = steps[this.index].gesture;
    this.elapsed += steps[this.index].gapMs;
    this.index++;
    if (this.index >= steps.length) {
      this.playing = false;
    }
    return gesture;
  }

  public currentGesture(): string {
    const steps = this.sequence.getSteps();
    return this.index >= steps.length ? '' : steps[this.index].gesture;
  }

  public getIndex(): number {
    return this.index;
  }

  public getElapsed(): number {
    return this.elapsed;
  }

  public isPlaying(): boolean {
    return this.playing;
  }

  public isComplete(): boolean {
    return this.index >= this.sequence.size();
  }

  public reset(): void {
    this.index = 0;
    this.elapsed = 0;
    this.playing = false;
  }
}

// Produces a pass/fail summary for gesture tests
class GestureReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function gestureSequenceTest() {
  describe('GestureSequence_Test', () => {

    it('sequence_should_add_known_gestures', 0, () => {
      const sequence = new GestureSequence();
      expect(sequence.add(GESTURE_TAP)).assertTrue();
      expect(sequence.add(GESTURE_LONG_PRESS)).assertTrue();
      expect(sequence.add(GESTURE_SWIPE_LEFT)).assertTrue();
      expect(sequence.size()).assertEqual(3);
      expect(sequence.gestures()).assertDeepEquals([GESTURE_TAP, GESTURE_LONG_PRESS, GESTURE_SWIPE_LEFT]);
    });

    it('sequence_should_reject_unknown_gestures', 0, () => {
      const sequence = new GestureSequence();
      expect(sequence.add('doubleTap')).assertFalse();
      expect(sequence.add('')).assertFalse();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.isDirectional()).assertFalse();
    });

    it('sequence_should_validate_gaps', 0, () => {
      const sequence = new GestureSequence();
      expect(sequence.add(GESTURE_TAP, -1)).assertFalse();
      expect(sequence.add(GESTURE_TAP, MAX_STEP_GAP_MS + 1)).assertFalse();
      expect(sequence.add(GESTURE_TAP, MAX_STEP_GAP_MS)).assertTrue();
      expect(sequence.totalGap()).assertEqual(MAX_STEP_GAP_MS);
    });

    it('sequence_should_sum_gaps', 0, () => {
      const sequence = new GestureSequence();
      sequence.add(GESTURE_TAP, 100);
      sequence.add(GESTURE_SWIPE_RIGHT, 200);
      sequence.add(GESTURE_SWIPE_UP, 300);
      expect(sequence.totalGap()).assertEqual(600);
      expect(sequence.countOf(GESTURE_TAP)).assertEqual(1);
      expect(sequence.countOf(GESTURE_SWIPE_DOWN)).assertEqual(0);
    });

    it('sequence_should_detect_directional_sequences', 0, () => {
      const directional = new GestureSequence();
      directional.add(GESTURE_SWIPE_LEFT);
      directional.add(GESTURE_SWIPE_UP);
      expect(directional.isDirectional()).assertTrue();
      const mixed = new GestureSequence();
      mixed.add(GESTURE_SWIPE_LEFT);
      mixed.add(GESTURE_TAP);
      expect(mixed.isDirectional()).assertFalse();
      const press = new GestureSequence();
      press.add(GESTURE_LONG_PRESS);
      expect(press.isDirectional()).assertFalse();
    });

    it('sequence_should_enforce_capacity', 0, () => {
      const sequence = new GestureSequence();
      for (let i = 0; i < MAX_SEQUENCE_STEPS; i++) {
        expect(sequence.add(GESTURE_TAP)).assertTrue();
      }
      expect(sequence.add(GESTURE_TAP)).assertFalse();
      expect(sequence.size()).assertEqual(MAX_SEQUENCE_STEPS);
      sequence.clear();
      expect(sequence.size()).assertEqual(0);
    });

    it('sequence_should_copy_steps', 0, () => {
      const sequence = new GestureSequence();
      sequence.add(GESTURE_TAP, 100);
      const steps = sequence.getSteps();
      steps.push({ gesture: GESTURE_LONG_PRESS, gapMs: 0 });
      steps[0].gapMs = 500;
      expect(sequence.size()).assertEqual(1);
      expect(sequence.totalGap()).assertEqual(100);
    });

    it('matcher_should_match_exact_sequence', 0, () => {
      const expected = new GestureSequence();
      expected.add(GESTURE_SWIPE_LEFT);
      expected.add(GESTURE_TAP);
      expect(GestureMatcher.matches(expected, [GESTURE_SWIPE_LEFT, GESTURE_TAP])).assertTrue();
      expect(GestureMatcher.matches(expected, [GESTURE_SWIPE_LEFT])).assertFalse();
      expect(GestureMatcher.matches(expected, [GESTURE_TAP, GESTURE_SWIPE_LEFT])).assertFalse();
    });

    it('matcher_should_match_prefix', 0, () => {
      const expected = new GestureSequence();
      expected.add(GESTURE_SWIPE_DOWN);
      expected.add(GESTURE_SWIPE_DOWN);
      expected.add(GESTURE_TAP);
      expect(GestureMatcher.matchesPrefix(expected, [GESTURE_SWIPE_DOWN])).assertTrue();
      expect(GestureMatcher.matchesPrefix(expected, [GESTURE_SWIPE_DOWN, GESTURE_SWIPE_DOWN]))
        .assertTrue();
      expect(GestureMatcher.matchesPrefix(expected, [GESTURE_SWIPE_UP])).assertFalse();
      expect(GestureMatcher.matchesPrefix(expected,
        [GESTURE_SWIPE_DOWN, GESTURE_SWIPE_DOWN, GESTURE_TAP, GESTURE_TAP])).assertFalse();
    });

    it('matcher_should_report_first_mismatch', 0, () => {
      const expected = new GestureSequence();
      expected.add(GESTURE_TAP);
      expected.add(GESTURE_SWIPE_LEFT);
      expected.add(GESTURE_LONG_PRESS);
      expect(GestureMatcher.firstMismatch(expected,
        [GESTURE_TAP, GESTURE_SWIPE_LEFT, GESTURE_LONG_PRESS])).assertEqual(-1);
      expect(GestureMatcher.firstMismatch(expected,
        [GESTURE_TAP, GESTURE_SWIPE_RIGHT, GESTURE_LONG_PRESS])).assertEqual(1);
      expect(GestureMatcher.firstMismatch(expected, [GESTURE_TAP])).assertEqual(1);
    });

    it('matcher_should_find_subsequence', 0, () => {
      const expected = new GestureSequence();
      expected.add(GESTURE_SWIPE_UP);
      expected.add(GESTURE_TAP);
      const recorded: string[] = [GESTURE_SWIPE_DOWN, GESTURE_SWIPE_UP, GESTURE_TAP, GESTURE_TAP];
      expect(GestureMatcher.contains(expected, recorded)).assertTrue();
      expect(GestureMatcher.contains(expected, [GESTURE_TAP, GESTURE_SWIPE_UP])).assertFalse();
      expect(GestureMatcher.contains(new GestureSequence(), recorded)).assertFalse();
    });

    it('player_should_play_all_steps', 0, () => {
      const sequence = new GestureSequence();
      sequence.add(GESTURE_SWIPE_LEFT, 100);
      sequence.add(GESTURE_TAP, 50);
      sequence.add(GESTURE_LONG_PRESS, 0);
      const player = new GesturePlayer(sequence);
      expect(player.start()).assertTrue();
      expect(player.isPlaying()).assertTrue();
      expect(player.currentGesture()).assertEqual(GESTURE_SWIPE_LEFT);
      expect(player.advance()).assertEqual(GESTURE_SWIPE_LEFT);
      expect(player.advance()).assertEqual(GESTURE_TAP);
      expect(player.advance()).assertEqual(GESTURE_LONG_PRESS);
      expect(player.isComplete()).assertTrue();
      expect(player.advance()).assertEqual('');
      expect(player.getElapsed()).assertEqual(150);
    });

    it('player_should_reject_invalid_start', 0, () => {
      const empty = new GestureSequence();
      const player = new GesturePlayer(empty);
      expect(player.start()).assertFalse();
      expect(player.advance()).assertEqual('');
      const sequence = new GestureSequence();
      sequence.add(GESTURE_TAP);
      player.start();
      expect(player.start()).assertFalse();
      player.reset();
      expect(player.isPlaying()).assertFalse();
      expect(player.getIndex()).assertEqual(0);
      expect(player.getElapsed()).assertEqual(0);
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new GestureReport();
      report.check('exact', true);
      report.check('prefix', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('subsequence', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['subsequence']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('gesture_flow_should_match_remote_navigation', 0, () => {
      const expected = new GestureSequence();
      expected.add(GESTURE_SWIPE_DOWN, 80);
      expected.add(GESTURE_SWIPE_DOWN, 80);
      expected.add(GESTURE_TAP, 0);
      const player = new GesturePlayer(expected);
      const report = new GestureReport();
      player.start();
      const recorded: string[] = [];
      let gesture = player.advance();
      while (gesture !== '') {
        recorded.push(gesture);
        gesture = player.advance();
      }
      report.check('count', recorded.length === 3);
      report.check('exact', GestureMatcher.matches(expected, recorded));
      report.check('directionalPrefix', GestureMatcher.matchesPrefix(expected, recorded.slice(0, 2)));
      expect(report.isPassed()).assertTrue();
      expect(expected.totalGap()).assertEqual(160);
      expect(player.isComplete()).assertTrue();
    });

    it('gesture_flow_should_accept_subsequence', 0, () => {
      const expected = new GestureSequence();
      expected.add(GESTURE_SWIPE_RIGHT);
      expected.add(GESTURE_SWIPE_RIGHT);
      const recorded: string[] = [
        GESTURE_SWIPE_LEFT, GESTURE_SWIPE_RIGHT, GESTURE_SWIPE_RIGHT, GESTURE_TAP
      ];
      expect(GestureMatcher.contains(expected, recorded)).assertTrue();
      expect(GestureMatcher.firstMismatch(expected, recorded)).assertEqual(0);
      expect(GestureMatcher.matches(expected, recorded)).assertFalse();
      expect(GestureSequence.isKnown(GESTURE_SWIPE_RIGHT)).assertTrue();
    });

    it('gesture_constants_should_be_stable', 0, () => {
      expect(GESTURE_TAP).assertEqual('tap');
      expect(GESTURE_LONG_PRESS).assertEqual('longPress');
      expect(GESTURE_SWIPE_LEFT).assertEqual('swipeLeft');
      expect(GESTURE_SWIPE_RIGHT).assertEqual('swipeRight');
      expect(GESTURE_SWIPE_UP).assertEqual('swipeUp');
      expect(GESTURE_SWIPE_DOWN).assertEqual('swipeDown');
      expect(MAX_SEQUENCE_STEPS).assertEqual(10);
      expect(MAX_STEP_GAP_MS).assertEqual(1000);
      expect(KNOWN_GESTURES.length).assertEqual(6);
    });
  });
}


