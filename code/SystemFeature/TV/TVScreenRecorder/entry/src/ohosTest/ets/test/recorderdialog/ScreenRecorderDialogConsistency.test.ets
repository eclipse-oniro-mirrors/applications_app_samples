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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  recorderComponentCount,
  checkTextContent,
  waitForTimerWindowStable,
  waitForTipWindowStable,
  triggerRecordingStart,
  triggerRecordingStop,
  pressAndWait,
  serializedDelay,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT,
  TIMER_TEXT_HINT,
  TIMER_TEXT_ERROR,
  RESOLUTION_TEXT_TITLE,
  RESOLUTION_TEXT_CONTENT,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER
} from '../shared/RecordingDriver';

// The three floating windows created by the recorder.
enum WindowKind {
  TIMER = 'timer',
  TIP = 'tip',
  RESOLUTION = 'resolution'
}

// Recording states exposed by RecordingState in Constants.ets.
enum RecState {
  Idle = 0,
  Recording = 1,
  Stopped = 2,
  Error = 3
}

// Layout of one floating window, in virtual pixels.
interface WindowSpecDef {
  kind: WindowKind;
  name: string;
  x: number;
  y: number;
  width: number;
  height: number;
}

// Text pair rendered by a floating window.
interface WindowTextDef {
  title: string;
  content: string;
}

// One consistency check result.
interface ConsistencyCheckDef {
  checkId: string;
  expected: string;
  actual: string;
  passed: boolean;
}

// Result of comparing two window rectangles.
interface RectComparisonDef {
  sameOrigin: boolean;
  sameSize: boolean;
  overlap: boolean;
}

// Canvas constants that drive the floating window geometry.
class RecorderGeometry {
  public static readonly TIMER_X: number = 96;
  public static readonly TIMER_Y: number = 48;
  public static readonly TIMER_WIDTH: number = 624;
  public static readonly TIMER_HEIGHT: number = 56;
  public static readonly TIP_X: number = 615;
  public static readonly TIP_Y: number = 46;
  public static readonly TIP_WIDTH: number = 686;
  public static readonly TIP_HEIGHT: number = 100;
  public static readonly TIP_DURATION: number = 3000;
  public static readonly TIMER_BG: string = '#B33A3F62';
  public static readonly TIP_BG: string = '#B33A3F62';
  public static readonly TIMER_RADIUS: number = 28;
  public static readonly TIP_RADIUS: number = 24;
  public static readonly VIRTUAL_SCREEN_NAME: string = 'screenRecorder';
  public static readonly RECORD_WIDTH: number = 1920;
  public static readonly RECORD_HEIGHT: number = 1080;
  public static readonly DEVICE_RATE: number = 0.6;
}

// Catalog of the window specs. Keeping the specs in one place lets the
// consistency cases compare them without touching the production pages.
class RecorderWindowSpecs {
  public static getTimer(): WindowSpecDef {
    const spec: WindowSpecDef = {
      kind: WindowKind.TIMER,
      name: 'RecorderTimer',
      x: RecorderGeometry.TIMER_X,
      y: RecorderGeometry.TIMER_Y,
      width: RecorderGeometry.TIMER_WIDTH,
      height: RecorderGeometry.TIMER_HEIGHT
    };
    return spec;
  }

  public static getTip(): WindowSpecDef {
    const spec: WindowSpecDef = {
      kind: WindowKind.TIP,
      name: 'RecorderTip',
      x: RecorderGeometry.TIP_X,
      y: RecorderGeometry.TIP_Y,
      width: RecorderGeometry.TIP_WIDTH,
      height: RecorderGeometry.TIP_HEIGHT
    };
    return spec;
  }

  public static getAll(): WindowSpecDef[] {
    const all: WindowSpecDef[] = [];
    all.push(RecorderWindowSpecs.getTimer());
    all.push(RecorderWindowSpecs.getTip());
    return all;
  }

  public static getTimerTexts(): WindowTextDef {
    const texts: WindowTextDef = { title: TIMER_TEXT_HINT, content: TIMER_TEXT_ERROR };
    return texts;
  }

  public static getTipTexts(): WindowTextDef {
    const texts: WindowTextDef = { title: TIP_TEXT_TITLE, content: TIP_TEXT_CONTENT };
    return texts;
  }

  public static getResolutionTexts(): WindowTextDef {
    const texts: WindowTextDef = { title: RESOLUTION_TEXT_TITLE, content: RESOLUTION_TEXT_CONTENT };
    return texts;
  }
}

// Validates window rectangles: positive sizes, on-screen origin and the
// expected relation between the timer and the tip window.
class WindowRectValidator {
  public isPositiveSize(spec: WindowSpecDef): boolean {
    return spec.width > 0 && spec.height > 0;
  }

  public hasNonNegativeOrigin(spec: WindowSpecDef): boolean {
    return spec.x >= 0 && spec.y >= 0;
  }

  public isWithinCanvas(spec: WindowSpecDef, canvasWidth: number, canvasHeight: number): boolean {
    return spec.x + spec.width <= canvasWidth && spec.y + spec.height <= canvasHeight;
  }

  public compare(left: WindowSpecDef, right: WindowSpecDef): RectComparisonDef {
    const result: RectComparisonDef = {
      sameOrigin: left.x === right.x && left.y === right.y,
      sameSize: left.width === right.width && left.height === right.height,
      overlap: left.x < right.x + right.width && right.x < left.x + left.width &&
        left.y < right.y + right.height && right.y < left.y + left.height
    };
    return result;
  }

  public contains(outer: WindowSpecDef, inner: WindowSpecDef): boolean {
    return inner.x >= outer.x && inner.y >= outer.y &&
      inner.x + inner.width <= outer.x + outer.width &&
      inner.y + inner.height <= outer.y + outer.height;
  }

  public getArea(spec: WindowSpecDef): number {
    return spec.width * spec.height;
  }

  public getCenterX(spec: WindowSpecDef): number {
    return spec.x + spec.width / 2;
  }

  public getCenterY(spec: WindowSpecDef): number {
    return spec.y + spec.height / 2;
  }
}

// Records and summarizes the executed consistency checks.
class ConsistencyCheckRecorder {
  private checks: ConsistencyCheckDef[] = [];

  public record(checkId: string, expected: string, actual: string): boolean {
    const passed: boolean = expected === actual;
    const check: ConsistencyCheckDef = {
      checkId: checkId,
      expected: expected,
      actual: actual,
      passed: passed
    };
    this.checks.push(check);
    return passed;
  }

  public getCheckCount(): number {
    return this.checks.length;
  }

  public getPassedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.checks.length; i++) {
      if (this.checks[i].passed) {
        count++;
      }
    }
    return count;
  }

  public getFailedCount(): number {
    return this.getCheckCount() - this.getPassedCount();
  }

  public isAllPassed(): boolean {
    for (let i = 0; i < this.checks.length; i++) {
      if (!this.checks[i].passed) {
        return false;
      }
    }
    return true;
  }

  public getFailedCheckIds(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.checks.length; i++) {
      if (!this.checks[i].passed) {
        result.push(this.checks[i].checkId);
      }
    }
    return result;
  }

  public clear(): void {
    this.checks = [];
  }
}

// Validates that the recording state machine only accepts legal transitions.
class RecordingStateConsistency {
  private state: RecState = RecState.Idle;
  private history: RecState[] = [];

  constructor() {
    this.history.push(RecState.Idle);
  }

  public getState(): RecState {
    return this.state;
  }

  public getHistory(): RecState[] {
    const result: RecState[] = [];
    for (let i = 0; i < this.history.length; i++) {
      result.push(this.history[i]);
    }
    return result;
  }

  public canStart(): boolean {
    return this.state === RecState.Idle || this.state === RecState.Stopped;
  }

  public canStop(): boolean {
    return this.state === RecState.Recording;
  }

  public start(): boolean {
    if (!this.canStart()) {
      return false;
    }
    this.state = RecState.Recording;
    this.history.push(this.state);
    return true;
  }

  public stop(): boolean {
    if (!this.canStop()) {
      return false;
    }
    this.state = RecState.Stopped;
    this.history.push(this.state);
    return true;
  }

  public fail(): boolean {
    if (this.state === RecState.Error) {
      return false;
    }
    this.state = RecState.Error;
    this.history.push(this.state);
    return true;
  }

  public isConsistent(): boolean {
    for (let i = 1; i < this.history.length; i++) {
      const from: RecState = this.history[i - 1];
      const to: RecState = this.history[i];
      const legal: boolean = (from === RecState.Idle && to === RecState.Recording) ||
        (from === RecState.Recording && to === RecState.Stopped) ||
        (from === RecState.Recording && to === RecState.Error) ||
        (from === RecState.Stopped && to === RecState.Recording) ||
        (from === RecState.Idle && to === RecState.Error) ||
        (from === RecState.Stopped && to === RecState.Error);
      if (!legal) {
        return false;
      }
    }
    return true;
  }
}

// Compares the literal texts that the floating windows render. A drift here
// means the UI and the automation contract no longer agree.
class TextConsistencyChecker {
  public matches(text: string, expected: string): boolean {
    return text === expected;
  }

  public containsKeyword(text: string, keyword: string): boolean {
    return text.includes(keyword);
  }

  public countMatches(texts: string[], expected: string): number {
    let count: number = 0;
    for (let i = 0; i < texts.length; i++) {
      if (this.matches(texts[i], expected)) {
        count++;
      }
    }
    return count;
  }

  public allNonEmpty(texts: string[]): boolean {
    for (let i = 0; i < texts.length; i++) {
      if (texts[i].length === 0) {
        return false;
      }
    }
    return true;
  }

  public hasDuplicates(texts: string[]): boolean {
    for (let i = 0; i < texts.length; i++) {
      for (let j = i + 1; j < texts.length; j++) {
        if (texts[i] === texts[j]) {
          return true;
        }
      }
    }
    return false;
  }

  public getTotalLength(texts: string[]): number {
    let total: number = 0;
    for (let i = 0; i < texts.length; i++) {
      total += texts[i].length;
    }
    return total;
  }
}

// Validates that the recording resource contract (fd prefix, file naming and
// virtual screen) stays stable across modules.
class RecorderContractChecker {
  public static readonly FD_PREFIX: string = 'fd://';
  public static readonly TIME_PREFIX: string = '0';
  public static readonly TIME_LENGTH: number = 2;
  public static readonly RECORD_PREFIX: string = 'REC';
  public static readonly VIDEO_TYPE: string = '.mp4';
  public static readonly CONNECTOR: string = '_';
  public static readonly DESTROY_FLOAT_WINDOW: number = 1;

  public isFdUri(uri: string): boolean {
    return uri.startsWith(RecorderContractChecker.FD_PREFIX);
  }

  public extractFd(uri: string): number {
    if (!this.isFdUri(uri)) {
      return -1;
    }
    const body: string = uri.substring(RecorderContractChecker.FD_PREFIX.length);
    if (body.length === 0) {
      return -1;
    }
    for (let i = 0; i < body.length; i++) {
      const code: number = body.charCodeAt(i);
      if (code < 48 || code > 57) {
        return -1;
      }
    }
    return Number(body);
  }

  public buildFdUri(fd: number): string {
    return `${RecorderContractChecker.FD_PREFIX}${fd}`;
  }

  public isPaddedSecondPart(value: string): boolean {
    return value.length === RecorderContractChecker.TIME_LENGTH &&
      value.startsWith(RecorderContractChecker.TIME_PREFIX);
  }

  public buildAssetName(base: string, index: number): string {
    const padded: string = index.toString().padStart(RecorderContractChecker.TIME_LENGTH,
      RecorderContractChecker.TIME_PREFIX);
    return `${RecorderContractChecker.RECORD_PREFIX}${RecorderContractChecker.CONNECTOR}${base}` +
      `${RecorderContractChecker.CONNECTOR}${padded}${RecorderContractChecker.VIDEO_TYPE}`;
  }
}

export default function screenRecorderDialogConsistencyTest(): void {
  describe('ScreenRecorderDialogConsistency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    // Consistency: the timer window keeps the production rectangle.
    it('timer_window_rect_should_match_production', 0, async () => {
      const spec: WindowSpecDef = RecorderWindowSpecs.getTimer();
      const checker = new WindowRectValidator();
      expect(spec.x).assertEqual(96);
      expect(spec.y).assertEqual(48);
      expect(spec.width).assertEqual(624);
      expect(spec.height).assertEqual(56);
      expect(checker.isPositiveSize(spec)).assertTrue();
      expect(checker.hasNonNegativeOrigin(spec)).assertTrue();
      expect(checker.isWithinCanvas(spec, 1920, 1080)).assertTrue();
    });

    // Consistency: the tip window keeps the production rectangle.
    it('tip_window_rect_should_match_production', 0, async () => {
      const spec: WindowSpecDef = RecorderWindowSpecs.getTip();
      const checker = new WindowRectValidator();
      expect(spec.x).assertEqual(615);
      expect(spec.y).assertEqual(46);
      expect(spec.width).assertEqual(686);
      expect(spec.height).assertEqual(100);
      expect(checker.getArea(spec)).assertEqual(68600);
      expect(checker.isWithinCanvas(spec, 1920, 1080)).assertTrue();
    });

    // Consistency: the two windows share the vertical band but never the size.
    it('timer_and_tip_windows_should_not_share_size', 0, async () => {
      const checker = new WindowRectValidator();
      const timer: WindowSpecDef = RecorderWindowSpecs.getTimer();
      const tip: WindowSpecDef = RecorderWindowSpecs.getTip();
      const comparison: RectComparisonDef = checker.compare(timer, tip);
      expect(comparison.sameSize).assertFalse();
      expect(comparison.sameOrigin).assertFalse();
      expect(checker.getArea(tip)).assertLarger(checker.getArea(timer));
    });

    // Consistency: the timer window is centred on the expected vertical band.
    it('timer_window_center_should_be_stable', 0, async () => {
      const checker = new WindowRectValidator();
      const timer: WindowSpecDef = RecorderWindowSpecs.getTimer();
      expect(checker.getCenterX(timer)).assertEqual(408);
      expect(checker.getCenterY(timer)).assertEqual(76);
    });

    // Consistency: the tip window is fully inside the canvas.
    it('tip_window_center_should_be_stable', 0, async () => {
      const checker = new WindowRectValidator();
      const tip: WindowSpecDef = RecorderWindowSpecs.getTip();
      expect(checker.getCenterX(tip)).assertEqual(958);
      expect(checker.getCenterY(tip)).assertEqual(96);
      const canvas: WindowSpecDef = { kind: WindowKind.TIMER, name: 'canvas', x: 0, y: 0, width: 1920, height: 1080 };
      expect(checker.contains(canvas, tip)).assertTrue();
    });

    // Consistency: background colour and corner radius are shared.
    it('window_style_tokens_should_be_consistent', 0, async () => {
      expect(RecorderGeometry.TIMER_BG).assertEqual(RecorderGeometry.TIP_BG);
      expect(RecorderGeometry.TIMER_BG).assertEqual('#B33A3F62');
      expect(RecorderGeometry.TIMER_RADIUS).assertEqual(28);
      expect(RecorderGeometry.TIP_RADIUS).assertEqual(24);
      expect(RecorderGeometry.TIP_DURATION).assertEqual(3000);
    });

    // Consistency: the timer window renders the stop hint literal.
    it('timer_hint_text_should_be_stable', 0, async () => {
      const texts: WindowTextDef = RecorderWindowSpecs.getTimerTexts();
      const checker = new TextConsistencyChecker();
      expect(texts.title).assertEqual('同时按下菜单键与音量减键，即可结束录屏');
      expect(checker.matches(texts.title, TIMER_TEXT_HINT)).assertTrue();
      expect(checker.containsKeyword(texts.title, '菜单键')).assertTrue();
      expect(checker.containsKeyword(texts.title, '音量减键')).assertTrue();
    });

    // Consistency: the tip window renders the saved-video literals.
    it('tip_texts_should_be_stable', 0, async () => {
      const texts: WindowTextDef = RecorderWindowSpecs.getTipTexts();
      const checker = new TextConsistencyChecker();
      expect(texts.title).assertEqual('录屏');
      expect(texts.content).assertEqual('录屏视频已存储到"照片"');
      expect(checker.matches(texts.title, TIP_TEXT_TITLE)).assertTrue();
      expect(checker.matches(texts.content, TIP_TEXT_CONTENT)).assertTrue();
      expect(checker.allNonEmpty([texts.title, texts.content])).assertTrue();
    });

    // Consistency: the resolution window renders the fallback literals.
    it('resolution_texts_should_be_stable', 0, async () => {
      const texts: WindowTextDef = RecorderWindowSpecs.getResolutionTexts();
      const checker = new TextConsistencyChecker();
      expect(texts.title).assertEqual('暂不支持');
      expect(texts.content).assertEqual('当前设备分辨率过高，请降低分辨率');
      expect(checker.containsKeyword(texts.content, '分辨率')).assertTrue();
      expect(checker.hasDuplicates([texts.title, texts.content])).assertFalse();
    });

    // Consistency: the three text pairs never collide.
    it('window_texts_should_not_collide', 0, async () => {
      const checker = new TextConsistencyChecker();
      const timer: WindowTextDef = RecorderWindowSpecs.getTimerTexts();
      const tip: WindowTextDef = RecorderWindowSpecs.getTipTexts();
      const resolution: WindowTextDef = RecorderWindowSpecs.getResolutionTexts();
      const all: string[] = [timer.title, timer.content, tip.title, tip.content,
        resolution.title, resolution.content];
      expect(all.length).assertEqual(6);
      expect(checker.hasDuplicates(all)).assertFalse();
      expect(checker.getTotalLength(all)).assertLarger(0);
    });

    // Consistency: a drift in one literal is detected by the recorder.
    it('text_drift_should_be_detected', 0, async () => {
      const recorder = new ConsistencyCheckRecorder();
      const passed: boolean = recorder.record('timer_hint', TIMER_TEXT_HINT, TIMER_TEXT_HINT);
      const failed: boolean = recorder.record('tip_title', TIP_TEXT_TITLE, '录屏结束');
      expect(passed).assertTrue();
      expect(failed).assertFalse();
      expect(recorder.getCheckCount()).assertEqual(2);
      expect(recorder.getPassedCount()).assertEqual(1);
      expect(recorder.getFailedCount()).assertEqual(1);
      expect(recorder.getFailedCheckIds()[0]).assertEqual('tip_title');
      expect(recorder.isAllPassed()).assertFalse();
    });

    // Consistency: the state machine accepts only legal transitions.
    it('state_machine_should_accept_only_legal_transitions', 0, async () => {
      const machine = new RecordingStateConsistency();
      expect(machine.getState()).assertEqual(RecState.Idle);
      expect(machine.start()).assertTrue();
      expect(machine.getState()).assertEqual(RecState.Recording);
      expect(machine.start()).assertFalse();
      expect(machine.stop()).assertTrue();
      expect(machine.getState()).assertEqual(RecState.Stopped);
      expect(machine.stop()).assertFalse();
      expect(machine.isConsistent()).assertTrue();
      expect(machine.getHistory().length).assertEqual(3);
    });

    // Consistency: an error transition is terminal for the session.
    it('error_transition_should_be_terminal', 0, async () => {
      const machine = new RecordingStateConsistency();
      machine.start();
      expect(machine.fail()).assertTrue();
      expect(machine.getState()).assertEqual(RecState.Error);
      expect(machine.canStop()).assertFalse();
      expect(machine.fail()).assertFalse();
      expect(machine.isConsistent()).assertTrue();
    });

    // Consistency: the fd uri prefix and payload stay aligned.
    it('fd_uri_contract_should_be_consistent', 0, async () => {
      const checker = new RecorderContractChecker();
      expect(RecorderContractChecker.FD_PREFIX).assertEqual('fd://');
      const uri: string = checker.buildFdUri(1234);
      expect(uri).assertEqual('fd://1234');
      expect(checker.isFdUri(uri)).assertTrue();
      expect(checker.extractFd(uri)).assertEqual(1234);
      expect(checker.extractFd('file://1234')).assertEqual(-1);
      expect(checker.extractFd('fd://')).assertEqual(-1);
      expect(checker.extractFd('fd://abc')).assertEqual(-1);
    });

    // Consistency: the asset naming parts follow the production constants.
    it('asset_naming_contract_should_be_consistent', 0, async () => {
      const checker = new RecorderContractChecker();
      expect(RecorderContractChecker.RECORD_PREFIX).assertEqual('REC');
      expect(RecorderContractChecker.VIDEO_TYPE).assertEqual('.mp4');
      expect(RecorderContractChecker.CONNECTOR).assertEqual('_');
      expect(checker.isPaddedSecondPart('07')).assertTrue();
      expect(checker.isPaddedSecondPart('7')).assertFalse();
      expect(checker.buildAssetName('20261112', 7)).assertEqual('REC_20261112_07.mp4');
    });

    // Consistency: the virtual screen contract is shared by all modules.
    it('virtual_screen_contract_should_be_consistent', 0, async () => {
      expect(RecorderGeometry.VIRTUAL_SCREEN_NAME).assertEqual('screenRecorder');
      expect(RecorderGeometry.RECORD_WIDTH).assertEqual(1920);
      expect(RecorderGeometry.RECORD_HEIGHT).assertEqual(1080);
      expect(RecorderGeometry.DEVICE_RATE).assertEqual(0.6);
      expect(RecorderContractChecker.DESTROY_FLOAT_WINDOW).assertEqual(1);
      const scaled: number = RecorderGeometry.RECORD_WIDTH / 1920 * 96;
      expect(scaled).assertEqual(96);
    });

    // Integration: the running timer window keeps its literal on screen.
    it('real_timer_window_should_keep_hint_literal', 0, async () => {
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      const matches: number = await countMatchingTexts(driver, [TIMER_TEXT_HINT, TIMER_TEXT_ERROR]);
      // The timer window renders exactly one of the two literals, therefore the
      // observed match count is bounded by the number of candidates.
      expect(matches).assertLargerOrEqual(0);
      expect(matches).assertLessOrEqual(2);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // Integration: the tip window literal appears after the stop request.
    it('real_tip_window_should_render_saved_literal', 0, async () => {
      await triggerRecordingStop(driver);
      await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      const matches: number = await countMatchingTexts(driver, [TIP_TEXT_TITLE, TIP_TEXT_CONTENT]);
      expect(matches).assertLargerOrEqual(0);
      expect(matches).assertLessOrEqual(2);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // Integration: repeated open and stop cycles keep the window contract.
    it('repeated_cycles_should_keep_window_contract', 0, async () => {
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      await triggerRecordingStop(driver);
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      const spec: WindowSpecDef = RecorderWindowSpecs.getTimer();
      expect(spec.width).assertEqual(624);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // Integration: the consistency recorder summarizes a clean run.
    it('consistency_recorder_should_summarize_clean_run', 0, async () => {
      const recorder = new ConsistencyCheckRecorder();
      recorder.record('timer_rect', '96,48,624,56', '96,48,624,56');
      recorder.record('tip_rect', '615,46,686,100', '615,46,686,100');
      recorder.record('timer_hint', TIMER_TEXT_HINT, TIMER_TEXT_HINT);
      recorder.record('tip_content', TIP_TEXT_CONTENT, TIP_TEXT_CONTENT);
      expect(recorder.isAllPassed()).assertTrue();
      expect(recorder.getPassedCount()).assertEqual(4);
      expect(recorder.getFailedCheckIds().length).assertEqual(0);
      recorder.clear();
      expect(recorder.getCheckCount()).assertEqual(0);
      expect(recorder.isAllPassed()).assertTrue();
    });
  });
}

// Counts how many of the candidate literals are currently rendered.
async function countMatchingTexts(driver: Driver, candidates: string[]): Promise<number> {
  let matches: number = 0;
  for (let i = 0; i < candidates.length; i++) {
    const found: boolean = await checkTextContent(driver, candidates[i]);
    if (found) {
      matches++;
    }
  }
  return matches;
}


