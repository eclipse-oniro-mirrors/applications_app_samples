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
import { uniformDataStruct, unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';

// [Start virtual_drag_receive]
// 获取落入数据中的文件 URI，不读取文件内容。
export function getDroppedFileUris(event: DragEvent): string[] {
  const uris: string[] = [];
  const records: unifiedDataChannel.UnifiedRecord[] = event.getData().getRecords();
  for (const record of records) {
    if (!record.getTypes().includes(uniformTypeDescriptor.UniformDataType.FILE_URI)) {
      continue;
    }
    const entry: uniformDataStruct.FileUri =
      record.getEntry(uniformTypeDescriptor.UniformDataType.FILE_URI) as uniformDataStruct.FileUri;
    if (entry.oriUri.length > 0) {
      uris.push(entry.oriUri);
    }
  }
  if (uris.length === 0) {
    throw new Error('No file URI received');
  }
  return uris;
}
// [End virtual_drag_receive]
