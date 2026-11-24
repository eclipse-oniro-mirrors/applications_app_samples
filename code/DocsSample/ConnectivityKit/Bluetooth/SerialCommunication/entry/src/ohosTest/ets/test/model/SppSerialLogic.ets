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

// Deterministic logic of pages/Index.ets (SPP server/client buttons) and common/ToastReport.ets.

// Mirrors the @State defaults of pages/Index.ets.
export const DEFAULT_UUID: string = '00001101-0000-1000-8000-00805f9b34fb';
export const DEFAULT_SERVER_NUMBER: number = 0;
export const DEFAULT_CLIENT_NUMBER: number = 1;
export const SERVER_NAME: string = 'server1';
// Mirrors socket.SppOptions { secure: true, type: 0 (SPP_RFCOMM) }.
export const SPP_SECURE: boolean = true;
export const SPP_RFCOMM: number = 0;
// Mirrors ToastReport.showResult(): duration 2000 ms and bottom 80 vp.
export const TOAST_DURATION: number = 2000;
export const TOAST_BOTTOM: number = 80;

// Mirrors socket.SppOptions built by the listen and connect buttons.
export interface SppOptionValue {
  uuid: string;
  secure: boolean;
  type: number;
}

// Mirrors the SppOptions of the sppListen button.
export function sppOptionOf(uuid: string): SppOptionValue {
  const option: SppOptionValue = { uuid: uuid, secure: SPP_SECURE, type: SPP_RFCOMM };
  return option;
}

// Mirrors the 8-4-4-4-12 hexadecimal layout of a Bluetooth UUID such as the default SPP uuid.
export function isUuidFormat(uuid: string): boolean {
  return /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/.test(uuid);
}

// Mirrors util.TextEncoder UTF-8 encoding of the text entered in dataValueInput.
export function utf8BytesOf(text: string): number[] {
  const bytes: number[] = [];
  for (let i: number = 0; i < text.length; i++) {
    let code: number = text.charCodeAt(i);
    if (code >= 0xd800 && code <= 0xdbff && i + 1 < text.length) {
      const low: number = text.charCodeAt(i + 1);
      code = 0x10000 + ((code - 0xd800) << 10) + (low - 0xdc00);
      i++;
    }
    if (code < 0x80) {
      bytes.push(code);
    } else if (code < 0x800) {
      bytes.push(0xc0 | (code >> 6), 0x80 | (code & 0x3f));
    } else if (code < 0x10000) {
      bytes.push(0xe0 | (code >> 12), 0x80 | ((code >> 6) & 0x3f), 0x80 | (code & 0x3f));
    } else {
      bytes.push(0xf0 | (code >> 18), 0x80 | ((code >> 12) & 0x3f), 0x80 | ((code >> 6) & 0x3f), 0x80 | (code & 0x3f));
    }
  }
  return bytes;
}

// Mirrors the sppWrite button: new Uint8Array(dataValue.length) filled by encodeIntoUint8Array, which only writes
// whole characters that still fit; the remaining bytes stay 0.
export function writeBytesOf(text: string): number[] {
  const capacity: number = text.length;
  const result: number[] = [];
  let i: number = 0;
  while (i < text.length) {
    const code: number = text.charCodeAt(i);
    const isPair: boolean = code >= 0xd800 && code <= 0xdbff && i + 1 < text.length;
    const unit: string = isPair ? text.substring(i, i + 2) : text.substring(i, i + 1);
    const bytes: number[] = utf8BytesOf(unit);
    if (result.length + bytes.length > capacity) {
      break;
    }
    for (const b of bytes) {
      result.push(b);
    }
    i += isPair ? 2 : 1;
  }
  while (result.length < capacity) {
    result.push(0);
  }
  return result;
}

// Mirrors the bytes encodeIntoUint8Array() actually writes into the dataValue.length sized buffer.
export function writtenByteCountOf(text: string): number {
  let written: number = 0;
  let i: number = 0;
  while (i < text.length) {
    const code: number = text.charCodeAt(i);
    const isPair: boolean = code >= 0xd800 && code <= 0xdbff && i + 1 < text.length;
    const size: number = utf8BytesOf(isPair ? text.substring(i, i + 2) : text.substring(i, i + 1)).length;
    if (written + size > text.length) {
      break;
    }
    written += size;
    i += isPair ? 2 : 1;
  }
  return written;
}

// Mirrors the UTF-8 bytes lost because the Uint8Array is sized by characters instead of bytes.
export function droppedBytesOf(text: string): number {
  return utf8BytesOf(text).length - writtenByteCountOf(text);
}

// Mirrors JSON.stringify(new Uint8Array(dataBuffer)) used in the sppRead toast: {"0":b0,"1":b1,...}.
export function uint8JsonOf(bytes: number[]): string {
  const parts: string[] = [];
  for (let i: number = 0; i < bytes.length; i++) {
    parts.push(`"${i}":${bytes[i] & 0xff}`);
  }
  return `{${parts.join(',')}}`;
}

// Mirrors the sppRead / offSppRead toast messages.
export function readMessageOf(bytes: number[], isOff: boolean): string {
  const prefix: string = isOff ? 'offSppRead' : 'sppRead';
  return `${prefix} success, data = ${uint8JsonOf(bytes)}`;
}

// Mirrors the error toasts of the socket callbacks ('sppListen error, code is ' + code, ...).
export function callbackErrorOf(operation: string, code: number): string {
  if (operation === 'sppConnect') {
    return `sppConnect error, code = ${code}`;
  }
  return `${operation} error, code is ${code}`;
}

// Mirrors the catch branch toast: 'errCode: ' + code + ', errMessage: ' + message.
export function exceptionMessageOf(code: number, message: string): string {
  return `errCode: ${code}, errMessage: ${message}`;
}

// Mirrors the success toasts of the listen / connect buttons.
export function successMessageOf(operation: string, socketId: number): string {
  if (operation === 'sppListen') {
    return `sppListen success, serverNumber = ${socketId}`;
  }
  if (operation === 'sppConnect') {
    return `sppConnect success, socketId = ${socketId}`;
  }
  if (operation === 'sppAccept') {
    return 'accept the client success';
  }
  return `${operation} success`;
}

// Mirrors the Index page: server, client and data buttons share serverNumber / clientNumber.
export class SppPageState {
  serverNumber: number = DEFAULT_SERVER_NUMBER;
  clientNumber: number = DEFAULT_CLIENT_NUMBER;
  deviceId: string = '';
  uuid: string = DEFAULT_UUID;
  dataValue: string = '';
  lastToast: string = '';
  written: number = 0;

  // Mirrors the TextInput.onChange() handlers.
  input(deviceId: string, uuid: string, dataValue: string): void {
    this.deviceId = deviceId;
    this.uuid = uuid;
    this.dataValue = dataValue;
  }

  // Mirrors the sppListen callback: a null code stores the server socket id.
  listen(code: number, serverSocketId: number): string {
    if (code !== 0) {
      this.lastToast = callbackErrorOf('sppListen', code);
      return this.lastToast;
    }
    this.serverNumber = serverSocketId;
    this.lastToast = successMessageOf('sppListen', serverSocketId);
    return this.lastToast;
  }

  // Mirrors the sppAccept callback: a null code stores the client socket id.
  accept(code: number, clientSocketId: number): string {
    if (code !== 0) {
      this.lastToast = callbackErrorOf('sppAccept', code);
      return this.lastToast;
    }
    this.clientNumber = clientSocketId;
    this.lastToast = successMessageOf('sppAccept', clientSocketId);
    return this.lastToast;
  }

  // Mirrors the sppConnect callback.
  connect(code: number, socketId: number): string {
    this.lastToast = code !== 0 ? callbackErrorOf('sppConnect', code) : successMessageOf('sppConnect', socketId);
    return this.lastToast;
  }

  // Mirrors the sppWrite button: returns the number of bytes handed to sppWrite().
  write(): number {
    const bytes: number[] = writeBytesOf(this.dataValue);
    this.written += bytes.length;
    this.lastToast = 'sppWrite success';
    return bytes.length;
  }

  // Mirrors the close buttons.
  close(isServer: boolean): string {
    this.lastToast = isServer ? 'sppCloseServerSocket success' : 'sppCloseClientSocket success';
    return this.lastToast;
  }
}
