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
 
import stream from '@ohos.util.stream';
import fastbuffer from '@ohos.fastbuffer';
import { emitter } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { LogUtil } from './LogUtil';
import { eventDataToText, eventDataToError } from './EventDataUtil';

type StreamCallback = (err?: Error | null) => void;

/** 分块大小（4KB） */
const CHUNK_SIZE: number = 4096;

/** 读取进度信息 */
export interface ReadProgress {
  chunkIndex: number;
  chunkBytes: number;
  totalBytes: number;
  fileSize: number;
}

/** 文件写入流：框架在缓冲区数据被消耗时自动回调 doWrite */
export class FileWritable extends stream.Writable {
  private fd: number;
  private written: number = 0;
  private notify: (n: number, total: number) => void;

  constructor(fd: number, notify: (n: number, total: number) => void) {
    super();
    this.fd = fd;
    this.notify = notify;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: StreamCallback): void {
    try {
      let n: number = 0;
      if (typeof chunk === 'string') {
        n = fs.writeSync(this.fd, chunk);
      } else {
        // Uint8Array → 拷贝为独立 ArrayBuffer 后落盘（避免底层缓冲被复用覆盖）
        const ab: ArrayBuffer = chunk.buffer.slice(chunk.byteOffset, chunk.byteOffset + chunk.byteLength);
        n = fs.writeSync(this.fd, ab);
      }
      this.written += n;
      this.notify(n, this.written);
      // 本 ROM 要求 doWrite 同步回调：延迟回调会让框架提前判 finish/丢弃排队块（实测 3 块只落盘 2 块）
      callback();
    } catch (err) {
      // 写入失败必须把错误回传给框架，否则流会永久等待回调而挂起
      callback(err instanceof Error ? err : new Error('写入文件失败'));
    }
  }
}

/** 文件读取流：框架在需要数据时回调 doRead，实现内用 push 送入缓冲区 */
export class FileReadable extends stream.Readable {
  private fd: number;
  private fileSize: number;
  private offset: number = 0;
  // 不能命名为 buf：基类 stream.Readable 内部的 buf（字节数组）会被本字段覆盖，
  // 框架 push()/read() 随即在 ArrayBuffer 上调 push() 抛 cannot Callspread
  private readBuf: ArrayBuffer = new ArrayBuffer(CHUNK_SIZE);
  /** 跨分块残留的不完整 UTF-8 字节，留待下一块拼接后再解码 */
  private pendingBytes: Uint8Array = new Uint8Array(0);
  private chunkIndex: number = 0;
  private eofTimer: number = -1;
  private eofSent: boolean = false;
  /** doRead 内部读取/推送失败时记录，消费方在 end 时检查并据此 reject */
  public readError: Error | null = null;
  private notify: (index: number, bytes: number, done: boolean) => void;

  constructor(fd: number, fileSize: number, notify: (index: number, bytes: number, done: boolean) => void) {
    super();
    this.fd = fd;
    this.fileSize = fileSize;
    this.notify = notify;
  }

  doRead(size: number): void {
    if (this.eofSent) {
      return;
    }
    if (this.offset >= this.fileSize) {
      this.eofSent = true;
      this.flushPending();
      this.push(null);
      return;
    }
    const len: number = Math.min(CHUNK_SIZE, this.fileSize - this.offset);
    let bytes: number = 0;
    try {
      bytes = fs.readSync(this.fd, this.readBuf, { offset: this.offset, length: len });
    } catch (err) {
      const e: Error = err instanceof Error ? err : new Error('读取文件失败');
      LogUtil.error('StreamFileUtil', `doRead 读取失败：${e.message}`);
      this.readError = e;
      this.eofSent = true;
      this.push(null);
      return;
    }
    if (bytes <= 0) {
      // 异常情况下 readSync 可能返回 0；若不推进 offset 会陷入 doRead 死循环
      LogUtil.warn('StreamFileUtil', `doRead 读取 0 字节（offset=${this.offset}），按 EOF 处理`);
      this.readError = new Error(`读取到 0 字节（offset=${this.offset}）`);
      this.pushEof();
      return;
    }
    this.offset += bytes;
    this.chunkIndex++;
    const done: boolean = this.offset >= this.fileSize;
    try {
      this.notify(this.chunkIndex, bytes, done);
      // 本 ROM 的 stream 实现对 push(Uint8Array) 送达不可靠（data 事件收不到有效数据），
      // push(string) 为验证过的路径：按 UTF-8 字符边界解码后入流。
      // 分块按字节切分，跨块的多字节字符由 pendingBytes 拼接，避免在边界处被截断成乱码。
      const raw: Uint8Array = new Uint8Array(this.readBuf.slice(0, bytes));
      const decoded: string = this.decodeUtf8Chunk(raw);
      if (decoded.length > 0) {
        this.push(decoded);
      }
    } catch (err) {
      const e: Error = err instanceof Error ? err : new Error('推送数据失败');
      LogUtil.error('StreamFileUtil', `doRead 推送失败：${e.message}`);
      this.readError = e;
      this.eofSent = true;
      this.push(null);
      return;
    }
    if (done) {
      // 同一 doRead 内先 push 数据再 push(null) 会让框架的 EOF 处理与数据出队竞态，
      // 延迟一拍再送 EOF（单独 push(null) 的 doRead 已验证可用）
      this.pushEof();
    }
  }

  /** 拼接上一块残留字节后按完整 UTF-8 边界解码；尾部不完整序列留到下一块 */
  private decodeUtf8Chunk(bytes: Uint8Array): string {
    const merged: Uint8Array = new Uint8Array(this.pendingBytes.length + bytes.length);
    merged.set(this.pendingBytes, 0);
    merged.set(bytes, this.pendingBytes.length);
    const completeLength: number = FileReadable.completeUtf8Length(merged);
    const complete: Uint8Array = merged.slice(0, completeLength);
    this.pendingBytes = merged.slice(completeLength);
    return fastbuffer.from(complete.buffer as ArrayBuffer).toString('utf8');
  }

  /** 返回字节数组中最长的、以完整 UTF-8 序列结尾的前缀长度 */
  private static completeUtf8Length(bytes: Uint8Array): number {
    const total: number = bytes.length;
    if (total === 0) {
      return 0;
    }
    let i: number = total - 1;
    let continuation: number = 0;
    while (i >= 0 && (bytes[i] & 0xC0) === 0x80 && continuation < 3) {
      i--;
      continuation++;
    }
    if (i < 0) {
      // 全是续字节，属于非法输入：整体交给解码器按替换字符处理，不再保留
      return total;
    }
    const lead: number = bytes[i];
    let need: number = 1;
    if ((lead & 0x80) === 0x00) {
      need = 1;
    } else if ((lead & 0xE0) === 0xC0) {
      need = 2;
    } else if ((lead & 0xF0) === 0xE0) {
      need = 3;
    } else if ((lead & 0xF8) === 0xF0) {
      need = 4;
    } else {
      // 非法首字节，不阻塞后续数据
      return total;
    }
    const available: number = total - i;
    return available >= need ? total : i;
  }

  /** 文件结束时把残留的不完整字节按替换字符输出，避免丢数据 */
  private flushPending(): void {
    if (this.pendingBytes.length === 0) {
      return;
    }
    const rest: string = fastbuffer.from(this.pendingBytes.buffer as ArrayBuffer).toString('utf8');
    this.pendingBytes = new Uint8Array(0);
    if (rest.length > 0) {
      this.push(rest);
    }
  }

  /** 延迟一拍发送 EOF；通过 eofSent/eofTimer 保证只发送一次，避免重复 timer 或重复 push(null) */
  private pushEof(): void {
    if (this.eofSent || this.eofTimer >= 0) {
      return;
    }
    this.eofTimer = setTimeout(() => {
      this.eofTimer = -1;
      if (this.eofSent) {
        return;
      }
      this.eofSent = true;
      this.flushPending();
      this.push(null);
    }, 0);
  }
}

export class StreamFileUtil {
  /** 获取文件大小（字节）；文件不存在返回 -1 */
  static getFileSize(path: string): number {
    try {
      return fs.statSync(path).size;
    } catch (err) {
      LogUtil.warn('StreamFileUtil', `getFileSize：${path} 不存在`);
      return -1;
    }
  }

  /** 分块流式写入：chunks 依次写入 path，resolve 落盘总字节数 */
  static async writeFileStreaming(path: string, chunks: string[],
    onProgress?: (written: number, total: number) => void): Promise<number> {
    let fd: number = -1;
    try {
      try {
        fs.unlinkSync(path);
      } catch (err) {
        // 文件不存在则忽略
      }
      fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE).fd;
      LogUtil.info('StreamFileUtil', `流式写入开始：${path}（${chunks.length} 块）`);
      const writer = new FileWritable(fd, (n: number, total: number) => {
        if (onProgress !== undefined) {
          onProgress(n, total);
        }
      });
      // 先挂完成/错误回调再写入，同步或异步的 finish/error 都能被捕获
      const finished = new Promise<number>((resolve, reject) => {
        writer.on('finish', () => {
          try {
            const size: number = fs.statSync(path).size;
            LogUtil.info('StreamFileUtil', `流式写入完成：${path}（${size}B）`);
            resolve(size);
          } catch (err) {
            LogUtil.error('StreamFileUtil', `finish 后读取文件大小失败：${err instanceof Error ? err.message : '未知错误'}`);
            reject(err instanceof Error ? err : new Error('读取文件大小失败'));
          }
        });
        writer.on('error', (err: emitter.EventData) => {
          const e: Error = eventDataToError(err);
          LogUtil.error('StreamFileUtil', `写入流出错：${e && e.message ? e.message : '未知错误'}`);
          reject(new Error(`写入流出错：${e && e.message ? e.message : '未知错误'}`));
        });
      });
      for (const c of chunks) {
        writer.write(c, 'utf8');
      }
      writer.end();
      return await finished;
    } finally {
      if (fd >= 0) {
        try {
          fs.closeSync(fd);
        } catch (err) {
          LogUtil.error('StreamFileUtil', `关闭 fd 失败：${err instanceof Error ? err.message : '未知错误'}`);
        }
        fd = -1;
      }
    }
  }

  /** 分块流式读取：每块通过 onChunk 回调（含进度），resolve 读取总字节数 */
  static async readFileStreaming(path: string, onChunk: (info: ReadProgress, chunk: string) => void): Promise<number> {
    let fd: number = -1;
    let received: number = 0;
    let chunkIndex: number = 0;
    try {
      fd = fs.openSync(path, fs.OpenMode.READ_ONLY).fd;
      const size: number = fs.statSync(path).size;
      LogUtil.info('StreamFileUtil', `流式读取开始：${path}（${size}B，分块 ${CHUNK_SIZE}B）`);
      const reader = new FileReadable(fd, size, (_index: number, _bytes: number, _done: boolean) => {
      });
      const finished = new Promise<void>((resolve, reject) => {
        reader.on('end', () => {
          if (reader.readError !== null) {
            LogUtil.error('StreamFileUtil', `读取流出错：${reader.readError.message}`);
            reject(reader.readError);
            return;
          }
          LogUtil.info('StreamFileUtil', `流式读取完成：${received}B / ${size}B，共 ${chunkIndex} 块`);
          resolve();
        });
        reader.on('error', (err: emitter.EventData) => {
          const e: Error = eventDataToError(err);
          LogUtil.error('StreamFileUtil', `读取流出错：${e && e.message ? e.message : '未知错误'}`);
          reject(new Error(`读取流出错：${e && e.message ? e.message : '未知错误'}`));
        });
      });
      reader.on('data', (data: emitter.EventData) => {
        const chunk: string = eventDataToText(data);
        chunkIndex++;
        // 用 UTF-8 编码后的长度作为字节数，避免多字节字符按字符数统计导致进度与文件大小不一致
        const chunkBytes: number = fastbuffer.from(chunk, 'utf8').length;
        received += chunkBytes;
        const info: ReadProgress = {
          chunkIndex: chunkIndex,
          chunkBytes: chunkBytes,
          totalBytes: received,
          fileSize: size
        };
        onChunk(info, chunk);
      });
      await finished;
      return received;
    } finally {
      if (fd >= 0) {
        try {
          fs.closeSync(fd);
        } catch (err) {
          LogUtil.error('StreamFileUtil', `关闭 fd 失败：${err instanceof Error ? err.message : '未知错误'}`);
        }
        fd = -1;
      }
    }
  }

  /** 流式拷贝：src 分块读取 → dest 分块写入，resolve 拷贝字节数 */
  static async copyFileStreaming(src: string, dest: string, onProgress?: (copied: number) => void): Promise<number> {
    let srcFd: number = -1;
    let destFd: number = -1;
    let copied: number = 0;
    try {
      try {
        fs.unlinkSync(dest);
      } catch (err) {
        // 文件不存在则忽略
      }
      srcFd = fs.openSync(src, fs.OpenMode.READ_ONLY).fd;
      destFd = fs.openSync(dest, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE).fd;
      const srcSize: number = fs.statSync(src).size;
      LogUtil.info('StreamFileUtil', `流式拷贝开始：${src} → ${dest}（${srcSize}B）`);
      const reader = new FileReadable(srcFd, srcSize, (_i: number, _b: number, _d: boolean) => {
      });
      const writer = new FileWritable(destFd, (_n: number, total: number) => {
        // total 为实际落盘字节数（fs.writeSync 返回值累加），多字节内容也能准确统计
        copied = total;
        if (onProgress !== undefined) {
          onProgress(total);
        }
      });
      // 先挂完成/错误回调，再挂 data 触发读取，避免同步事件早于监听器注册
      const finished = new Promise<void>((resolve, reject) => {
        reader.on('error', (err: emitter.EventData) => {
          const e: Error = eventDataToError(err);
          LogUtil.error('StreamFileUtil', `拷贝读流出错：${e && e.message ? e.message : '未知错误'}`);
          reject(new Error(`拷贝读流出错：${e && e.message ? e.message : '未知错误'}`));
        });
        reader.on('end', () => {
          if (reader.readError !== null) {
            LogUtil.error('StreamFileUtil', `拷贝读流出错：${reader.readError.message}`);
            reject(reader.readError);
            return;
          }
          writer.end();
        });
        writer.on('finish', () => {
          LogUtil.info('StreamFileUtil', `流式拷贝完成：${copied}B`);
          resolve();
        });
        writer.on('error', (err: emitter.EventData) => {
          const e: Error = eventDataToError(err);
          LogUtil.error('StreamFileUtil', `拷贝写出错：${e && e.message ? e.message : '未知错误'}`);
          reject(new Error(`拷贝写出错：${e && e.message ? e.message : '未知错误'}`));
        });
      });
      reader.on('data', (data: emitter.EventData) => {
        const chunk: string = eventDataToText(data);
        writer.write(chunk);
      });
      await finished;
      return copied;
    } finally {
      if (srcFd >= 0) {
        try {
          fs.closeSync(srcFd);
        } catch (err) {
          LogUtil.error('StreamFileUtil', `关闭源 fd 失败：${err instanceof Error ? err.message : '未知错误'}`);
        }
        srcFd = -1;
      }
      if (destFd >= 0) {
        try {
          fs.closeSync(destFd);
        } catch (err) {
          LogUtil.error('StreamFileUtil', `关闭目标 fd 失败：${err instanceof Error ? err.message : '未知错误'}`);
        }
        destFd = -1;
      }
    }
  }
}
