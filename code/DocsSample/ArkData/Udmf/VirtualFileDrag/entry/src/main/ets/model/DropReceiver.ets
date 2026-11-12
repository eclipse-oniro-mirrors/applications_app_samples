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

import fs from '@ohos.file.fs';
import fileUri from '@ohos.file.fileuri';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import { common } from '@kit.AbilityKit';

async function copyEntry(source: string, destination: string, depth: number = 0): Promise<void> {
  if (depth > 64) {
    throw new Error('目录层级过深');
  }
  const stat = await fs.stat(source);
  if (stat.isDirectory()) {
    await fs.mkdir(destination);
    const names = await fs.listFile(source);
    for (const name of names) {
      if (name === '.' || name === '..' || name.includes('/') || name.includes('\\')) {
        throw new Error('无效的文件名');
      }
      await copyEntry(`${source}/${name}`, `${destination}/${name}`, depth + 1);
    }
    return;
  }
  if (!stat.isFile()) {
    throw new Error('仅接收普通文件或目录');
  }
  const input = await fs.open(source, fs.OpenMode.READ_ONLY);
  try {
    const output = await fs.open(destination, fs.OpenMode.CREATE | fs.OpenMode.TRUNC | fs.OpenMode.WRITE_ONLY);
    try {
      const buffer = new ArrayBuffer(64 * 1024);
      let count = await fs.read(input.fd, buffer);
      while (count > 0) {
        let written = 0;
        while (written < count) {
          const bytes = await fs.write(output.fd, buffer.slice(written, count));
          if (bytes <= 0) {
            throw new Error('文件写入失败');
          }
          written += bytes;
        }
        count = await fs.read(input.fd, buffer);
      }
    } finally {
      await fs.close(output);
    }
  } finally {
    await fs.close(input);
  }
}

// [Start virtual_drag_receive]
export async function copyDroppedFiles(event: DragEvent, context: common.UIAbilityContext,
  log: (text: string) => void): Promise<void> {
  try {
    const records = event.getData().getRecords();
    const directory = `${context.filesDir}/received-${Date.now()}`;
    await fs.mkdir(directory);
    let count = 0;
    for (const record of records) {
      if (!record.getTypes().includes(uniformTypeDescriptor.UniformDataType.FILE_URI)) {
        continue;
      }
      const entry = record.getEntry(uniformTypeDescriptor.UniformDataType.FILE_URI) as uniformDataStruct.FileUri;
      const source = new fileUri.FileUri(entry.oriUri).path;
      const name = source.substring(source.lastIndexOf('/') + 1);
      if (name.length === 0 || name === '.' || name === '..') {
        throw new Error('文件名无效');
      }
      log(`开始复制：${name}`);
      // 普通文件 API 即可读取虚拟文件，无须使用提供方回调。
      await copyEntry(source, `${directory}/${count}-${name}`);
      count++;
    }
    log(count > 0 ? `复制成功：${count} 个根节点，保存到 ${directory}` : '未收到文件数据');
  } catch (error) {
    log(`复制失败：${JSON.stringify(error)}`);
  }
}
// [End virtual_drag_receive]
