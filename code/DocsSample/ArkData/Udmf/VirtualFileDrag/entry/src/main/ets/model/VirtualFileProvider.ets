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

import uniformDataStruct from '@ohos.data.uniformDataStruct';
import http from '@ohos.net.http';
import fs from '@ohos.file.fs';
import util from '@ohos.util';
import zlib from '@ohos.zlib';
import { common } from '@kit.AbilityKit';

const MAX_READ = 5 * 1024 * 1024;

class SourceFile {
  item: uniformDataStruct.VirtualFileItem;
  content: Uint8Array;
  url: string;
  archive: string;
  output: string;

  constructor(item: uniformDataStruct.VirtualFileItem, content: Uint8Array,
    url: string = '', archive: string = '', output: string = '') {
    this.item = item;
    this.content = content;
    this.url = url;
    this.archive = archive;
    this.output = output;
  }
  extraction?: Promise<void>;
}

export class VirtualFileProvider {
  private sources: Map<string, SourceFile> = new Map();
  private pending: Map<string, Set<http.HttpRequest>> = new Map();
  private root?: uniformDataStruct.VirtualItemType;

  private log: (text: string) => void;

  constructor(log: (text: string) => void) {
    this.log = log;
  }

  private file(id: string): SourceFile {
    const source = this.sources.get(id);
    if (!source) {
      throw new Error('文件标识不存在');
    }
    return source;
  }

// [Start virtual_drag_js_provider]
  createVirtualEntry(): uniformDataStruct.VirtualFileInfo {
    const root = this.root;
    if (!root) {
      throw new Error('请先准备文件');
    }
    return {
      itemInfo: root,
      onStat: async (id: string): Promise<uniformDataStruct.VirtualFileItem> => this.file(id).item,
      onRead: async (id: string, offset: number, length: number): Promise<Uint8Array> => {
        const file = this.file(id);
        this.log(`onRead: ${id}, offset=${offset}, length=${length}`);
        if (!Number.isSafeInteger(offset) || offset < 0 || !Number.isInteger(length) ||
          length <= 0 || length > MAX_READ) {
          throw new Error('读取参数无效');
        }
        const count = Math.min(length, Math.max(0, file.item.size - offset));
        if (count === 0) {
          return new Uint8Array(0);
        }
        if (file.url.length > 0) {
          return this.readNetwork(file, offset, count);
        }
        if (file.archive.length > 0) {
          return this.readArchive(file, offset, count);
        }
        return file.content.slice(offset, offset + count);
      },
      onCancel: async (ids: string[]): Promise<void> => {
        this.log(`onCancel: ${ids.join(',')}`);
        // 只取消当前请求，不禁止同一 id 的后续读取。
        ids.forEach((id: string) => {
          this.pending.get(id)?.forEach((request: http.HttpRequest) => request.destroy());
        });
      }
    };
  }
// [End virtual_drag_js_provider]

  prepareDocuments(directory: boolean): void {
    const files: uniformDataStruct.VirtualItemType[] = [];
    const count = directory ? 3 : 1;
    for (let index = 0; index < count; index++) {
      const id = `document-${index}`;
      const content = util.TextEncoder.create('utf-8').encodeInto(
        `OpenHarmony 虚拟文档 ${index + 1}\n此内容在目标应用读取时提供。\n`);
      const item: uniformDataStruct.VirtualFileItem = {
        name: `文档${index + 1}.txt`, type: 'file', id: id, size: content.length, modifyTime: Date.now()
      };
      this.sources.set(id, new SourceFile(item, content));
      files.push(item);
    }
    const root: uniformDataStruct.VirtualDirItem = {
      name: '导出文档', type: 'dir', modifyTime: Date.now(),
      subItems: [files[0], { name: '附件', type: 'dir', modifyTime: Date.now(), subItems: files.slice(1) }]
    };
    this.root = directory ? root : files[0];
  }

  async prepareNetwork(url: string, size: number): Promise<void> {
    if (!/^https:\/\//.test(url) || !Number.isSafeInteger(size) || size <= 0) {
      throw new Error('请输入 HTTPS 地址及准确的文件字节数');
    }
    const item: uniformDataStruct.VirtualFileItem = {
      name: '网络文件.bin', type: 'file', id: 'network', size: size, modifyTime: Date.now()
    };
    const source = new SourceFile(item, new Uint8Array(0), url);
    // 只探测一个字节，验证服务端支持 Range；不会预先下载完整文件。
    await this.readNetwork(source, 0, 1);
    this.sources.set(item.id, source);
    this.root = item;
  }

  async prepareArchive(context: common.UIAbilityContext): Promise<void> {
    const directory = `${context.filesDir}/archive-${Date.now()}`;
    fs.mkdirSync(directory);
    const resource = await context.resourceManager.getRawFileContent('documents.zip');
    const archive = `${directory}/documents.zip`;
    const file = fs.openSync(archive, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY);
    try {
      fs.writeSync(file.fd, resource.buffer);
    } finally {
      fs.closeSync(file);
    }
    const output = `${directory}/extracted`;
    fs.mkdirSync(output);
    const item: uniformDataStruct.VirtualFileItem = {
      name: 'archive-note.txt', type: 'file', id: 'archive-note', size: 106, modifyTime: Date.now()
    };
    this.sources.set(item.id, new SourceFile(item, new Uint8Array(0), '', archive, output));
    this.root = item;
  }

  private async readArchive(file: SourceFile, offset: number, count: number): Promise<Uint8Array> {
    if (!file.extraction) {
      this.log('首次读取：开始解压本地 ZIP 中的文件');
      file.extraction = zlib.decompressFile(file.archive, file.output);
    }
    await file.extraction;
    const handle = await fs.open(`${file.output}/archive-note.txt`, fs.OpenMode.READ_ONLY);
    try {
      const buffer = new ArrayBuffer(count);
      const read = await fs.read(handle.fd, buffer, { offset: offset, length: count });
      return new Uint8Array(buffer, 0, read);
    } finally {
      await fs.close(handle);
    }
  }

  private async readNetwork(file: SourceFile, offset: number, count: number): Promise<Uint8Array> {
    const request = http.createHttp();
    let requests = this.pending.get(file.item.id);
    if (!requests) {
      requests = new Set<http.HttpRequest>();
      this.pending.set(file.item.id, requests);
    }
    requests.add(request);
    try {
      const result = await request.request(file.url, {
        method: http.RequestMethod.GET,
        header: { 'Range': `bytes=${offset}-${offset + count - 1}`, 'Accept-Encoding': 'identity' },
        expectDataType: http.HttpDataType.ARRAY_BUFFER,
        maxLimit: count, usingCache: false, connectTimeout: 15000, readTimeout: 15000
      });
      const headers = result.header as Record<string, string>;
      const range = headers['content-range'] ?? headers['Content-Range'];
      const bytes = new Uint8Array(result.result as ArrayBuffer);
      if (result.responseCode !== 206 || range !== `bytes ${offset}-${offset + count - 1}/${file.item.size}` ||
        bytes.length !== count) {
        throw new Error('服务端必须支持 Range，且实际范围与声明大小一致');
      }
      return bytes;
    } finally {
      requests.delete(request);
      request.destroy();
    }
  }
}
