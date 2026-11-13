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

import { describe, expect, it } from '@ohos/hypium';
import type { uniformDataStruct } from '@kit.ArkData';
import { util } from '@kit.ArkTS';
import { VirtualFileProvider } from '../../../main/ets/model/VirtualFileProvider';

// 验证示例数据源的文件树、元数据及读取回调，不依赖文件管理器。
export default function providerTest(): void {
  describe('VirtualFileDragProvider', () => {
    // 核对声明大小、stat 元数据、分段数据与文件末尾，不把短读伪装为完整内容。
    it('VirtualFileDrag_ReadRange_004', 0, async (): Promise<void> => {
      console.info('VirtualFileDrag_ReadRange_004 begin');
      try {
        const provider: VirtualFileProvider = new VirtualFileProvider();
        provider.prepareDocuments(false);
        const entry: uniformDataStruct.VirtualFileInfo = provider.createVirtualEntry();
        const item: uniformDataStruct.VirtualFileItem = entry.itemInfo as uniformDataStruct.VirtualFileItem;
        const expected: string = 'OpenHarmony virtual document 1\n' +
          'Content is provided when the target reads this file.\n';
        const expectedBytes: Uint8Array = util.TextEncoder.create('utf-8').encodeInto(expected);
        console.info(`Declared size=${item.size}, expected=${expectedBytes.length}`);
        expect(item.size).assertEqual(expectedBytes.length);
        if (!entry.onStat) {
          throw new Error('The sample should provide onStat');
        }
        const stat: uniformDataStruct.VirtualFileItem = await entry.onStat(item.id);
        console.info(`Stat id=${stat.id}, expected=${item.id}`);
        expect(stat.id).assertEqual(item.id);
        console.info(`Stat size=${stat.size}, expected=${item.size}`);
        expect(stat.size).assertEqual(item.size);
        const first: Uint8Array = await entry.onRead(item.id, 0, 7);
        const tail: Uint8Array = await entry.onRead(item.id, 7, item.size);
        const full: Uint8Array = new Uint8Array(first.length + tail.length);
        full.set(first);
        full.set(tail, first.length);
        const actual: string = util.TextDecoder.create('utf-8').decodeToString(full);
        console.info(`Reassembled length=${full.length}, expected=${expectedBytes.length}`);
        expect(actual).assertEqual(expected);
        const eof: Uint8Array = await entry.onRead(item.id, item.size, 1);
        console.info(`EOF length=${eof.length}, expected=0`);
        expect(eof.length).assertEqual(0);
      } finally {
        console.info('VirtualFileDrag_ReadRange_004 end');
      }
    });

    // 验证目录包含一个根文件和一个有两个子文件的子目录，每个文件可按 id 读取。
    it('VirtualFileDrag_DirectoryContent_005', 0, async (): Promise<void> => {
      console.info('VirtualFileDrag_DirectoryContent_005 begin');
      try {
        const provider: VirtualFileProvider = new VirtualFileProvider();
        provider.prepareDocuments(true);
        const entry: uniformDataStruct.VirtualFileInfo = provider.createVirtualEntry();
        const root: uniformDataStruct.VirtualDirItem = entry.itemInfo as uniformDataStruct.VirtualDirItem;
        const children: uniformDataStruct.VirtualItemType[] = root.subItems ?? [];
        console.info(`Root type=${root.type}, expected=dir`);
        expect(root.type).assertEqual('dir');
        console.info(`Root children=${children.length}, expected=2`);
        expect(children.length).assertEqual(2);
        const folder: uniformDataStruct.VirtualDirItem = children[1] as uniformDataStruct.VirtualDirItem;
        const nested: uniformDataStruct.VirtualItemType[] = folder.subItems ?? [];
        console.info(`Nested files=${nested.length}, expected=2`);
        expect(nested.length).assertEqual(2);
        const files: uniformDataStruct.VirtualFileItem[] = [children[0] as uniformDataStruct.VirtualFileItem,
          nested[0] as uniformDataStruct.VirtualFileItem, nested[1] as uniformDataStruct.VirtualFileItem];
        const ids: Set<string> = new Set();
        for (const file of files) {
          ids.add(file.id);
          const data: Uint8Array = await entry.onRead(file.id, 0, file.size);
          console.info(`File id=${file.id}, actual size=${data.length}, expected=${file.size}`);
          expect(data.length).assertEqual(file.size);
        }
        console.info(`Distinct ids=${ids.size}, expected=3`);
        expect(ids.size).assertEqual(3);
      } finally {
        console.info('VirtualFileDrag_DirectoryContent_005 end');
      }
    });

    // 未知 id、负偏移和超过单次上限的请求必须拒绝，不能用空数据掩盖失败。
    it('VirtualFileDrag_InvalidRead_006', 0, async (): Promise<void> => {
      console.info('VirtualFileDrag_InvalidRead_006 begin');
      try {
        const provider: VirtualFileProvider = new VirtualFileProvider();
        provider.prepareDocuments(false);
        const entry: uniformDataStruct.VirtualFileInfo = provider.createVirtualEntry();
        const item: uniformDataStruct.VirtualFileItem = entry.itemInfo as uniformDataStruct.VirtualFileItem;
        const cases: ReadRequest[] = [
          { id: 'missing-id', offset: 0, length: 1 },
          { id: item.id, offset: -1, length: 1 },
          { id: item.id, offset: 0, length: 5 * 1024 * 1024 + 1 }
        ];
        for (const request of cases) {
          let rejected: boolean = false;
          try {
            await entry.onRead(request.id, request.offset, request.length);
          } catch (_error) {
            rejected = true;
          }
          console.info(`Invalid request offset=${request.offset}, length=${request.length}, rejected=${rejected}`);
          expect(rejected).assertTrue();
        }
      } finally {
        console.info('VirtualFileDrag_InvalidRead_006 end');
      }
    });
  });
}

interface ReadRequest {
  id: string;
  offset: number;
  length: number;
}
