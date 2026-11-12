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

@Entry
@Component
struct Index {
  @State private status: string = '选择场景并准备文件，随后长按蓝色区域拖出。';
  @State private ready: boolean = false;
  @State private busy: boolean = false;
  @State private url: string = '';
  @State private fileSize: string = '';
  private provider?: VirtualFileProvider;

  private log(message: string): void {
    console.info(`[VirtualFileDrag] ${message}`);
    this.status = `${message}\n${this.status}`.slice(0, 5000);
  }

  private async prepare(scenario: number): Promise<void> {
    this.ready = false;
    this.busy = true;
    try {
      const provider = new VirtualFileProvider((message: string) => this.log(message));
      if (scenario === 2) {
        await provider.prepareNetwork(this.url, Number(this.fileSize));
      } else if (scenario === 3) {
        await provider.prepareArchive(this.getUIContext().getHostContext() as common.UIAbilityContext);
      } else {
        provider.prepareDocuments(scenario === 1);
      }
      this.provider = provider;
      this.ready = true;
      this.log('文件元数据已就绪，可拖到文件管理器、桌面或另一示例的接收区');
    } catch (error) {
      this.log(`准备失败：${JSON.stringify(error)}`);
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

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text('虚拟文件拖拽 · ArkTS').fontSize(24)
        Row({ space: 8 }) {
          Button('文档').onClick(() => { this.prepare(0); }).enabled(!this.busy)
          Button('嵌套目录').onClick(() => { this.prepare(1); }).enabled(!this.busy)
          Button('ZIP 内文件').onClick(() => { this.prepare(3); }).enabled(!this.busy)
        }
        TextInput({ placeholder: '支持 Range 的 HTTPS 文件地址', text: this.url })
          .onChange((value: string) => { this.url = value; })
        TextInput({ placeholder: '网络文件准确大小（字节）', text: this.fileSize })
          .type(InputType.Number).onChange((value: string) => { this.fileSize = value; })
        Button('准备网络文件').onClick(() => { this.prepare(2); }).enabled(!this.busy)
        Text(this.ready ? '长按这里拖出文件' : '请先准备文件')
          .width('100%').height(100).backgroundColor('#D9E8FF')
          .draggable(this.ready)
// [Start virtual_drag_js_start]
          .onDragStart((event: DragEvent) => {
            try {
              event.setData(this.createDragData());
              this.log('已设置拖拽数据，等候目标应用读取');
            } catch (error) {
              this.log(`设置拖拽数据失败：${JSON.stringify(error)}`);
            }
          })
// [End virtual_drag_js_start]
          .onDragEnd(() => { this.log('拖拽结束；不在此处取消目标应用的读取'); })
        Text('将另一示例的文件拖入这里，复制到当前应用沙箱')
          .width('100%').height(100).backgroundColor('#DCF2DF')
          .allowDrop([uniformTypeDescriptor.UniformDataType.FILE_URI])
          .onDrop((event: DragEvent) => {
            copyDroppedFiles(event, this.getUIContext().getHostContext() as common.UIAbilityContext,
              (message: string) => this.log(message));
          })
        Text(this.status).width('100%').fontSize(14).copyOption(CopyOptions.InApp)
      }.padding(16).width('100%')
    }.height('100%')
  }
}
