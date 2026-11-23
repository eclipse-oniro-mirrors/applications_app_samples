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
 *
 * Test-side harness replicating the UDP message dispatch state machine used by
 * pages/Index.ets bindOption(): the received text is compared against the
 * control words 'online' / 'offline' / 'exit'; everything else is treated as a
 * chat payload. The main source keeps the logic inline and is not modified.
 */

import util from '@ohos.util';

export enum SocketCommandKind {
  ONLINE = 0,
  OFFLINE = 1,
  EXIT = 2,
  CHAT = 3,
  UNKNOWN = 4
}

export interface ParsedCommand {
  kind: SocketCommandKind;
  payload: string;
  rawLength: number;
}

export function classifyCommand(text: string): SocketCommandKind {
  if (text === 'online') {
    return SocketCommandKind.ONLINE;
  }
  if (text === 'offline') {
    return SocketCommandKind.OFFLINE;
  }
  if (text === 'exit') {
    return SocketCommandKind.EXIT;
  }
  if (text.length === 0) {
    return SocketCommandKind.UNKNOWN;
  }
  return SocketCommandKind.CHAT;
}

export function parseCommandFrame(bytes: Uint8Array): ParsedCommand {
  const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
  const text: string = decoder.decodeWithStream(bytes);
  const kind: SocketCommandKind = classifyCommand(text);
  const frame: ParsedCommand = { kind: kind, payload: text, rawLength: bytes.byteLength };
  return frame;
}

export function encodeCommandFrame(text: string): Uint8Array {
  const encoder: util.TextEncoder = new util.TextEncoder();
  return encoder.encodeInto(text);
}
