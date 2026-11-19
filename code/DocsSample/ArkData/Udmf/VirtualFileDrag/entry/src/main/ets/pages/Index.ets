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

import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import type { uniformDataStruct } from '@kit.ArkData';
import type { common } from '@kit.AbilityKit';
import { logSampleError } from '../model/SampleError';
import { VirtualFileProvider } from '../model/VirtualFileProvider';
import { getDroppedFileUris } from '../model/DropReceiver';

enum ExportScenario {
  DOCUMENT,
  DIRECTORY,
  ARCHIVE
}

@Entry
@Component
struct Index {
  @State private ready: boolean = false;
  @State private busy: boolean = false;
  @State private sourceText: Resource = $r('app.string.source_document');
  private provider?: VirtualFileProvider;

  // 准备默认文档，使页面首次显示时即可拖起。
  aboutToAppear(): void {
    this.prepare(ExportScenario.DOCUMENT);
  }

  private async prepare(scenario: ExportScenario): Promise<void> {
    this.ready = false;
    this.busy = true;
    try {
      const provider: VirtualFileProvider = new VirtualFileProvider();
      if (scenario === ExportScenario.ARCHIVE) {
        await provider.prepareArchive(this.getUIContext().getHostContext() as common.UIAbilityContext);
        this.sourceText = $r('app.string.source_archive');
      } else {
        const directory: boolean = scenario === ExportScenario.DIRECTORY;
        provider.prepareDocuments(directory);
        this.sourceText = directory ? $r('app.string.source_directory') : $r('app.string.source_document');
      }
      this.provider = provider;
      this.ready = true;
    } catch (error) {
      logSampleError('Prepare virtual file', error as Error);
      this.getUIContext().getPromptAction().showToast({ message: $r('app.string.prepare_failed') });
    } finally {
      this.busy = false;
    }
  }

// [Start virtual_drag_js_data]
  private createDragData(): unifiedDataChannel.UnifiedData {
    if (!this.provider) {
      throw new Error('Prepare a file before dragging');
    }
    const entry: uniformDataStruct.VirtualFileInfo = this.provider.createVirtualEntry();
    // oriUri是非空占位URI，不要求文件已存在；落入方使用实际获取的URI。
    const fileUri: uniformDataStruct.FileUri = {
      uniformDataType: 'general.file-uri',
      oriUri: `file:///virtual/${encodeURIComponent(entry.itemInfo.name)}`,
      fileType: entry.itemInfo.type === 'dir' ? 'general.directory' : 'general.file',
      virtualEntry: entry
    };
    const record: unifiedDataChannel.UnifiedRecord = new unifiedDataChannel.UnifiedRecord(
      uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
    return new unifiedDataChannel.UnifiedData(record);
  }
// [End virtual_drag_js_data]

// [Start virtual_drag_js_drop_result]
  private receive(event: DragEvent): void {
    try {
      this.handleUris(getDroppedFileUris(event));
      event.setResult(DragResult.DRAG_SUCCESSFUL);
    } catch (error) {
      event.setResult(DragResult.DRAG_FAILED);
      logSampleError('Get dropped URIs', error as Error);
      this.getUIContext().getPromptAction().showToast({ message: $r('app.string.receive_failed') });
    }
  }

  private handleUris(uris: string[]): void {
    // 业务可在此根据URI读取、复制或打开文件，示例仅提示已接收。
    this.getUIContext().getPromptAction().showToast({ message: $r('app.string.uris_received', uris.length) });
  }
// [End virtual_drag_js_drop_result]

  build() {
    Column({ space: 20 }) {
      Text($r('app.string.drag_title'))
        .fontSize(24)
      Row({ space: 8 }) {
        Button($r('app.string.document'))
          .onClick(() => { this.prepare(ExportScenario.DOCUMENT); })
          .enabled(!this.busy)
        Button($r('app.string.directory'))
          .onClick(() => { this.prepare(ExportScenario.DIRECTORY); })
          .enabled(!this.busy)
        Button($r('app.string.archive'))
          .onClick(() => { this.prepare(ExportScenario.ARCHIVE); })
          .enabled(!this.busy)
      }
      Text(this.ready ? this.sourceText : $r('app.string.preparing'))
        .width('100%').height(120)
        .backgroundColor($r('app.color.drag_source_background'))
        .draggable(this.ready)
// [Start virtual_drag_js_start]
        .onDragStart((event: DragEvent) => {
          try {
            event.setData(this.createDragData());
          } catch (error) {
            logSampleError('Set drag data', error as Error);
            this.getUIContext().getPromptAction().showToast({ message: $r('app.string.drag_failed') });
          }
        })
// [End virtual_drag_js_start]
// [Start virtual_drag_js_drop_target]
      Text($r('app.string.drop_hint'))
        .width('100%').height(120)
        .backgroundColor($r('app.color.drag_drop_background'))
        .allowDrop([uniformTypeDescriptor.UniformDataType.FILE_URI])
        .onDrop((event: DragEvent) => { this.receive(event); })
// [End virtual_drag_js_drop_target]
    }
    .padding(24)
    .width('100%').height('100%')
  }
}
