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
 
import fastbuffer from '@ohos.fastbuffer';
import { LogUtil } from './LogUtil';

const HEX_CHARS = '0123456789abcdef';
/** hexDump 每行默认字节数 */
const DUMP_BYTES_PER_LINE = 16;

export class FastBufferUtil {
  private static crcTable: number[] | null = null;

  /** utf8 字符串 → FastBuffer */
  static utf8Encode(text: string): fastbuffer.FastBuffer {
    return fastbuffer.from(text, 'utf8');
  }

  /** FastBuffer → utf8 字符串 */
  static utf8Decode(fb: fastbuffer.FastBuffer): string {
    return fb.toString('utf8');
  }

  /** subarray 视图 → utf8 字符串。本 ROM 视图的 toString/from/byteOffset 均不识别偏移
   *  （byteOffset 恒为 0，解码会落到底层缓冲开头），只有 readUInt8/copy 按偏移读取，
   *  故用 readUInt8/writeUInt8 逐字节拷出独立缓冲再解码 */
  static utf8ViewDecode(view: fastbuffer.FastBuffer): string {
    const copy: fastbuffer.FastBuffer = fastbuffer.alloc(view.length);
    for (let i = 0; i < view.length; i++) {
      copy.writeUInt8(view.readUInt8(i), i);
    }
    return copy.toString('utf8');
  }

  /** FastBuffer → 连续小写 hex 字符串 */
  static toHex(fb: fastbuffer.FastBuffer): string {
    return fb.toString('hex');
  }

  /** hex 字符串 → FastBuffer；非法输入（奇数长度/非 hex 字符）抛 Error */
  static fromHex(hex: string): fastbuffer.FastBuffer {
    if (hex.length % 2 !== 0) {
      LogUtil.error('FastBufferUtil', `fromHex：长度 ${hex.length} 不是偶数`);
      throw new Error('hex length must be even');
    }
    const lower = hex.toLowerCase();
    for (let i = 0; i < lower.length; i++) {
      if (HEX_CHARS.indexOf(lower.charAt(i)) < 0) {
        LogUtil.error('FastBufferUtil', `fromHex：第 ${i} 位字符非法：${lower.charAt(i)}`);
        throw new Error(`invalid hex char at ${i}`);
      }
    }
    return fastbuffer.from(hex, 'hex');
  }

  /** FastBuffer → base64 字符串 */
  static toBase64(fb: fastbuffer.FastBuffer): string {
    return fb.toString('base64');
  }

  /** base64 字符串 → FastBuffer */
  static fromBase64(text: string): fastbuffer.FastBuffer {
    return fastbuffer.from(text, 'base64');
  }

  /** 按指定字节序写入 uint32（true=小端，false=大端） */
  static writeUint32(fb: fastbuffer.FastBuffer, value: number, offset: number, littleEndian: boolean): void {
    if (littleEndian) {
      fb.writeUInt32LE(value, offset);
    } else {
      fb.writeUInt32BE(value, offset);
    }
  }

  /** 按指定字节序读取 uint32（true=小端，false=大端） */
  static readUint32(fb: fastbuffer.FastBuffer, offset: number, littleEndian: boolean): number {
    return littleEndian ? fb.readUInt32LE(offset) : fb.readUInt32BE(offset);
  }

  /** 批量拼接：依次复制到新 FastBuffer */
  static concatAll(list: fastbuffer.FastBuffer[]): fastbuffer.FastBuffer {
    return fastbuffer.concat(list);
  }

  /**
   * hexDump 可视化：每行 = 8 位地址 + 两组十六进制 + ASCII 列。
   * 不可打印字节显示为 '.'，格式对齐经典 hexdump 工具。
   */
  static hexDump(fb: fastbuffer.FastBuffer, bytesPerLine: number = DUMP_BYTES_PER_LINE): string {
    if (fb.length === 0) {
      return 'Empty buffer';
    }
    // bytesPerLine <= 0 会导致 off 不递增而死循环，统一回退到默认值
    const width: number = bytesPerLine > 0 ? bytesPerLine : DUMP_BYTES_PER_LINE;
    const half: number = Math.floor(width / 2);
    const lines: string[] = [];
    for (let off = 0; off < fb.length; off += width) {
      const end: number = Math.min(off + width, fb.length);
      let hexPart: string = '';
      let asciiPart: string = '';
      for (let i = off; i < off + width; i++) {
        if (i < end) {
          const b: number = fb.readUInt8(i);
          hexPart += b.toString(16).padStart(2, '0') + ' ';
          asciiPart += (b >= 0x20 && b <= 0x7e) ? String.fromCharCode(b) : '.';
        } else {
          hexPart += '   ';
        }
        if (i - off === half - 1) {
          hexPart += ' ';
        }
      }
      lines.push(`${off.toString(16).padStart(8, '0')}  ${hexPart} |${asciiPart}|`);
    }
    return lines.join('\n');
  }

  /**
   * CRC32 校验（IEEE 802.3，多项式 0xEDB88320，查表法）。
   * 标准校验值：crc32("123456789") = 0xCBF43926。
   */
  static crc32(fb: fastbuffer.FastBuffer): number {
    if (FastBufferUtil.crcTable === null) {
      FastBufferUtil.crcTable = FastBufferUtil.buildCrcTable();
    }
    const table: number[] = FastBufferUtil.crcTable;
    let crc: number = 0xFFFFFFFF;
    for (let i = 0; i < fb.length; i++) {
      crc = (crc >>> 8) ^ table[(crc ^ fb.readUInt8(i)) & 0xFF];
    }
    return (crc ^ 0xFFFFFFFF) >>> 0;
  }

  /** crc32 十六进制字符串（8 位大写，便于日志展示） */
  static crc32Hex(fb: fastbuffer.FastBuffer): string {
    return FastBufferUtil.crc32(fb).toString(16).toUpperCase().padStart(8, '0');
  }

  private static buildCrcTable(): number[] {
    const table: number[] = [];
    for (let n = 0; n < 256; n++) {
      let c: number = n;
      for (let k = 0; k < 8; k++) {
        if ((c & 1) !== 0) {
          c = (0xEDB88320 ^ (c >>> 1));
        } else {
          c = c >>> 1;
        }
      }
      table.push(c >>> 0);
    }
    return table;
  }
}
