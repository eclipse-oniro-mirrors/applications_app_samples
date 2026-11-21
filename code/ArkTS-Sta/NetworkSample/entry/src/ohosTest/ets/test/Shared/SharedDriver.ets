'use static';
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

/**
 * SharedDriver for the NetworkSample ohosTest module.
 *
 * The production page (entry/src/main/ets/pages/Index.ets) is an ArkUI struct:
 * state lives in @State members and network callbacks are bound to a native
 * request.agent task. A pure logic suite cannot instantiate that struct without
 * a UI host, so this file rebuilds the observable parts as plain classes.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65    progressValueA / progressValueB / progressValueC / isTaskFinished
 *   62       private lock = true, the gate of task C
 *   63-64    taskACompleted / taskBCompleted
 *   68-76    updateProgress(task) writes 100 for exactly one task
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   98-102   checkAndUnlock: A && B && lock -> lock = false
 *   105-107  canRunTaskC returns !lock
 *   109-148  download(): action DOWNLOAD, overwrite true, method GET, saveas './'
 *   151-171  runTaskA / runTaskB / runTaskC URL literals
 *   174-198  startAllTasks(): isTaskFinished false, shared A/B, exclusive C,
 *            200 ms setInterval poll, clearInterval on run or progress 100
 *   200-265  progress rows and the enabled(isTaskFinished) start button
 *
 * Every oracle is written independently from the implementation so a defect in
 * the page cannot silently bless a matching defect in the expectation.
 */

export const TASK_A: string = 'A';
export const TASK_B: string = 'B';
export const TASK_C: string = 'C';
export const TASK_NUMBERS: string[] = [TASK_A, TASK_B, TASK_C];

export const URL_TASK_A: string =
  'https://gitee.com/openharmony/applications_app_samples/raw/a826ab0e75fe51d028c1c5af58188e908736b53b/code/Solutions/Shopping/OrangeShopping/feature/navigationHome/src/main/resources/base/media/favor_list_tea.png';
export const URL_TASK_B: string =
  'https://gitee.com/chenhaiwen2/cases/raw/fdb9d48cacd1083f17b7c3e569b39f36db8a26aa/CommonAppDevelopment/product/entry/src/main/resources/base/media/after_cache.png';
export const URL_TASK_C: string =
  'https://gitee.com/chenhaiwen2/cases/raw/fdb9d48cacd1083f17b7c3e569b39f36db8a26aa/CommonAppDevelopment/product/entry/src/main/resources/base/media/icon_main_color.png';
export const TASK_URLS: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];

export const PROGRESS_TOTAL: number = 100;
export const PROGRESS_INITIAL: number = 0;
export const POLL_INTERVAL_MS: number = 200;

export const CONFIG_ACTION_DOWNLOAD: string = 'DOWNLOAD';
export const CONFIG_METHOD_GET: string = 'GET';
export const CONFIG_SAVEAS_CACHE: string = './';
export const CONFIG_OVERWRITE: boolean = true;

export const STATUS_IDLE: string = 'idle';
export const STATUS_RUNNING: string = 'running';
export const STATUS_COMPLETED: string = 'completed';
export const STATUS_FAILED: string = 'failed';

export const ERROR_NONE: number = 0;
export const ERROR_CREATE: number = 13400001;
export const ERROR_START: number = 13400002;
export const ERROR_NETWORK: number = 13400003;
export const ERROR_TIMEOUT: number = 13400004;

export const LEVEL_INFO: string = 'INFO';
export const LEVEL_WARN: string = 'WARN';
export const LEVEL_ERROR: string = 'ERROR';

export const BUTTON_ACTIVE_BACKGROUND: string = '#409EFF';
export const BUTTON_DISABLED_BACKGROUND: string = '#C0C4CC';
export const PAGE_TITLE: string = '网络场景';

/** Plain clamp used by progress and index helpers. */
export function clampInt(value: number, low: number, high: number): number {
  if (value < low) {
    return low;
  }
  if (value > high) {
    return high;
  }
  return value;
}

/** True when the status no longer accepts progress. */
export function isTerminalStatus(status: string): boolean {
  return status === STATUS_COMPLETED || status === STATUS_FAILED;
}

/** Independent progress oracle: bound to 0..100 and never move backwards. */
export function expectedProgressAfter(current: number, incoming: number): number {
  const bounded = clampInt(incoming, PROGRESS_INITIAL, PROGRESS_TOTAL);
  return bounded > current ? bounded : current;
}

/** The page writes 100 in one assignment, so completion is always exactly full. */
export function expectedCompletedProgress(): number {
  return PROGRESS_TOTAL;
}

/** Deterministic status of one dependency step. */
export function expectedStepStatus(aDone: boolean, bDone: boolean): string {
  return aDone && bDone ? STATUS_COMPLETED : STATUS_RUNNING;
}

/** True when the gate predicate of the page should hold. */
export function expectedGateOpen(aDone: boolean, bDone: boolean): boolean {
  return aDone && bDone;
}

/** Full file name after the last slash, or the provided fallback. */
export function fileNameOf(url: string, fallback: string = 'file'): string {
  const slash = url.lastIndexOf('/');
  const tail = slash >= 0 ? url.substring(slash + 1) : url;
  return tail.length === 0 ? fallback : tail;
}

/** Extension including the dot, or an empty string. */
export function extensionOf(url: string): string {
  const name = fileNameOf(url, '');
  const dot = name.lastIndexOf('.');
  return dot > 0 ? name.substring(dot) : '';
}

/** Scheme without the colon, or an empty string. */
export function schemeOf(url: string): string {
  const marker = url.indexOf('://');
  return marker > 0 ? url.substring(0, marker) : '';
}

/** Host part, or an empty string. */
export function hostOf(url: string): string {
  const marker = url.indexOf('://');
  if (marker <= 0) {
    return '';
  }
  const rest = url.substring(marker + 3);
  const slash = rest.indexOf('/');
  return slash >= 0 ? rest.substring(0, slash) : rest;
}

/** Path part without query, or an empty string. */
export function pathOf(url: string): string {
  const marker = url.indexOf('://');
  const rest = marker > 0 ? url.substring(marker + 3) : url;
  const slash = rest.indexOf('/');
  if (slash < 0) {
    return '';
  }
  const withQuery = rest.substring(slash);
  const question = withQuery.indexOf('?');
  return question >= 0 ? withQuery.substring(0, question) : withQuery;
}

/** Query part including the question mark, or an empty string. */
export function queryOf(url: string): string {
  const question = url.indexOf('?');
  return question >= 0 ? url.substring(question) : '';
}

export function isHttpUrl(url: string): boolean {
  return url.startsWith('http://');
}

export function isHttpsUrl(url: string): boolean {
  return url.startsWith('https://');
}

export function hasQuery(url: string): boolean {
  return url.indexOf('?') >= 0;
}

/** Removes the query so a log line never carries a token. */
export function redactQuery(url: string): string {
  const question = url.indexOf('?');
  return question >= 0 ? url.substring(0, question) : url;
}

/** Removes user:password@ from an authority. */
export function redactCredentials(url: string): string {
  const marker = url.indexOf('://');
  if (marker <= 0) {
    return url;
  }
  const prefix = url.substring(0, marker + 3);
  const rest = url.substring(marker + 3);
  const at = rest.indexOf('@');
  if (at < 0) {
    return url;
  }
  return prefix + '***@' + rest.substring(at + 1);
}

export function sameStringArray(left: string[], right: string[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

export function hasDuplicateStrings(values: string[]): boolean {
  for (let index = 0; index < values.length; index++) {
    for (let inner = index + 1; inner < values.length; inner++) {
      if (values[index] === values[inner]) {
        return true;
      }
    }
  }
  return false;
}

export function countOf(values: string[], target: string): number {
  let total = 0;
  for (let index = 0; index < values.length; index++) {
    if (values[index] === target) {
      total = total + 1;
    }
  }
  return total;
}

export function uniqueStrings(values: string[]): string[] {
  const result: string[] = [];
  for (let index = 0; index < values.length; index++) {
    if (result.indexOf(values[index]) < 0) {
      result.push(values[index]);
    }
  }
  return result;
}

export function sortedCopy(values: string[]): string[] {
  const result: string[] = values.slice();
  result.sort();
  return result;
}

export function reversedCopy(values: string[]): string[] {
  const result: string[] = [];
  for (let index = values.length - 1; index >= 0; index--) {
    result.push(values[index]);
  }
  return result;
}

export function joined(values: string[], separator: string = ','): string {
  let text = '';
  for (let index = 0; index < values.length; index++) {
    if (index > 0) {
      text = text + separator;
    }
    text = text + values[index];
  }
  return text;
}

/** Small rolling hash used to compare event traces without exposing secrets. */
export function textFingerprint(text: string): number {
  let hash = 216613;
  for (let index = 0; index < text.length; index++) {
    hash = (hash * 31 + text.charCodeAt(index)) % 1000003;
  }
  return hash;
}

/** Percent label rendered under each progress bar. */
export function progressLabel(taskNo: string, value: number): string {
  return '任务' + taskNo + '当前进度 ' + String(value) + '%';
}

/** The start button is enabled exactly while isTaskFinished is true. */
export function startButtonEnabled(isTaskFinished: boolean): boolean {
  return isTaskFinished;
}

export function startButtonBackground(isTaskFinished: boolean): string {
  return isTaskFinished ? BUTTON_ACTIVE_BACKGROUND : BUTTON_DISABLED_BACKGROUND;
}

/**
 * Ordered event recorder shared by every suite. It stores stable textual
 * entries so two runs can be compared and fingerprinted.
 */
export class EventRecorder {
  public entries: string[] = [];

  public record(kind: string, detail: string): void {
    this.entries.push(kind + ':' + detail);
  }

  public size(): int {
    return this.entries.length;
  }

  public countOf(kind: string): number {
    let total = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].startsWith(kind + ':')) {
        total = total + 1;
      }
    }
    return total;
  }

  public last(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  public trace(): string {
    return joined(this.entries, '|');
  }

  public fingerprint(): number {
    return textFingerprint(this.trace());
  }

  public clear(): void {
    this.entries = [];
  }
}

/**
 * Observable state of one request.agent task after the page has attached its
 * onCompleted / onProgress / start callbacks.
 */
export class DownloadTask {
  public taskNo: string;
  public url: string;
  public progress: number = PROGRESS_INITIAL;
  public status: string = STATUS_IDLE;
  public attempts: number = 0;
  public lastErrorCode: number = ERROR_NONE;
  public startedAt: number = 0;
  public finishedAt: number = 0;

  constructor(taskNo: string, url: string) {
    this.taskNo = taskNo;
    this.url = url;
  }

  public start(now: number = 0): boolean {
    if (this.status === STATUS_RUNNING || isTerminalStatus(this.status)) {
      return false;
    }
    this.status = STATUS_RUNNING;
    this.attempts = this.attempts + 1;
    this.startedAt = now;
    return true;
  }

  /**
   * The page only assigns 100 in completeTask*, but the progress callback also
   * receives intermediate values. Intermediate values are bounded and monotone.
   */
  public reportProgress(value: number): number {
    if (isTerminalStatus(this.status)) {
      return this.progress;
    }
    this.progress = expectedProgressAfter(this.progress, value);
    return this.progress;
  }

  public complete(now: number = 0): boolean {
    if (this.status === STATUS_COMPLETED) {
      return false;
    }
    this.status = STATUS_COMPLETED;
    this.progress = expectedCompletedProgress();
    this.finishedAt = now;
    return true;
  }

  public fail(code: number): boolean {
    if (this.status === STATUS_COMPLETED) {
      return false;
    }
    this.status = STATUS_FAILED;
    this.lastErrorCode = code;
    return true;
  }

  public reset(): void {
    this.progress = PROGRESS_INITIAL;
    this.status = STATUS_IDLE;
    this.lastErrorCode = ERROR_NONE;
    this.startedAt = 0;
    this.finishedAt = 0;
  }

  public isComplete(): boolean {
    return this.status === STATUS_COMPLETED;
  }

  public isFailed(): boolean {
    return this.status === STATUS_FAILED;
  }

  public isRunning(): boolean {
    return this.status === STATUS_RUNNING;
  }

  public isIdle(): boolean {
    return this.status === STATUS_IDLE;
  }

  public progressRatio(): number {
    return this.progress / PROGRESS_TOTAL;
  }

  public label(): string {
    return progressLabel(this.taskNo, this.progress);
  }

  public describe(): string {
    return this.taskNo + ':' + this.status + ':' + String(this.progress);
  }

  public snapshot(): RunSnapshot {
    return new RunSnapshot(this.taskNo, this.progress, this.status);
  }
}

/** Snapshot used by consistency and regression suites. */
export class RunSnapshot {
  public taskNo: string;
  public progress: number;
  public status: string;

  constructor(taskNo: string, progress: number, status: string) {
    this.taskNo = taskNo;
    this.progress = progress;
    this.status = status;
  }

  public sameAs(other: RunSnapshot): boolean {
    return this.taskNo === other.taskNo && this.progress === other.progress && this.status === other.status;
  }

  public describe(): string {
    return this.taskNo + '/' + this.status + '/' + String(this.progress);
  }
}

export class SnapshotLog {
  public snapshots: RunSnapshot[] = [];

  public add(snapshot: RunSnapshot): void {
    this.snapshots.push(snapshot);
  }

  public capture(tasks: DownloadTask[]): void {
    for (let index = 0; index < tasks.length; index++) {
      this.add(tasks[index].snapshot());
    }
  }

  public latest(taskNo: string): RunSnapshot | undefined {
    for (let index = this.snapshots.length - 1; index >= 0; index--) {
      if (this.snapshots[index].taskNo === taskNo) {
        return this.snapshots[index];
      }
    }
    return undefined;
  }

  public size(): int {
    return this.snapshots.length;
  }

  public trace(): string {
    const parts: string[] = [];
    for (let index = 0; index < this.snapshots.length; index++) {
      parts.push(this.snapshots[index].describe());
    }
    return joined(parts, '|');
  }

  public clear(): void {
    this.snapshots = [];
  }
}

/**
 * Mirror of the AsyncLock arrangement used by startAllTasks: A and B take the
 * lock in SHARED mode, C asks for EXCLUSIVE and can only enter after both
 * shared holders released.
 */
export class DependencyLock {
  public sharedHolders: string[] = [];
  public exclusiveOwner: string = '';
  public waitingExclusive: boolean = false;
  public acquisitions: number = 0;
  public rejections: number = 0;

  public acquireShared(owner: string): boolean {
    if (this.exclusiveOwner.length > 0) {
      this.rejections = this.rejections + 1;
      return false;
    }
    if (this.sharedHolders.indexOf(owner) < 0) {
      this.sharedHolders.push(owner);
      this.acquisitions = this.acquisitions + 1;
    }
    return true;
  }

  public releaseShared(owner: string): boolean {
    const index = this.sharedHolders.indexOf(owner);
    if (index < 0) {
      return false;
    }
    this.sharedHolders.splice(index, 1);
    return true;
  }

  public acquireExclusive(owner: string): boolean {
    if (this.exclusiveOwner.length > 0 || this.sharedHolders.length > 0) {
      this.waitingExclusive = true;
      this.rejections = this.rejections + 1;
      return false;
    }
    this.exclusiveOwner = owner;
    this.waitingExclusive = false;
    this.acquisitions = this.acquisitions + 1;
    return true;
  }

  public releaseExclusive(owner: string): boolean {
    if (this.exclusiveOwner.length === 0 || this.exclusiveOwner !== owner) {
      return false;
    }
    this.exclusiveOwner = '';
    return true;
  }

  public isUnlocked(): boolean {
    return this.sharedHolders.length === 0 && this.exclusiveOwner.length === 0;
  }

  public hasShared(owner: string): boolean {
    return this.sharedHolders.indexOf(owner) >= 0;
  }

  public holderCount(): number {
    return this.sharedHolders.length + (this.exclusiveOwner.length > 0 ? 1 : 0);
  }

  public reset(): void {
    this.sharedHolders = [];
    this.exclusiveOwner = '';
    this.waitingExclusive = false;
    this.acquisitions = 0;
    this.rejections = 0;
  }
}

/** Request configuration assembled by download() before agent.create. */
export class DownloadConfig {
  public action: string;
  public url: string;
  public overwrite: boolean;
  public method: string;
  public saveas: string;

  constructor(action: string, url: string, overwrite: boolean, method: string, saveas: string) {
    this.action = action;
    this.url = url;
    this.overwrite = overwrite;
    this.method = method;
    this.saveas = saveas;
  }

  public static forUrl(url: string): DownloadConfig {
    return new DownloadConfig(CONFIG_ACTION_DOWNLOAD, url, CONFIG_OVERWRITE, CONFIG_METHOD_GET, CONFIG_SAVEAS_CACHE);
  }

  public static forTask(taskNo: string): DownloadConfig {
    if (taskNo === TASK_A) {
      return DownloadConfig.forUrl(URL_TASK_A);
    }
    if (taskNo === TASK_B) {
      return DownloadConfig.forUrl(URL_TASK_B);
    }
    if (taskNo === TASK_C) {
      return DownloadConfig.forUrl(URL_TASK_C);
    }
    return DownloadConfig.forUrl('');
  }

  public clone(): DownloadConfig {
    return new DownloadConfig(this.action, this.url, this.overwrite, this.method, this.saveas);
  }

  public fileName(): string {
    return fileNameOf(this.url);
  }

  public validate(): string[] {
    const errors: string[] = [];
    if (this.url.length === 0) {
      errors.push('url-empty');
    }
    if (!isHttpsUrl(this.url)) {
      errors.push('url-not-https');
    }
    if (this.action !== CONFIG_ACTION_DOWNLOAD) {
      errors.push('action-not-download');
    }
    if (this.method !== CONFIG_METHOD_GET && this.method !== 'POST') {
      errors.push('method-unsupported');
    }
    if (!this.overwrite) {
      errors.push('overwrite-disabled');
    }
    if (this.saveas !== CONFIG_SAVEAS_CACHE) {
      errors.push('saveas-not-cache');
    }
    return errors;
  }

  public isValid(): boolean {
    return this.validate().length === 0;
  }

  public describe(): string {
    return this.action + '|' + this.method + '|' + String(this.overwrite) + '|' + this.saveas + '|' + this.url;
  }

  public sameAs(other: DownloadConfig): boolean {
    return this.describe() === other.describe();
  }
}

/** Independent configuration oracle, written from the page literal. */
export function expectedConfigFor(taskNo: string): DownloadConfig {
  let url = '';
  if (taskNo === TASK_A) {
    url = URL_TASK_A;
  } else if (taskNo === TASK_B) {
    url = URL_TASK_B;
  } else if (taskNo === TASK_C) {
    url = URL_TASK_C;
  }
  return new DownloadConfig('DOWNLOAD', url, true, 'GET', './');
}

/**
 * Rebuilds the observable task graph of Index.ets:
 *  - A and B start together (shared lock),
 *  - C is gated by A && B,
 *  - completion writes 100 and updates isTaskFinished only through startAll,
 *  - a 200 ms poll checks the gate and stops itself when C runs.
 */
export class TaskGraph {
  public tasks: DownloadTask[] = [];
  public lock: DependencyLock = new DependencyLock();
  public events: EventRecorder = new EventRecorder();
  public isTaskFinished: boolean = true;
  public pollTicks: number = 0;
  public timerActive: boolean = false;
  public completionOrder: string[] = [];

  constructor() {
    this.tasks.push(new DownloadTask(TASK_A, URL_TASK_A));
    this.tasks.push(new DownloadTask(TASK_B, URL_TASK_B));
    this.tasks.push(new DownloadTask(TASK_C, URL_TASK_C));
  }

  public taskByNo(taskNo: string): DownloadTask | undefined {
    for (let index = 0; index < this.tasks.length; index++) {
      if (this.tasks[index].taskNo === taskNo) {
        return this.tasks[index];
      }
    }
    return undefined;
  }

  public taskAt(index: number): DownloadTask {
    return this.tasks[clampInt(index, 0, this.tasks.length - 1).toInt()];
  }

  public startAll(): boolean {
    if (!this.isTaskFinished) {
      this.events.record('start-rejected', String(this.pollTicks));
      return false;
    }
    this.isTaskFinished = false;
    this.events.record('start-all', 'begin');
    const a = this.taskByNo(TASK_A) as DownloadTask;
    const b = this.taskByNo(TASK_B) as DownloadTask;
    a.start(0);
    b.start(0);
    this.lock.acquireShared(TASK_A);
    this.lock.acquireShared(TASK_B);
    this.lock.waitingExclusive = true;
    this.timerActive = true;
    this.events.record('started', TASK_A);
    this.events.record('started', TASK_B);
    this.events.record('queued', TASK_C);
    return true;
  }

  public completeTask(taskNo: string, now: number = 0): boolean {
    const task = this.taskByNo(taskNo);
    if (task === undefined) {
      return false;
    }
    if (!task.complete(now)) {
      return false;
    }
    this.completionOrder.push(taskNo);
    this.events.record('completed', taskNo);
    if (taskNo === TASK_A || taskNo === TASK_B) {
      this.lock.releaseShared(taskNo);
    }
    if (this.canRunTaskC()) {
      this.events.record('unlocked', TASK_C);
    }
    return true;
  }

  public canRunTaskC(): boolean {
    const a = this.taskByNo(TASK_A) as DownloadTask;
    const b = this.taskByNo(TASK_B) as DownloadTask;
    return a.isComplete() && b.isComplete();
  }

  public runTaskCIfReady(now: number = 0): boolean {
    if (!this.canRunTaskC()) {
      return false;
    }
    const c = this.taskByNo(TASK_C) as DownloadTask;
    if (!c.isIdle()) {
      return false;
    }
    if (!this.lock.acquireExclusive(TASK_C)) {
      return false;
    }
    c.start(now);
    this.timerActive = false;
    this.events.record('started', TASK_C);
    return true;
  }

  /** One 200 ms poll iteration. A ready gate both starts C and stops the timer. */
  public pollTick(now: number = 0): boolean {
    this.pollTicks = this.pollTicks + 1;
    if (!this.timerActive) {
      return false;
    }
    const started = this.runTaskCIfReady(now);
    if (started) {
      this.events.record('timer-cleared', TASK_C);
    }
    return started;
  }

  public completeTaskC(now: number = 0): boolean {
    const done = this.completeTask(TASK_C, now);
    if (done) {
      this.lock.releaseExclusive(TASK_C);
    }
    return done;
  }

  public allCompleted(): boolean {
    for (let index = 0; index < this.tasks.length; index++) {
      if (!this.tasks[index].isComplete()) {
        return false;
      }
    }
    return true;
  }

  public runningCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.tasks.length; index++) {
      if (this.tasks[index].isRunning()) {
        total = total + 1;
      }
    }
    return total;
  }

  public totalProgress(): number {
    let total: number = 0;
    for (let index = 0; index < this.tasks.length; index++) {
      total = total + this.tasks[index].progress;
    }
    return total;
  }

  public averageProgress(): number {
    return this.totalProgress() / this.tasks.length;
  }

  public snapshotText(): string {
    return this.taskAt(0).describe() + '|' + this.taskAt(1).describe() + '|' + this.taskAt(2).describe();
  }

  public eventTrace(): string {
    return this.events.trace();
  }

  public reset(): void {
    for (let index = 0; index < this.tasks.length; index++) {
      this.tasks[index].reset();
    }
    this.lock.reset();
    this.events.clear();
    this.isTaskFinished = true;
    this.pollTicks = 0;
    this.timerActive = false;
    this.completionOrder = [];
  }
}

/** Seed graph used by most suites. */
export function createTaskGraph(): TaskGraph {
  return new TaskGraph();
}

/**
 * Independent oracle of the dependency gate. It uses two booleans and a number
 * of poll rounds instead of the class graph, so a shared implementation bug
 * cannot make both sides agree.
 */
export class ReferenceGraph {
  public aDone: boolean = false;
  public bDone: boolean = false;
  public cStarted: boolean = false;
  public cDone: boolean = false;
  public rounds: number = 0;

  public markComplete(taskNo: string): void {
    if (taskNo === TASK_A) {
      this.aDone = true;
    } else if (taskNo === TASK_B) {
      this.bDone = true;
    } else if (taskNo === TASK_C) {
      this.cDone = true;
    }
  }

  public unlocked(): boolean {
    return this.aDone && this.bDone;
  }

  public poll(): boolean {
    this.rounds = this.rounds + 1;
    if (this.unlocked() && !this.cStarted) {
      this.cStarted = true;
      return true;
    }
    return false;
  }

  public trace(): string {
    return String(this.aDone) + ',' + String(this.bDone) + ',' + String(this.cStarted) + ',' + String(this.cDone);
  }
}

/** Retry policy used by recovery suites. It never retries a completed task. */
export class RetryPolicy {
  public maxAttempts: number;
  public baseDelayMs: number;

  constructor(maxAttempts: number = 3, baseDelayMs: number = 200) {
    this.maxAttempts = maxAttempts;
    this.baseDelayMs = baseDelayMs;
  }

  public shouldRetry(attempt: number, errorCode: number, status: string): boolean {
    if (status === STATUS_COMPLETED) {
      return false;
    }
    if (attempt >= this.maxAttempts) {
      return false;
    }
    return errorCode !== ERROR_NONE;
  }

  public delayFor(attempt: number): number {
    if (attempt <= 0) {
      return this.baseDelayMs;
    }
    return this.baseDelayMs * attempt;
  }

  public isExhausted(attempt: number): boolean {
    return attempt >= this.maxAttempts;
  }
}

/** Model of the 200 ms polling timer. */
export class PollClock {
  public intervalMs: number;
  public active: boolean = false;
  public ticks: number = 0;
  public elapsedMs: number = 0;

  constructor(intervalMs: number = POLL_INTERVAL_MS) {
    this.intervalMs = intervalMs;
  }

  public start(): void {
    this.active = true;
    this.ticks = 0;
    this.elapsedMs = 0;
  }

  public tick(): number {
    if (!this.active) {
      return this.elapsedMs;
    }
    this.ticks = this.ticks + 1;
    this.elapsedMs = this.elapsedMs + this.intervalMs;
    return this.elapsedMs;
  }

  public stop(): void {
    this.active = false;
  }

  public isDueAfter(rounds: number): boolean {
    return this.intervalMs * rounds <= this.elapsedMs;
  }
}

/** Bounded logger model used by logging and security suites. */
export class LogBuffer {
  public levels: string[] = [];
  public lines: string[] = [];
  public limit: number;

  constructor(limit: number = 64) {
    this.limit = limit;
  }

  public info(line: string): void {
    this.push(LEVEL_INFO, line);
  }

  public warn(line: string): void {
    this.push(LEVEL_WARN, line);
  }

  public error(line: string): void {
    this.push(LEVEL_ERROR, line);
  }

  private push(level: string, line: string): void {
    this.levels.push(level);
    this.lines.push(level + ' ' + line);
    if (this.lines.length > this.limit) {
      this.lines.splice(0, (this.lines.length - this.limit).toInt());
      this.levels.splice(0, (this.levels.length - this.limit).toInt());
    }
  }

  public size(): int {
    return this.lines.length;
  }

  public countLevel(level: string): number {
    return countOf(this.levels, level);
  }

  public contains(fragment: string): boolean {
    for (let index = 0; index < this.lines.length; index++) {
      if (this.lines[index].indexOf(fragment) >= 0) {
        return true;
      }
    }
    return false;
  }

  public trace(): string {
    return joined(this.lines, '|');
  }

  public clear(): void {
    this.levels = [];
    this.lines = [];
  }
}

/** Aggregate metrics used by performance and regression suites. */
export class NetworkMetrics {
  public totalTasks: number = 0;
  public completedTasks: number = 0;
  public failedTasks: number = 0;
  public totalProgress: number = 0;

  public static from(graph: TaskGraph): NetworkMetrics {
    const metrics = new NetworkMetrics();
    metrics.totalTasks = graph.tasks.length;
    metrics.totalProgress = graph.totalProgress();
    for (let index = 0; index < graph.tasks.length; index++) {
      if (graph.tasks[index].isComplete()) {
        metrics.completedTasks = metrics.completedTasks + 1;
      }
      if (graph.tasks[index].isFailed()) {
        metrics.failedTasks = metrics.failedTasks + 1;
      }
    }
    return metrics;
  }

  public averageProgress(): number {
    return this.totalTasks === 0 ? 0 : this.totalProgress / this.totalTasks;
  }

  public successRatio(): number {
    return this.totalTasks === 0 ? 0 : this.completedTasks / this.totalTasks;
  }

  public fingerprint(): number {
    return textFingerprint(String(this.totalTasks) + ':' + String(this.completedTasks) + ':' +
      String(this.failedTasks) + ':' + String(this.totalProgress));
  }
}

/** Reads one task number from a completion trace such as A|B|C. */
export function completionTrace(graph: TaskGraph): string {
  return joined(graph.completionOrder, '|');
}

/** True when the supplied order is a valid topological order of the gate. */
export function isTopologicalCompletion(order: string[]): boolean {
  const indexA = order.indexOf(TASK_A);
  const indexB = order.indexOf(TASK_B);
  const indexC = order.indexOf(TASK_C);
  if (indexA < 0 || indexB < 0 || indexC < 0) {
    return false;
  }
  return indexC > indexA && indexC > indexB;
}

/** Classifies a start callback pair the way the page branches on err.code. */
export function classifyStartResult(code: number): string {
  if (code === ERROR_NONE) {
    return 'started';
  }
  return 'failed';
}

/** Production only aborts when err.code is non-zero. */
export function shouldAbortStart(code: number): boolean {
  return code !== ERROR_NONE;
}

/** Error codes that the retry policy treats as transient. */
export function isRetryableError(code: number): boolean {
  return code === ERROR_NETWORK || code === ERROR_TIMEOUT || code === ERROR_START;
}

/** Builds the URL literal check used by the resource suites. */
export class UrlExpectation {
  public taskNo: string;
  public url: string;
  public fileName: string;
  public extension: string;
  public host: string;

  constructor(taskNo: string, url: string) {
    this.taskNo = taskNo;
    this.url = url;
    this.fileName = fileNameOf(url);
    this.extension = extensionOf(url);
    this.host = hostOf(url);
  }
}

export function expectationFor(taskNo: string): UrlExpectation {
  const url = taskNo === TASK_A ? URL_TASK_A : (taskNo === TASK_B ? URL_TASK_B : URL_TASK_C);
  return new UrlExpectation(taskNo, url);
}
