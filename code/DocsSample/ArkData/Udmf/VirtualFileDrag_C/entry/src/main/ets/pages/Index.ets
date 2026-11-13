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

enum ExportScenario {
  DOCUMENT,
  DIRECTORY,
  ARCHIVE
}

@Entry
@Component
struct Index {
  private scenario: ExportScenario = ExportScenario.DOCUMENT;
  private content: NodeContent = new NodeContent();

  aboutToAppear(): void {
    nativeEntry.createNativeNode(this.content);
    this.prepare(this.scenario);
  }

  aboutToDisappear(): void {
    nativeEntry.destroyNativeNode();
  }

  private prepare(scenario: ExportScenario): void {
    try {
      nativeEntry.configure(scenario === ExportScenario.DIRECTORY, scenario === ExportScenario.ARCHIVE);
      this.scenario = scenario;
    } catch (error) {
      console.error(`Prepare virtual file failed: ${JSON.stringify(error)}`);
      this.getUIContext().getPromptAction().showToast({ message: '文件准备失败，请重试' });
    }
  }

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
        Button('文档').onClick(() => { this.prepare(ExportScenario.DOCUMENT); })
        Button('目录').onClick(() => { this.prepare(ExportScenario.DIRECTORY); })
        Button('按需解压').onClick(() => { this.prepare(ExportScenario.ARCHIVE); })
      }
      Row() {
        ContentSlot(this.content)
      }.width('100%').height(120).backgroundColor('#D9E8FF')
      Text('拖入文件以保存')
        .width('100%').height(120).backgroundColor('#DCF2DF')
        .allowDrop([uniformTypeDescriptor.UniformDataType.FILE_URI])
        .onDrop((event: DragEvent) => { this.receive(event); })
    }.padding(24).width('100%').height('100%')
  }
}
