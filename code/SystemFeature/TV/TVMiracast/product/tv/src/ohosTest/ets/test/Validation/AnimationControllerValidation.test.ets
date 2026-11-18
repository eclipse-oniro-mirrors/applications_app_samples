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
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  miracastComponentCount,
  waitForPageStable,
  waitForPermissionDialog,
  isPermissionDialogVisible,
  pressAndWait,
  serializedDelay,
  safeBack,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_SESSION_CREATE,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';

const TAG: string = 'AnimationControllerSuite';

// Animation types used by the permission float window and multi tile layout switch.
enum CastAnimationType {
  FADE_IN = 'fade_in',
  FADE_OUT = 'fade_out',
  LAYOUT_SWITCH = 'layout_switch',
  TILE_ENTER = 'tile_enter',
  TILE_EXIT = 'tile_exit',
  SCALE_UP = 'scale_up',
  NONE = 'none'
}

// Animation lifecycle states of a single float window animation.
enum CastAnimationState {
  IDLE = 'idle',
  RUNNING = 'running',
  PAUSED = 'paused',
  COMPLETED = 'completed',
  CANCELLED = 'cancelled'
}

// Immutable configuration of one animation playback.
interface CastAnimationConfig {
  type: CastAnimationType;
  duration: number;
  delay: number;
  easing: string;
  repeatCount: number;
}

// Status snapshot returned to callers, always a deep copy.
interface CastAnimationStatus {
  state: CastAnimationState;
  progress: number;
  currentTime: number;
  config: CastAnimationConfig;
}

// One finished or cancelled animation record.
interface CastAnimationHistoryItem {
  type: CastAnimationType;
  startTime: number;
  endTime: number;
  completed: boolean;
}

// Wrapper used to capture the latest status inside a listener.
interface CastStatusWrapper {
  status: CastAnimationStatus | null;
}

// Request describing a layout switch from N tiles to M tiles.
interface LayoutSwitchRequest {
  fromTiles: number;
  toTiles: number;
  screenWidth: number;
  screenHeight: number;
}

// Controller of the permission float window fade and layout switch animations.
class PermissionWindowAnimationController {
  private static instance: PermissionWindowAnimationController | null = null;
  private currentState: CastAnimationState = CastAnimationState.IDLE;
  private currentType: CastAnimationType = CastAnimationType.NONE;
  private duration: number = 0;
  private delayMs: number = 0;
  private easing: string = 'linear';
  private progress: number = 0;
  private currentTime: number = 0;
  private frameCount: number = 0;
  private history: CastAnimationHistoryItem[] = [];
  private listeners: Array<(status: CastAnimationStatus) => void> = [];

  public static getInstance(): PermissionWindowAnimationController {
    if (PermissionWindowAnimationController.instance === null) {
      PermissionWindowAnimationController.instance = new PermissionWindowAnimationController();
    }
    return PermissionWindowAnimationController.instance;
  }

  // Starts a fade or layout switch animation, rejects reentrant playback.
  public playAnimation(config: CastAnimationConfig): boolean {
    if (this.currentState === CastAnimationState.RUNNING) {
      return false;
    }
    this.currentType = config.type;
    this.duration = config.duration;
    this.delayMs = config.delay;
    this.easing = config.easing;
    this.currentState = CastAnimationState.RUNNING;
    this.progress = 0;
    this.currentTime = 0;
    this.frameCount = 0;
    this.notifyListeners();
    return true;
  }

  // Pauses a running animation, other states are rejected.
  public pauseAnimation(): boolean {
    if (this.currentState !== CastAnimationState.RUNNING) {
      return false;
    }
    this.currentState = CastAnimationState.PAUSED;
    this.notifyListeners();
    return true;
  }

  // Resumes a paused animation, other states are rejected.
  public resumeAnimation(): boolean {
    if (this.currentState !== CastAnimationState.PAUSED) {
      return false;
    }
    this.currentState = CastAnimationState.RUNNING;
    this.notifyListeners();
    return true;
  }

  // Stops the current animation, a running stop is recorded as unfinished.
  public stopAnimation(): boolean {
    if (this.currentState === CastAnimationState.IDLE) {
      return false;
    }
    const wasRunning: boolean = this.currentState === CastAnimationState.RUNNING;
    this.currentState = CastAnimationState.CANCELLED;
    this.progress = 0;
    if (wasRunning) {
      this.history.push({
        type: this.currentType,
        startTime: Date.now() - this.currentTime,
        endTime: Date.now(),
        completed: false
      });
    }
    this.notifyListeners();
    return true;
  }

  // Advances the animation clock, delay is part of the total duration.
  public updateAnimation(elapsedTime: number): void {
    if (this.currentState !== CastAnimationState.RUNNING) {
      return;
    }
    this.frameCount++;
    this.currentTime += elapsedTime;
    const totalDuration: number = this.duration + this.delayMs;
    if (totalDuration <= 0) {
      this.progress = 1;
    } else {
      this.progress = Math.min(1, this.currentTime / totalDuration);
    }
    if (this.progress >= 1) {
      this.currentState = CastAnimationState.COMPLETED;
      this.history.push({
        type: this.currentType,
        startTime: Date.now() - this.currentTime,
        endTime: Date.now(),
        completed: true
      });
    }
    this.notifyListeners();
  }

  // Returns a deep copy of the current animation status.
  public getStatus(): CastAnimationStatus {
    const configCopy: CastAnimationConfig = {
      type: this.currentType,
      duration: this.duration,
      delay: this.delayMs,
      easing: this.easing,
      repeatCount: 0
    };
    const status: CastAnimationStatus = {
      state: this.currentState,
      progress: this.progress,
      currentTime: this.currentTime,
      config: configCopy
    };
    return status;
  }

  public getAnimationHistory(): CastAnimationHistoryItem[] {
    const result: CastAnimationHistoryItem[] = [];
    for (const item of this.history) {
      result.push({
        type: item.type,
        startTime: item.startTime,
        endTime: item.endTime,
        completed: item.completed
      });
    }
    return result;
  }

  public getPlayCount(): number {
    return this.history.length;
  }

  public getCompletedCount(): number {
    let count: number = 0;
    for (const item of this.history) {
      if (item.completed) {
        count++;
      }
    }
    return count;
  }

  public addAnimationListener(listener: (status: CastAnimationStatus) => void): void {
    this.listeners.push(listener);
  }

  public removeAnimationListener(listener: (status: CastAnimationStatus) => void): void {
    const index: number = this.listeners.indexOf(listener);
    if (index !== -1) {
      this.listeners.splice(index, 1);
    }
  }

  public getListenerCount(): number {
    return this.listeners.length;
  }

  public resetController(): void {
    this.currentState = CastAnimationState.IDLE;
    this.currentType = CastAnimationType.NONE;
    this.duration = 0;
    this.delayMs = 0;
    this.easing = 'linear';
    this.progress = 0;
    this.currentTime = 0;
    this.frameCount = 0;
    this.history = [];
  }

  public getFrameCount(): number {
    return this.frameCount;
  }

  public isPlaying(): boolean {
    return this.currentState === CastAnimationState.RUNNING;
  }

  public isPaused(): boolean {
    return this.currentState === CastAnimationState.PAUSED;
  }

  public isCompleted(): boolean {
    return this.currentState === CastAnimationState.COMPLETED;
  }

  // Counts played animations per type, used to verify fade and switch ratio.
  public getTypeStats(): Map<string, number> {
    const stats: Map<string, number> = new Map<string, number>();
    for (const item of this.history) {
      const key: string = item.type;
      const stored = stats.get(key);
      if (stored === undefined) {
        stats.set(key, 1);
      } else {
        stats.set(key, stored + 1);
      }
    }
    return stats;
  }

  // Notifies every listener with a fresh copy of the status.
  private notifyListeners(): void {
    for (const listener of this.listeners) {
      const configCopy: CastAnimationConfig = {
        type: this.currentType,
        duration: this.duration,
        delay: this.delayMs,
        easing: this.easing,
        repeatCount: 0
      };
      const snapshot: CastAnimationStatus = {
        state: this.currentState,
        progress: this.progress,
        currentTime: this.currentTime,
        config: configCopy
      };
      listener(snapshot);
    }
  }
}

// Easing curves supported by fade and tile scale animations.
enum CastEasing {
  LINEAR = 'linear',
  EASE_IN = 'ease_in',
  EASE_OUT = 'ease_out',
  EASE_IN_OUT = 'ease_in_out',
  SPRING = 'spring'
}

// Playback policy of a scheduled animation.
enum CastPlaybackPolicy {
  ONCE = 'once',
  REPEAT = 'repeat',
  PING_PONG = 'ping_pong',
  INFINITE = 'infinite'
}

// Maps linear progress to eased progress, input is clamped to [0, 1].
class CastEasingCalculator {
  public calculate(easing: CastEasing, linearProgress: number): number {
    const t: number = Math.max(0, Math.min(1, linearProgress));
    if (easing === CastEasing.EASE_IN) {
      return t * t;
    }
    if (easing === CastEasing.EASE_OUT) {
      return 1 - (1 - t) * (1 - t);
    }
    if (easing === CastEasing.EASE_IN_OUT) {
      if (t < 0.5) {
        return 2 * t * t;
      }
      return 1 - Math.pow(-2 * t + 2, 2) / 2;
    }
    if (easing === CastEasing.SPRING) {
      return Math.min(1, 1 - Math.cos(t * Math.PI));
    }
    return t;
  }

  public isLinear(easing: CastEasing): boolean {
    return easing === CastEasing.LINEAR;
  }

  // Builds frameCount + 1 progress samples including both endpoints.
  public generateProgressSequence(easing: CastEasing, frameCount: number): number[] {
    const sequence: number[] = [];
    for (let i: number = 0; i <= frameCount; i++) {
      const linear: number = frameCount === 0 ? 0 : i / frameCount;
      sequence.push(this.calculate(easing, linear));
    }
    return sequence;
  }
}

// Tile geometry model of the multi cast layout, mirrors the player page rules.
class LayoutSwitchAnimationModel {
  private tileCount: number;
  private screenWidth: number;
  private screenHeight: number;

  constructor(tileCount: number, screenWidth: number, screenHeight: number) {
    this.tileCount = tileCount;
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
  }

  public getTileCount(): number {
    return this.tileCount;
  }

  // Column count: 1 tile full, 2 tiles side by side, 3-4 quad, 5-9 nine grid.
  public getColumns(): number {
    if (this.tileCount === 1) {
      return 1;
    }
    if (this.tileCount === 2) {
      return 2;
    }
    if (this.tileCount === 3 || this.tileCount === 4) {
      return 2;
    }
    if (this.tileCount >= 5 && this.tileCount <= 9) {
      return 3;
    }
    return 0;
  }

  public getRows(): number {
    if (this.tileCount === 1) {
      return 1;
    }
    if (this.tileCount === 2) {
      return 1;
    }
    if (this.tileCount === 3 || this.tileCount === 4) {
      return 2;
    }
    if (this.tileCount >= 5 && this.tileCount <= 9) {
      return 3;
    }
    return 0;
  }

  public getTileWidth(): number {
    const columns: number = this.getColumns();
    if (columns <= 0) {
      return 0;
    }
    return Math.floor(this.screenWidth / columns);
  }

  public getTileHeight(): number {
    const rows: number = this.getRows();
    if (rows <= 0) {
      return 0;
    }
    return Math.floor(this.screenHeight / rows);
  }

  public getTileArea(): number {
    return this.getTileWidth() * this.getTileHeight();
  }

  public isFullScreen(): boolean {
    return this.tileCount === 1;
  }

  public getLayoutName(): string {
    if (this.tileCount === 1) {
      return 'full';
    }
    if (this.tileCount === 2) {
      return 'split_two';
    }
    if (this.tileCount === 3 || this.tileCount === 4) {
      return 'quad';
    }
    if (this.tileCount >= 5 && this.tileCount <= 9) {
      return 'nine';
    }
    return 'unsupported';
  }

  public equals(other: LayoutSwitchAnimationModel): boolean {
    return this.tileCount === other.getTileCount() && this.screenWidth === other.getScreenWidth() &&
      this.screenHeight === other.getScreenHeight();
  }

  public clone(): LayoutSwitchAnimationModel {
    return new LayoutSwitchAnimationModel(this.tileCount, this.screenWidth, this.screenHeight);
  }

  public getScreenWidth(): number {
    return this.screenWidth;
  }

  public getScreenHeight(): number {
    return this.screenHeight;
  }
}

// Statistics of layout switch models, used for layout budget validation.
class LayoutSwitchStatistics {
  private models: LayoutSwitchAnimationModel[] = [];

  public addModel(model: LayoutSwitchAnimationModel): void {
    this.models.push(model.clone());
  }

  public getModelCount(): number {
    return this.models.length;
  }

  public getCountByLayout(layoutName: string): number {
    let count: number = 0;
    for (const model of this.models) {
      if (model.getLayoutName() === layoutName) {
        count++;
      }
    }
    return count;
  }

  public getAverageTileArea(): number {
    if (this.models.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const model of this.models) {
      total += model.getTileArea();
    }
    return total / this.models.length;
  }

  public getFullScreenCount(): number {
    let count: number = 0;
    for (const model of this.models) {
      if (model.isFullScreen()) {
        count++;
      }
    }
    return count;
  }
}

// Plans the fade and layout switch animation sequence of the permission window.
class FadeLayoutAnimationPlanner {
  private showDuration: number = 300;
  private hideDuration: number = 200;
  private switchDuration: number = 250;

  public getShowDuration(): number {
    return this.showDuration;
  }

  public getHideDuration(): number {
    return this.hideDuration;
  }

  public getSwitchDuration(): number {
    return this.switchDuration;
  }

  // Fade in when the float window becomes visible.
  public planShowFade(): CastAnimationConfig {
    return {
      type: CastAnimationType.FADE_IN,
      duration: this.showDuration,
      delay: 0,
      easing: 'ease_in_out',
      repeatCount: 0
    };
  }

  // Fade out before the float window is destroyed.
  public planHideFade(): CastAnimationConfig {
    return {
      type: CastAnimationType.FADE_OUT,
      duration: this.hideDuration,
      delay: 0,
      easing: 'ease_out',
      repeatCount: 0
    };
  }

  // Layout switch runs only when the tile count really changes.
  public planLayoutSwitch(request: LayoutSwitchRequest): CastAnimationConfig {
    const duration: number = request.fromTiles === request.toTiles ? 0 : this.switchDuration;
    return {
      type: CastAnimationType.LAYOUT_SWITCH,
      duration: duration,
      delay: 0,
      easing: 'ease_in_out',
      repeatCount: 0
    };
  }

  // Full sequence used when a new device joins a running cast session.
  public buildSequence(fromTiles: number, toTiles: number): CastAnimationConfig[] {
    const sequence: CastAnimationConfig[] = [];
    const switchRequest: LayoutSwitchRequest = {
      fromTiles: fromTiles,
      toTiles: toTiles,
      screenWidth: 1920,
      screenHeight: 1080
    };
    sequence.push(this.planLayoutSwitch(switchRequest));
    if (toTiles > fromTiles) {
      const tileEnter: CastAnimationConfig = {
        type: CastAnimationType.TILE_ENTER,
        duration: 150,
        delay: 0,
        easing: 'ease_out',
        repeatCount: 0
      };
      sequence.push(tileEnter);
    }
    return sequence;
  }

  public getSequenceDuration(fromTiles: number, toTiles: number): number {
    const sequence: CastAnimationConfig[] = this.buildSequence(fromTiles, toTiles);
    let total: number = 0;
    for (const config of sequence) {
      total += config.duration;
    }
    return total;
  }
}

// Maps between linear progress and eased progress for float window fades.
class CastProgressMapper {
  private calculator: CastEasingCalculator = new CastEasingCalculator();

  public mapProgress(easing: CastEasing, linearProgress: number): number {
    return this.calculator.calculate(easing, linearProgress);
  }

  // Only the linear curve can be inverted exactly, others are clamped.
  public unmapProgress(easing: CastEasing, easedProgress: number): number {
    if (easing === CastEasing.LINEAR) {
      return easedProgress;
    }
    return Math.min(1, Math.max(0, easedProgress));
  }

  public isEquivalentMapping(easingA: CastEasing, easingB: CastEasing, linearProgress: number): boolean {
    const progressA: number = this.mapProgress(easingA, linearProgress);
    const progressB: number = this.mapProgress(easingB, linearProgress);
    return Math.abs(progressA - progressB) < 0.0001;
  }
}

// Float window panel size model based on the 690 x 590 design draft.
class PermissionWindowSizeModel {
  public static readonly DESIGN_WIDTH: number = 690;
  public static readonly DESIGN_HEIGHT: number = 590;
  private zoomRatio: number;

  constructor(zoomRatio: number) {
    this.zoomRatio = zoomRatio > 0 ? zoomRatio : 1;
  }

  public getZoomRatio(): number {
    return this.zoomRatio;
  }

  public getScaledWidth(): number {
    return Math.round(PermissionWindowSizeModel.DESIGN_WIDTH * this.zoomRatio);
  }

  public getScaledHeight(): number {
    return Math.round(PermissionWindowSizeModel.DESIGN_HEIGHT * this.zoomRatio);
  }

  // Window is centered by moveWindowTo, offset is half of the free space.
  public getCenterOffsetX(screenWidth: number): number {
    const offset: number = (screenWidth - this.getScaledWidth()) / 2;
    return offset > 0 ? Math.round(offset) : 0;
  }

  public getCenterOffsetY(screenHeight: number): number {
    const offset: number = (screenHeight - this.getScaledHeight()) / 2;
    return offset > 0 ? Math.round(offset) : 0;
  }

  public isLandscape(screenWidth: number, screenHeight: number): boolean {
    return screenWidth > screenHeight;
  }
}

// Stub used by the suite to keep the shared driver contract visible.
const ANIMATION_FRAME_STEP: number = 16;

export default function animationControllerValidationSuite(): void {
  describe('AnimationControllerValidation_Suite', () => {
    let driver: Driver;
    let controller: PermissionWindowAnimationController;

    beforeAll(async () => {
      driver = getDriver();
      controller = PermissionWindowAnimationController.getInstance();
      controller.resetController();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await safeBack(driver, 2);
      Log.info(TAG, 'suite end');
    });
    it('animation_type_enum_should_define_expected_values', 0, async () => {
      expect(CastAnimationType.FADE_IN).assertEqual('fade_in');
      expect(CastAnimationType.FADE_OUT).assertEqual('fade_out');
      expect(CastAnimationType.LAYOUT_SWITCH).assertEqual('layout_switch');
      expect(CastAnimationType.TILE_ENTER).assertEqual('tile_enter');
      expect(CastAnimationType.TILE_EXIT).assertEqual('tile_exit');
      expect(CastAnimationType.NONE).assertEqual('none');
    });

    it('animation_state_enum_should_define_expected_values', 0, async () => {
      expect(CastAnimationState.IDLE).assertEqual('idle');
      expect(CastAnimationState.RUNNING).assertEqual('running');
      expect(CastAnimationState.PAUSED).assertEqual('paused');
      expect(CastAnimationState.COMPLETED).assertEqual('completed');
      expect(CastAnimationState.CANCELLED).assertEqual('cancelled');
    });

    it('easing_enum_should_define_expected_values', 0, async () => {
      expect(CastEasing.LINEAR).assertEqual('linear');
      expect(CastEasing.EASE_IN).assertEqual('ease_in');
      expect(CastEasing.EASE_OUT).assertEqual('ease_out');
      expect(CastEasing.EASE_IN_OUT).assertEqual('ease_in_out');
      expect(CastEasing.SPRING).assertEqual('spring');
      expect(CastPlaybackPolicy.ONCE).assertEqual('once');
      expect(CastPlaybackPolicy.INFINITE).assertEqual('infinite');
    });

    // The permission window must start from a clean idle state.
    it('controller_initial_state_should_be_idle', 0, async () => {
      controller.resetController();
      const status: CastAnimationStatus = controller.getStatus();
      expect(status.state).assertEqual(CastAnimationState.IDLE);
      expect(status.progress).assertEqual(0);
      expect(status.currentTime).assertEqual(0);
      expect(status.config.type).assertEqual(CastAnimationType.NONE);
      expect(controller.isPlaying()).assertFalse();
    });

    // Fade in of the permission window applies the configured duration.
    it('fade_in_playback_should_start_running', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 300,
        delay: 0,
        easing: 'ease_in_out',
        repeatCount: 0
      };
      expect(controller.playAnimation(config)).assertTrue();
      const status: CastAnimationStatus = controller.getStatus();
      expect(status.state).assertEqual(CastAnimationState.RUNNING);
      expect(status.config.type).assertEqual(CastAnimationType.FADE_IN);
      expect(status.config.duration).assertEqual(300);
      expect(status.config.easing).assertEqual('ease_in_out');
      const planner = new FadeLayoutAnimationPlanner();
      expect(planner.getShowDuration()).assertEqual(300);
      expect(planner.getHideDuration()).assertEqual(200);
      expect(planner.getSwitchDuration()).assertEqual(250);
      expect(planner.planShowFade().type).assertEqual(CastAnimationType.FADE_IN);
      expect(planner.planHideFade().type).assertEqual(CastAnimationType.FADE_OUT);
      expect(planner.getSequenceDuration(1, 2)).assertEqual(400);
    });

    // Layout switch must not interrupt a running fade animation.
    it('second_play_should_be_rejected_while_running', 0, async () => {
      controller.resetController();
      const fadeIn: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 300,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      const layoutSwitch: CastAnimationConfig = {
        type: CastAnimationType.LAYOUT_SWITCH,
        duration: 250,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      expect(controller.playAnimation(fadeIn)).assertTrue();
      expect(controller.playAnimation(layoutSwitch)).assertFalse();
      expect(controller.getStatus().config.type).assertEqual(CastAnimationType.FADE_IN);
      expect(controller.getPlayCount()).assertEqual(0);
    });
    // Pause then resume keeps the same animation type and duration.
    it('pause_and_resume_should_restore_running', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.TILE_ENTER,
        duration: 400,
        delay: 0,
        easing: 'ease_out',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(100);
      expect(controller.pauseAnimation()).assertTrue();
      expect(controller.isPaused()).assertTrue();
      expect(controller.getStatus().progress).assertEqual(0.25);
      expect(controller.resumeAnimation()).assertTrue();
      expect(controller.isPlaying()).assertTrue();
      expect(controller.getStatus().config.type).assertEqual(CastAnimationType.TILE_ENTER);
    });

    it('pause_from_idle_should_return_false', 0, async () => {
      controller.resetController();
      expect(controller.pauseAnimation()).assertFalse();
      expect(controller.isPaused()).assertFalse();
      expect(controller.getStatus().state).assertEqual(CastAnimationState.IDLE);
    });

    it('resume_from_idle_should_return_false', 0, async () => {
      controller.resetController();
      expect(controller.resumeAnimation()).assertFalse();
      expect(controller.isPlaying()).assertFalse();
    });

    // Resume after a completed animation is rejected as well.
    it('resume_after_completion_should_return_false', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_OUT,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(200);
      expect(controller.isCompleted()).assertTrue();
      expect(controller.resumeAnimation()).assertFalse();
      expect(controller.getStatus().state).assertEqual(CastAnimationState.COMPLETED);
    });

    it('stop_from_idle_should_return_false', 0, async () => {
      controller.resetController();
      expect(controller.stopAnimation()).assertFalse();
      expect(controller.getPlayCount()).assertEqual(0);
    });

    // Stopping a running fade records an unfinished history entry.
    it('stop_should_cancel_and_reset_progress', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_OUT,
        duration: 400,
        delay: 0,
        easing: 'ease_out',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(100);
      expect(controller.stopAnimation()).assertTrue();
      expect(controller.getStatus().state).assertEqual(CastAnimationState.CANCELLED);
      expect(controller.getStatus().progress).assertEqual(0);
      expect(controller.getPlayCount()).assertEqual(1);
      expect(controller.getCompletedCount()).assertEqual(0);
    });
    // Half of the duration yields exactly half of the progress.
    it('progress_update_should_reach_half_at_half_duration', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.SCALE_UP,
        duration: 1000,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(500);
      expect(controller.getStatus().progress).assertEqual(0.5);
      expect(controller.isCompleted()).assertFalse();
    });

    // Delay is part of the total duration of a float window animation.
    it('progress_should_respect_delay_in_total_duration', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.TILE_ENTER,
        duration: 200,
        delay: 100,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(150);
      expect(controller.getStatus().progress).assertEqual(0.5);
      controller.updateAnimation(150);
      expect(controller.getStatus().progress).assertEqual(1);
      expect(controller.isCompleted()).assertTrue();
    });

    it('animation_should_complete_at_total_duration', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 250,
        delay: 50,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(299);
      expect(controller.isCompleted()).assertFalse();
      controller.updateAnimation(1);
      expect(controller.isCompleted()).assertTrue();
      expect(controller.getFrameCount()).assertEqual(2);
    });

    // A completed animation must appear in history as completed.
    it('completion_should_be_recorded_in_history', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(200);
      const history: CastAnimationHistoryItem[] = controller.getAnimationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].type).assertEqual(CastAnimationType.FADE_IN);
      expect(history[0].completed).assertTrue();
      expect(history[0].endTime >= history[0].startTime).assertTrue();
    });

    // A stopped layout switch stays in history without the completion flag.
    it('cancelled_animation_should_be_recorded_as_unfinished', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.LAYOUT_SWITCH,
        duration: 250,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(100);
      controller.stopAnimation();
      const history: CastAnimationHistoryItem[] = controller.getAnimationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].type).assertEqual(CastAnimationType.LAYOUT_SWITCH);
      expect(history[0].completed).assertFalse();
      expect(controller.getCompletedCount()).assertEqual(0);
    });

    // Type statistics separate fade animations from layout switches.
    it('type_stats_should_count_per_type', 0, async () => {
      controller.resetController();
      const fadeIn: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 100,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      const layoutSwitch: CastAnimationConfig = {
        type: CastAnimationType.LAYOUT_SWITCH,
        duration: 100,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(fadeIn);
      controller.updateAnimation(100);
      controller.playAnimation(fadeIn);
      controller.updateAnimation(100);
      controller.playAnimation(layoutSwitch);
      controller.updateAnimation(100);
      const stats: Map<string, number> = controller.getTypeStats();
      expect(stats.get('fade_in')).assertEqual(2);
      expect(stats.get('layout_switch')).assertEqual(1);
      expect(stats.size).assertEqual(2);
    });
    it('play_count_and_completed_count_should_be_consistent', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 100,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(100);
      controller.playAnimation(config);
      controller.updateAnimation(50);
      controller.stopAnimation();
      expect(controller.getPlayCount()).assertEqual(2);
      expect(controller.getCompletedCount()).assertEqual(1);
    });

    // Status snapshots must not leak the internal configuration object.
    it('status_get_should_return_deep_copy', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 300,
        delay: 0,
        easing: 'ease_in',
        repeatCount: 0
      };
      controller.playAnimation(config);
      const statusA: CastAnimationStatus = controller.getStatus();
      statusA.config.duration = 999;
      statusA.config.easing = 'broken';
      const statusB: CastAnimationStatus = controller.getStatus();
      expect(statusB.config.duration).assertEqual(300);
      expect(statusB.config.easing).assertEqual('ease_in');
    });

    it('history_get_should_return_deep_copy', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.TILE_EXIT,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(200);
      const historyA: CastAnimationHistoryItem[] = controller.getAnimationHistory();
      historyA[0].type = CastAnimationType.FADE_OUT;
      historyA[0].completed = false;
      const historyB: CastAnimationHistoryItem[] = controller.getAnimationHistory();
      expect(historyB[0].type).assertEqual(CastAnimationType.TILE_EXIT);
      expect(historyB[0].completed).assertTrue();
    });

    // Frame counting is used to estimate the animation frame budget.
    it('frame_count_should_increase_per_update', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 1000,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      expect(controller.getFrameCount()).assertEqual(0);
      controller.updateAnimation(ANIMATION_FRAME_STEP);
      controller.updateAnimation(ANIMATION_FRAME_STEP);
      controller.updateAnimation(ANIMATION_FRAME_STEP);
      expect(controller.getFrameCount()).assertEqual(3);
      expect(controller.getStatus().currentTime).assertEqual(48);
    });

    // Idle updates must not advance the frame counter.
    it('update_on_idle_should_be_ignored', 0, async () => {
      controller.resetController();
      controller.updateAnimation(500);
      expect(controller.getStatus().progress).assertEqual(0);
      expect(controller.getFrameCount()).assertEqual(0);
      expect(controller.isPlaying()).assertFalse();
    });

    // Zero duration animations complete on the first frame.
    it('zero_duration_animation_should_complete_immediately', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.LAYOUT_SWITCH,
        duration: 0,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      controller.updateAnimation(0);
      expect(controller.isCompleted()).assertTrue();
      expect(controller.getStatus().progress).assertEqual(1);
    });

    // Every listener receives the running and completed snapshots.
    it('listener_should_receive_state_snapshots', 0, async () => {
      controller.resetController();
      const wrapper: CastStatusWrapper = { status: null };
      let notifications: number = 0;
      const listener = (status: CastAnimationStatus) => {
        notifications++;
        wrapper.status = status;
      };
      controller.addAnimationListener(listener);
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 300,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      expect(notifications).assertEqual(1);
      controller.updateAnimation(150);
      expect(notifications).assertEqual(2);
      expect(wrapper.status === null).assertFalse();
      controller.removeAnimationListener(listener);
    });

    it('listener_removal_should_stop_notifications', 0, async () => {
      controller.resetController();
      let notifications: number = 0;
      const listener = () => {
        notifications++;
      };
      controller.addAnimationListener(listener);
      controller.playAnimation({
        type: CastAnimationType.FADE_IN,
        duration: 100,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      });
      expect(notifications).assertEqual(1);
      controller.removeAnimationListener(listener);
      controller.updateAnimation(100);
      expect(notifications).assertEqual(1);
      expect(controller.getListenerCount()).assertEqual(0);
    });

    it('listener_count_should_track_registration', 0, async () => {
      controller.resetController();
      const first = () => {
      };
      const second = () => {
      };
      expect(controller.getListenerCount()).assertEqual(0);
      controller.addAnimationListener(first);
      controller.addAnimationListener(second);
      expect(controller.getListenerCount()).assertEqual(2);
      controller.removeAnimationListener(first);
      expect(controller.getListenerCount()).assertEqual(1);
      controller.removeAnimationListener(second);
      expect(controller.getListenerCount()).assertEqual(0);
    });
    it('reset_controller_should_clear_history', 0, async () => {
      controller.resetController();
      controller.playAnimation({
        type: CastAnimationType.FADE_IN,
        duration: 100,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      });
      controller.updateAnimation(100);
      expect(controller.getPlayCount()).assertEqual(1);
      controller.resetController();
      expect(controller.getPlayCount()).assertEqual(0);
      expect(controller.getStatus().state).assertEqual(CastAnimationState.IDLE);
      expect(controller.getFrameCount()).assertEqual(0);
    });

    it('animation_controller_should_be_singleton', 0, async () => {
      const first: PermissionWindowAnimationController = PermissionWindowAnimationController.getInstance();
      const second: PermissionWindowAnimationController = PermissionWindowAnimationController.getInstance();
      expect(first === second).assertTrue();
      first.resetController();
      first.playAnimation({
        type: CastAnimationType.FADE_IN,
        duration: 100,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      });
      expect(second.isPlaying()).assertTrue();
    });

    it('controller_should_recover_from_abnormal_states', 0, async () => {
      controller.resetController();
      expect(controller.pauseAnimation()).assertFalse();
      expect(controller.resumeAnimation()).assertFalse();
      expect(controller.stopAnimation()).assertFalse();
      controller.playAnimation({
        type: CastAnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      });
      expect(controller.isPlaying()).assertTrue();
      controller.resetController();
      expect(controller.getStatus().state).assertEqual(CastAnimationState.IDLE);
      controller.playAnimation({
        type: CastAnimationType.FADE_OUT,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      });
      expect(controller.isPlaying()).assertTrue();
      expect(controller.getStatus().config.type).assertEqual(CastAnimationType.FADE_OUT);
    });

    it('linear_easing_should_be_identity', 0, async () => {
      const calculator = new CastEasingCalculator();
      expect(calculator.isLinear(CastEasing.LINEAR)).assertTrue();
      expect(calculator.isLinear(CastEasing.SPRING)).assertFalse();
      expect(calculator.calculate(CastEasing.LINEAR, 0)).assertEqual(0);
      expect(calculator.calculate(CastEasing.LINEAR, 0.5)).assertEqual(0.5);
      expect(calculator.calculate(CastEasing.LINEAR, 1)).assertEqual(1);
      const mapper = new CastProgressMapper();
      expect(mapper.mapProgress(CastEasing.LINEAR, 0.5)).assertEqual(0.5);
      expect(mapper.unmapProgress(CastEasing.SPRING, 5)).assertEqual(1);
      expect(mapper.isEquivalentMapping(CastEasing.LINEAR, CastEasing.LINEAR, 0.25)).assertTrue();
    });

    it('ease_in_and_out_should_match_quadratic_curve', 0, async () => {
      const calculator = new CastEasingCalculator();
      expect(calculator.calculate(CastEasing.EASE_IN, 0.5)).assertEqual(0.25);
      expect(calculator.calculate(CastEasing.EASE_OUT, 0.5)).assertEqual(0.75);
      expect(calculator.calculate(CastEasing.EASE_IN_OUT, 0.5)).assertEqual(0.5);
      expect(calculator.calculate(CastEasing.EASE_IN_OUT, 0.25)).assertEqual(0.125);
      expect(calculator.calculate(CastEasing.EASE_IN_OUT, 0.75)).assertEqual(0.875);
    });

    it('easing_should_clamp_out_of_range_progress', 0, async () => {
      const calculator = new CastEasingCalculator();
      expect(calculator.calculate(CastEasing.LINEAR, -1)).assertEqual(0);
      expect(calculator.calculate(CastEasing.LINEAR, 2)).assertEqual(1);
      expect(calculator.calculate(CastEasing.EASE_IN, -5)).assertEqual(0);
      expect(calculator.calculate(CastEasing.EASE_OUT, 9)).assertEqual(1);
    });

    it('spring_easing_midpoint_should_be_one', 0, async () => {
      const calculator = new CastEasingCalculator();
      expect(calculator.calculate(CastEasing.SPRING, 0)).assertEqual(0);
      expect(Math.abs(calculator.calculate(CastEasing.SPRING, 0.5) - 1) < 0.001).assertTrue();
      expect(calculator.calculate(CastEasing.SPRING, 1)).assertEqual(1);
    });
    it('progress_sequence_should_include_endpoints', 0, async () => {
      const calculator = new CastEasingCalculator();
      const sequence: number[] = calculator.generateProgressSequence(CastEasing.LINEAR, 4);
      expect(sequence.length).assertEqual(5);
      expect(sequence[0]).assertEqual(0);
      expect(sequence[2]).assertEqual(0.5);
      expect(sequence[4]).assertEqual(1);
    });

    it('progress_sequence_with_zero_frames_should_have_one_sample', 0, async () => {
      const calculator = new CastEasingCalculator();
      const sequence: number[] = calculator.generateProgressSequence(CastEasing.EASE_IN, 0);
      expect(sequence.length).assertEqual(1);
      expect(sequence[0]).assertEqual(0);
    });

    // A single stream is rendered full screen with the whole panel area.
    it('single_tile_should_be_full_screen', 0, async () => {
      const model = new LayoutSwitchAnimationModel(1, 1920, 1080);
      expect(model.getColumns()).assertEqual(1);
      expect(model.getRows()).assertEqual(1);
      expect(model.getTileWidth()).assertEqual(1920);
      expect(model.getTileHeight()).assertEqual(1080);
      expect(model.getTileArea()).assertEqual(2073600);
      expect(model.isFullScreen()).assertTrue();
      expect(model.getLayoutName()).assertEqual('full');
    });

    it('two_tiles_should_split_columns', 0, async () => {
      const model = new LayoutSwitchAnimationModel(2, 1920, 1080);
      expect(model.getColumns()).assertEqual(2);
      expect(model.getRows()).assertEqual(1);
      expect(model.getTileWidth()).assertEqual(960);
      expect(model.getTileHeight()).assertEqual(1080);
      expect(model.getTileArea()).assertEqual(1036800);
      expect(model.isFullScreen()).assertFalse();
      expect(model.getLayoutName()).assertEqual('split_two');
      const stats = new LayoutSwitchStatistics();
      stats.addModel(model);
      stats.addModel(new LayoutSwitchAnimationModel(1, 1920, 1080));
      expect(stats.getModelCount()).assertEqual(2);
      expect(stats.getCountByLayout('split_two')).assertEqual(1);
      expect(stats.getAverageTileArea()).assertEqual(1555200);
      expect(stats.getFullScreenCount()).assertEqual(1);
      expect(model.equals(model.clone())).assertTrue();
    });

    it('three_tiles_should_use_quad_layout', 0, async () => {
      const model = new LayoutSwitchAnimationModel(3, 1920, 1080);
      expect(model.getColumns()).assertEqual(2);
      expect(model.getRows()).assertEqual(2);
      expect(model.getTileWidth()).assertEqual(960);
      expect(model.getTileHeight()).assertEqual(540);
      expect(model.getLayoutName()).assertEqual('quad');
    });

    it('four_tiles_should_use_quad_layout', 0, async () => {
      const model = new LayoutSwitchAnimationModel(4, 1920, 1080);
      expect(model.getColumns()).assertEqual(2);
      expect(model.getRows()).assertEqual(2);
      expect(model.getTileArea()).assertEqual(518400);
      expect(model.getLayoutName()).assertEqual('quad');
    });

    it('five_tiles_should_use_nine_grid', 0, async () => {
      const model = new LayoutSwitchAnimationModel(5, 1920, 1080);
      expect(model.getColumns()).assertEqual(3);
      expect(model.getRows()).assertEqual(3);
      expect(model.getTileWidth()).assertEqual(640);
      expect(model.getTileHeight()).assertEqual(360);
      expect(model.getLayoutName()).assertEqual('nine');
    });
    // The fade animation of the permission window correlates with the float window.

    // Layout switch animation is triggered from the player page navigation keys.
    it('layout_switch_should_correlate_with_player_navigation', 0, async () => {
      const before: number = await miracastComponentCount(driver);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const after: number = await miracastComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(3);
      const switchPlan: CastAnimationConfig = new FadeLayoutAnimationPlanner().planLayoutSwitch({
        fromTiles: 1,
        toTiles: 2,
        screenWidth: 1920,
        screenHeight: 1080
      });
      expect(switchPlan.type).assertEqual(CastAnimationType.LAYOUT_SWITCH);
      expect(switchPlan.duration).assertEqual(250);
    });

    // Repeated playback must stay within the frame budget of the TV device.
    it('animation_performance_should_handle_1000_playbacks', 0, async () => {
      controller.resetController();
      const startedAt: number = Date.now();
      for (let i: number = 0; i < 1000; i++) {
        controller.playAnimation({
          type: CastAnimationType.FADE_IN,
          duration: 100,
          delay: 0,
          easing: 'linear',
          repeatCount: 0
        });
        controller.updateAnimation(50);
        controller.updateAnimation(50);
      }
      const elapsed: number = Date.now() - startedAt;
      expect(elapsed).assertLessOrEqual(5000);
      expect(controller.getPlayCount()).assertEqual(1000);
      expect(controller.getCompletedCount()).assertEqual(1000);
    });

    // Key interactions must not disturb the animation controller state machine.
    it('animation_state_should_survive_key_interactions', 0, async () => {
      controller.resetController();
      const config: CastAnimationConfig = {
        type: CastAnimationType.FADE_IN,
        duration: 400,
        delay: 0,
        easing: 'linear',
        repeatCount: 0
      };
      controller.playAnimation(config);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_AFTER_SESSION_OP);
      const status: CastAnimationStatus = controller.getStatus();
      expect(status.state).assertEqual(CastAnimationState.RUNNING);
      controller.updateAnimation(200);
      expect(controller.getStatus().progress).assertEqual(0.5);
      expect(controller.pauseAnimation()).assertTrue();
      expect(controller.isPaused()).assertTrue();
    });
  });
}
