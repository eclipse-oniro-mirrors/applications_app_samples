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
 * SharedDriver for IPC_Stub ohosTest.
 *
 * Production anchors (entry/src/main/ets/ServiceExtAbility/ServiceExtAbility.ets):
 *   22-40   Stub extends rpc.RemoteObject, descriptor, onRemoteMessageRequest
 *   26-38   code 1 reads a string, writes 'hello rpc', returns true; other codes false
 *   43-65   ServiceAbility lifecycle onCreate / onRequest / onConnect /
 *           onDisconnect / onDestroy and onConnect returns new Stub('IPCStubTest')
 *
 * The suite cannot host a real ServiceExtensionAbility, so the observable
 * protocol and lifecycle are rebuilt as plain classes.
 */

export const STUB_DESCRIPTOR: string = 'IPCStubTest';
export const STUB_BUNDLE: string = 'com.example.ipc_stub';
export const STUB_ABILITY: string = 'ServiceAbility';
export const CLIENT_BUNDLE: string = 'com.example.ipc_client';

export const REQUEST_CODE: number = 1;
export const UNKNOWN_CODE_ZERO: number = 0;
export const UNKNOWN_CODE_TWO: number = 2;
export const UNKNOWN_CODE_NEGATIVE: number = -1;
export const UNKNOWN_CODE_LARGE: number = 99;

export const REQUEST_PAYLOAD: string = 'hello world';
export const REPLY_PAYLOAD: string = 'hello rpc';

export const EVENT_ON_CREATE: string = 'onCreate';
export const EVENT_ON_REQUEST: string = 'onRequest';
export const EVENT_ON_CONNECT: string = 'onConnect';
export const EVENT_ON_DISCONNECT: string = 'onDisconnect';
export const EVENT_ON_DESTROY: string = 'onDestroy';
export const EVENT_ON_REMOTE_DIED: string = 'onRemoteDied';

export const ERROR_NONE: number = 0;
export const ERROR_STUB_REJECTED: number = 16000011;
export const ERROR_STUB_NOT_ALIVE: number = 16000012;
export const ERROR_SEQUENCE_RECLAIMED: number = 16000013;

export const OPTION_FLAG_SYNC: number = 0;
export const OPTION_FLAG_ASYNC: number = 1;

export const LEVEL_INFO: string = 'INFO';
export const LEVEL_WARN: string = 'WARN';
export const LEVEL_ERROR: string = 'ERROR';

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

export function clampInt(value: number, low: number, high: number): number {
  if (value < low) {
    return low;
  }
  if (value > high) {
    return high;
  }
  return value;
}

export function isKnownRequestCode(code: number): boolean {
  return code === REQUEST_CODE;
}

/** MessageSequence stand-in. */
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

  public reclaim(): void {
    this.reclaimed = true;
    this.cursor = 0;
  }

  public trace(): string {
    return joined(this.values, '|') + '#' + String(this.cursor);
  }
}

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

  public describe(): string {
    return String(this.flags) + '/' + String(this.waitTime) + '/' + String(this.sync);
  }
}

export class RequestResultModel {
  public errCode: number;
  public replyText: string;
  public handled: boolean;

  constructor(errCode: number, replyText: string = '', handled: boolean = false) {
    this.errCode = errCode;
    this.replyText = replyText;
    this.handled = handled;
  }

  public isSuccess(): boolean {
    return this.errCode === ERROR_NONE && this.handled;
  }
}

/** One request recorded by the stub. */
export class StubRequestRecord {
  public code: number;
  public text: string;
  public replyText: string;
  public handled: boolean;
  public option: string;

  constructor(code: number, text: string, replyText: string, handled: boolean, option: string) {
    this.code = code;
    this.text = text;
    this.replyText = replyText;
    this.handled = handled;
    this.option = option;
  }

  public describe(): string {
    return String(this.code) + '/' + this.text + '/' + this.replyText + '/' + String(this.handled);
  }
}

/** Stub implementation of onRemoteMessageRequest. */
export class StubRemoteObjectModel {
  public descriptor: string;
  public requests: StubRequestRecord[] = [];
  public alive: boolean = true;
  public replyText: string;
  public rejectCodes: number[] = [];

  constructor(descriptor: string = STUB_DESCRIPTOR) {
    this.descriptor = descriptor;
    this.replyText = REPLY_PAYLOAD;
  }

  public onRemoteMessageRequest(code: number, data: MessageSequenceModel, reply: MessageSequenceModel,
    option: MessageOptionModel): boolean {
    if (!this.alive) {
      this.requests.push(new StubRequestRecord(code, '', '', false, option.describe()));
      return false;
    }
    if (this.rejectCodes.indexOf(code) >= 0) {
      this.requests.push(new StubRequestRecord(code, '', '', false, option.describe()));
      return false;
    }
    if (code === REQUEST_CODE) {
      const text = data.readString();
      const written = reply.writeString(this.replyText);
      const handled = written;
      this.requests.push(new StubRequestRecord(code, text, this.replyText, handled, option.describe()));
      return handled;
    }
    this.requests.push(new StubRequestRecord(code, '', '', false, option.describe()));
    return false;
  }

  public kill(): void {
    this.alive = false;
  }

  public revive(): void {
    this.alive = true;
  }

  public requestCount(): number {
    return this.requests.length;
  }

  public lastRequest(): StubRequestRecord | undefined {
    return this.requests.length === 0 ? undefined : this.requests[this.requests.length - 1];
  }

  public reset(): void {
    this.requests = [];
    this.alive = true;
    this.replyText = REPLY_PAYLOAD;
    this.rejectCodes = [];
  }
}

/** Oracle for the boolean returned by onRemoteMessageRequest. */
export function expectedHandled(code: number): boolean {
  return code === REQUEST_CODE;
}

/** Oracle for the reply text for a code. */
export function expectedReplyFor(code: number): string {
  return code === REQUEST_CODE ? REPLY_PAYLOAD : '';
}

/** Oracle for the descriptor returned by onConnect. */
export function expectedDescriptor(): string {
  return STUB_DESCRIPTOR;
}

/** A client double that drives the stub and records the request/reply pair. */
export class InProcessClient {
  public stub: StubRemoteObjectModel;
  public sentCodes: number[] = [];
  public sentTexts: string[] = [];
  public replies: string[] = [];
  public results: RequestResultModel[] = [];

  constructor(stub: StubRemoteObjectModel = new StubRemoteObjectModel()) {
    this.stub = stub;
  }

  public send(code: number, payload: string = REQUEST_PAYLOAD): RequestResultModel {
    const data = MessageSequenceModel.create();
    const reply = MessageSequenceModel.create();
    data.writeString(payload);
    this.sentCodes.push(code);
    this.sentTexts.push(payload);
    const handled = this.stub.onRemoteMessageRequest(code, data, reply, new MessageOptionModel());
    const text = reply.readString();
    const result = new RequestResultModel(handled ? ERROR_NONE : ERROR_STUB_REJECTED, text, handled);
    if (handled) {
      this.replies.push(text);
    }
    this.results.push(result);
    data.reclaim();
    reply.reclaim();
    return result;
  }

  public sendMany(count: number, code: number = REQUEST_CODE): number {
    let handled = 0;
    for (let index = 0; index < count; index++) {
      if (this.send(code, REQUEST_PAYLOAD).isSuccess()) {
        handled = handled + 1;
      }
    }
    return handled;
  }

  public trace(): string {
    return joined(this.replies, '|');
  }

  public reset(): void {
    this.stub.reset();
    this.sentCodes = [];
    this.sentTexts = [];
    this.replies = [];
    this.results = [];
  }
}

/** Bounded logger. */
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

/** Ordered lifecycle event recorder. */
export class ServiceEventRecorder {
  public entries: string[] = [];

  public record(kind: string, detail: string = ''): void {
    this.entries.push(detail.length > 0 ? kind + ':' + detail : kind);
  }

  public size(): number {
    return this.entries.length;
  }

  public countOf(kind: string): number {
    let total = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index] === kind || this.entries[index].startsWith(kind + ':')) {
        total = total + 1;
      }
    }
    return total;
  }

  public last(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  public trace(): string {
    return joined(this.entries, '>');
  }

  public fingerprint(): number {
    return textFingerprint(this.trace());
  }

  public clear(): void {
    this.entries = [];
  }
}

/** ServiceExtensionAbility lifecycle model. */
export class ServiceLifecycleModel {
  public state: string = 'idle';
  public events: ServiceEventRecorder = new ServiceEventRecorder();
  public logs: LogBuffer = new LogBuffer(128);
  public stub: StubRemoteObjectModel | undefined = undefined;
  public connectCount: number = 0;
  public disconnectCount: number = 0;
  public requestCount: number = 0;
  public destroyCount: number = 0;

  public onCreate(): void {
    this.state = 'created';
    this.events.record(EVENT_ON_CREATE);
    this.logs.info('onCreate');
  }

  public onRequest(startId: number = 1): void {
    this.requestCount = this.requestCount + 1;
    this.events.record(EVENT_ON_REQUEST, String(startId));
    this.logs.info('onRequest ' + String(startId));
  }

  public onConnect(): StubRemoteObjectModel {
    this.connectCount = this.connectCount + 1;
    this.state = 'connected';
    this.stub = new StubRemoteObjectModel(STUB_DESCRIPTOR);
    this.events.record(EVENT_ON_CONNECT, this.stub.descriptor);
    this.logs.info('onConnect');
    return this.stub;
  }

  public onDisconnect(): void {
    this.disconnectCount = this.disconnectCount + 1;
    this.state = 'disconnected';
    this.events.record(EVENT_ON_DISCONNECT);
    this.logs.info('onDisconnect');
  }

  public onDestroy(): void {
    this.destroyCount = this.destroyCount + 1;
    this.state = 'destroyed';
    this.events.record(EVENT_ON_DESTROY);
    this.logs.info('onDestroy');
  }

  public isAlive(): boolean {
    return this.state !== 'destroyed';
  }

  public reset(): void {
    this.state = 'idle';
    this.events.clear();
    this.logs.clear();
    this.stub = undefined;
    this.connectCount = 0;
    this.disconnectCount = 0;
    this.requestCount = 0;
    this.destroyCount = 0;
  }
}

/** Snapshot of the service lifecycle. */
export class ServiceSnapshot {
  public state: string;
  public connects: number;
  public disconnects: number;
  public requests: number;
  public destroys: number;

  constructor(service: ServiceLifecycleModel) {
    this.state = service.state;
    this.connects = service.connectCount;
    this.disconnects = service.disconnectCount;
    this.requests = service.requestCount;
    this.destroys = service.destroyCount;
  }

  public sameAs(other: ServiceSnapshot): boolean {
    return this.state === other.state && this.connects === other.connects &&
      this.disconnects === other.disconnects && this.requests === other.requests &&
      this.destroys === other.destroys;
  }

  public describe(): string {
    return this.state + '/' + String(this.connects) + '/' + String(this.disconnects) + '/' +
      String(this.requests) + '/' + String(this.destroys);
  }
}

/** Aggregate metrics. */
export class StubMetrics {
  public requests: number = 0;
  public handled: number = 0;
  public rejected: number = 0;
  public replies: number = 0;

  public static from(stub: StubRemoteObjectModel): StubMetrics {
    const metrics = new StubMetrics();
    metrics.requests = stub.requests.length;
    for (let index = 0; index < stub.requests.length; index++) {
      const record = stub.requests[index];
      if (record.handled) {
        metrics.handled = metrics.handled + 1;
        if (record.replyText.length > 0) {
          metrics.replies = metrics.replies + 1;
        }
      } else {
        metrics.rejected = metrics.rejected + 1;
      }
    }
    return metrics;
  }

  public successRatio(): number {
    return this.requests === 0 ? 0 : this.handled / this.requests;
  }

  public fingerprint(): number {
    return textFingerprint(String(this.requests) + ':' + String(this.handled) + ':' +
      String(this.rejected) + ':' + String(this.replies));
  }
}

/** Builds a request ledger with one entry per supplied code. */
export function replayCodes(stub: StubRemoteObjectModel, codes: number[]): InProcessClient {
  const client = new InProcessClient(stub);
  for (let index = 0; index < codes.length; index++) {
    client.send(codes[index], REQUEST_PAYLOAD);
  }
  return client;
}

