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

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
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
  private chunkIndex: number = 0;
  private notify: (index: number, bytes: number, done: boolean) => void;

  constructor(fd: number, fileSize: number, notify: (index: number, bytes: number, done: boolean) => void) {
    super();
    this.fd = fd;
    this.fileSize = fileSize;
    this.notify = notify;
  }

  doRead(size: number): void {
    if (this.offset >= this.fileSize) {
      this.push(null);
      return;
    }
    const len: number = Math.min(CHUNK_SIZE, this.fileSize - this.offset);
    const bytes: number = fs.readSync(this.fd, this.readBuf, { offset: this.offset, length: len });
    this.offset += bytes;
    this.chunkIndex++;
    const done: boolean = this.offset >= this.fileSize;
    this.notify(this.chunkIndex, bytes, done);
    // 本 ROM 的 stream 实现对 push(Uint8Array) 送达不可靠（data 事件收不到有效数据），
    // push(string) 为验证过的路径：用 fastbuffer 把字节块解码为 utf8 字符串再入流
    // 注：分块边界按字节切分，仅适用于分块边界恰好落在字符边界的内容（演示数据均为 ASCII）
    this.push(fastbuffer.from(this.readBuf.slice(0, bytes)).toString('utf8'));
    if (done) {
      // 同一 doRead 内先 push 数据再 push(null) 会让框架的 EOF 处理与数据出队竞态，
      // 延迟一拍再送 EOF（单独 push(null) 的 doRead 已验证可用）
      setTimeout(() => {
        this.push(null);
      }, 0);
    }
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
  static writeFileStreaming(path: string, chunks: string[],
    onProgress?: (written: number, total: number) => void): Promise<number> {
    return new Promise<number>((resolve, reject) => {
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
        writer.on('finish', () => {
          const size: number = fs.statSync(path).size;
          fs.closeSync(fd);
          LogUtil.info('StreamFileUtil', `流式写入完成：${path}（${size}B）`);
          resolve(size);
        });
        writer.on('error', (err: emitter.EventData) => {
          const e = err.data as Error;
          LogUtil.error('StreamFileUtil', `写入流出错：${e && e.message ? e.message : '未知错误'}`);
          fs.closeSync(fd);
          reject(new Error(`写入流出错：${e && e.message ? e.message : '未知错误'}`));
        });
        for (const c of chunks) {
          writer.write(c, 'utf8');
        }
        writer.end();
      } catch (err) {
        if (fd >= 0) {
          fs.closeSync(fd);
        }
        reject(err as Error);
      }
    });
  }

  /** 分块流式读取：每块通过 onChunk 回调（含进度），resolve 读取总字节数 */
  static readFileStreaming(path: string, onChunk: (info: ReadProgress, chunk: string) => void): Promise<number> {
    return new Promise<number>((resolve, reject) => {
      let fd: number = -1;
      try {
        fd = fs.openSync(path, fs.OpenMode.READ_ONLY).fd;
        const size: number = fs.statSync(path).size;
        LogUtil.info('StreamFileUtil', `流式读取开始：${path}（${size}B，分块 ${CHUNK_SIZE}B）`);
        const reader = new FileReadable(fd, size, (_index: number, _bytes: number, _done: boolean) => {
        });
        let received: number = 0;
        let chunkIndex: number = 0;
        reader.on('data', (data: emitter.EventData) => {
          const chunk = data.data as Object as string;
          chunkIndex++;
          received += chunk.length;
          const info: ReadProgress = {
            chunkIndex: chunkIndex,
            chunkBytes: chunk.length,
            totalBytes: received,
            fileSize: size
          };
          onChunk(info, chunk);
        });
        reader.on('end', () => {
          fs.closeSync(fd);
          LogUtil.info('StreamFileUtil', `流式读取完成：${received}B / ${size}B，共 ${chunkIndex} 块`);
          resolve(received);
        });
        reader.on('error', (err: emitter.EventData) => {
          const e = err.data as Error;
          LogUtil.error('StreamFileUtil', `读取流出错：${e && e.message ? e.message : '未知错误'}`);
          fs.closeSync(fd);
          reject(new Error(`读取流出错：${e && e.message ? e.message : '未知错误'}`));
        });
      } catch (err) {
        if (fd >= 0) {
          fs.closeSync(fd);
        }
        reject(err as Error);
      }
    });
  }

  /** 流式拷贝：src 分块读取 → dest 分块写入，resolve 拷贝字节数 */
  static copyFileStreaming(src: string, dest: string, onProgress?: (copied: number) => void): Promise<number> {
    return new Promise<number>((resolve, reject) => {
      let srcFd: number = -1;
      let destFd: number = -1;
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
          if (onProgress !== undefined) {
            onProgress(total);
          }
        });
        let copied: number = 0;
        reader.on('data', (data: emitter.EventData) => {
          const chunk = data.data as Object as string;
          copied += chunk.length;
          writer.write(chunk);
        });
        reader.on('end', () => {
          writer.end();
        });
        // 必须挂 reader 错误处理：否则读取流出错时无人 reject，Promise 悬挂直到超时
        reader.on('error', (err: emitter.EventData) => {
          const e = err.data as Error;
          LogUtil.error('StreamFileUtil', `拷贝读流出错：${e && e.message ? e.message : '未知错误'}`);
          fs.closeSync(srcFd);
          fs.closeSync(destFd);
          reject(new Error(`拷贝读流出错：${e && e.message ? e.message : '未知错误'}`));
        });
        writer.on('finish', () => {
          fs.closeSync(srcFd);
          fs.closeSync(destFd);
          LogUtil.info('StreamFileUtil', `流式拷贝完成：${copied}B`);
          resolve(copied);
        });
        writer.on('error', (err: emitter.EventData) => {
          const e = err.data as Error;
          LogUtil.error('StreamFileUtil', `拷贝写出错：${e && e.message ? e.message : '未知错误'}`);
          fs.closeSync(srcFd);
          fs.closeSync(destFd);
          reject(new Error(`拷贝写出错：${e && e.message ? e.message : '未知错误'}`));
        });
      } catch (err) {
        if (srcFd >= 0) {
          fs.closeSync(srcFd);
        }
        if (destFd >= 0) {
          fs.closeSync(destFd);
        }
        reject(err as Error);
      }
    });
  }
}
