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
import { FastBufferUtil } from './FastBufferUtil';

/** 协议魔数 "OHOS"（与场景6 数据包一致） */
const MAGIC: number = 0x4F484F53;
/** 记录固定头长度：魔数 4B + tag 1B + length 4B */
const HEADER_SIZE: number = 9;
/** 记录尾部长度：CRC32 4B */
const CRC_SIZE: number = 4;

/** 单条 TLV 记录解析结果 */
export class TlvRecord {
  public tag: number = 0;
  public length: number = 0;
  public value: fastbuffer.FastBuffer = fastbuffer.alloc(0);
  public crcOk: boolean = false;
}

/** 整条字节流的解析汇总结果 */
export class TlvParseResult {
  /** 结构完整（所有记录完整解析到流末尾）；坏 CRC 不影响 ok */
  public ok: boolean = false;
  public records: TlvRecord[] = [];
  /** 因噪声跳过的字节数 */
  public noiseBytes: number = 0;
  /** 截断记录的起始偏移（ok=true 时为 -1） */
  public errorIndex: number = -1;
  public errorMessage: string = '';
}

export class TlvUtil {
  /**
   * 构造多记录 TLV 字节流。
   * @param recordCount 记录条数（tag 依次为 1..recordCount）
   * @param valueSize 每条 value 的字节数（内容为 'V' 填充）
   * @param injectNoise 是否在流首与记录之间插入噪声字节（保证噪声不含魔数）
   */
  static buildTlvStream(recordCount: number, valueSize: number, injectNoise: boolean): fastbuffer.FastBuffer {
    const parts: fastbuffer.FastBuffer[] = [];
    if (injectNoise) {
      parts.push(TlvUtil.noiseChunk(3));
    }
    for (let i = 1; i <= recordCount; i++) {
      // 前缀长度会随记录序号增长（R1- → R10-），按实际前缀长度补齐，保证 value 恰为 valueSize 字节
      const prefix: string = `R${i}-`;
      const valueText: string = prefix.length <= valueSize ?
        prefix + 'V'.repeat(valueSize - prefix.length) : 'V'.repeat(Math.max(0, valueSize));
      const value: fastbuffer.FastBuffer = FastBufferUtil.utf8Encode(valueText);
      const record: fastbuffer.FastBuffer = fastbuffer.alloc(HEADER_SIZE + value.length + CRC_SIZE);
      record.writeUInt32BE(MAGIC, 0);
      record.writeUInt8(i, 4);
      FastBufferUtil.writeUint32(record, value.length, 5, false);
      value.copy(record, HEADER_SIZE);
      FastBufferUtil.writeUint32(record, FastBufferUtil.crc32(value), HEADER_SIZE + value.length, false);
      parts.push(record);
      if (injectNoise && i < recordCount) {
        parts.push(TlvUtil.noiseChunk(4));
      }
    }
    return FastBufferUtil.concatAll(parts);
  }

  /** 构造 n 字节噪声（0xA5/0x5A 交替，不含魔数序列；按字节写入避免字符串编码膨胀） */
  private static noiseChunk(n: number): fastbuffer.FastBuffer {
    const chunk: fastbuffer.FastBuffer = fastbuffer.alloc(n);
    for (let i = 0; i < n; i++) {
      chunk.writeUInt8(i % 2 === 0 ? 0xA5 : 0x5A, i);
    }
    return chunk;
  }

  /** 构造被篡改 CRC 的流：第 2 条记录（index 1）的 CRC 末字节翻转 */
  static makeBadCrcStream(recordCount: number, valueSize: number): fastbuffer.FastBuffer {
    const clean: fastbuffer.FastBuffer = TlvUtil.buildTlvStream(recordCount, valueSize, false);
    // 定位第 2 条记录：第 1 条记录总长 = HEADER_SIZE + valueSize + CRC_SIZE，其后紧跟第 2 条魔数
    const recordSize: number = HEADER_SIZE + valueSize + CRC_SIZE;
    const crcLastOffset: number = recordSize + HEADER_SIZE + valueSize + CRC_SIZE - 1;
    clean.writeUInt8(clean.readUInt8(crcLastOffset) ^ 0xFF, crcLastOffset);
    return clean;
  }

  /**
   * 解析 TLV 字节流：跳过噪声定位魔数，逐记录解析。
   * 坏 CRC 记录标记 crcOk=false 并继续；记录不完整则终止并返回 ok=false。
   */
  static parseTlvStream(data: fastbuffer.FastBuffer): TlvParseResult {
    const result: TlvParseResult = new TlvParseResult();
    const magicBuf: fastbuffer.FastBuffer = fastbuffer.alloc(4);
    magicBuf.writeUInt32BE(MAGIC, 0);
    let offset: number = 0;
    while (offset < data.length) {
      // 从当前偏移向后定位魔数；找不到则剩余全部视为噪声
      const found: number = data.indexOf(magicBuf, offset);
      if (found < 0) {
        result.noiseBytes += data.length - offset;
        break;
      }
      result.noiseBytes += found - offset;
      offset = found;
      // 记录头/体不完整 → 截断
      if (data.length - offset < HEADER_SIZE) {
        result.ok = false;
        result.errorIndex = offset;
        result.errorMessage =
          `Record header truncated: only ${data.length - offset}B left at offset ${offset}, less than ${HEADER_SIZE}B`;
        return result;
      }
      const tag: number = data.readUInt8(offset + 4);
      const length: number = FastBufferUtil.readUint32(data, offset + 5, false);
      const recordSize: number = HEADER_SIZE + length + CRC_SIZE;
      if (data.length - offset < recordSize) {
        result.ok = false;
        result.errorIndex = offset;
        result.errorMessage =
          `Record body truncated: tag=${tag} declares ${length}B, only ${data.length - offset - HEADER_SIZE}B left at offset ${offset}`;
        return result;
      }
      const value: fastbuffer.FastBuffer = data.subarray(offset + HEADER_SIZE, offset + HEADER_SIZE + length);
      const crcStored: number = FastBufferUtil.readUint32(data, offset + HEADER_SIZE + length, false);
      const record: TlvRecord = new TlvRecord();
      record.tag = tag;
      record.length = length;
      record.value = value;
      record.crcOk = FastBufferUtil.crc32(value) === crcStored;
      result.records.push(record);
      offset += recordSize;
    }
    result.ok = true;
    return result;
  }
}
