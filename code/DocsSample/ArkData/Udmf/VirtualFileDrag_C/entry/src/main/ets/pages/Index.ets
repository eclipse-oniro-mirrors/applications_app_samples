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

import { NodeContent } from '@kit.ArkUI';
import type { common } from '@kit.AbilityKit';
import type { BusinessError } from '@kit.BasicServicesKit';
import nativeEntry from 'libentry.so';

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
    this.prepare(this.scenario);
    nativeEntry.createNativeNode(this.content, (uris: string[]) => { this.handleUris(uris); },
      this.getText('drop_hint'));
  }

  aboutToDisappear(): void {
    nativeEntry.destroyNativeNode();
  }

  private getText(name: string): string {
    const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
    return context.resourceManager.getStringByNameSync(name);
  }

  private prepare(scenario: ExportScenario): void {
    try {
      const label: string = scenario === ExportScenario.DIRECTORY ? 'source_directory' :
        (scenario === ExportScenario.ARCHIVE ? 'source_archive' : 'source_document');
      nativeEntry.configure(scenario === ExportScenario.DIRECTORY, scenario === ExportScenario.ARCHIVE,
        this.getText(label));
      this.scenario = scenario;
    } catch (error) {
      console.error(`Prepare virtual file failed, code: ${(error as BusinessError).code}`);
      this.getUIContext().getPromptAction().showToast({ message: $r('app.string.prepare_failed') });
    }
  }

  private handleUris(uris: string[]): void {
    // 业务可在此根据 URI 读取、复制或打开文件，示例仅提示已接收。
    this.getUIContext().getPromptAction().showToast({
      message: uris.length > 0 ? $r('app.string.uris_received', uris.length) : $r('app.string.receive_failed')
    });
  }

  build() {
    Column({ space: 20 }) {
      Text($r('app.string.drag_title'))
        .fontSize(24)
      Row({ space: 8 }) {
        Button($r('app.string.document'))
          .onClick(() => { this.prepare(ExportScenario.DOCUMENT); })
        Button($r('app.string.directory'))
          .onClick(() => { this.prepare(ExportScenario.DIRECTORY); })
        Button($r('app.string.archive'))
          .onClick(() => { this.prepare(ExportScenario.ARCHIVE); })
      }
      Row() {
        ContentSlot(this.content)
      }.width('100%').height(260)
    }
    .padding(24)
    .width('100%').height('100%')
  }
}
