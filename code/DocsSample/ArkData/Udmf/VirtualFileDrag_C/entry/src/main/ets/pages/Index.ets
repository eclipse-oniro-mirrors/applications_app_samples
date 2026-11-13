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
    nativeEntry.createNativeNode(this.content, (uris: string[]) => { this.handleUris(uris); });
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

  private handleUris(uris: string[]): void {
    // 业务可在此根据 URI 读取、复制或打开文件，示例仅提示已接收。
    this.getUIContext().getPromptAction().showToast({
      message: uris.length > 0 ? `已接收 ${uris.length} 个文件 URI` : '未获取到文件 URI，请重试'
    });
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
      }.width('100%').height(260)
    }.padding(24).width('100%').height('100%')
  }
}
