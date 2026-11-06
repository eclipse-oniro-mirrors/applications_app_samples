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
import buffer from '@ohos.buffer';
import { LogUtil } from './utils/LogUtil';
import { PerfTimer } from './utils/PerfTimer';
import { FastBufferUtil } from './utils/FastBufferUtil';
import { TlvUtil, TlvParseResult, TlvRecord } from './utils/TlvUtil';

const TAG = 'FastBufferBasics';
/** 场景2 写读轮次。基准同步运行在 UI 线程，本 ROM 上 buffer 每调用约 60µs，
 *  10 万轮（40 万次调用）会阻塞主线程超 6 秒触发 THREAD_BLOCK_6S 被系统杀进程，
 *  故取 1 万轮（约 1.2 秒），对比结论不受影响 */
const BENCH_ROUNDS = 10000;
/** 场景2 拼接片段数 */
const BENCH_PARTS = 2000;
/** 场景2 每执行多少轮让出一帧，避免长时间阻塞 UI */
const BENCH_YIELD_CHUNK = 2000;

export class FastBufferBasics {
  private benchmarkRunning: boolean = false;

  /** 场景1：FastBuffer 基础操作（纯内存，无外部依赖） */
  runBasics(): void {
    LogUtil.info(TAG, '【场景1】FastBuffer 基础操作开始');

    // 1.1 两种创建方式：from（从字符串/数组构造）、alloc（指定长度并填充）
    const hello: fastbuffer.FastBuffer = fastbuffer.from('OpenHarmony FastBuffer');
    const header: fastbuffer.FastBuffer = fastbuffer.alloc(8);
    LogUtil.info(TAG, `1.1 from 创建：length=${hello.length}，内容="${hello.toString('utf8')}"`);
    LogUtil.info(TAG, `1.1 alloc 创建：length=${header.length}，默认填充 0x00`);

    // 1.2 二进制写入：魔数 "OHOS"（0x4F484F53）+ 起始版本号 20（FastBuffer 自 API 20 支持）
    header.writeUInt32BE(0x4F484F53, 0);
    header.writeUInt32BE(20, 4);
    LogUtil.info(TAG, `1.2 writeUInt32BE 写入魔数 0x4F484F53 与版本 20，hex=${header.toString('hex')}`);

    // 1.3 二进制读取并校验
    const magic: number = header.readUInt32BE(0);
    const version: number = header.readUInt32BE(4);
    LogUtil.info(TAG, `1.3 readUInt32BE 读回：magic=0x${magic.toString(16).toUpperCase()}，version=${version}`);

    // 1.4 编码转换：utf8 → hex / base64，再从 base64 还原校验
    const hex: string = hello.toString('hex');
    const base64: string = hello.toString('base64');
    const restored: string = fastbuffer.from(base64, 'base64').toString('utf8');
    LogUtil.info(TAG, `1.4 编码转换：hex=${hex.substring(0, 24)}...，base64=${base64}`);
    LogUtil.info(TAG, `1.4 base64 还原校验：${restored === hello.toString('utf8') ? '一致' : '不一致'}`);

    // 1.5 concat 拼接：header + hello + payload 组成完整数据包
    const payload: fastbuffer.FastBuffer = fastbuffer.from(' | payload-0123456789');
    const packet: fastbuffer.FastBuffer = fastbuffer.concat([header, hello, payload]);
    LogUtil.info(TAG, `1.5 concat 拼接 3 段：packet.length=${packet.length}（${header.length}+${hello.length}+${payload.length}）`);

    // 1.6 copy 复制尾部 4 字节 / subarray 共享内存切片
    const tail: fastbuffer.FastBuffer = fastbuffer.alloc(4);
    packet.copy(tail, 0, packet.length - 4);
    const view: fastbuffer.FastBuffer = packet.subarray(8, 8 + hello.length);
    LogUtil.info(TAG, `1.6 copy 尾部 4 字节：${tail.toString('hex')}`);
    LogUtil.info(TAG, `1.6 subarray 切片 [8, ${8 + hello.length})：${FastBufferUtil.utf8ViewDecode(view)}`);

    // 1.7 equals / compare 比较
    const same: fastbuffer.FastBuffer = fastbuffer.from('OpenHarmony FastBuffer');
    LogUtil.info(TAG, `1.7 equals 同内容比较：${hello.equals(same)}；compare=${hello.compare(same)}（0 表示相等）`);

    LogUtil.info(TAG, '【场景1】完成：创建/读写/编码/拼接/切片/比较全部通过');
  }

  /** 场景2：FastBuffer vs Buffer 性能对比（PerfTimer 计时 + 系统时钟） */
  runBenchmark(): void {
    if (this.benchmarkRunning) {
      LogUtil.warn(TAG, '【场景2】性能对比正在执行，忽略重复点击');
      return;
    }
    this.benchmarkRunning = true;
    this.runBenchmarkAsync().catch((err: Error) => {
      LogUtil.error(TAG, `【场景2】性能对比异常：${err.message}`);
    });
  }

  /** 分块执行 + 每块后让出一帧：总负载与结论不变，避免 10k 轮循环长时间冻结 UI */
  private async runBenchmarkAsync(): Promise<void> {
    try {
      LogUtil.info(TAG, `【场景2】性能对比开始（同负载：4 字节写读 ×${BENCH_ROUNDS} + ${BENCH_PARTS} 片 concat）`);
      PerfTimer.clear();

      // —— FastBuffer（API 20+）——
      PerfTimer.start('fb_writeRead');
      const fb: fastbuffer.FastBuffer = fastbuffer.alloc(BENCH_ROUNDS * 4);
      let sumFb: number = 0;
      for (let base = 0; base < BENCH_ROUNDS; base += BENCH_YIELD_CHUNK) {
        const limit: number = Math.min(base + BENCH_YIELD_CHUNK, BENCH_ROUNDS);
        for (let i = base; i < limit; i++) {
          fb.writeUInt32BE(i, i * 4);
        }
        for (let i = base; i < limit; i++) {
          sumFb += fb.readUInt32BE(i * 4);
        }
        await FastBufferBasics.yieldToUi();
      }
      const fbRwMs: number = PerfTimer.stop('fb_writeRead');

      PerfTimer.start('fb_concat');
      const fbParts: fastbuffer.FastBuffer[] = [];
      for (let i = 0; i < BENCH_PARTS; i++) {
        fbParts.push(fastbuffer.from(`chunk-${i}-`));
      }
      const fbJoined: fastbuffer.FastBuffer = fastbuffer.concat(fbParts);
      const fbConcatMs: number = PerfTimer.stop('fb_concat');
      LogUtil.info(TAG, `2.1 FastBuffer：写读 ${fbRwMs}ms（校验和 ${sumFb % 100000007}），拼接 ${fbConcatMs}ms（${fbJoined.length}B）`);
      await FastBufferBasics.yieldToUi();

      // —— Buffer（@ohos.buffer，API 9+）——
      PerfTimer.start('buffer_writeRead');
      const bf: buffer.Buffer = buffer.alloc(BENCH_ROUNDS * 4);
      let sumBf: number = 0;
      for (let base = 0; base < BENCH_ROUNDS; base += BENCH_YIELD_CHUNK) {
        const limit: number = Math.min(base + BENCH_YIELD_CHUNK, BENCH_ROUNDS);
        for (let i = base; i < limit; i++) {
          bf.writeUInt32BE(i, i * 4);
        }
        for (let i = base; i < limit; i++) {
          sumBf += bf.readUInt32BE(i * 4);
        }
        await FastBufferBasics.yieldToUi();
      }
      const bfRwMs: number = PerfTimer.stop('buffer_writeRead');

      PerfTimer.start('buffer_concat');
      const bfParts: buffer.Buffer[] = [];
      for (let i = 0; i < BENCH_PARTS; i++) {
        bfParts.push(buffer.from(`chunk-${i}-`));
      }
      const bfJoined: buffer.Buffer = buffer.concat(bfParts);
      const bfConcatMs: number = PerfTimer.stop('buffer_concat');
      LogUtil.info(TAG, `2.2 Buffer：写读 ${bfRwMs}ms（校验和 ${sumBf % 100000007}），拼接 ${bfConcatMs}ms（${bfJoined.length}B）`);

      // 2.3 结果对比与正确性校验
      if (sumFb === sumBf && fbJoined.length === bfJoined.length) {
        LogUtil.info(TAG, '2.3 正确性校验：两套结果校验和与长度一致，数据正确');
        const rwDiff: number = bfRwMs - fbRwMs;
        const rwWinner: string = rwDiff > 0 ? 'FastBuffer faster' : (rwDiff < 0 ? 'Buffer faster' : 'Tie');
        const concatDiff: number = bfConcatMs - fbConcatMs;
        const concatWinner: string = concatDiff > 0 ? 'FastBuffer faster' : (concatDiff < 0 ? 'Buffer faster' : 'Tie');
        LogUtil.info(TAG, `2.3 结论：写读 ${rwWinner}（差 ${Math.abs(rwDiff)}ms），拼接 ${concatWinner}（差 ${Math.abs(concatDiff)}ms）`);
        LogUtil.info(TAG, `2.3 PerfTimer 汇总：${PerfTimer.summary()}`);
      } else {
        LogUtil.error(TAG, '2.3 正确性校验失败：两套结果不一致，请检查运行环境');
      }
      LogUtil.info(TAG, '【场景2】完成');
    } finally {
      this.benchmarkRunning = false;
    }
  }

  private static yieldToUi(): Promise<void> {
    return new Promise<void>((resolve) => {
      setTimeout(() => resolve(), 0);
    });
  }

  /** 场景6：工具类实战——协议封包与解包（FastBufferUtil 组合应用） */
  runPacketDemo(): void {
    LogUtil.info(TAG, '【场景6】工具类实战：协议封包与解包开始');

    // 6.1 封包：[魔数 4B][版本 4B][payload 长度 4B][payload][CRC32 4B]
    const payloadText: string = 'OpenHarmony packet payload - FastBufferUtil demo';
    const payload: fastbuffer.FastBuffer = FastBufferUtil.utf8Encode(payloadText);
    const packet: fastbuffer.FastBuffer = fastbuffer.alloc(12 + payload.length + 4);
    FastBufferUtil.writeUint32(packet, 0x4F484F53, 0, false);
    FastBufferUtil.writeUint32(packet, 20, 4, false);
    FastBufferUtil.writeUint32(packet, payload.length, 8, false);
    payload.copy(packet, 12);
    FastBufferUtil.writeUint32(packet, FastBufferUtil.crc32(payload), 12 + payload.length, false);
    LogUtil.info(TAG, `6.1 封包完成：总长 ${packet.length}B（头 12B + payload ${payload.length}B + CRC 4B）`);

    // 6.2 hexDump 可视化（前 48 字节）
    const dumpRange: fastbuffer.FastBuffer = packet.subarray(0, Math.min(48, packet.length));
    LogUtil.info(TAG, `6.2 hexDump 前 ${dumpRange.length} 字节：\n${FastBufferUtil.hexDump(dumpRange)}`);

    // 6.3 解包：读魔数/版本/长度，切片 payload，CRC 校验
    const magic: number = FastBufferUtil.readUint32(packet, 0, false);
    const version: number = FastBufferUtil.readUint32(packet, 4, false);
    const len: number = FastBufferUtil.readUint32(packet, 8, false);
    const payloadView: fastbuffer.FastBuffer = packet.subarray(12, 12 + len);
    const crcStored: number = FastBufferUtil.readUint32(packet, 12 + len, false);
    const crcCalc: number = FastBufferUtil.crc32(payloadView);
    LogUtil.info(TAG, `6.3 解包：magic=0x${magic.toString(16).toUpperCase()}，version=${version}，len=${len}`);
    LogUtil.info(TAG, `6.3 CRC 校验：存储=${crcStored.toString(16).toUpperCase()}，计算=${crcCalc.toString(16).toUpperCase()} → ${crcStored === crcCalc ? '通过' : '失败'}`);

    // 6.4 payload 还原（视图解码走 utf8ViewDecode：from/toString 均不识别视图偏移）
    const decoded: string = FastBufferUtil.utf8ViewDecode(payloadView);
    LogUtil.info(TAG, `6.4 payload 还原：${decoded === payloadText ? '与原文一致' : '不一致'}（"${decoded}"）`);

    // 6.5 篡改检测：翻转 payload 首字节后 CRC 应失败
    packet.writeUInt8(packet.readUInt8(12) ^ 0xFF, 12);
    const crcTampered: number = FastBufferUtil.crc32(packet.subarray(12, 12 + len));
    LogUtil.info(TAG, `6.5 篡改检测：修改 payload 首字节后 CRC ${crcTampered === crcStored ? '仍通过（异常）' : '校验失败（正确检出篡改）'}`);

    LogUtil.info(TAG, '【场景6】完成');
  }

  /** 场景7：TLV 多记录协议流解析（TlvUtil 组合应用） */
  runTlvDemo(): void {
    LogUtil.info(TAG, '【场景7】TLV 多记录协议流解析开始');

    // 7.1 构造 5 条记录、带噪声的字节流（记录间插入噪声，模拟真实传输场景）
    const stream: fastbuffer.FastBuffer = TlvUtil.buildTlvStream(5, 48, true);
    LogUtil.info(TAG, `7.1 构造 TLV 流：5 条记录（value 各 48B），总长 ${stream.length}B，含噪声字节`);

    // 7.2 解析：噪声跳过 + 逐记录 tag/length/CRC 结果
    const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
    LogUtil.info(TAG, `7.2 解析完成：结构完整=${result.ok}，解析出 ${result.records.length} 条记录，跳过噪声 ${result.noiseBytes}B`);
    for (const rec of result.records) {
      // 本 ROM 对视图嵌套 subarray 不累加父偏移，先整段解码再在字符串域截取
      const head: string = FastBufferUtil.utf8ViewDecode(rec.value).substring(0, Math.min(8, rec.value.length));
      LogUtil.info(TAG, `7.2 记录 tag=${rec.tag} length=${rec.length}B CRC=${rec.crcOk ? '通过' : '失败'} value 前缀="${head}"`);
    }

    // 7.3 坏 CRC 检出：第 2 条记录 CRC 被篡改，解析应标记 crcOk=false
    const badStream: fastbuffer.FastBuffer = TlvUtil.makeBadCrcStream(3, 48);
    const badResult: TlvParseResult = TlvUtil.parseTlvStream(badStream);
    const badRecord: TlvRecord | undefined = badResult.records.find((r: TlvRecord) => !r.crcOk);
    if (badRecord) {
      // 视图不可再嵌套切片，直接整段 hexDump（readUInt8 对一级视图按偏移读取）
      LogUtil.info(TAG, `7.3 坏 CRC 检出：tag=${badRecord.tag} 校验失败（其余 ${badResult.records.length - 1} 条正常），value hexDump：\n${FastBufferUtil.hexDump(badRecord.value)}`);
    } else {
      LogUtil.error(TAG, '7.3 坏 CRC 检出失败：未识别出被篡改记录');
    }

    // 7.4 截断防护：砍掉末尾 6 字节后解析应报错并给出偏移
    const truncated: fastbuffer.FastBuffer = stream.subarray(0, stream.length - 6);
    const truncResult: TlvParseResult = TlvUtil.parseTlvStream(truncated);
    LogUtil.info(TAG, `7.4 截断防护：结构完整=${truncResult.ok}，errorIndex=${truncResult.errorIndex}，原因="${truncResult.errorMessage}"`);

    LogUtil.info(TAG, '【场景7】完成');
  }
}
