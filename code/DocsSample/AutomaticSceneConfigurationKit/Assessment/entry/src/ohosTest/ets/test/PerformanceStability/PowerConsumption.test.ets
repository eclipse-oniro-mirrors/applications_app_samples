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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  DELAY_KEY_NAVIGATION,
  ID_BEGIN_BUTTON,
  ID_INDEX_TITLE,
  ID_QUERY_CONFIG_BUTTON,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  clickIndexButton,
  findById,
  getDriver,
  launchAssessmentApp,
  pressAndWait,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Timing and power constants of the assessment sample.
const COUNTDOWN_INTERVAL: number = 1000;
const TOAST_DURATION: number = 2000;
const SECONDS_PER_MINUTE: number = 60;
const MILLIS_PER_MINUTE: number = 60000;
const MILLIS_PER_SECOND: number = 1000;
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;
const HARDENING_MEASURES: number = 4;

// Power figures of the model. They are order of magnitude estimates of a phone class device, the
// absolute values only matter for the ratios that the assertions use, so they are documented
// here instead of being scattered through the cases.
// Screen on with an assessment page rendered: 320 mA.
const SCREEN_ON_CURRENT_MA: number = 320;
// Screen off, processor idle: 8 mA.
const SCREEN_OFF_CURRENT_MA: number = 8;
// One countdown tick (a diff of one text node plus a ring repaint): 1 mAs. The energy values of
// this model are whole milliampere seconds so that every accounting assertion is exact instead
// of being subject to floating point rounding.
const TICK_ENERGY_MAS: number = 1;
// One AppStorage write of the event log: 2 mAs.
const APPSTORAGE_WRITE_ENERGY_MAS: number = 2;
// One hardening measure applied or released: 12 mAs.
const HARDENING_MEASURE_ENERGY_MAS: number = 12;
// One soft keyboard raise or hide: 45 mAs.
const KEYBOARD_CYCLE_ENERGY_MAS: number = 45;
// One frame of a page transition: 6 mAs.
const FRAME_ENERGY_MAS: number = 6;
// Battery capacity of the reference device: 4000 mAh, expressed in milliampere seconds.
const BATTERY_CAPACITY_MAS: number = 4000 * 3600;

// Budgets of the sixty minute model. The ten minute countdown is the default candidate and it is
// replayed six times to cover one hour of assessment. One hour of screen on assessment costs
// about 32 percent of the reference battery, so the drain budget leaves headroom for the
// assessment overhead on top of the display. The overhead itself (everything except the screen)
// must stay below two percent, which is the part the sample can actually control.
const MODEL_HOUR_REPETITIONS: number = 6;
const MAX_HOURLY_DRAIN_PERCENT: number = 40;
const MAX_ACTIVE_DRAIN_PERCENT: number = 2;
const MAX_TICK_SHARE_PERCENT: number = 1;
const MAX_HARDENING_SHARE_PERCENT: number = 1;
const MAX_TOAST_SHARE_PERCENT: number = 1;
// Severity bands of the drain percent, they are relative to the reference battery capacity. One
// hour of a visible assessment page costs about eight percent of the battery, which still counts
// as a normal session, while a page that repaints continuously lands in the high band.
const NEGLIGIBLE_DRAIN_PERCENT: number = 5;

const MODEL_ITERATIONS: number = 2000;
const MODEL_BUDGET_MS: number = 5000;
const UI_ROUNDS: number = 3;
const UI_ACTION_BUDGET_MS: number = 5000;

// Case identifiers, the trailing number is the sequence number of the case inside the suite.
const CASE_001: string = BUNDLE + 'PowerConsumption_001';
const CASE_002: string = BUNDLE + 'PowerConsumption_002';
const CASE_003: string = BUNDLE + 'PowerConsumption_003';
const CASE_004: string = BUNDLE + 'PowerConsumption_004';
const CASE_005: string = BUNDLE + 'PowerConsumption_005';
const CASE_006: string = BUNDLE + 'PowerConsumption_006';
const CASE_007: string = BUNDLE + 'PowerConsumption_007';
const CASE_008: string = BUNDLE + 'PowerConsumption_008';
const CASE_009: string = BUNDLE + 'PowerConsumption_009';
const CASE_010: string = BUNDLE + 'PowerConsumption_010';
const CASE_011: string = BUNDLE + 'PowerConsumption_011';
const CASE_012: string = BUNDLE + 'PowerConsumption_012';
const CASE_013: string = BUNDLE + 'PowerConsumption_013';
const CASE_014: string = BUNDLE + 'PowerConsumption_014';
const CASE_015: string = BUNDLE + 'PowerConsumption_015';
const CASE_016: string = BUNDLE + 'PowerConsumption_016';
const CASE_017: string = BUNDLE + 'PowerConsumption_017';
const CASE_018: string = BUNDLE + 'PowerConsumption_018';
const CASE_019: string = BUNDLE + 'PowerConsumption_019';
const CASE_020: string = BUNDLE + 'PowerConsumption_020';
const CASE_021: string = BUNDLE + 'PowerConsumption_021';
const CASE_022: string = BUNDLE + 'PowerConsumption_022';
const CASE_023: string = BUNDLE + 'PowerConsumption_023';
const CASE_024: string = BUNDLE + 'PowerConsumption_024';
const CASE_025: string = BUNDLE + 'PowerConsumption_025';
const CASE_026: string = BUNDLE + 'PowerConsumption_026';
const CASE_027: string = BUNDLE + 'PowerConsumption_027';
const CASE_028: string = BUNDLE + 'PowerConsumption_028';
const CASE_029: string = BUNDLE + 'PowerConsumption_029';

/**
 * Named power consumer of the assessment pages.
 */
enum PowerConsumer {
  SCREEN = 'screen',
  COUNTDOWN_TICK = 'countdown_tick',
  APP_STORAGE_WRITE = 'app_storage_write',
  HARDENING = 'hardening',
  KEYBOARD = 'keyboard',
  PAGE_TRANSITION = 'page_transition',
  TOAST = 'toast'
}

/**
 * Severity of a drain estimate.
 */
enum DrainSeverity {
  NEGLIGIBLE = 'negligible',
  NORMAL = 'normal',
  HIGH = 'high'
}

/**
 * One accounted charge of a session.
 */
interface PowerCharge {
  consumer: PowerConsumer;
  energyMas: number;
  occurrences: number;
}

/**
 * Accumulated energy of one consumer.
 */
interface ConsumerEnergy {
  consumer: PowerConsumer;
  energyMas: number;
  sharePercent: number;
}

/**
 * Result of one drain estimate.
 */
interface DrainEstimate {
  // Number of profile replays that the estimate covers.
  minutes: number;
  totalMas: number;
  drainPercent: number;
  severity: DrainSeverity;
}

/**
 * Numeric helper shared by the power models.
 */
class PowerMath {
  /**
   * Clamps a value into the closed interval.
   *
   * @param value value to clamp.
   * @param low lower bound.
   * @param high upper bound.
   * @returns the clamped value.
   */
  public static clamp(value: number, low: number, high: number): number {
    if (value < low) {
      return low;
    }
    if (value > high) {
      return high;
    }
    return value;
  }

  /**
   * Computes a rounded percentage, a zero whole never divides.
   *
   * @param part part of the whole.
   * @param whole reference value.
   * @returns the rounded percentage.
   */
  public static percentOf(part: number, whole: number): number {
    if (whole <= 0) {
      return 0;
    }
    return Math.round(part * 100 / whole);
  }

  /**
   * Rounds a value to two decimals without string conversion.
   *
   * @param value value to round.
   * @returns the rounded value.
   */
  public static roundTwo(value: number): number {
    return Math.round(value * 100) / 100;
  }

  /**
   * Computes an integer ceiling division.
   *
   * @param dividend value to divide.
   * @param divisor divisor, it must be positive.
   * @returns the ceiling of the quotient.
   */
  public static ceilDiv(dividend: number, divisor: number): number {
    if (divisor <= 0) {
      return 0;
    }
    const normalized: number = dividend < 0 ? 0 : dividend;
    return Math.floor((normalized + divisor - 1) / divisor);
  }
}

/**
 * Models the power profile of the assessment session.
 *
 * Every source of energy of the session is a named consumer: the screen while the page is
 * visible, the countdown tick, the AppStorage writes of the event log, the hardening measures,
 * the keyboard cycles of the whitelist input, the page transitions and the toast of an API
 * error. The profile keeps one accumulated bucket per consumer so that the share of every
 * consumer can be asserted without a device.
 */
class SessionPowerProfile {
  private screenMas: number = 0;
  private tickMas: number = 0;
  private appStorageMas: number = 0;
  private hardeningMas: number = 0;
  private keyboardMas: number = 0;
  private transitionMas: number = 0;
  private toastMas: number = 0;
  private ticks: number = 0;
  private writes: number = 0;
  private measures: number = 0;
  private keyboardCycles: number = 0;
  private frames: number = 0;
  private toasts: number = 0;

  /**
   * Accounts the screen energy of the given time span.
   *
   * @param durationMs duration the screen is on.
   * @returns the accounted energy in milliampere seconds.
   */
  public addScreenOn(durationMs: number): number {
    if (durationMs <= 0) {
      return 0;
    }
    const energy: number = SCREEN_ON_CURRENT_MA * durationMs / MILLIS_PER_SECOND;
    this.screenMas += energy;
    return energy;
  }

  /**
   * Accounts one countdown tick.
   *
   * @returns the accounted energy in milliampere seconds.
   */
  public addTick(): number {
    this.tickMas += TICK_ENERGY_MAS;
    this.ticks++;
    return TICK_ENERGY_MAS;
  }

  /**
   * Accounts several countdown ticks.
   *
   * @param times number of ticks.
   * @returns the accounted energy in milliampere seconds.
   */
  public addTicks(times: number): number {
    if (times <= 0) {
      return 0;
    }
    const energy: number = TICK_ENERGY_MAS * times;
    this.tickMas += energy;
    this.ticks += times;
    return energy;
  }

  /**
   * Accounts AppStorage writes of the event log.
   *
   * @param times number of writes.
   * @returns the accounted energy in milliampere seconds.
   */
  public addAppStorageWrites(times: number): number {
    if (times <= 0) {
      return 0;
    }
    const energy: number = APPSTORAGE_WRITE_ENERGY_MAS * times;
    this.appStorageMas += energy;
    this.writes += times;
    return energy;
  }

  /**
   * Accounts hardening measures, each measure costs the same whether it is applied or released.
   *
   * @param times number of measure transitions.
   * @returns the accounted energy in milliampere seconds.
   */
  public addHardening(times: number): number {
    if (times <= 0) {
      return 0;
    }
    const energy: number = HARDENING_MEASURE_ENERGY_MAS * times;
    this.hardeningMas += energy;
    this.measures += times;
    return energy;
  }

  /**
   * Accounts soft keyboard cycles.
   *
   * @param times number of raise and hide cycles.
   * @returns the accounted energy in milliampere seconds.
   */
  public addKeyboardCycles(times: number): number {
    if (times <= 0) {
      return 0;
    }
    const energy: number = KEYBOARD_CYCLE_ENERGY_MAS * times;
    this.keyboardMas += energy;
    this.keyboardCycles += times;
    return energy;
  }

  /**
   * Accounts rendered page transition frames.
   *
   * @param times number of frames.
   * @returns the accounted energy in milliampere seconds.
   */
  public addFrames(times: number): number {
    if (times <= 0) {
      return 0;
    }
    const energy: number = FRAME_ENERGY_MAS * times;
    this.transitionMas += energy;
    this.frames += times;
    return energy;
  }

  /**
   * Accounts one toast of the configured duration.
   *
   * @returns the accounted energy in milliampere seconds.
   */
  public addToast(): number {
    const energy: number = SCREEN_ON_CURRENT_MA * TOAST_DURATION / MILLIS_PER_SECOND;
    this.toastMas += energy;
    this.toasts++;
    return energy;
  }

  /**
   * Sums the energy of every consumer.
   *
   * @returns the total energy in milliampere seconds.
   */
  public totalMas(): number {
    return this.screenMas + this.tickMas + this.appStorageMas + this.hardeningMas + this.keyboardMas +
      this.transitionMas + this.toastMas;
  }

  /**
   * Sums the energy that is not caused by the display.
   *
   * @returns the non display energy in milliampere seconds.
   */
  public activeMas(): number {
    return this.totalMas() - this.screenMas;
  }

  public energyOf(consumer: PowerConsumer): number {
    if (consumer === PowerConsumer.SCREEN) {
      return this.screenMas;
    }
    if (consumer === PowerConsumer.COUNTDOWN_TICK) {
      return this.tickMas;
    }
    if (consumer === PowerConsumer.APP_STORAGE_WRITE) {
      return this.appStorageMas;
    }
    if (consumer === PowerConsumer.HARDENING) {
      return this.hardeningMas;
    }
    if (consumer === PowerConsumer.KEYBOARD) {
      return this.keyboardMas;
    }
    if (consumer === PowerConsumer.PAGE_TRANSITION) {
      return this.transitionMas;
    }
    return this.toastMas;
  }

  /**
   * Builds the energy breakdown of every consumer.
   *
   * @returns the breakdown in a fixed consumer order.
   */
  public breakdown(): ConsumerEnergy[] {
    const consumers: PowerConsumer[] = [
      PowerConsumer.SCREEN,
      PowerConsumer.COUNTDOWN_TICK,
      PowerConsumer.APP_STORAGE_WRITE,
      PowerConsumer.HARDENING,
      PowerConsumer.KEYBOARD,
      PowerConsumer.PAGE_TRANSITION,
      PowerConsumer.TOAST
    ];
    const whole: number = this.totalMas();
    const result: ConsumerEnergy[] = [];
    for (let i = 0; i < consumers.length; i++) {
      const energy: number = this.energyOf(consumers[i]);
      result.push({
        consumer: consumers[i],
        energyMas: energy,
        sharePercent: PowerMath.percentOf(energy, whole)
      });
    }
    return result;
  }

  public getTicks(): number {
    return this.ticks;
  }

  public getWrites(): number {
    return this.writes;
  }

  public getMeasures(): number {
    return this.measures;
  }

  public getKeyboardCycles(): number {
    return this.keyboardCycles;
  }

  public getFrames(): number {
    return this.frames;
  }

  public getToasts(): number {
    return this.toasts;
  }

  public reset(): void {
    this.screenMas = 0;
    this.tickMas = 0;
    this.appStorageMas = 0;
    this.hardeningMas = 0;
    this.keyboardMas = 0;
    this.transitionMas = 0;
    this.toastMas = 0;
    this.ticks = 0;
    this.writes = 0;
    this.measures = 0;
    this.keyboardCycles = 0;
    this.frames = 0;
    this.toasts = 0;
  }

  public toString(): string {
    return `SessionPowerProfile{total=${PowerMath.roundTwo(this.totalMas())} mAs, ticks=${this.ticks}, writes=${this.writes}}`;
  }
}

/**
 * Models the countdown tick efficiency.
 *
 * The countdown of the exam page only writes one number per second, so the efficiency of a tick
 * is defined as the energy per rendered second. A page that repainted the whole list once per
 * second would have a very different efficiency, the model keeps the ratio explicit so that a
 * regression of the tick cost is visible.
 */
class TickEfficiencyModel {
  private ticks: number = 0;
  private energyMas: number = 0;
  private readonly intervalMs: number;

  constructor(intervalMs: number) {
    this.intervalMs = intervalMs > 0 ? intervalMs : COUNTDOWN_INTERVAL;
  }

  /**
   * Accounts one tick.
   *
   * @returns true when the tick was accounted.
   */
  public tick(): boolean {
    this.ticks++;
    this.energyMas += TICK_ENERGY_MAS;
    return true;
  }

  /**
   * Accounts the ticks of a countdown of the given duration.
   *
   * @param durationMs countdown duration.
   * @returns the number of accounted ticks.
   */
  public ticksOfDuration(durationMs: number): number {
    if (durationMs <= 0) {
      return 0;
    }
    const expected: number = Math.floor(durationMs / this.intervalMs);
    for (let i = 0; i < expected; i++) {
      this.tick();
    }
    return expected;
  }

  public count(): number {
    return this.ticks;
  }

  public energy(): number {
    return this.energyMas;
  }

  /**
   * Computes the energy that one rendered second costs.
   *
   * @returns the energy per second in milliampere seconds, zero for an empty countdown.
   */
  public energyPerSecond(): number {
    if (this.ticks === 0) {
      return 0;
    }
    return PowerMath.roundTwo(this.energyMas / (this.ticks * this.intervalMs / MILLIS_PER_SECOND));
  }

  /**
   * Computes the average energy of one tick.
   *
   * @returns the average energy in milliampere seconds.
   */
  public energyPerTick(): number {
    if (this.ticks === 0) {
      return 0;
    }
    return PowerMath.roundTwo(this.energyMas / this.ticks);
  }

  public getIntervalMs(): number {
    return this.intervalMs;
  }

  public reset(): void {
    this.ticks = 0;
    this.energyMas = 0;
  }

  public toString(): string {
    return `TickEfficiencyModel{ticks=${this.ticks}, energy=${this.energyMas} mAs}`;
  }
}

/**
 * Models the wakeup budget of a session.
 *
 * A wakeup is the delivery of one timer callback. The countdown wakes the processor once per
 * second, everything else of the assessment session is event driven. The budget therefore only
 * allows one wakeup per second plus a small allowance for the transition of the pages.
 */
class WakeupBudget {
  private readonly maxWakeups: number;
  private wakeups: number = 0;
  private rejections: number = 0;

  constructor(durationMs: number) {
    const seconds: number = Math.floor(durationMs / MILLIS_PER_SECOND);
    // One countdown wakeup per second plus a fixed allowance of eight wakeups for the page
    // transitions and the two query calls of a session.
    this.maxWakeups = seconds + 8;
  }

  /**
   * Accounts one wakeup.
   *
   * @returns true when the wakeup fits the budget.
   */
  public wake(): boolean {
    if (this.wakeups >= this.maxWakeups) {
      this.rejections++;
      return false;
    }
    this.wakeups++;
    return true;
  }

  /**
   * Accounts several wakeups.
   *
   * @param times number of wakeups.
   * @returns the number of wakeups that fit the budget.
   */
  public wakeTimes(times: number): number {
    let accepted: number = 0;
    for (let i = 0; i < times; i++) {
      if (this.wake()) {
        accepted++;
      }
    }
    return accepted;
  }

  public count(): number {
    return this.wakeups;
  }

  public limit(): number {
    return this.maxWakeups;
  }

  public getRejections(): number {
    return this.rejections;
  }

  public remaining(): number {
    return this.maxWakeups - this.wakeups;
  }

  public isWithinBudget(): boolean {
    return this.wakeups <= this.maxWakeups;
  }

  public reset(): void {
    this.wakeups = 0;
    this.rejections = 0;
  }

  public toString(): string {
    return `WakeupBudget{wakeups=${this.wakeups}, limit=${this.maxWakeups}, rejections=${this.rejections}}`;
  }
}

/**
 * Models the screen on policy of the assessment session.
 *
 * The assessment service keeps the display awake while a session is active, the exam page must
 * not add a second keep awake request on top of it. The model tracks the holders of the policy
 * and rejects a duplicate acquisition, so the session never holds two screen locks.
 */
class ScreenOnPolicy {
  private holders: string[] = [];
  private acquisitions: number = 0;
  private releases: number = 0;
  private duplicates: number = 0;

  /**
   * Acquires the screen on policy for a holder.
   *
   * @param holder name of the holder, for example the assessment service.
   * @returns true when the holder acquired the policy.
   */
  public acquire(holder: string): boolean {
    if (holder.length === 0 || this.holders.indexOf(holder) >= 0) {
      this.duplicates++;
      return false;
    }
    this.holders.push(holder);
    this.acquisitions++;
    return true;
  }

  /**
   * Releases the screen on policy of a holder.
   *
   * @param holder name of the holder.
   * @returns true when the holder released the policy.
   */
  public release(holder: string): boolean {
    const index: number = this.holders.indexOf(holder);
    if (index < 0) {
      return false;
    }
    this.holders.splice(index, 1);
    this.releases++;
    return true;
  }

  public holderCount(): number {
    return this.holders.length;
  }

  public isHeld(): boolean {
    return this.holders.length > 0;
  }

  public isHeldBy(holder: string): boolean {
    return this.holders.indexOf(holder) >= 0;
  }

  public getAcquisitions(): number {
    return this.acquisitions;
  }

  public getReleases(): number {
    return this.releases;
  }

  public getDuplicates(): number {
    return this.duplicates;
  }

  public isBalanced(): boolean {
    return this.acquisitions === this.releases && this.holders.length === 0;
  }

  public reset(): void {
    this.holders.splice(0, this.holders.length);
    this.acquisitions = 0;
    this.releases = 0;
    this.duplicates = 0;
  }

  public toString(): string {
    return `ScreenOnPolicy{holders=${this.holders.length}, acquisitions=${this.acquisitions}}`;
  }
}

/**
 * Estimates the battery drain of an hour of assessment.
 *
 * The estimate scales a measured profile to the number of times it is replayed inside one hour.
 * A ten minute countdown is replayed six times, a one minute sample sixty times. The drain is
 * expressed in percent of the reference battery so that it can be compared with the documented
 * budget, and the severity is derived from that percent.
 */
class BatteryDrainModel {
  private readonly capacityMas: number;

  constructor(capacityMas: number) {
    this.capacityMas = capacityMas > 0 ? capacityMas : BATTERY_CAPACITY_MAS;
  }

  /**
   * Estimates the drain of a replayed profile.
   *
   * @param profile power profile of one replay.
   * @param repetitions number of replays inside the estimate window.
   * @returns the drain estimate.
   */
  public estimate(profile: SessionPowerProfile, repetitions: number): DrainEstimate {
    const bounded: number = repetitions < 0 ? 0 : repetitions;
    const total: number = profile.totalMas() * bounded;
    const drainPercent: number = PowerMath.roundTwo(total * 100 / this.capacityMas);
    return {
      minutes: bounded,
      totalMas: PowerMath.roundTwo(total),
      drainPercent: drainPercent,
      severity: this.severityOf(drainPercent)
    };
  }

  /**
   * Estimates the drain of the active consumers only, the screen is excluded.
   *
   * @param profile power profile of one replay.
   * @param repetitions number of replays inside the estimate window.
   * @returns the drain estimate of the active consumers.
   */
  public estimateActive(profile: SessionPowerProfile, repetitions: number): DrainEstimate {
    const bounded: number = repetitions < 0 ? 0 : repetitions;
    const total: number = profile.activeMas() * bounded;
    const drainPercent: number = PowerMath.roundTwo(total * 100 / this.capacityMas);
    return {
      minutes: bounded,
      totalMas: PowerMath.roundTwo(total),
      drainPercent: drainPercent,
      severity: this.severityOf(drainPercent)
    };
  }

  /**
   * Grades a drain percent of the reference battery.
   *
   * @param drainPercent drain of the battery in percent.
   * @returns the severity of the drain.
   */
  public severityOf(drainPercent: number): DrainSeverity {
    if (drainPercent <= NEGLIGIBLE_DRAIN_PERCENT) {
      return DrainSeverity.NEGLIGIBLE;
    }
    if (drainPercent <= MAX_HOURLY_DRAIN_PERCENT) {
      return DrainSeverity.NORMAL;
    }
    return DrainSeverity.HIGH;
  }

  public capacity(): number {
    return this.capacityMas;
  }

  public toString(): string {
    return `BatteryDrainModel{capacity=${this.capacityMas} mAs}`;
  }
}

/**
 * Aggregates the pass and fail outcomes of one power run.
 */
class PowerReport {
  private checks: string[] = [];
  private failures: string[] = [];

  public check(name: string, passed: boolean): boolean {
    this.checks.push(name);
    if (!passed) {
      this.failures.push(name);
    }
    return passed;
  }

  public checkUpperBound(name: string, value: number, threshold: number): boolean {
    return this.check(name, value <= threshold);
  }

  public checkLowerBound(name: string, value: number, threshold: number): boolean {
    return this.check(name, value >= threshold);
  }

  public count(): number {
    return this.checks.length;
  }

  public passedCount(): number {
    return this.checks.length - this.failures.length;
  }

  public failureCount(): number {
    return this.failures.length;
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failures.length === 0;
  }

  public failureNames(): string[] {
    return this.failures.slice();
  }

  public summary(): string {
    return this.isPassed() ? 'power-pass' : 'power-fail';
  }

  public reset(): void {
    this.checks = [];
    this.failures = [];
  }

  public toString(): string {
    return `PowerReport{checks=${this.checks.length}, failures=${this.failures.length}}`;
  }
}

/**
 * Logs the begin marker of a case.
 *
 * @param caseName name of the case.
 */
function logBegin(caseName: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', caseName + ', begin');
}

/**
 * Logs the end marker of a case.
 *
 * @param caseName name of the case.
 */
function logEnd(caseName: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', caseName + ', end');
}

/**
 * Launches the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is available.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  return await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
}

/**
 * Builds the power profile of one exam page visit.
 *
 * @param durationMs duration of the countdown.
 * @param transitions number of page transitions.
 * @returns the profile of the visit.
 */
function buildVisitProfile(durationMs: number, transitions: number): SessionPowerProfile {
  const profile: SessionPowerProfile = new SessionPowerProfile();
  profile.addScreenOn(durationMs);
  profile.addTicks(Math.floor(durationMs / COUNTDOWN_INTERVAL));
  profile.addHardening(HARDENING_MEASURES * 2);
  profile.addFrames(transitions * 12);
  return profile;
}

export default function powerConsumptionTest() {
  describe('PowerConsumption_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh power profile is created.
     * Expectation: every consumer bucket is zero and the breakdown returns one entry per
     * consumer with a zero share.
     */
    it('Assessment_PowerConsumption_001', 0, () => {
      logBegin(CASE_001);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      expect(profile.totalMas()).assertEqual(0);
      expect(profile.activeMas()).assertEqual(0);
      expect(profile.breakdown().length).assertEqual(7);
      expect(profile.breakdown()[0].sharePercent).assertEqual(0);
      expect(profile.energyOf(PowerConsumer.SCREEN)).assertEqual(0);
      expect(profile.getTicks()).assertEqual(0);
      logEnd(CASE_001);
    });

    /**
     * Scenario: one countdown tick is accounted.
     * Expectation: the tick bucket, the tick counter and the active energy all move by the
     * documented tick energy.
     */
    it('Assessment_PowerConsumption_003', 0, () => {
      logBegin(CASE_003);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      expect(profile.addTick()).assertEqual(TICK_ENERGY_MAS);
      expect(profile.getTicks()).assertEqual(1);
      expect(profile.energyOf(PowerConsumer.COUNTDOWN_TICK)).assertEqual(TICK_ENERGY_MAS);
      expect(profile.activeMas()).assertEqual(TICK_ENERGY_MAS);
      expect(profile.totalMas()).assertEqual(TICK_ENERGY_MAS);
      expect(profile.addTicks(0)).assertEqual(0);
      logEnd(CASE_003);
    });

    /**
     * Scenario: the ticks of a ten minute countdown are accounted in one call.
     * Expectation: six hundred ticks enter the bucket and the returned energy equals the tick
     * energy multiplied by the tick count.
     */
    it('Assessment_PowerConsumption_004', 0, () => {
      logBegin(CASE_004);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      const ticks: number = DURATION_TEN_MINUTES / COUNTDOWN_INTERVAL;
      const energy: number = profile.addTicks(ticks);
      expect(energy).assertEqual(TICK_ENERGY_MAS * 600);
      expect(profile.getTicks()).assertEqual(600);
      expect(profile.energyOf(PowerConsumer.COUNTDOWN_TICK)).assertEqual(TICK_ENERGY_MAS * 600);
      hilog.info(DOMAIN, TAG, '%{public}s', profile.toString());
      logEnd(CASE_004);
    });

    /**
     * Scenario: AppStorage writes of the event log are accounted.
     * Expectation: every write costs the documented energy and the write counter matches the
     * number of accounted writes.
     */
    it('Assessment_PowerConsumption_005', 0, () => {
      logBegin(CASE_005);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      expect(profile.addAppStorageWrites(20)).assertEqual(APPSTORAGE_WRITE_ENERGY_MAS * 20);
      expect(profile.getWrites()).assertEqual(20);
      expect(profile.addAppStorageWrites(0)).assertEqual(0);
      expect(profile.getWrites()).assertEqual(20);
      expect(profile.energyOf(PowerConsumer.APP_STORAGE_WRITE)).assertEqual(APPSTORAGE_WRITE_ENERGY_MAS * 20);
      logEnd(CASE_005);
    });

    /**
     * Scenario: the hardening measures of one page visit are accounted.
     * Expectation: applying and releasing four measures costs eight measure transitions and the
     * measure counter matches them.
     */
    it('Assessment_PowerConsumption_006', 0, () => {
      logBegin(CASE_006);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      const transitions: number = HARDENING_MEASURES * 2;
      expect(profile.addHardening(transitions)).assertEqual(HARDENING_MEASURE_ENERGY_MAS * transitions);
      expect(profile.getMeasures()).assertEqual(8);
      expect(profile.energyOf(PowerConsumer.HARDENING)).assertEqual(96);
      expect(profile.addHardening(-1)).assertEqual(0);
      logEnd(CASE_006);
    });

    /**
     * Scenario: the keyboard cycles of the whitelist input are accounted.
     * Expectation: one cycle costs the documented keyboard energy and the cycle counter is
     * exact.
     */
    it('Assessment_PowerConsumption_007', 0, () => {
      logBegin(CASE_007);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      expect(profile.addKeyboardCycles(1)).assertEqual(KEYBOARD_CYCLE_ENERGY_MAS);
      expect(profile.getKeyboardCycles()).assertEqual(1);
      expect(profile.addKeyboardCycles(3)).assertEqual(KEYBOARD_CYCLE_ENERGY_MAS * 3);
      expect(profile.getKeyboardCycles()).assertEqual(4);
      expect(profile.energyOf(PowerConsumer.KEYBOARD)).assertEqual(180);
      logEnd(CASE_007);
    });

    /**
     * Scenario: the transition frames of a page push are accounted.
     * Expectation: twelve frames cost the documented frame energy and the frame counter follows
     * the accounting.
     */
    it('Assessment_PowerConsumption_008', 0, () => {
      logBegin(CASE_008);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      expect(profile.addFrames(12)).assertEqual(FRAME_ENERGY_MAS * 12);
      expect(profile.getFrames()).assertEqual(12);
      expect(profile.energyOf(PowerConsumer.PAGE_TRANSITION)).assertEqual(72);
      expect(profile.addFrames(0)).assertEqual(0);
      logEnd(CASE_008);
    });

    /**
     * Scenario: one toast of an API error is accounted.
     * Expectation: the toast costs the screen current for the configured two second duration and
     * the toast counter is one.
     */
    it('Assessment_PowerConsumption_009', 0, () => {
      logBegin(CASE_009);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      const energy: number = profile.addToast();
      expect(energy).assertEqual(SCREEN_ON_CURRENT_MA * TOAST_DURATION / MILLIS_PER_SECOND);
      expect(energy).assertEqual(640);
      expect(profile.getToasts()).assertEqual(1);
      expect(profile.energyOf(PowerConsumer.TOAST)).assertEqual(640);
      logEnd(CASE_009);
    });

    /**
     * Scenario: the power profile is reset between two sessions.
     * Expectation: every bucket and every counter returns to zero.
     */
    it('Assessment_PowerConsumption_011', 0, () => {
      logBegin(CASE_011);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      profile.addScreenOn(MILLIS_PER_MINUTE);
      profile.addTicks(60);
      profile.addAppStorageWrites(5);
      profile.addToast();
      profile.reset();
      expect(profile.totalMas()).assertEqual(0);
      expect(profile.activeMas()).assertEqual(0);
      expect(profile.getTicks()).assertEqual(0);
      expect(profile.getWrites()).assertEqual(0);
      expect(profile.getToasts()).assertEqual(0);
      expect(profile.breakdown()[0].sharePercent).assertEqual(0);
      logEnd(CASE_011);
    });

    /**
     * Scenario: a visit profile of the ten minute countdown is built.
     * Expectation: the profile accounts the screen, the six hundred ticks, the eight hardening
     * transitions and the transition frames of the visit.
     */
    it('Assessment_PowerConsumption_012', 0, () => {
      logBegin(CASE_012);
      const profile: SessionPowerProfile = buildVisitProfile(DURATION_TEN_MINUTES, 1);
      expect(profile.getTicks()).assertEqual(600);
      expect(profile.getMeasures()).assertEqual(8);
      expect(profile.getFrames()).assertEqual(12);
      expect(profile.energyOf(PowerConsumer.SCREEN)).assertEqual(SCREEN_ON_CURRENT_MA * 600);
      expect(profile.totalMas()).assertLarger(profile.activeMas());
      hilog.info(DOMAIN, TAG, '%{public}s', profile.toString());
      logEnd(CASE_012);
    });

    /**
     * Scenario: a fresh tick efficiency model is created.
     * Expectation: the countdown is empty, the interval equals the sample interval and every
     * ratio answers zero.
     */
    it('Assessment_PowerConsumption_013', 0, () => {
      logBegin(CASE_013);
      const efficiency: TickEfficiencyModel = new TickEfficiencyModel(COUNTDOWN_INTERVAL);
      expect(efficiency.count()).assertEqual(0);
      expect(efficiency.energy()).assertEqual(0);
      expect(efficiency.energyPerSecond()).assertEqual(0);
      expect(efficiency.energyPerTick()).assertEqual(0);
      expect(efficiency.getIntervalMs()).assertEqual(1000);
      logEnd(CASE_013);
    });

    /**
     * Scenario: one second of countdown is accounted by the efficiency model.
     * Expectation: the energy per rendered second equals the documented tick energy and the
     * average energy per tick is the same value for a one second countdown.
     */
    it('Assessment_PowerConsumption_014', 0, () => {
      logBegin(CASE_014);
      const efficiency: TickEfficiencyModel = new TickEfficiencyModel(COUNTDOWN_INTERVAL);
      expect(efficiency.tick()).assertTrue();
      expect(efficiency.count()).assertEqual(1);
      expect(efficiency.energy()).assertEqual(TICK_ENERGY_MAS);
      expect(efficiency.energyPerSecond()).assertEqual(PowerMath.roundTwo(TICK_ENERGY_MAS));
      expect(efficiency.energyPerTick()).assertEqual(PowerMath.roundTwo(TICK_ENERGY_MAS));
      logEnd(CASE_014);
    });

    /**
     * Scenario: the ticks of all four duration candidates are accounted.
     * Expectation: the default candidate needs no ticks, the explicit candidates need six
     * hundred, eighteen hundred and thirty six hundred ticks.
     */
    it('Assessment_PowerConsumption_015', 0, () => {
      logBegin(CASE_015);
      const efficiency: TickEfficiencyModel = new TickEfficiencyModel(COUNTDOWN_INTERVAL);
      expect(efficiency.ticksOfDuration(DURATION_DEFAULT)).assertEqual(0);
      expect(efficiency.ticksOfDuration(DURATION_TEN_MINUTES)).assertEqual(600);
      expect(efficiency.ticksOfDuration(DURATION_THIRTY_MINUTES)).assertEqual(1800);
      expect(efficiency.ticksOfDuration(DURATION_SIXTY_MINUTES)).assertEqual(3600);
      expect(efficiency.count()).assertEqual(6000);
      expect(efficiency.energy()).assertEqual(TICK_ENERGY_MAS * 6000);
      logEnd(CASE_015);
    });

    /**
     * Scenario: the efficiency model is reset after a countdown.
     * Expectation: the tick counter and the energy return to zero and the ratios answer zero
     * again.
     */
    it('Assessment_PowerConsumption_016', 0, () => {
      logBegin(CASE_016);
      const efficiency: TickEfficiencyModel = new TickEfficiencyModel(COUNTDOWN_INTERVAL);
      efficiency.ticksOfDuration(DURATION_TEN_MINUTES);
      expect(efficiency.count()).assertEqual(600);
      efficiency.reset();
      expect(efficiency.count()).assertEqual(0);
      expect(efficiency.energy()).assertEqual(0);
      expect(efficiency.energyPerSecond()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', efficiency.toString());
      logEnd(CASE_016);
    });

    /**
     * Scenario: a wakeup budget is created for the ten minute countdown.
     * Expectation: the budget allows one wakeup per second plus the fixed transition allowance.
     */
    it('Assessment_PowerConsumption_018', 0, () => {
      logBegin(CASE_018);
      const budget: WakeupBudget = new WakeupBudget(DURATION_TEN_MINUTES);
      expect(budget.limit()).assertEqual(608);
      expect(budget.count()).assertEqual(0);
      expect(budget.remaining()).assertEqual(608);
      expect(budget.isWithinBudget()).assertTrue();
      expect(budget.getRejections()).assertEqual(0);
      logEnd(CASE_018);
    });

    /**
     * Scenario: a countdown consumes its whole wakeup budget.
     * Expectation: the six hundred countdown wakeups fit and the first eight transition wakeups
     * still fit while the ninth one is rejected.
     */
    it('Assessment_PowerConsumption_019', 0, () => {
      logBegin(CASE_019);
      const budget: WakeupBudget = new WakeupBudget(DURATION_TEN_MINUTES);
      expect(budget.wakeTimes(600)).assertEqual(600);
      expect(budget.remaining()).assertEqual(8);
      expect(budget.wakeTimes(8)).assertEqual(8);
      expect(budget.remaining()).assertEqual(0);
      expect(budget.wake()).assertFalse();
      expect(budget.getRejections()).assertEqual(1);
      expect(budget.isWithinBudget()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', budget.toString());
      logEnd(CASE_019);
    });

    /**
     * Scenario: the wakeup budget of the default duration is created.
     * Expectation: a zero duration only allows the fixed transition allowance.
     */
    it('Assessment_PowerConsumption_020', 0, () => {
      logBegin(CASE_020);
      const budget: WakeupBudget = new WakeupBudget(DURATION_DEFAULT);
      expect(budget.limit()).assertEqual(8);
      expect(budget.wakeTimes(8)).assertEqual(8);
      expect(budget.wakeTimes(3)).assertEqual(0);
      expect(budget.getRejections()).assertEqual(3);
      budget.reset();
      expect(budget.count()).assertEqual(0);
      expect(budget.remaining()).assertEqual(8);
      logEnd(CASE_020);
    });

    /**
     * Scenario: the screen on policy is acquired by the assessment service.
     * Expectation: the policy is held by the service, a duplicate acquisition is rejected and
     * the holder list never contains the same name twice.
     */
    it('Assessment_PowerConsumption_021', 0, () => {
      logBegin(CASE_021);
      const policy: ScreenOnPolicy = new ScreenOnPolicy();
      expect(policy.acquire('assessment-service')).assertTrue();
      expect(policy.isHeld()).assertTrue();
      expect(policy.isHeldBy('assessment-service')).assertTrue();
      expect(policy.acquire('assessment-service')).assertFalse();
      expect(policy.acquire('')).assertFalse();
      expect(policy.getDuplicates()).assertEqual(2);
      expect(policy.holderCount()).assertEqual(1);
      logEnd(CASE_021);
    });

    /**
     * Scenario: the screen on policy is acquired and released again.
     * Expectation: the releases balance the acquisitions and the policy is free afterwards.
     */
    it('Assessment_PowerConsumption_022', 0, () => {
      logBegin(CASE_022);
      const policy: ScreenOnPolicy = new ScreenOnPolicy();
      expect(policy.acquire('assessment-service')).assertTrue();
      expect(policy.acquire('exam-page')).assertTrue();
      expect(policy.holderCount()).assertEqual(2);
      expect(policy.release('exam-page')).assertTrue();
      expect(policy.release('unknown')).assertFalse();
      expect(policy.release('assessment-service')).assertTrue();
      expect(policy.isHeld()).assertFalse();
      expect(policy.isBalanced()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', policy.toString());
      logEnd(CASE_022);
    });

    /**
     * Scenario: a battery drain model is created for the reference capacity.
     * Expectation: the model reports the documented capacity and the severity bands of the drain
     * percent are stable.
     */
    it('Assessment_PowerConsumption_023', 0, () => {
      logBegin(CASE_023);
      const drain: BatteryDrainModel = new BatteryDrainModel(BATTERY_CAPACITY_MAS);
      expect(drain.capacity()).assertEqual(BATTERY_CAPACITY_MAS);
      expect(drain.severityOf(0)).assertEqual(DrainSeverity.NEGLIGIBLE);
      expect(drain.severityOf(NEGLIGIBLE_DRAIN_PERCENT)).assertEqual(DrainSeverity.NEGLIGIBLE);
      expect(drain.severityOf(NEGLIGIBLE_DRAIN_PERCENT + 1)).assertEqual(DrainSeverity.NORMAL);
      expect(drain.severityOf(MAX_HOURLY_DRAIN_PERCENT)).assertEqual(DrainSeverity.NORMAL);
      expect(drain.severityOf(MAX_HOURLY_DRAIN_PERCENT + 1)).assertEqual(DrainSeverity.HIGH);
      expect(drain.severityOf(100)).assertEqual(DrainSeverity.HIGH);
      logEnd(CASE_023);
    });

    /**
     * Scenario: the hourly overhead is split by consumer.
     * Expectation: the tick energy stays inside its documented share of the drain, the hardening
     * stays inside its share and the toast stays inside its share.
     */
    it('Assessment_PowerConsumption_026', 0, () => {
      logBegin(CASE_026);
      const profile: SessionPowerProfile = new SessionPowerProfile();
      profile.addScreenOn(60 * MILLIS_PER_MINUTE);
      profile.addTicks(3600);
      profile.addHardening(HARDENING_MEASURES * 2 * MODEL_HOUR_REPETITIONS);
      profile.addToast();
      const drain: BatteryDrainModel = new BatteryDrainModel(BATTERY_CAPACITY_MAS);
      const estimate: DrainEstimate = drain.estimate(profile, 1);
      const report: PowerReport = new PowerReport();
      report.checkUpperBound('tick-share', PowerMath.percentOf(profile.energyOf(PowerConsumer.COUNTDOWN_TICK),
        profile.totalMas()), MAX_TICK_SHARE_PERCENT);
      report.checkUpperBound('hardening-share', PowerMath.percentOf(profile.energyOf(PowerConsumer.HARDENING),
        profile.totalMas()), MAX_HARDENING_SHARE_PERCENT);
      report.checkUpperBound('toast-share', PowerMath.percentOf(profile.energyOf(PowerConsumer.TOAST),
        profile.totalMas()), MAX_TOAST_SHARE_PERCENT);
      report.checkUpperBound('drain', estimate.drainPercent, MAX_HOURLY_DRAIN_PERCENT);
      report.checkUpperBound('active-drain', drain.estimateActive(profile, 1).drainPercent,
        MAX_ACTIVE_DRAIN_PERCENT);
      expect(report.isPassed()).assertTrue();
      expect(profile.getTicks()).assertEqual(3600);
      hilog.info(DOMAIN, TAG, '%{public}s', report.toString());
      logEnd(CASE_026);
    });
  });
}
