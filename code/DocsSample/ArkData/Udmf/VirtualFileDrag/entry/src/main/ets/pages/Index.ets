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
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import { common } from '@kit.AbilityKit';
import { VirtualFileProvider } from '../model/VirtualFileProvider';
import { copyDroppedFiles } from '../model/DropReceiver';

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
  @State private fileName: string = '文档';
  private provider?: VirtualFileProvider;

  aboutToAppear(): void {
    this.prepare(ExportScenario.DOCUMENT);
  }

  private async prepare(scenario: ExportScenario): Promise<void> {
    this.ready = false;
    this.busy = true;
    try {
      const provider = new VirtualFileProvider();
      if (scenario === ExportScenario.ARCHIVE) {
        await provider.prepareArchive(this.getUIContext().getHostContext() as common.UIAbilityContext);
        this.fileName = '解压文件';
      } else {
        const directory = scenario === ExportScenario.DIRECTORY;
        provider.prepareDocuments(directory);
        this.fileName = directory ? '嵌套目录' : '文档';
      }
      this.provider = provider;
      this.ready = true;
    } catch (error) {
      console.error(`Prepare virtual file failed: ${JSON.stringify(error)}`);
      this.getUIContext().getPromptAction().showToast({ message: '文件准备失败，请重试' });
    } finally {
      this.busy = false;
    }
  }

// [Start virtual_drag_js_data]
  private createDragData(): unifiedDataChannel.UnifiedData {
    if (!this.provider) {
      throw new Error('请先准备文件');
    }
    const entry = this.provider.createVirtualEntry();
    const fileUri: uniformDataStruct.FileUri = {
      uniformDataType: 'general.file-uri',
      oriUri: `file:///virtual/${encodeURIComponent(entry.itemInfo.name)}`,
      fileType: entry.itemInfo.type === 'dir' ? 'general.directory' : 'general.file',
      virtualEntry: entry
    };
    const record = new unifiedDataChannel.UnifiedRecord(
      uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
    return new unifiedDataChannel.UnifiedData(record);
  }
// [End virtual_drag_js_data]

  private async receive(event: DragEvent): Promise<void> {
    try {
      await copyDroppedFiles(event, this.getUIContext().getHostContext() as common.UIAbilityContext);
      this.getUIContext().getPromptAction().showToast({ message: '文件已保存' });
    } catch (error) {
      console.error(`Copy dropped files failed: ${JSON.stringify(error)}`);
      this.getUIContext().getPromptAction().showToast({ message: '文件保存失败，请重试' });
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('虚拟文件拖拽').fontSize(24)
      Row({ space: 8 }) {
        Button('文档').onClick(() => { this.prepare(ExportScenario.DOCUMENT); }).enabled(!this.busy)
        Button('目录').onClick(() => { this.prepare(ExportScenario.DIRECTORY); }).enabled(!this.busy)
        Button('按需解压').onClick(() => { this.prepare(ExportScenario.ARCHIVE); }).enabled(!this.busy)
      }
      Text(this.ready ? `${this.fileName}：长按拖出` : '正在准备文件…')
        .width('100%').height(120).backgroundColor('#D9E8FF')
        .draggable(this.ready)
// [Start virtual_drag_js_start]
        .onDragStart((event: DragEvent) => {
          try {
            event.setData(this.createDragData());
          } catch (error) {
            console.error(`Set drag data failed: ${JSON.stringify(error)}`);
            this.getUIContext().getPromptAction().showToast({ message: '拖拽失败，请重试' });
          }
        })
// [End virtual_drag_js_start]
      Text('拖入文件以保存')
        .width('100%').height(120).backgroundColor('#DCF2DF')
        .allowDrop([uniformTypeDescriptor.UniformDataType.FILE_URI])
        .onDrop((event: DragEvent) => { this.receive(event); })
    }.padding(24).width('100%').height('100%')
  }
}
