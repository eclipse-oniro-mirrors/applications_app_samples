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
 * 收发载荷的编码工具：linkEnhance.sendData 与 proxyChannelManager.sendData 都只吃 ArrayBuffer，
 * 页面上输入的是字符串，因此这里手写一个 UTF-8 编解码（不依赖 util.TextEncoder，
 * 好处是能被本地单测逐字节断言，也顺便覆盖代理对）。
 */

/** 把字符串按 UTF-8 编码成 ArrayBuffer；孤立代理按 3 字节（U+FFFD 之外的原始值）编码，不做替换 */
export function encodeUtf8(text: string): ArrayBuffer {
  const bytes: number[] = [];
  for (let i = 0; i < text.length; i++) {
    let code: number = text.charCodeAt(i);
    if (code >= 0xD800 && code <= 0xDBFF && i + 1 < text.length) {
      const low: number = text.charCodeAt(i + 1);
      if (low >= 0xDC00 && low <= 0xDFFF) {
        code = 0x10000 + ((code - 0xD800) << 10) + (low - 0xDC00);
        i++;
      }
    }
    if (code < 0x80) {
      bytes.push(code);
    } else if (code < 0x800) {
      bytes.push(0xC0 | (code >> 6));
      bytes.push(0x80 | (code & 0x3F));
    } else if (code < 0x10000) {
      bytes.push(0xE0 | (code >> 12));
      bytes.push(0x80 | ((code >> 6) & 0x3F));
      bytes.push(0x80 | (code & 0x3F));
    } else {
      bytes.push(0xF0 | (code >> 18));
      bytes.push(0x80 | ((code >> 12) & 0x3F));
      bytes.push(0x80 | ((code >> 6) & 0x3F));
      bytes.push(0x80 | (code & 0x3F));
    }
  }
  const buffer = new ArrayBuffer(bytes.length);
  const view = new Uint8Array(buffer);
  for (let i = 0; i < bytes.length; i++) {
    view[i] = bytes[i];
  }
  return buffer;
}

/** 把 ArrayBuffer 按 UTF-8 解回字符串：遇到被截断的尾字节直接停，不抛异常 */
export function decodeUtf8(buffer: ArrayBuffer): string {
  const view = new Uint8Array(buffer);
  let text = '';
  let i = 0;
  while (i < view.length) {
    const first = view[i];
    let code = 0;
    let extra = 0;
    if (first < 0x80) {
      code = first;
    } else if (first >= 0xC0 && first < 0xE0) {
      code = first & 0x1F;
      extra = 1;
    } else if (first >= 0xE0 && first < 0xF0) {
      code = first & 0x0F;
      extra = 2;
    } else if (first >= 0xF0 && first < 0xF8) {
      code = first & 0x07;
      extra = 3;
    } else {
      i++;
      continue;
    }
    if (i + extra >= view.length) {
      break;
    }
    for (let j = 1; j <= extra; j++) {
      code = (code << 6) | (view[i + j] & 0x3F);
    }
    i += extra + 1;
    if (code > 0xFFFF) {
      const offset = code - 0x10000;
      text += String.fromCharCode(0xD800 + (offset >> 10));
      text += String.fromCharCode(0xDC00 + (offset & 0x3FF));
    } else {
      text += String.fromCharCode(code);
    }
  }
  return text;
}

/** 字节数（不等于字符串 length：一个汉字 3 字节，一个 emoji 4 字节） */
export function utf8Length(text: string): number {
  return encodeUtf8(text).byteLength;
}

/** 发送前的十六进制预览，超出 limit 的部分用 … 收尾 */
export function toHexPreview(buffer: ArrayBuffer, limit: number = 16): string {
  const view = new Uint8Array(buffer);
  const count = Math.min(view.length, limit);
  const parts: string[] = [];
  for (let i = 0; i < count; i++) {
    const value = view[i];
    parts.push(value < 16 ? `0${value.toString(16).toUpperCase()}` : value.toString(16).toUpperCase());
  }
  const tail = view.length > count ? ' …' : '';
  return `${parts.join(' ')}${tail}`;
}

/** 按 UTF-8 字节数裁剪：超过 maxBytes 就整字符丢弃，不做半个字符的截断 */
export function clampPayload(text: string, maxBytes: number): string {
  if (maxBytes <= 0) {
    return '';
  }
  let used = 0;
  let result = '';
  for (let i = 0; i < text.length; i++) {
    const char = text.charAt(i);
    const size = utf8Length(char);
    if (used + size > maxBytes) {
      break;
    }
    used += size;
    result += char;
  }
  return result;
}
