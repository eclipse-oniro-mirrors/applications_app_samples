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
 * SharedDriver for IPC_Client ohosTest.
 *
 * The production page (entry/src/main/ets/pages/Index.ets) talks to a
 * ServiceExtensionAbility through @kit.IPCKit. A host test cannot own a real
 * remote proxy, so this file rebuilds the observable protocol as plain
 * classes: connection state, death recipient registration, message sequence
 * cursor, request/reply result and toast decisions.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   24-33   proxy, connectId, MyDeathRecipient, deathRecipient
 *   37      isDisconnect flag
 *   103-197 connectAbility: Want(com.example.ipc_stub / ServiceAbility),
 *           onConnect / onDisconnect / onFailed, registerDeathRecipient
 *   200-211 disconnectAbility: only when connectId != undefined
 *   215-279 sendString: code 1, writeString('hello world'),
 *           readString() reply, reclaim in finally, proxy undefined branch
 */

export const TARGET_BUNDLE: string = 'com.example.ipc_stub';
export const TARGET_ABILITY: string = 'ServiceAbility';
export const CLIENT_BUNDLE: string = 'com.example.ipc_client';
export const STUB_DESCRIPTOR: string = 'IPCStubTest';

export const REQUEST_CODE: number = 1;
export const UNKNOWN_CODE_ZERO: number = 0;
export const UNKNOWN_CODE_TWO: number = 2;
export const UNKNOWN_CODE_NEGATIVE: number = -1;
export const UNKNOWN_CODE_LARGE: number = 99;

export const REQUEST_PAYLOAD: string = 'hello world';
export const REPLY_PAYLOAD: string = 'hello rpc';

export const CONNECT_SUCCESS_TOAST: string = 'connectAbility success';
export const CONNECT_FAIL_TOAST: string =
  'Connect failed. Please ensure that the service is running in the background.';
export const SEND_SUCCESS_TOAST: string = 'sendRequest success';
export const SEND_FAIL_TOAST: string = 'sendRequest failed, please connect to the server first';
export const DISCONNECT_FAIL_TOAST: string = 'disConnect failed. Please connect to the service first.';
export const DISCONNECT_SUCCESS_TOAST: string = 'disconnectAbility success';

export const STATE_DISCONNECTED: string = 'disconnected';
export const STATE_CONNECTING: string = 'connecting';
export const STATE_CONNECTED: string = 'connected';
export const STATE_FAILED: string = 'failed';

export const ERROR_NONE: number = 0;
export const ERROR_CONNECT: number = 16000001;
export const ERROR_DISCONNECT: number = 16000002;
export const ERROR_SEND: number = 16000003;
export const ERROR_PROXY_INVALID: number = 16000004;
export const ERROR_DEATH_REGISTER: number = 16000005;

export const TOAST_DURATION_MS: number = 2000;
export const DISCONNECT_PROBE_MS: number = 3000;
export const OPTION_FLAG_SYNC: number = 0;
export const OPTION_FLAG_ASYNC: number = 1;
export const INITIAL_CONNECT_ID: number = -1;

export const LOG_TAG: string = 'testTag';
export const LEVEL_INFO: string = 'INFO';
export const LEVEL_WARN: string = 'WARN';
export const LEVEL_ERROR: string = 'ERROR';

export function clampInt(value: number, low: number, high: number): number {
  if (value < low) {
    return low;
  }
  if (value > high) {
    return high;
  }
  return value;
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

export function textFingerprint(text: string): number {
  let hash = 216613;
  for (let index = 0; index < text.length; index++) {
    hash = (hash * 31 + text.charCodeAt(index)) % 1000003;
  }
  return hash;
}

export function isKnownRequestCode(code: number): boolean {
  return code === REQUEST_CODE;
}

export function isNonZeroError(code: number): boolean {
  return code !== ERROR_NONE;
}

/** MessageSequence stand-in: a cursor over string values. */
export class MessageSequenceModel {
  public values: string[] = [];
  public cursor: number = 0;
  public reclaimed: boolean = false;
  public writeCount: number = 0;
  public readCount: number = 0;

  public static create(): MessageSequenceModel {
    return new MessageSequenceModel();
  }

  public writeString(value: string): boolean {
    if (this.reclaimed) {
      return false;
    }
    this.values.push(value);
    this.writeCount = this.writeCount + 1;
    return true;
  }

  public readString(): string {
    if (this.reclaimed || this.cursor >= this.values.length) {
      return '';
    }
    const value = this.values[this.cursor];
    this.cursor = this.cursor + 1;
    this.readCount = this.readCount + 1;
    return value;
  }

  public rewind(): void {
    this.cursor = 0;
  }

  public size(): number {
    return this.values.length;
  }

  public isEmpty(): boolean {
    return this.values.length === 0;
  }

  public reclaim(): void {
    this.reclaimed = true;
    this.cursor = 0;
  }

  public isReclaimed(): boolean {
    return this.reclaimed;
  }

  public trace(): string {
    return joined(this.values, '|') + '#' + String(this.cursor);
  }
}

/** MessageOption stand-in. */
export class MessageOptionModel {
  public flags: number;
  public waitTime: number;
  public sync: boolean;

  constructor(flags: number = OPTION_FLAG_SYNC, waitTime: number = 0, sync: boolean = false) {
    this.flags = flags;
    this.waitTime = waitTime;
    this.sync = sync;
  }

  public isSync(): boolean {
    return this.sync || this.flags === OPTION_FLAG_SYNC;
  }

  public isAsync(): boolean {
    return !this.isSync();
  }

  public clone(): MessageOptionModel {
    return new MessageOptionModel(this.flags, this.waitTime, this.sync);
  }

  public describe(): string {
    return String(this.flags) + '/' + String(this.waitTime) + '/' + String(this.sync);
  }
}

/** Want stand-in used by connect(). */
export class WantModel {
  public bundleName: string;
  public abilityName: string;

  constructor(bundleName: string = TARGET_BUNDLE, abilityName: string = TARGET_ABILITY) {
    this.bundleName = bundleName;
    this.abilityName = abilityName;
  }

  public matches(target: WantModel): boolean {
    return this.bundleName === target.bundleName && this.abilityName === target.abilityName;
  }

  public validate(): string[] {
    const errors: string[] = [];
    if (this.bundleName.length === 0) {
      errors.push('bundle-empty');
    }
    if (this.abilityName.length === 0) {
      errors.push('ability-empty');
    }
    if (this.bundleName.indexOf(' ') >= 0) {
      errors.push('bundle-has-space');
    }
    if (this.abilityName.indexOf(' ') >= 0) {
      errors.push('ability-has-space');
    }
    return errors;
  }

  public describe(): string {
    return this.bundleName + '/' + this.abilityName;
  }
}

/** RequestResult stand-in. */
export class RequestResultModel {
  public errCode: number;
  public reply: MessageSequenceModel;
  public replyText: string;

  constructor(errCode: number, replyText: string = '') {
    this.errCode = errCode;
    this.replyText = replyText;
    this.reply = new MessageSequenceModel();
    if (replyText.length > 0) {
      this.reply.writeString(replyText);
    }
  }

  public isSuccess(): boolean {
    return this.errCode === ERROR_NONE;
  }

  public readReply(): string {
    return this.reply.readString();
  }
}

/** Stub side of the protocol, mirrored for in-process client requests. */
export class RemoteStubModel {
  public descriptor: string;
  public handledCodes: number[] = [];
  public receivedTexts: string[] = [];
  public replyText: string;
  public alive: boolean = true;

  constructor(descriptor: string = STUB_DESCRIPTOR) {
    this.descriptor = descriptor;
    this.replyText = REPLY_PAYLOAD;
  }

  public onRemoteMessageRequest(code: number, data: MessageSequenceModel, reply: MessageSequenceModel,
    option: MessageOptionModel): boolean {
    this.handledCodes.push(code);
    if (!this.alive) {
      return false;
    }
    if (code === REQUEST_CODE) {
      const text = data.readString();
      this.receivedTexts.push(text);
      reply.writeString(this.replyText);
      return true;
    }
    return false;
  }

  public kill(): void {
    this.alive = false;
  }

  public revive(): void {
    this.alive = true;
  }

  public requestCount(): number {
    return this.handledCodes.length;
  }
}

/** DeathRecipient stand-in. */
export class DeathRecipientModel {
  public diedCount: number = 0;
  public registered: boolean = false;

  public onRemoteDied(): void {
    this.diedCount = this.diedCount + 1;
  }

  public describe(): string {
    return String(this.diedCount) + '/' + String(this.registered);
  }
}

/** Remote proxy stand-in. */
export class RemoteProxyModel {
  public descriptor: string;
  public stub: RemoteStubModel;
  public alive: boolean = true;
  public deathRegistered: boolean = false;
  public deathRecipient: DeathRecipientModel | undefined = undefined;
  public requests: number[] = [];
  public lastPayload: string = '';
  public sendCalls: number = 0;
  public failNextSend: number = ERROR_NONE;

  constructor(stub: RemoteStubModel = new RemoteStubModel()) {
    this.stub = stub;
    this.descriptor = stub.descriptor;
  }

  public registerDeathRecipient(recipient: DeathRecipientModel): boolean {
    if (!this.alive) {
      return false;
    }
    this.deathRecipient = recipient;
    recipient.registered = true;
    this.deathRegistered = true;
    return true;
  }

  public unregisterDeathRecipient(recipient: DeathRecipientModel): boolean {
    if (this.deathRecipient !== recipient) {
      return false;
    }
    recipient.registered = false;
    this.deathRecipient = undefined;
    this.deathRegistered = false;
    return true;
  }

  public sendMessageRequest(code: number, data: MessageSequenceModel, reply: MessageSequenceModel,
    option: MessageOptionModel): RequestResultModel {
    this.sendCalls = this.sendCalls + 1;
    this.requests.push(code);
    if (!this.alive) {
      return new RequestResultModel(ERROR_SEND, '');
    }
    if (this.failNextSend !== ERROR_NONE) {
      const codeValue = this.failNextSend;
      this.failNextSend = ERROR_NONE;
      return new RequestResultModel(codeValue, '');
    }
    const handled = this.stub.onRemoteMessageRequest(code, data, reply, option);
    if (!handled) {
      return new RequestResultModel(ERROR_SEND, '');
    }
    return new RequestResultModel(ERROR_NONE, this.stub.replyText);
  }

  public notifyDeath(): void {
    this.alive = false;
    this.stub.kill();
    if (this.deathRecipient !== undefined) {
      this.deathRecipient.onRemoteDied();
    }
  }

  public kill(): void {
    this.alive = false;
  }

  public revive(): void {
    this.alive = true;
  }

  public isAlive(): boolean {
    return this.alive;
  }

  public reset(): void {
    this.alive = true;
    if (this.deathRecipient !== undefined) {
      this.deathRecipient.registered = false;
    }
    this.deathRegistered = false;
    this.deathRecipient = undefined;
    this.requests = [];
    this.lastPayload = '';
    this.sendCalls = 0;
    this.failNextSend = ERROR_NONE;
  }
}

/** Bounded logger used by logging/security suites. */
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
      this.lines.splice(0, this.lines.length - this.limit);
      this.levels.splice(0, this.levels.length - this.limit);
    }
  }

  public size(): number {
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

/** Ordered event recorder. */
export class EventRecorder {
  public entries: string[] = [];

  public record(kind: string, detail: string): void {
    this.entries.push(kind + ':' + detail);
  }

  public size(): number {
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

/** Client connection state machine and toast decisions. */
export class ConnectionModel {
  public state: string = STATE_DISCONNECTED;
  public connectId: number = INITIAL_CONNECT_ID;
  public want: WantModel;
  public proxy: RemoteProxyModel | undefined = undefined;
  public deathRecipient: DeathRecipientModel = new DeathRecipientModel();
  public events: EventRecorder = new EventRecorder();
  public logs: LogBuffer = new LogBuffer(128);
  public toasts: string[] = [];
  public isDisconnect: boolean = false;
  public failedCode: number = ERROR_NONE;
  public connectCalls: number = 0;

  constructor(want: WantModel = new WantModel()) {
    this.want = want;
  }

  public connect(connectId: number = 1): boolean {
    this.connectCalls = this.connectCalls + 1;
    if (this.state === STATE_CONNECTED || this.state === STATE_CONNECTING) {
      this.logs.warn('connect skipped in state ' + this.state);
      return false;
    }
    this.want.validate();
    this.state = STATE_CONNECTING;
    this.connectId = connectId;
    this.events.record('connect', this.want.describe());
    return true;
  }

  public onConnect(proxy: RemoteProxyModel): void {
    this.proxy = proxy;
    this.state = STATE_CONNECTED;
    const registered = proxy.registerDeathRecipient(this.deathRecipient);
    if (registered) {
      this.logs.info('registerDeathRecipient success');
      this.events.record('death-register', proxy.descriptor);
    } else {
      this.logs.error('register failed');
      this.events.record('death-register-failed', proxy.descriptor);
    }
    this.toasts.push(CONNECT_SUCCESS_TOAST);
    this.events.record('connected', proxy.descriptor);
    this.logs.info('onConnect');
  }

  public onDisconnect(): void {
    if (this.proxy !== undefined) {
      this.proxy.unregisterDeathRecipient(this.deathRecipient);
      this.proxy = undefined;
    }
    this.state = STATE_DISCONNECTED;
    this.connectId = INITIAL_CONNECT_ID;
    this.isDisconnect = true;
    this.toasts.push(DISCONNECT_SUCCESS_TOAST);
    this.events.record('disconnected', 'ok');
    this.logs.info('onDisconnect');
  }

  public onFailed(code: number): void {
    this.state = STATE_FAILED;
    this.failedCode = code;
    this.toasts.push(CONNECT_FAIL_TOAST);
    this.events.record('failed', String(code));
    this.logs.error('onFailed code ' + String(code));
  }

  public disconnectRequested(): boolean {
    if (this.connectId === INITIAL_CONNECT_ID) {
      this.logs.error('disconnect without connectId');
      return false;
    }
    this.events.record('disconnect-request', String(this.connectId));
    return true;
  }

  public sendString(payload: string = REQUEST_PAYLOAD): RequestResultModel {
    if (this.proxy === undefined) {
      this.logs.error('proxy is invalid');
      this.toasts.push(SEND_FAIL_TOAST);
      this.events.record('send-no-proxy', payload);
      return new RequestResultModel(ERROR_PROXY_INVALID, '');
    }
    const data = MessageSequenceModel.create();
    const reply = MessageSequenceModel.create();
    data.writeString(payload);
    const result = this.proxy.sendMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
    if (result.errCode !== ERROR_NONE) {
      this.logs.error('sendMessageRequest failed, errCode is ' + String(result.errCode));
      this.toasts.push(SEND_FAIL_TOAST);
      this.events.record('send-failed', String(result.errCode));
    } else {
      // Keep the returned snapshot unread; logging must not move its cursor.
      const text = result.replyText;
      this.toasts.push(SEND_SUCCESS_TOAST);
      this.events.record('send-ok', text);
      this.logs.info('reply ' + text);
    }
    data.reclaim();
    reply.reclaim();
    return result;
  }

  public isConnected(): boolean {
    return this.state === STATE_CONNECTED && this.proxy !== undefined && this.proxy.isAlive();
  }

  public lastToast(): string {
    return this.toasts.length === 0 ? '' : this.toasts[this.toasts.length - 1];
  }

  public reset(): void {
    if (this.proxy !== undefined) {
      this.proxy.unregisterDeathRecipient(this.deathRecipient);
    }
    this.state = STATE_DISCONNECTED;
    this.connectId = INITIAL_CONNECT_ID;
    this.proxy = undefined;
    this.deathRecipient = new DeathRecipientModel();
    this.events.clear();
    this.logs.clear();
    this.toasts = [];
    this.isDisconnect = false;
    this.failedCode = ERROR_NONE;
    this.connectCalls = 0;
  }
}

/** Builds a connected client session for a suite. */
export function createConnectedSession(payload: string = REPLY_PAYLOAD): ConnectionModel {
  const stub = new RemoteStubModel();
  stub.replyText = payload;
  const proxy = new RemoteProxyModel(stub);
  const client = new ConnectionModel();
  client.connect(7);
  client.onConnect(proxy);
  return client;
}

/** Independent oracle for the reply of one request code. */
export function expectedReplyFor(code: number): string {
  return code === REQUEST_CODE ? REPLY_PAYLOAD : '';
}

/** Independent oracle for onRemoteMessageRequest. */
export function expectedHandled(code: number): boolean {
  return code === REQUEST_CODE;
}

/** Oracle for the connection state after a callback. */
export function expectedStateAfter(callback: string): string {
  if (callback === 'connect') {
    return STATE_CONNECTING;
  }
  if (callback === 'onConnect') {
    return STATE_CONNECTED;
  }
  if (callback === 'onDisconnect') {
    return STATE_DISCONNECTED;
  }
  return STATE_FAILED;
}

/** Oracle for the toast text produced by an action. */
export function expectedToastFor(action: string): string {
  if (action === 'connect-success') {
    return CONNECT_SUCCESS_TOAST;
  }
  if (action === 'connect-fail') {
    return CONNECT_FAIL_TOAST;
  }
  if (action === 'send-success') {
    return SEND_SUCCESS_TOAST;
  }
  if (action === 'send-fail') {
    return SEND_FAIL_TOAST;
  }
  if (action === 'disconnect-fail') {
    return DISCONNECT_FAIL_TOAST;
  }
  return DISCONNECT_SUCCESS_TOAST;
}

/** Snapshot of client state for consistency suites. */
export class ClientSnapshot {
  public state: string;
  public connectId: number;
  public hasProxy: boolean;
  public deathRegistered: boolean;
  public toastCount: number;

  constructor(client: ConnectionModel) {
    this.state = client.state;
    this.connectId = client.connectId;
    this.hasProxy = client.proxy !== undefined;
    this.deathRegistered = client.deathRecipient.registered;
    this.toastCount = client.toasts.length;
  }

  public sameAs(other: ClientSnapshot): boolean {
    return this.state === other.state && this.connectId === other.connectId &&
      this.hasProxy === other.hasProxy && this.deathRegistered === other.deathRegistered &&
      this.toastCount === other.toastCount;
  }

  public describe(): string {
    return this.state + '/' + String(this.connectId) + '/' + String(this.hasProxy) + '/' +
      String(this.deathRegistered) + '/' + String(this.toastCount);
  }
}

/** Aggregate metrics. */
export class ClientMetrics {
  public connects: number = 0;
  public sends: number = 0;
  public failures: number = 0;
  public replies: number = 0;

  public static from(client: ConnectionModel): ClientMetrics {
    const metrics = new ClientMetrics();
    metrics.connects = client.events.countOf('connect');
    // Dispatch metrics exclude calls blocked before reaching a proxy.
    metrics.sends = client.events.countOf('send-ok') + client.events.countOf('send-failed');
    metrics.failures = client.events.countOf('failed') + client.events.countOf('send-failed');
    metrics.replies = client.events.countOf('send-ok');
    return metrics;
  }

  public successRatio(): number {
    return this.sends === 0 ? 0 : this.replies / this.sends;
  }

  public fingerprint(): number {
    return textFingerprint(String(this.connects) + ':' + String(this.sends) + ':' +
      String(this.failures) + ':' + String(this.replies));
  }
}

