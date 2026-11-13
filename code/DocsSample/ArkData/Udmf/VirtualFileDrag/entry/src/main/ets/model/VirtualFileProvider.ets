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
import fs from '@ohos.file.fs';
import util from '@ohos.util';
import zlib from '@ohos.zlib';
import { common } from '@kit.AbilityKit';

const MAX_READ = 5 * 1024 * 1024;

class SourceFile {
  public item: uniformDataStruct.VirtualFileItem;
  public content: Uint8Array;
  public archive: string;
  public output: string;

  constructor(item: uniformDataStruct.VirtualFileItem, content: Uint8Array,
    archive: string = '', output: string = '') {
    this.item = item;
    this.content = content;
    this.archive = archive;
    this.output = output;
  }
  public extraction?: Promise<void>;
}

export class VirtualFileProvider {
  private sources: Map<string, SourceFile> = new Map();
  private root?: uniformDataStruct.VirtualItemType;

  private file(id: string): SourceFile {
    const source = this.sources.get(id);
    if (!source) {
      throw new Error('文件标识不存在');
    }
    return source;
  }

// [Start virtual_drag_js_provider]
  public createVirtualEntry(): uniformDataStruct.VirtualFileInfo {
    const root = this.root;
    if (!root) {
      throw new Error('请先准备文件');
    }
    return {
      itemInfo: root,
      onStat: async (id: string): Promise<uniformDataStruct.VirtualFileItem> => this.file(id).item,
      onRead: async (id: string, offset: number, length: number): Promise<Uint8Array> => {
        const file = this.file(id);
        if (!Number.isSafeInteger(offset) || offset < 0 || !Number.isInteger(length) ||
          length <= 0 || length > MAX_READ) {
          throw new Error('读取参数无效');
        }
        const count = Math.min(length, Math.max(0, file.item.size - offset));
        if (count === 0) {
          return new Uint8Array(0);
        }
        if (file.archive.length > 0) {
          return this.readArchive(file, offset, count);
        }
        return file.content.slice(offset, offset + count);
      },
      onCancel: async (_ids: string[]): Promise<void> => {
        // 本地读取没有额外的可取消任务。实际提供方可在此停止对应 id 的待处理任务。
        // 取消通知不表示永久禁用这些 id，也不应影响其后续读取。
      }
    };
  }
// [End virtual_drag_js_provider]

  public prepareDocuments(directory: boolean): void {
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

  public async prepareArchive(context: common.UIAbilityContext): Promise<void> {
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
    this.sources.set(item.id, new SourceFile(item, new Uint8Array(0), archive, output));
    this.root = item;
  }

  private async readArchive(file: SourceFile, offset: number, count: number): Promise<Uint8Array> {
    if (!file.extraction) {
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
}
