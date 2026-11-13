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

import type { uniformDataStruct } from '@kit.ArkData';
import { fileIo as fs } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import { zlib } from '@kit.BasicServicesKit';
import type { common } from '@kit.AbilityKit';

const MAX_READ_LENGTH: number = 5 * 1024 * 1024;
const DIRECTORY_FILE_COUNT: number = 3;
const ARCHIVE_FILE_NAME: string = 'archive-note.txt';
// 来自示例 ZIP 的已知文件信息，拖拽前即可声明，不需要先解压文件。
const ARCHIVE_FILE_SIZE: number = 106;

// 示例数据源：文件信息用于声明节点，content 或 archivePath 用于按需提供内容。
class SourceFile {
  public metadata: uniformDataStruct.VirtualFileItem;
  public content: Uint8Array;
  public archivePath: string;
  public outputDir: string;
  public extractionTask?: Promise<void>;

  constructor(metadata: uniformDataStruct.VirtualFileItem, content: Uint8Array,
    archivePath: string = '', outputDir: string = '') {
    this.metadata = metadata;
    this.content = content;
    this.archivePath = archivePath;
    this.outputDir = outputDir;
  }
}

export class VirtualFileProvider {
  private sources: Map<string, SourceFile> = new Map();
  private rootItem?: uniformDataStruct.VirtualItemType;

  private getSourceFile(id: string): SourceFile {
    const source: SourceFile | undefined = this.sources.get(id);
    if (!source) {
      throw new Error('Unknown file ID');
    }
    return source;
  }

// [Start virtual_drag_js_provider]
  // 创建文件树及内容回调，供 FileUri.virtualEntry 使用。
  public createVirtualEntry(): uniformDataStruct.VirtualFileInfo {
    const rootItem: uniformDataStruct.VirtualItemType | undefined = this.rootItem;
    if (!rootItem) {
      throw new Error('Prepare a file before dragging');
    }
    return {
      // itemInfo 是根文件或根目录；目录通过 subItems 描述子节点。
      itemInfo: rootItem,
      // 可选：按文件 id 返回文件信息。
      onStat: async (id: string): Promise<uniformDataStruct.VirtualFileItem> => this.getSourceFile(id).metadata,
      // 必选：从 offset 开始提供最多 length 字节；失败时抛出异常。
      onRead: async (id: string, offset: number, length: number): Promise<Uint8Array> => {
        const file: SourceFile = this.getSourceFile(id);
        if (!Number.isSafeInteger(offset) || offset < 0 || !Number.isInteger(length) ||
          length <= 0 || length > MAX_READ_LENGTH) {
          throw new Error('Invalid read parameters');
        }
        const count: number = Math.min(length, Math.max(0, file.metadata.size - offset));
        if (count === 0) {
          return new Uint8Array(0); // offset 已到文件末尾。
        }
        if (file.archivePath.length > 0) {
          return this.readArchive(file, offset, count);
        }
        return file.content.slice(offset, offset + count);
      },
      // 可选：取消对应 id 当前待处理的任务。
      onCancel: async (_ids: string[]): Promise<void> => {
        // 本地读取没有额外的可取消任务。实际提供方可在此停止对应 id 的待处理任务。
        // 取消通知不表示永久禁用这些 id，也不应影响其后续读取。
      }
    };
  }
// [End virtual_drag_js_provider]

  // 声明单个文件或嵌套目录，内容保存在示例内存数据源中。
  public prepareDocuments(directory: boolean): void {
    const files: uniformDataStruct.VirtualItemType[] = [];
    const count: number = directory ? DIRECTORY_FILE_COUNT : 1;
    for (let index: number = 0; index < count; index++) {
      const id: string = `document-${index}`;
      const content: Uint8Array = util.TextEncoder.create('utf-8').encodeInto(
        `OpenHarmony virtual document ${index + 1}\nContent is provided when the target reads this file.\n`);
      const metadata: uniformDataStruct.VirtualFileItem = {
        name: `document-${index + 1}.txt`, type: 'file', id: id, size: content.length, modifyTime: Date.now()
      };
      this.sources.set(id, new SourceFile(metadata, content));
      files.push(metadata);
    }
    if (!directory) {
      this.rootItem = files[0];
      return;
    }
    // 目录本身不提供读取回调，目录内的每个文件通过 id 找到其数据源。
    const rootItem: uniformDataStruct.VirtualDirItem = {
      name: 'exported-documents', type: 'dir', modifyTime: Date.now(),
      subItems: [files[0], { name: 'attachments', type: 'dir', modifyTime: Date.now(), subItems: files.slice(1) }]
    };
    this.rootItem = rootItem;
  }

  // 复制自带 ZIP 并声明其中的文件，直到读取时才解压。
  public async prepareArchive(context: common.UIAbilityContext): Promise<void> {
    const directory: string = `${context.filesDir}/archive-${Date.now()}`;
    fs.mkdirSync(directory);
    const resource: Uint8Array = await context.resourceManager.getRawFileContent('documents.zip');
    const archivePath: string = `${directory}/documents.zip`;
    const file: fs.File = fs.openSync(archivePath, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY);
    try {
      fs.writeSync(file.fd, resource.buffer);
    } finally {
      fs.closeSync(file);
    }
    const outputDir: string = `${directory}/extracted`;
    fs.mkdirSync(outputDir);
    const metadata: uniformDataStruct.VirtualFileItem = {
      name: ARCHIVE_FILE_NAME, type: 'file', id: 'archive-note', size: ARCHIVE_FILE_SIZE, modifyTime: Date.now()
    };
    this.sources.set(metadata.id, new SourceFile(metadata, new Uint8Array(0), archivePath, outputDir));
    this.rootItem = metadata;
  }

  private async readArchive(file: SourceFile, offset: number, count: number): Promise<Uint8Array> {
    // 共用一次解压任务；并发读取时不重复解压。
    if (!file.extractionTask) {
      file.extractionTask = zlib.decompressFile(file.archivePath, file.outputDir);
    }
    await file.extractionTask;
    const handle: fs.File = await fs.open(`${file.outputDir}/${ARCHIVE_FILE_NAME}`, fs.OpenMode.READ_ONLY);
    try {
      const buffer: ArrayBuffer = new ArrayBuffer(count);
      const read: number = await fs.read(handle.fd, buffer, { offset: offset, length: count });
      return new Uint8Array(buffer, 0, read);
    } finally {
      await fs.close(handle);
    }
  }
}
