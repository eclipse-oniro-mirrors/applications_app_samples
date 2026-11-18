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
import { hilog } from '@kit.PerformanceAnalysisKit';
const FRAMEWORK_TAG: string = 'OhosConnectTest';
export class TestLog {
  public static info(message: string): void {
    hilog.info(0x0000, FRAMEWORK_TAG, '%{public}s', message);
  }
  public static warn(message: string): void {
    hilog.warn(0x0000, FRAMEWORK_TAG, '%{public}s', message);
  }
  public static error(message: string): void {
    hilog.error(0x0000, FRAMEWORK_TAG, '%{public}s', message);
  }
}
export enum TestProtocol {
  BLE = 1,
  WIFI = 2,
  IOT = 3,
  CLOUD = 4,
  VIRTUAL = 5
}
export enum TestConnState {
  DISCONNECT = 0,
  CONNECTING = 1,
  ONLINE = 2,
  OFFLINE = 3,
  ERROR = 4
}
export class TestDevice {
  public unionCode: string;
  public deviceId: string;
  public name: string;
  public protocol: TestProtocol;
  public rssi: number;
  public state: TestConnState;
  constructor(unionCode: string, deviceId: string, name: string, protocol: TestProtocol, rssi: number,
    state: TestConnState) {
    this.unionCode = unionCode;
    this.deviceId = deviceId;
    this.name = name;
    this.protocol = protocol;
    this.rssi = rssi;
    this.state = state;
  }
  public isOnline(): boolean {
    return this.state === TestConnState.ONLINE;
  }
  public key(): string {
    return this.protocol.toString() + '_' + this.unionCode;
  }
  public describe(): string {
    return this.name + '(' + this.unionCode + ')';
  }
}
export class TestDeviceStore {
  private devices: Map<string, TestDevice> = new Map<string, TestDevice>();
  public add(device: TestDevice): boolean {
    if (this.devices.has(device.unionCode)) {
      return false;
    }
    this.devices.set(device.unionCode, device);
    return true;
  }
  public find(unionCode: string): TestDevice | undefined {
    return this.devices.get(unionCode);
  }
  public remove(unionCode: string): boolean {
    return this.devices.delete(unionCode);
  }
  public size(): number {
    return this.devices.size;
  }
  public onlineCount(): number {
    let count: number = 0;
    this.devices.forEach((device: TestDevice) => {
      if (device.isOnline()) {
        count = count + 1;
      }
    });
    return count;
  }
  public filterByProtocol(protocol: TestProtocol): TestDevice[] {
    const result: TestDevice[] = [];
    this.devices.forEach((device: TestDevice) => {
      if (device.protocol === protocol) {
        result.push(device);
      }
    });
    return result;
  }
  public sortByRssi(): TestDevice[] {
    const result: TestDevice[] = [];
    this.devices.forEach((device: TestDevice) => {
      result.push(device);
    });
    result.sort((a: TestDevice, b: TestDevice) => b.rssi - a.rssi);
    return result;
  }
  public updateState(unionCode: string, state: TestConnState): boolean {
    const device: TestDevice | undefined = this.devices.get(unionCode);
    if (device === undefined) {
      return false;
    }
    device.state = state;
    return true;
  }
  public clear(): void {
    this.devices.clear();
  }
  public all(): TestDevice[] {
    const result: TestDevice[] = [];
    this.devices.forEach((device: TestDevice) => {
      result.push(device);
    });
    return result;
  }
}
export class TestConnMachine {
  private state: TestConnState = TestConnState.DISCONNECT;
  public getState(): TestConnState {
    return this.state;
  }
  public connect(): boolean {
    if (this.state === TestConnState.ONLINE || this.state === TestConnState.CONNECTING) {
      return false;
    }
    this.state = TestConnState.CONNECTING;
    return true;
  }
  public confirmOnline(): boolean {
    if (this.state !== TestConnState.CONNECTING) {
      return false;
    }
    this.state = TestConnState.ONLINE;
    return true;
  }
  public disconnect(): void {
    this.state = TestConnState.DISCONNECT;
  }
  public fail(): void {
    this.state = TestConnState.ERROR;
  }
  public isOnline(): boolean {
    return this.state === TestConnState.ONLINE;
  }
  public reset(): void {
    this.state = TestConnState.DISCONNECT;
  }
}
export class TestScene {
  public sceneId: string;
  public title: string;
  public enabled: boolean;
  public actionCount: number;
  constructor(sceneId: string, title: string, enabled: boolean, actionCount: number) {
    this.sceneId = sceneId;
    this.title = title;
    this.enabled = enabled;
    this.actionCount = actionCount;
  }
}
export class TestSceneStore {
  private scenes: Map<string, TestScene> = new Map<string, TestScene>();
  public add(scene: TestScene): boolean {
    if (this.scenes.has(scene.sceneId)) {
      return false;
    }
    this.scenes.set(scene.sceneId, scene);
    return true;
  }
  public find(sceneId: string): TestScene | undefined {
    return this.scenes.get(sceneId);
  }
  public enable(sceneId: string, enabled: boolean): boolean {
    const scene: TestScene | undefined = this.scenes.get(sceneId);
    if (scene === undefined) {
      return false;
    }
    scene.enabled = enabled;
    return true;
  }
  public enabledCount(): number {
    let count: number = 0;
    this.scenes.forEach((scene: TestScene) => {
      if (scene.enabled) {
        count = count + 1;
      }
    });
    return count;
  }
  public size(): number {
    return this.scenes.size;
  }
}
export class TestSession {
  public token: string;
  public userId: string;
  public expireAt: number;
  constructor(token: string, userId: string, expireAt: number) {
    this.token = token;
    this.userId = userId;
    this.expireAt = expireAt;
  }
  public isValid(now: number): boolean {
    return this.token.length > 0 && this.expireAt > now;
  }
}
export class TestSessionManager {
  private session: TestSession | undefined = undefined;
  public login(token: string, userId: string, ttl: number, now: number): TestSession {
    this.session = new TestSession(token, userId, now + ttl);
    return this.session;
  }
  public logout(): void {
    this.session = undefined;
  }
  public isLoggedIn(now: number): boolean {
    if (this.session === undefined) {
      return false;
    }
    return this.session.isValid(now);
  }
  public current(): TestSession | undefined {
    return this.session;
  }
}
export interface TestCommandJson {
  seq: number;
  sid: string;
  value: number;
}
export class TestCommand {
  public seq: number;
  public sid: string;
  public value: number;
  constructor(seq: number, sid: string, value: number) {
    this.seq = seq;
    this.sid = sid;
    this.value = value;
  }
}
export class TestCommandCodec {
  public static encode(command: TestCommand): string {
    return '{"seq":' + command.seq + ',"sid":"' + command.sid + '","value":' + command.value + '}';
  }
  public static decode(json: string): TestCommand | undefined {
    try {
      const obj: TestCommandJson = JSON.parse(json) as TestCommandJson;
      if (obj === null || obj === undefined) {
        return undefined;
      }
      return new TestCommand(obj.seq, obj.sid, obj.value);
    } catch (error) {
      return undefined;
    }
  }
}
export class TestRetryPolicy {
  private maxRetry: number;
  private baseDelay: number;
  constructor(maxRetry: number, baseDelay: number) {
    this.maxRetry = maxRetry;
    this.baseDelay = baseDelay;
  }
  public shouldRetry(attempt: number): boolean {
    return attempt < this.maxRetry;
  }
  public nextDelay(attempt: number): number {
    let delayMs: number = this.baseDelay;
    for (let i = 0; i < attempt; i++) {
      delayMs = delayMs * 2;
    }
    return delayMs;
  }
}
export class TestTokenBucket {
  private capacity: number;
  private tokens: number;
  constructor(capacity: number) {
    this.capacity = capacity;
    this.tokens = capacity;
  }
  public tryAcquire(count: number): boolean {
    if (count <= 0) {
      return false;
    }
    if (this.tokens < count) {
      return false;
    }
    this.tokens = this.tokens - count;
    return true;
  }
  public refill(count: number): void {
    this.tokens = this.tokens + count;
    if (this.tokens > this.capacity) {
      this.tokens = this.capacity;
    }
  }
  public available(): number {
    return this.tokens;
  }
}
export class TestMetrics {
  private values: number[] = [];
  public record(value: number): void {
    this.values.push(value);
  }
  public count(): number {
    return this.values.length;
  }
  public sum(): number {
    let total: number = 0;
    for (let i = 0; i < this.values.length; i++) {
      total = total + this.values[i];
    }
    return total;
  }
  public average(): number {
    if (this.values.length === 0) {
      return 0;
    }
    return this.sum() / this.values.length;
  }
  public max(): number {
    if (this.values.length === 0) {
      return 0;
    }
    let result: number = this.values[0];
    for (let i = 1; i < this.values.length; i++) {
      if (this.values[i] > result) {
        result = this.values[i];
      }
    }
    return result;
  }
  public min(): number {
    if (this.values.length === 0) {
      return 0;
    }
    let result: number = this.values[0];
    for (let i = 1; i < this.values.length; i++) {
      if (this.values[i] < result) {
        result = this.values[i];
      }
    }
    return result;
  }
}
export class TestHex {
  public static isValid(hex: string): boolean {
    if (hex.length < 3) {
      return false;
    }
    if (!hex.startsWith('0x')) {
      return false;
    }
    const body: string = hex.substring(2);
    for (let i = 0; i < body.length; i++) {
      const c: string = body.charAt(i);
      const isDigit: boolean = c >= '0' && c <= '9';
      const isUpper: boolean = c >= 'A' && c <= 'F';
      const isLower: boolean = c >= 'a' && c <= 'f';
      if (!isDigit && !isUpper && !isLower) {
        return false;
      }
    }
    return true;
  }
  public static parse(hex: string): number {
    if (!TestHex.isValid(hex)) {
      return -1;
    }
    return Number.parseInt(hex.substring(2), 16);
  }
}
export function testDelay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}
export function makeDevice(unionCode: string, protocol: TestProtocol, rssi: number, online: boolean): TestDevice {
  const state: TestConnState = online ? TestConnState.ONLINE : TestConnState.OFFLINE;
  return new TestDevice(unionCode, 'id_' + unionCode, 'name_' + unionCode, protocol, rssi, state);
}
export class TestStringUtil {
  public static isEmpty(value: string): boolean {
    return value.length === 0;
  }
  public static isBlank(value: string): boolean {
    return value.trim().length === 0;
  }
  public static contains(source: string, target: string): boolean {
    return source.indexOf(target) >= 0;
  }
  public static join(values: string[], separator: string): string {
    let result: string = '';
    for (let i = 0; i < values.length; i++) {
      if (i > 0) {
        result = result + separator;
      }
      result = result + values[i];
    }
    return result;
  }
  public static repeat(value: string, times: number): string {
    let result: string = '';
    for (let i = 0; i < times; i++) {
      result = result + value;
    }
    return result;
  }
}
export class TestArrayUtil {
  public static sum(values: number[]): number {
    let total: number = 0;
    for (let i = 0; i < values.length; i++) {
      total = total + values[i];
    }
    return total;
  }
  public static uniqueCount(values: string[]): number {
    const seen: Map<string, boolean> = new Map<string, boolean>();
    for (let i = 0; i < values.length; i++) {
      seen.set(values[i], true);
    }
    let count: number = 0;
    seen.forEach((value: boolean) => {
      count = count + 1;
    });
    return count;
  }
  public static contains(values: number[], target: number): boolean {
    for (let i = 0; i < values.length; i++) {
      if (values[i] === target) {
        return true;
      }
    }
    return false;
  }
}
export class TestTimeUtil {
  public static isExpired(expireAt: number, now: number): boolean {
    return expireAt <= now;
  }
  public static remaining(expireAt: number, now: number): number {
    if (expireAt <= now) {
      return 0;
    }
    return expireAt - now;
  }
  public static secondsToMillis(seconds: number): number {
    return seconds * 1000;
  }
}
export class TestConfigDefaults {
  public static readonly DEFAULT_TIMEOUT_MS: number = 2000;
  public static readonly DEFAULT_RETRY_TIMES: number = 3;
  public static readonly DEFAULT_BUCKET_CAPACITY: number = 5;
  public static readonly DEFAULT_SEQ_START: number = 0;
  public static isValidTimeout(value: number): boolean {
    return value > 0 && value <= 60000;
  }
  public static isValidRetry(value: number): boolean {
    return value >= 0 && value <= 10;
  }
}
