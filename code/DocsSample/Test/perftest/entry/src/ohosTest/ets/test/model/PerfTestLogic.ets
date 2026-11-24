/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Deterministic transcription of the perftest sample: the Utils calculator, the
// PerfTest strategy/measure lifecycle, page routing and list-swipe inputs. Device
// counters and UiTest are replaced by explicit inputs so every result is stable.

export const DEFAULT_MAX_NUM: number = 10000;
export const DEFAULT_ITERATIONS: number = 5;
export const DEFAULT_TIMEOUT: number = 30000;
export const PAGE_TIMEOUT: number = 50000;
export const FLING_START_FACTOR: number = 1.5;
export const FLING_END_FACTOR: number = 0.5;
export const FLING_STEP: number = 50;
export const FLING_VELOCITY: number = 20000;
export const SCROLL_TO_TOP_SPEED: number = 40000;
export const BUNDLE_NAME: string = 'com.samples.test.perftest';
export const ABILITY_NAME: string = 'EntryAbility';
export const LIST_PAGE: string = 'pages/PageListPage';
export const NAV_PAGE: string = 'pages/navigationPage';
export const INDEX_PAGE: string = 'pages/Index';
export const BUTTON_LIST_ID: string = 'toPageList';
export const BUTTON_NAV_ID: string = 'toNavigationPage';
export const LIST_TEXT: string = 'ListPage';
export const NAV_TEXT: string = 'navigation';
export const PUSH_TEXT: string = 'push Page01';
export const PAGE_BACK: string = 'back';
export const PAGE_PUSH: string = 'push';

// Mirrors PerfMetric members used by the sample.
export const METRIC_DURATION: number = 0;
export const METRIC_CPU_LOAD: number = 1;
export const METRIC_CPU_USAGE: number = 2;
export const METRIC_MEMORY_RSS: number = 3;
export const METRIC_MEMORY_PSS: number = 4;
export const METRIC_PAGE_SWITCH: number = 5;
export const METRIC_LIST_FPS: number = 6;
export const METRIC_APP_RESPONSE: number = 7;
export const METRIC_APP_COMPLETE: number = 8;
export const METRIC_COUNT: number = 9;

export function round6(value: number): number {
  return Math.round(value * 1000000) / 1000000;
}

export function metricName(id: number): string {
  if (id === METRIC_DURATION) { return 'DURATION'; }
  if (id === METRIC_CPU_LOAD) { return 'CPU_LOAD'; }
  if (id === METRIC_CPU_USAGE) { return 'CPU_USAGE'; }
  if (id === METRIC_MEMORY_RSS) { return 'MEMORY_RSS'; }
  if (id === METRIC_MEMORY_PSS) { return 'MEMORY_PSS'; }
  if (id === METRIC_PAGE_SWITCH) { return 'PAGE_SWITCH_COMPLETE_TIME'; }
  if (id === METRIC_LIST_FPS) { return 'LIST_SWIPE_FPS'; }
  if (id === METRIC_APP_RESPONSE) { return 'APP_START_RESPONSE_TIME'; }
  if (id === METRIC_APP_COMPLETE) { return 'APP_START_COMPLETE_TIME'; }
  return '';
}

export function metricId(name: string): number {
  for (let i: number = 0; i < METRIC_COUNT; i++) {
    if (metricName(i) === name) { return i; }
  }
  return -1;
}

export function isCpuMetric(id: number): boolean {
  return id === METRIC_CPU_LOAD || id === METRIC_CPU_USAGE;
}

export function isMemoryMetric(id: number): boolean {
  return id === METRIC_MEMORY_RSS || id === METRIC_MEMORY_PSS;
}

export function isTimeMetric(id: number): boolean {
  return id === METRIC_DURATION || id === METRIC_PAGE_SWITCH || id === METRIC_APP_RESPONSE ||
    id === METRIC_APP_COMPLETE;
}

export function isFpsMetric(id: number): boolean {
  return id === METRIC_LIST_FPS;
}

// Mirrors the metric arrays chosen by each scenario in PerfTest.test.ets.
export function scenarioMetrics(scenario: number): string {
  if (scenario === 0) { return 'DURATION,CPU_LOAD,CPU_USAGE,MEMORY_RSS,MEMORY_PSS'; }
  if (scenario === 1) { return 'PAGE_SWITCH_COMPLETE_TIME'; }
  if (scenario === 2) { return 'LIST_SWIPE_FPS'; }
  if (scenario === 3) { return 'DURATION,MEMORY_RSS,MEMORY_PSS'; }
  if (scenario === 4) { return 'DURATION,MEMORY_RSS,MEMORY_PSS,PAGE_SWITCH_COMPLETE_TIME'; }
  if (scenario === 5) { return 'DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME'; }
  return '';
}

export function scenarioName(scenario: number): string {
  if (scenario === 0) { return 'calculate'; }
  if (scenario === 1) { return 'pageSwitch'; }
  if (scenario === 2) { return 'listSwipe'; }
  if (scenario === 3) { return 'keep'; }
  if (scenario === 4) { return 'navigation'; }
  if (scenario === 5) { return 'appStart'; }
  return '';
}

// Mirrors Utils.CalculateTest()/Reset().
export function calculateNum(current: number, maxNum: number): number {
  return current + maxNum;
}

export function resetNum(): number {
  return 0;
}

export function calculateSteps(count: number, iterations: number): number {
  return count * iterations;
}

export function utilsNumAfter(iterations: number, maxNum: number): number {
  let num: number = 0;
  for (let i: number = 0; i < iterations; i++) {
    num = calculateNum(num, maxNum);
  }
  return num;
}

export function iterationsValid(iterations: number): boolean {
  return Number.isInteger(iterations) && iterations >= 1 && iterations <= 100;
}

export function timeoutValid(timeout: number): boolean {
  return Number.isInteger(timeout) && timeout >= 1000 && timeout <= 60000;
}

export function metricListValid(metrics: Array<number>): boolean {
  if (metrics.length === 0) { return false; }
  for (let i: number = 0; i < metrics.length; i++) {
    if (metrics[i] < 0 || metrics[i] >= METRIC_COUNT) { return false; }
    for (let j: number = i + 1; j < metrics.length; j++) {
      if (metrics[i] === metrics[j]) { return false; }
    }
  }
  return true;
}

export function bundleValid(bundleName: string): boolean {
  return bundleName.length > 0;
}

export function hasActionValid(hasAction: boolean): boolean {
  return hasAction;
}

export function strategyValid(metrics: Array<number>, iterations: number, timeout: number, bundleName: string,
  hasAction: boolean): boolean {
  return metricListValid(metrics) && iterationsValid(iterations) && timeoutValid(timeout) &&
    bundleValid(bundleName) && hasActionValid(hasAction);
}

export function strategySummary(metrics: Array<number>, iterations: number, timeout: number): string {
  let names: Array<string> = [];
  for (let i: number = 0; i < metrics.length; i++) { names.push(metricName(metrics[i])); }
  return names.join(',') + '|' + iterations + '|' + timeout;
}

export function average(values: Array<number>): number {
  if (values.length === 0) { return 0; }
  let sum: number = 0;
  for (let i: number = 0; i < values.length; i++) { sum += values[i]; }
  return round6(sum / values.length);
}

export function maximum(values: Array<number>): number {
  if (values.length === 0) { return 0; }
  let max: number = values[0];
  for (let i: number = 1; i < values.length; i++) { if (values[i] > max) { max = values[i]; } }
  return max;
}

export function minimum(values: Array<number>): number {
  if (values.length === 0) { return 0; }
  let min: number = values[0];
  for (let i: number = 1; i < values.length; i++) { if (values[i] < min) { min = values[i]; } }
  return min;
}

export function roundCount(values: Array<number>): number {
  return values.length;
}

export function resultSummary(values: Array<number>): string {
  return average(values) + '|' + maximum(values) + '|' + minimum(values) + '|' + roundCount(values);
}

export function resultValid(values: Array<number>): boolean {
  return average(values) >= 0 && maximum(values) >= 0 && minimum(values) >= 0 && roundCount(values) >= 0;
}

export function clampMetricValue(value: number): number {
  return value < 0 ? 0 : value;
}

export function fpsFromFrames(frames: number, durationMs: number): number {
  if (durationMs <= 0) { return 0; }
  return round6(frames * 1000 / durationMs);
}

export function durationBetween(start: number, end: number): number {
  return end >= start ? end - start : 0;
}

export function flingStartY(centerY: number): number {
  return Math.floor(centerY * FLING_START_FACTOR);
}

export function flingEndY(centerY: number): number {
  return Math.floor(centerY * FLING_END_FACTOR);
}

export function flingDistance(centerY: number): number {
  return flingStartY(centerY) - flingEndY(centerY);
}

export function flingVelocityValid(velocity: number): boolean {
  return Number.isInteger(velocity) && velocity >= 200 && velocity <= 40000;
}

export function flingStepsValid(step: number): boolean {
  return Number.isInteger(step) && step >= 1 && step <= 100;
}

export function scrollToTopValid(speed: number): boolean {
  return Number.isInteger(speed) && speed >= 200 && speed <= 40000;
}

export function routeUrl(page: number): string {
  if (page === 0) { return LIST_PAGE; }
  if (page === 1) { return NAV_PAGE; }
  if (page === 2) { return INDEX_PAGE; }
  return '';
}

export function routeButtonId(page: number): string {
  if (page === 0) { return BUTTON_LIST_ID; }
  if (page === 1) { return BUTTON_NAV_ID; }
  return '';
}

export function routeText(page: number): string {
  if (page === 0) { return LIST_TEXT; }
  if (page === 1) { return NAV_TEXT; }
  return '';
}

export function navigationAction(action: number): string {
  return action === 0 ? PAGE_PUSH : PAGE_BACK;
}

export function routeFlag(ok: boolean): string {
  return ok ? 'Pass' : 'Error';
}

export function pageSwitchMetric(): number {
  return METRIC_PAGE_SWITCH;
}

export function listSwipeMetric(): number {
  return METRIC_LIST_FPS;
}

export function appStartMetrics(): string {
  return 'DURATION,APP_START_RESPONSE_TIME,APP_START_COMPLETE_TIME';
}

// Mirrors the Utils counter and reset sequence.
export class UtilsModel {
  private num: number = 0;
  private maxNum: number = DEFAULT_MAX_NUM;
  private calculateCalls: number = 0;
  private resetCalls: number = 0;

  constructor(maxNum: number) {
    this.maxNum = maxNum;
  }

  calculate(): number {
    this.num = calculateNum(this.num, this.maxNum);
    this.calculateCalls++;
    return this.num;
  }

  reset(): number {
    this.num = resetNum();
    this.resetCalls++;
    return this.num;
  }

  value(): number { return this.num; }
  calls(): number { return this.calculateCalls; }
  resets(): number { return this.resetCalls; }
}

// Mirrors PerfTest.getMeasureResult() statistics.
export class MeasureResultModel {
  private values: Array<number> = [];

  add(value: number): void {
    this.values.push(clampMetricValue(value));
  }

  averageValue(): number { return average(this.values); }
  maximumValue(): number { return maximum(this.values); }
  minimumValue(): number { return minimum(this.values); }
  rounds(): number { return roundCount(this.values); }
  summary(): string { return resultSummary(this.values); }
}

// Mirrors create()/run()/getMeasureResult()/destroy() lifecycle.
export class PerfRunModel {
  private events: Array<string> = [];
  private created: boolean = false;
  private running: boolean = false;
  private destroyed: boolean = false;
  private iterations: number = DEFAULT_ITERATIONS;
  private actionRuns: number = 0;
  private resetRuns: number = 0;
  private metrics: Array<number> = [];

  private record(step: string): void { this.events.push(step); }

  create(metrics: Array<number>, iterations: number): string {
    this.metrics = metrics.slice();
    this.iterations = iterations;
    this.created = true;
    this.record('create');
    return strategyValid(metrics, iterations, DEFAULT_TIMEOUT, BUNDLE_NAME, true) ? 'created' : 'invalid';
  }

  run(hasReset: boolean): string {
    if (!this.created) { return 'not-created'; }
    if (this.running) { return 'already-running'; }
    this.running = true;
    this.record('run');
    for (let i: number = 0; i < this.iterations; i++) {
      this.actionRuns++;
      this.record('action:' + i);
      if (hasReset) {
        this.resetRuns++;
        this.record('reset:' + i);
      }
    }
    this.running = false;
    this.record('run-end');
    return 'done';
  }

  getFor(metric: number): string {
    if (!this.created) { return 'not-created'; }
    if (this.metrics.indexOf(metric) === -1) { return 'missing'; }
    this.record('get:' + metricName(metric));
    return metricName(metric);
  }

  destroy(): string {
    if (!this.created) { return 'not-created'; }
    this.destroyed = true;
    this.record('destroy');
    return 'destroyed';
  }

  steps(): string { return this.events.join(','); }
  count(): number { return this.events.length; }
  actionCount(): number { return this.actionRuns; }
  resetCount(): number { return this.resetRuns; }
  isCreated(): boolean { return this.created; }
  isDestroyed(): boolean { return this.destroyed; }
  metricCount(): number { return this.metrics.length; }
}

// Mirrors Index/navigation router transitions and page flags.
export class PageFlowModel {
  private page: number = 2;
  private flag: string = 'wait';
  private history: Array<number> = [];
  private events: Array<string> = [];

  private record(step: string): void { this.events.push(step); }

  push(page: number, ok: boolean): string {
    if (ok) {
      this.history.push(this.page);
      this.page = page;
      this.flag = routeFlag(true);
    } else {
      this.flag = routeFlag(false);
    }
    this.record('push:' + page + ':' + ok);
    return this.flag;
  }

  back(ok: boolean): number {
    if (ok && this.history.length > 0) {
      this.page = this.history.pop() as number;
      this.flag = routeFlag(true);
    } else if (!ok) {
      this.flag = routeFlag(false);
    }
    this.record('back:' + ok);
    return this.page;
  }

  current(): number { return this.page; }
  currentUrl(): string { return routeUrl(this.page); }
  state(): string { return this.flag; }
  steps(): string { return this.events.join(','); }
  depth(): number { return this.history.length; }
}

// Mirrors the fling/scrollToTop list-swipe actions.
export class SwipeModel {
  private flings: number = 0;
  private resets: number = 0;
  private lastDistance: number = 0;
  private fpsValue: number = 0;

  fling(centerY: number, frames: number, durationMs: number): number {
    this.flings++;
    this.lastDistance = flingDistance(centerY);
    this.fpsValue = fpsFromFrames(frames, durationMs);
    return this.lastDistance;
  }

  scrollToTop(): number {
    this.resets++;
    return SCROLL_TO_TOP_SPEED;
  }

  flingCount(): number { return this.flings; }
  resetCount(): number { return this.resets; }
  distance(): number { return this.lastDistance; }
  fps(): number { return this.fpsValue; }
}
