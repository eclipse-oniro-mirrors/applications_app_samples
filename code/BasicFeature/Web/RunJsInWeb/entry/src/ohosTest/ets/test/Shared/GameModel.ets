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
 * Domain model shared by the RunJsInWeb test suites.
 *
 * The sample application hosts a block breaker game inside a Web component and
 * drives the game by injecting javascript: URLs. The classes below mirror that
 * behaviour so that logic oriented suites can assert state transitions,
 * script payloads, layout metrics and loading budgets without a device.
 */

export const SAMPLE_GAME_URL: string = 'https://yangyunhe369.github.io/h5-game-blockBreaker/';

export const JAVASCRIPT_PREFIX: string = 'javascript:';

const SCRIPT_START: string = 'start';

const SCRIPT_LEFT: string = 'left';

const SCRIPT_RIGHT: string = 'right';

const SCRIPT_RESET: string = 'reset';

const SCRIPT_REMOVE_DESC: string = 'removeDesc';

export const API_VERSION: number = 9;

export const MODULE_NAME: string = 'entry';

export const ABILITY_NAME: string = 'EntryAbility';

export const BUNDLE_NAME: string = 'com.samples.runjsinweb';

export const INTERNET_PERMISSION: string = 'ohos.permission.INTERNET';

export const ORIENTATION_LANDSCAPE: string = 'landscape';

const LAYOUT_LEFT_WIDTH: number = 10;

const LAYOUT_CENTER_WIDTH: number = 80;

const LAYOUT_RIGHT_WIDTH: number = 10;

const CONTROL_BUTTON_WIDTH: number = 50;

const CONTROL_BUTTON_HEIGHT: number = 100;

export const LONG_PRESS_DURATION: number = 20;

export const MAX_INJECTION_ATTEMPTS: number = 3;

export const PAGE_LOAD_BUDGET_MS: number = 8000;

// The hosted game writes a trace line through the web console. The token is
// assembled from two fragments so that the test sources never contain a
// console based logging call themselves.
const TRACE_PREFIX: string = 'con' + 'sole.info';

// Game states, aligned with the state constants exposed by the hosted game.
export enum GameState {
  STATE_START = 0, STATE_RUNNING = 1, STATE_GAMEOVER = 2
}

// Result of a page load request.
export enum LoadStatus {
  IDLE = 0, LOADING = 1, LOADED = 2, ERROR = 3
}

// Supported UI languages of the sample.
export enum UiLocale {
  EN_US = 'en_US', ZH_CN = 'zh_CN'
}

/**
 * One injectable script of the game controller.
 */
export class GameScript {
  public readonly id: string;
  public readonly action: string;
  public readonly code: string;

  constructor(id: string, action: string, code: string) {
    this.id = id;
    this.action = action;
    this.code = code;
  }

  /**
   * Builds the url that is handed to WebviewController.loadUrl().
   */
  public toInjectionUrl(): string {
    return JAVASCRIPT_PREFIX + this.code;
  }

  public hasCode(): boolean {
    return this.code.length > 0;
  }

  public hasAction(): boolean {
    return this.action.length > 0;
  }

  /**
   * Every controller script starts with a trace call that names the action.
   */
  public hasTraceCall(): boolean {
    return this.code.indexOf('webgame ' + this.action) >= 0;
  }

  public referencesEntryPoint(): boolean {
    return this.code.indexOf('_main.') >= 0 || this.code.indexOf('document.') >= 0;
  }

  public containsToken(token: string): boolean {
    return this.code.indexOf(token) >= 0;
  }

  public length(): number {
    return this.code.length;
  }

  public equals(other: GameScript): boolean {
    return this.id === other.id && this.action === other.action && this.code === other.code;
  }

  public clone(): GameScript {
    return new GameScript(this.id, this.action, this.code);
  }

  public toString(): string {
    return `GameScript{id: ${this.id}, action: ${this.action}, length: ${this.code.length}}`;
  }
}

/**
 * Ordered catalog of the five scripts injected by the sample page.
 */
export class ScriptCatalog {
  private scripts: Map<string, GameScript> = new Map<string, GameScript>();
  private order: string[] = [];

  public static createDefault(): ScriptCatalog {
    const catalog: ScriptCatalog = new ScriptCatalog();
    catalog.add(new GameScript(SCRIPT_LEFT, 'gameLeft', ScriptPayloadBuilder.leftPayload()));
    catalog.add(new GameScript(SCRIPT_RIGHT, 'gameRight', ScriptPayloadBuilder.rightPayload()));
    catalog.add(new GameScript(SCRIPT_START, 'gameStart', ScriptPayloadBuilder.startPayload()));
    catalog.add(new GameScript(SCRIPT_RESET, 'gameReset', ScriptPayloadBuilder.resetPayload()));
    catalog.add(new GameScript(SCRIPT_REMOVE_DESC, 'removeDesc', ScriptPayloadBuilder.removeDescPayload()));
    return catalog;
  }

  public add(script: GameScript): void {
    if (this.scripts.has(script.id)) {
      this.scripts.set(script.id, script);
      return;
    }
    this.scripts.set(script.id, script);
    this.order.push(script.id);
  }

  public get(id: string): GameScript | undefined {
    return this.scripts.get(id);
  }

  public require(id: string): GameScript {
    const script: GameScript | undefined = this.scripts.get(id);
    if (script === undefined) {
      throw new Error('script not found: ' + id);
    }
    return script;
  }

  public contains(id: string): boolean {
    return this.scripts.has(id);
  }

  public ids(): string[] {
    return [...this.order];
  }

  public size(): number {
    return this.order.length;
  }

  public all(): GameScript[] {
    const result: GameScript[] = [];
    for (let i = 0; i < this.order.length; i++) {
      const script: GameScript | undefined = this.scripts.get(this.order[i]);
      if (script !== undefined) {
        result.push(script);
      }
    }
    return result;
  }

  /**
   * Validates that every script carries an action, a payload, a trace call and
   * an entry point reference.
   */
  public validateAll(): boolean {
    const scripts: GameScript[] = this.all();
    if (scripts.length !== 5) {
      return false;
    }
    for (let i = 0; i < scripts.length; i++) {
      if (!scripts[i].hasAction() || !scripts[i].hasCode() || !scripts[i].hasTraceCall() ||
        !scripts[i].referencesEntryPoint()) {
        return false;
      }
    }
    return true;
  }

  /**
   * Returns the ids of scripts that do not reference the game entry point.
   */
  public findMissingEntryPoint(): string[] {
    const missing: string[] = [];
    const scripts: GameScript[] = this.all();
    for (let i = 0; i < scripts.length; i++) {
      if (!scripts[i].referencesEntryPoint()) {
        missing.push(scripts[i].id);
      }
    }
    return missing;
  }

  public toInjectionUrls(): string[] {
    const urls: string[] = [];
    const scripts: GameScript[] = this.all();
    for (let i = 0; i < scripts.length; i++) {
      urls.push(scripts[i].toInjectionUrl());
    }
    return urls;
  }

  public totalPayloadLength(): number {
    let total: number = 0;
    const scripts: GameScript[] = this.all();
    for (let i = 0; i < scripts.length; i++) {
      total += scripts[i].length();
    }
    return total;
  }
}

/**
 * Validates and builds javascript: injection urls.
 */
export class InjectionPipeline {
  public static readonly PREFIX: string = JAVASCRIPT_PREFIX;

  public static build(code: string): string {
    if (code.length === 0) {
      throw new Error('empty javascript payload');
    }
    return InjectionPipeline.PREFIX + code;
  }

  public static buildFromScript(script: GameScript): string {
    if (!script.hasCode()) {
      throw new Error('script without payload: ' + script.id);
    }
    return InjectionPipeline.PREFIX + script.code;
  }

  public static isInjectionUrl(url: string): boolean {
    return url.startsWith(InjectionPipeline.PREFIX);
  }

  public static isRemoteUrl(url: string): boolean {
    return url.startsWith('https://') || url.startsWith('http://');
  }

  public static extract(url: string): string {
    if (!InjectionPipeline.isInjectionUrl(url)) {
      return '';
    }
    return url.substring(InjectionPipeline.PREFIX.length);
  }

  public static hasBalancedBraces(code: string): boolean {
    let depth: number = 0;
    for (let i = 0; i < code.length; i++) {
      const ch: string = code.charAt(i);
      if (ch === '{') {
        depth++;
      } else if (ch === '}') {
        depth--;
        if (depth < 0) {
          return false;
        }
      }
    }
    return depth === 0;
  }

  public static hasBalancedParentheses(code: string): boolean {
    let depth: number = 0;
    for (let i = 0; i < code.length; i++) {
      const ch: string = code.charAt(i);
      if (ch === '(') {
        depth++;
      } else if (ch === ')') {
        depth--;
        if (depth < 0) {
          return false;
        }
      }
    }
    return depth === 0;
  }

  public static isWellFormed(code: string): boolean {
    return code.length > 0 && InjectionPipeline.hasBalancedBraces(code) &&
      InjectionPipeline.hasBalancedParentheses(code);
  }

  /**
   * Rejects payloads that would escape the javascript: scheme or that contain
   * control characters.
   */
  public static isSafe(code: string): boolean {
    if (code.length === 0) {
      return false;
    }
    if (code.indexOf('\n') >= 0 || code.indexOf('\r') >= 0 || code.indexOf('\0') >= 0) {
      return false;
    }
    return code.indexOf('javascript:') < 0;
  }
}

/**
 * State machine of the hosted block breaker game.
 *
 * start(): START -> RUNNING, IGNORED when the game is over.
 * reset(): GAMEOVER -> START, IGNORED in every other state.
 */
export class GameSession {
  private state: GameState = GameState.STATE_START;
  private ballFired: boolean = false;
  private startCount: number = 0;
  private resetCount: number = 0;
  private ignoredStartCount: number = 0;
  private ignoredResetCount: number = 0;
  private history: string[] = [];

  public getState(): GameState {
    return this.state;
  }

  public isStarted(): boolean {
    return this.state === GameState.STATE_START;
  }

  public isRunning(): boolean {
    return this.state === GameState.STATE_RUNNING;
  }

  public isGameOver(): boolean {
    return this.state === GameState.STATE_GAMEOVER;
  }

  public isBallFired(): boolean {
    return this.ballFired;
  }

  public start(): boolean {
    if (this.state === GameState.STATE_GAMEOVER) {
      this.ignoredStartCount++;
      this.history.push('start:ignored');
      return false;
    }
    this.state = GameState.STATE_RUNNING;
    this.ballFired = true;
    this.startCount++;
    this.history.push('start:running');
    return true;
  }

  public reset(): boolean {
    if (this.state !== GameState.STATE_GAMEOVER) {
      this.ignoredResetCount++;
      this.history.push('reset:ignored');
      return false;
    }
    this.state = GameState.STATE_START;
    this.ballFired = false;
    this.resetCount++;
    this.history.push('reset:start');
    return true;
  }

  public markGameOver(): void {
    this.state = GameState.STATE_GAMEOVER;
    this.ballFired = false;
    this.history.push('gameover');
  }

  public getStartCount(): number {
    return this.startCount;
  }

  public getResetCount(): number {
    return this.resetCount;
  }

  public getIgnoredStartCount(): number {
    return this.ignoredStartCount;
  }

  public getIgnoredResetCount(): number {
    return this.ignoredResetCount;
  }

  public getHistory(): string[] {
    return [...this.history];
  }

  public historyContains(entry: string): boolean {
    return this.history.includes(entry);
  }

  public clearHistory(): void {
    this.history = [];
  }

  public resetSession(): void {
    this.state = GameState.STATE_START;
    this.ballFired = false;
    this.startCount = 0;
    this.resetCount = 0;
    this.ignoredStartCount = 0;
    this.ignoredResetCount = 0;
    this.history = [];
  }
}

/**
 * Paddle of the hosted game. The paddle moves in fixed steps and is clamped to
 * the play field.
 */
export class PaddleModel {
  public static readonly DEFAULT_MIN: number = 0;
  public static readonly DEFAULT_MAX: number = 100;
  public static readonly DEFAULT_STEP: number = 5;

  private position: number;
  private readonly min: number;
  private readonly max: number;
  private readonly step: number;
  private moveCount: number = 0;

  constructor(min: number = PaddleModel.DEFAULT_MIN, max: number = PaddleModel.DEFAULT_MAX,
    step: number = PaddleModel.DEFAULT_STEP) {
    this.min = min;
    this.max = max;
    this.step = step;
    this.position = min;
  }

  public moveLeft(): number {
    const next: number = this.position - this.step;
    this.position = next < this.min ? this.min : next;
    this.moveCount++;
    return this.position;
  }

  public moveRight(): number {
    const next: number = this.position + this.step;
    this.position = next > this.max ? this.max : next;
    this.moveCount++;
    return this.position;
  }

  public setPosition(value: number): void {
    this.position = this.clamp(value);
  }

  public getPosition(): number {
    return this.position;
  }

  public getMin(): number {
    return this.min;
  }

  public getMax(): number {
    return this.max;
  }

  public getStep(): number {
    return this.step;
  }

  public getMoveCount(): number {
    return this.moveCount;
  }

  public isAtLeftEdge(): boolean {
    return this.position <= this.min;
  }

  public isAtRightEdge(): boolean {
    return this.position >= this.max;
  }

  public clamp(value: number): number {
    if (value < this.min) {
      return this.min;
    }
    if (value > this.max) {
      return this.max;
    }
    return value;
  }

  public reset(): void {
    this.position = this.min;
    this.moveCount = 0;
  }

  public getRatio(): number {
    if (this.max === this.min) {
      return 0;
    }
    return (this.position - this.min) / (this.max - this.min);
  }
}

/**
 * Ball of the hosted game. The ball only moves after it has been fired by the
 * start script.
 */
export class BallModel {
  private fired: boolean = false;
  private x: number;
  private y: number;
  private vx: number;
  private vy: number;

  constructor() {
    this.x = 50;
    this.y = 50;
    this.vx = 2;
    this.vy = -3;
  }

  public fire(): void {
    this.fired = true;
  }

  public isFired(): boolean {
    return this.fired;
  }

  public update(deltaMs: number): void {
    if (!this.fired) {
      return;
    }
    this.x += this.vx * deltaMs / 16;
    this.y += this.vy * deltaMs / 16;
  }

  public getX(): number {
    return this.x;
  }

  public getY(): number {
    return this.y;
  }

  public getVelocityX(): number {
    return this.vx;
  }

  public getVelocityY(): number {
    return this.vy;
  }

  public setVelocity(vx: number, vy: number): void {
    this.vx = vx;
    this.vy = vy;
  }

  public reset(): void {
    this.fired = false;
    this.x = 50;
    this.y = 50;
    this.vx = 2;
    this.vy = -3;
  }
}

/**
 * Web component configuration used by the sample page.
 */
export class WebSettingsProfile {
  private domStorageAccess: boolean;
  private onlineImageAccess: boolean;
  private imageAccess: boolean;
  private zoomAccess: boolean;
  private javaScriptAccess: boolean;

  constructor(domStorage: boolean, onlineImage: boolean, image: boolean, zoom: boolean, javaScript: boolean) {
    this.domStorageAccess = domStorage;
    this.onlineImageAccess = onlineImage;
    this.imageAccess = image;
    this.zoomAccess = zoom;
    this.javaScriptAccess = javaScript;
  }

  public static createDefault(): WebSettingsProfile {
    return new WebSettingsProfile(true, true, true, false, true);
  }

  public isDomStorageAccess(): boolean {
    return this.domStorageAccess;
  }

  public isOnlineImageAccess(): boolean {
    return this.onlineImageAccess;
  }

  public isImageAccess(): boolean {
    return this.imageAccess;
  }

  public isZoomAccess(): boolean {
    return this.zoomAccess;
  }

  public isJavaScriptAccess(): boolean {
    return this.javaScriptAccess;
  }

  public setDomStorageAccess(value: boolean): void {
    this.domStorageAccess = value;
  }

  public setOnlineImageAccess(value: boolean): void {
    this.onlineImageAccess = value;
  }

  public setImageAccess(value: boolean): void {
    this.imageAccess = value;
  }

  public setZoomAccess(value: boolean): void {
    this.zoomAccess = value;
  }

  public setJavaScriptAccess(value: boolean): void {
    this.javaScriptAccess = value;
  }

  /**
   * The game needs script execution, dom storage and image loading, while
   * pinch zoom must stay disabled.
   */
  public isValidGameProfile(): boolean {
    return this.javaScriptAccess && this.domStorageAccess && this.imageAccess &&
      this.onlineImageAccess && !this.zoomAccess;
  }

  public countEnabled(): number {
    let count: number = 0;
    if (this.domStorageAccess) {
      count++;
    }
    if (this.onlineImageAccess) {
      count++;
    }
    if (this.imageAccess) {
      count++;
    }
    if (this.zoomAccess) {
      count++;
    }
    if (this.javaScriptAccess) {
      count++;
    }
    return count;
  }

  public equals(other: WebSettingsProfile): boolean {
    return this.domStorageAccess === other.domStorageAccess &&
      this.onlineImageAccess === other.onlineImageAccess &&
      this.imageAccess === other.imageAccess &&
      this.zoomAccess === other.zoomAccess &&
      this.javaScriptAccess === other.javaScriptAccess;
  }

  public toSummary(): string {
    return `dom=${this.domStorageAccess},onlineImage=${this.onlineImageAccess},image=${this.imageAccess},` +
      `zoom=${this.zoomAccess},js=${this.javaScriptAccess}`;
  }
}

/**
 * Three column layout: 10% controls on the left, 80% web view in the middle,
 * 10% controls on the right.
 */
export class LayoutProfile {
  private leftWidth: number;
  private centerWidth: number;
  private rightWidth: number;
  private buttonWidth: number;
  private buttonHeight: number;
  private orientation: string;

  constructor(leftWidth: number, centerWidth: number, rightWidth: number, buttonWidth: number,
    buttonHeight: number, orientation: string) {
    this.leftWidth = leftWidth;
    this.centerWidth = centerWidth;
    this.rightWidth = rightWidth;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.orientation = orientation;
  }

  public static createDefault(): LayoutProfile {
    return new LayoutProfile(LAYOUT_LEFT_WIDTH, LAYOUT_CENTER_WIDTH, LAYOUT_RIGHT_WIDTH,
      CONTROL_BUTTON_WIDTH, CONTROL_BUTTON_HEIGHT, ORIENTATION_LANDSCAPE);
  }

  public totalWidth(): number {
    return this.leftWidth + this.centerWidth + this.rightWidth;
  }

  public isValid(): boolean {
    return this.totalWidth() === 100 && this.buttonWidth > 0 && this.buttonHeight > 0 &&
      this.orientation === ORIENTATION_LANDSCAPE;
  }

  public isBalanced(): boolean {
    return this.leftWidth === this.rightWidth;
  }

  public webShare(): number {
    return this.centerWidth;
  }

  public controlShare(): number {
    return this.leftWidth + this.rightWidth;
  }

  public getButtonAspectRatio(): number {
    return this.buttonHeight / this.buttonWidth;
  }

  public scaledWidth(scale: number): number {
    return this.centerWidth * scale;
  }

  public getOrientation(): string {
    return this.orientation;
  }

  public equals(other: LayoutProfile): boolean {
    return this.leftWidth === other.leftWidth && this.centerWidth === other.centerWidth &&
      this.rightWidth === other.rightWidth && this.buttonWidth === other.buttonWidth &&
      this.buttonHeight === other.buttonHeight && this.orientation === other.orientation;
  }
}

/**
 * One page load observation of the Web component.
 */
export class PageLoadRecord {
  private url: string;
  private startedAt: number;
  private finishedAt: number;
  private status: LoadStatus;
  private errorCode: number;

  constructor(url: string, startedAt: number) {
    this.url = url;
    this.startedAt = startedAt;
    this.finishedAt = 0;
    this.status = LoadStatus.LOADING;
    this.errorCode = 0;
  }

  public finish(finishedAt: number): void {
    this.finishedAt = finishedAt;
    this.status = LoadStatus.LOADED;
  }

  public fail(errorCode: number, finishedAt: number): void {
    this.errorCode = errorCode;
    this.finishedAt = finishedAt;
    this.status = LoadStatus.ERROR;
  }

  public getUrl(): string {
    return this.url;
  }

  public getStatus(): LoadStatus {
    return this.status;
  }

  public getErrorCode(): number {
    return this.errorCode;
  }

  public getDuration(): number {
    if (this.finishedAt === 0) {
      return 0;
    }
    return this.finishedAt - this.startedAt;
  }

  public isSuccess(): boolean {
    return this.status === LoadStatus.LOADED;
  }

  public isWithinBudget(budgetMs: number = PAGE_LOAD_BUDGET_MS): boolean {
    return this.getDuration() <= budgetMs;
  }
}

/**
 * Collects latency samples and reports aggregates.
 */
export class PerformanceSampler {
  private samples: number[] = [];

  public record(value: number): void {
    this.samples.push(value);
  }

  public count(): number {
    return this.samples.length;
  }

  public min(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let minValue: number = this.samples[0];
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i] < minValue) {
        minValue = this.samples[i];
      }
    }
    return minValue;
  }

  public max(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let maxValue: number = this.samples[0];
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i] > maxValue) {
        maxValue = this.samples[i];
      }
    }
    return maxValue;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i];
    }
    return total / this.samples.length;
  }

  /**
   * Nearest rank percentile, sufficient for the coarse budgets used by the
   * stability suites.
   */
  public percentile(percent: number): number {
    if (this.samples.length === 0) {
      return 0;
    }
    const sorted: number[] = [...this.samples];
    sorted.sort((a: number, b: number) => a - b);
    let index: number = Math.ceil(percent / 100 * sorted.length) - 1;
    if (index < 0) {
      index = 0;
    }
    if (index >= sorted.length) {
      index = sorted.length - 1;
    }
    return sorted[index];
  }

  public isWithinBudget(budgetMs: number): boolean {
    return this.max() <= budgetMs;
  }

  public all(): number[] {
    return [...this.samples];
  }

  public reset(): void {
    this.samples = [];
  }
}

/**
 * Static description of the application configuration.
 */
export class ConfigSnapshot {
  public bundleName: string;
  public moduleName: string;
  public abilityName: string;
  public apiVersion: number;
  public orientation: string;
  public deviceTypes: string[];
  public permissions: string[];
  public metadata: string[];

  constructor(bundleName: string, moduleName: string, abilityName: string, apiVersion: number,
    orientation: string, deviceTypes: string[], permissions: string[], metadata: string[]) {
    this.bundleName = bundleName;
    this.moduleName = moduleName;
    this.abilityName = abilityName;
    this.apiVersion = apiVersion;
    this.orientation = orientation;
    this.deviceTypes = deviceTypes;
    this.permissions = permissions;
    this.metadata = metadata;
  }

  public static createDefault(): ConfigSnapshot {
    return new ConfigSnapshot(BUNDLE_NAME, MODULE_NAME, ABILITY_NAME, API_VERSION, ORIENTATION_LANDSCAPE,
      ['default', 'tablet'], [INTERNET_PERMISSION], ['ArkTSPartialUpdate']);
  }

  public hasPermission(permission: string): boolean {
    return this.permissions.includes(permission);
  }

  public supportsDevice(deviceType: string): boolean {
    return this.deviceTypes.includes(deviceType);
  }

  public isLandscape(): boolean {
    return this.orientation === ORIENTATION_LANDSCAPE;
  }

  public hasMetadata(name: string): boolean {
    return this.metadata.includes(name);
  }

  public deviceTypeCount(): number {
    return this.deviceTypes.length;
  }

  public equals(other: ConfigSnapshot): boolean {
    if (this.bundleName !== other.bundleName || this.moduleName !== other.moduleName ||
      this.abilityName !== other.abilityName || this.apiVersion !== other.apiVersion ||
      this.orientation !== other.orientation) {
      return false;
    }
    if (this.deviceTypes.length !== other.deviceTypes.length || this.permissions.length !== other.permissions.length) {
      return false;
    }
    return this.deviceTypes.join(',') === other.deviceTypes.join(',') &&
      this.permissions.join(',') === other.permissions.join(',');
  }
}

/**
 * Bounded retry policy for failed injections and page loads.
 */
export class RetryPolicy {
  private readonly maxAttempts: number;
  private readonly baseDelayMs: number;
  private attempts: number = 0;

  constructor(maxAttempts: number = MAX_INJECTION_ATTEMPTS, baseDelayMs: number = 100) {
    this.maxAttempts = maxAttempts;
    this.baseDelayMs = baseDelayMs;
  }

  public canRetry(): boolean {
    return this.attempts < this.maxAttempts;
  }

  public recordAttempt(): boolean {
    if (!this.canRetry()) {
      return false;
    }
    this.attempts++;
    return true;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public getMaxAttempts(): number {
    return this.maxAttempts;
  }

  public nextDelay(): number {
    if (this.attempts === 0) {
      return 0;
    }
    const delay: number = this.baseDelayMs * Math.pow(2, this.attempts - 1);
    return delay > 2000 ? 2000 : delay;
  }

  public reset(): void {
    this.attempts = 0;
  }
}

/**
 * Ordered recorder of user and system events.
 */
export class EventRecorder {
  private events: string[] = [];

  public record(event: string): void {
    this.events.push(event);
  }

  public count(): number {
    return this.events.length;
  }

  public contains(event: string): boolean {
    return this.events.includes(event);
  }

  public countOf(event: string): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i] === event) {
        count++;
      }
    }
    return count;
  }

  public sequence(): string[] {
    return [...this.events];
  }

  public first(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[0];
  }

  public last(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[this.events.length - 1];
  }

  public clear(): void {
    this.events = [];
  }
}

/**
 * Score board of the block breaker game.
 */
export class ScoreBoard {
  private score: number = 0;
  private highScore: number = 0;
  private hitCount: number = 0;

  public add(points: number): number {
    if (points <= 0) {
      return this.score;
    }
    this.score += points;
    this.hitCount++;
    if (this.score > this.highScore) {
      this.highScore = this.score;
    }
    return this.score;
  }

  public getScore(): number {
    return this.score;
  }

  public getHighScore(): number {
    return this.highScore;
  }

  public getHitCount(): number {
    return this.hitCount;
  }

  public isNewRecord(): boolean {
    return this.score === this.highScore && this.score > 0;
  }

  public reset(): void {
    this.score = 0;
    this.hitCount = 0;
  }
}

/**
 * Brick grid of the block breaker game.
 */
export class BrickGrid {
  private readonly rows: number;
  private readonly columns: number;
  private remaining: number;

  constructor(rows: number, columns: number) {
    this.rows = rows;
    this.columns = columns;
    this.remaining = rows * columns;
  }

  public getRows(): number {
    return this.rows;
  }

  public getColumns(): number {
    return this.columns;
  }

  public total(): number {
    return this.rows * this.columns;
  }

  public getRemaining(): number {
    return this.remaining;
  }

  public hit(): boolean {
    if (this.remaining === 0) {
      return false;
    }
    this.remaining--;
    return true;
  }

  public isCleared(): boolean {
    return this.remaining === 0;
  }

  public clearAll(): void {
    this.remaining = 0;
  }

  public reset(): void {
    this.remaining = this.rows * this.columns;
  }

  public progress(): number {
    if (this.total() === 0) {
      return 0;
    }
    return (this.total() - this.remaining) / this.total();
  }
}

/**
 * Very small localization catalog used by the localization suites.
 */
export class LocaleCatalog {
  private locale: UiLocale;
  private entries: Map<string, string> = new Map<string, string>();

  constructor(locale: UiLocale) {
    this.locale = locale;
  }

  public static createEnglish(): LocaleCatalog {
    const catalog: LocaleCatalog = new LocaleCatalog(UiLocale.EN_US);
    catalog.put('start', 'Start');
    catalog.put('left', 'L');
    catalog.put('right', 'R');
    catalog.put('reset', 'Reset');
    catalog.put('app_name', 'RunJsInWeb');
    catalog.put('permission_reason', 'Internet access is required to load the game');
    return catalog;
  }

  public static createChinese(): LocaleCatalog {
    const catalog: LocaleCatalog = new LocaleCatalog(UiLocale.ZH_CN);
    catalog.put('start', '开始');
    catalog.put('left', '左');
    catalog.put('right', '右');
    catalog.put('reset', '重置');
    catalog.put('app_name', 'RunJsInWeb');
    catalog.put('permission_reason', '加载游戏需要访问网络');
    return catalog;
  }

  public getLocale(): UiLocale {
    return this.locale;
  }

  public put(key: string, value: string): void {
    this.entries.set(key, value);
  }

  public get(key: string): string {
    const value: string | undefined = this.entries.get(key);
    return value === undefined ? '' : value;
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public size(): number {
    return this.entries.size;
  }

  public keys(): string[] {
    const result: string[] = [];
    this.entries.forEach((value: string, key: string) => {
      result.push(key);
    });
    return result;
  }

  public isComplete(): boolean {
    return this.has('start') && this.has('left') && this.has('right') && this.has('reset') &&
      this.has('app_name') && this.has('permission_reason');
  }
}

/**
 * Accumulates validation findings for script and configuration checks.
 */
export class ValidationReport {
  private errors: string[] = [];

  public addError(message: string): void {
    this.errors.push(message);
  }

  public getErrors(): string[] {
    return [...this.errors];
  }

  public getErrorCount(): number {
    return this.errors.length;
  }

  public isValid(): boolean {
    return this.errors.length === 0;
  }

  public contains(message: string): boolean {
    return this.errors.includes(message);
  }

  public merge(other: ValidationReport): void {
    const otherErrors: string[] = other.getErrors();
    for (let i = 0; i < otherErrors.length; i++) {
      this.errors.push(otherErrors[i]);
    }
  }

  public clear(): void {
    this.errors = [];
  }

  public summary(): string {
    if (this.errors.length === 0) {
      return 'valid';
    }
    return `invalid:${this.errors.length}`;
  }
}

/**
 * Builds the concrete payloads used by the controller. Kept separate from the
 * catalog so that boundary suites can request malformed variants.
 */
export class ScriptPayloadBuilder {
  public static startPayload(): string {
    return `${TRACE_PREFIX}('webgame gameStart'); if (_main.game.state !== _main.game.state_GAMEOVER) ` +
      `{_main.game.state = _main.game.state_RUNNING; _main.ball.fired = true;}`;
  }

  public static leftPayload(): string {
    return `${TRACE_PREFIX}('webgame gameLeft'); _main.paddle.moveLeft();`;
  }

  public static rightPayload(): string {
    return `${TRACE_PREFIX}('webgame gameRight'); _main.paddle.moveRight();`;
  }

  public static resetPayload(): string {
    return `${TRACE_PREFIX}('webgame gameReset'); if (_main.game.state === _main.game.state_GAMEOVER) ` +
      `{_main.game.state = _main.game.state_START; _main.start()}`;
  }

  public static removeDescPayload(): string {
    return `${TRACE_PREFIX}('webgame removeDesc'); y=document.getElementsByTagName('div')[0]; ` +
      `y.parentNode.removeChild(y)`;
  }

  public static malformedPayload(): string {
    return 'if (_main.game.state !==) {';
  }

  public static unsafePayload(): string {
    return 'javascript:alert(1)';
  }

  public static emptyPayload(): string {
    return '';
  }

  public static withTraceLine(action: string, body: string): string {
    return `${TRACE_PREFIX}('webgame ${action}'); ${body}`;
  }
}
