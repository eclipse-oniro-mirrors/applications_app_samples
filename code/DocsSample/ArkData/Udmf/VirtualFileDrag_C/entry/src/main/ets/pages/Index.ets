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

import nativeEntry from 'libentry.so';
import { NodeContent } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import { copyDroppedFiles } from '../model/DropReceiver';

@Entry
@Component
struct Index {
  private content: NodeContent = new NodeContent();

  aboutToAppear(): void {
    nativeEntry.createNativeNode(this.content);
    nativeEntry.configure(this.directory, this.compressed);
  }

  aboutToDisappear(): void {
    nativeEntry.destroyNativeNode();
  }

  @State private status: string = '默认导出一个文档；选择场景后从蓝色区域拖出。';
  @State private directory: boolean = false;
  @State private compressed: boolean = false;

  private configure(): void {
    nativeEntry.configure(this.directory, this.compressed);
    this.status = `场景：${this.directory ? '嵌套目录' : '单个文件'}，${this.compressed ? '按需解压' : '文档导出'}`;
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Text('虚拟文件拖拽 · C API').fontSize(24)
        Row({ space: 8 }) {
          Text('嵌套目录')
          Toggle({ type: ToggleType.Switch, isOn: this.directory }).onChange((value: boolean) => {
            this.directory = value;
            this.configure();
          })
        }
        Row({ space: 8 }) {
          Text('首次读取时解压内容')
          Toggle({ type: ToggleType.Switch, isOn: this.compressed }).onChange((value: boolean) => {
            this.compressed = value;
            this.configure();
          })
        }
        Row() {
          ContentSlot(this.content)
        }.width('100%').height(120)
        Text('将另一示例的文件拖入这里，复制到当前应用沙箱')
          .width('100%').height(120).backgroundColor('#DCF2DF')
          .allowDrop([uniformTypeDescriptor.UniformDataType.FILE_URI])
          .onDrop((event: DragEvent) => {
            copyDroppedFiles(event, this.getUIContext().getHostContext() as common.UIAbilityContext, (message: string) => {
              this.status = `${message}\n${this.status}`.slice(0, 5000);
            });
          })
        Text(this.status).fontSize(14).width('100%').copyOption(CopyOptions.InApp)
        Text('提供方回调日志：hilog 中搜索 VirtualFileDragC').fontSize(14)
      }.padding(16).width('100%')
    }.height('100%')
  }
}
