/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

'use static'

// [Start MainPanel]
import {Entry, Text, Column, Component, RelativeContainer, Button, ClickEvent, TouchEvent, TouchType } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { SelectionModel } from '../models/SelectionModel';
import selectionManager from '@ohos.selectionInput.selectionManager';

@Entry
@Component
struct MainPanel {
  @State message: string = 'MainPanel';

  aboutToAppear(): void {
    let selectionModel: SelectionModel | undefined = SelectionModel.getInstance();
    if (selectionModel !== undefined) {
      let selectionInfo = (selectionModel as SelectionModel).getSelectionInfo();
      if (selectionInfo !== undefined) {
        this.message = selectionInfo.bundleName;
      }
    } else {
      return;
    }
    
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('MainPanelHelloWorld')
        .fontSize(8)
    }
    .onTouch((event: TouchEvent) => {
      if (event.type === TouchType.Down) {
        let selectionPanel: selectionManager.Panel | undefined = SelectionModel.getInstance()?.getSelectionPanel();
        if (selectionPanel !== undefined) {
          selectionPanel.startMoving();   // 调用selectionManager提供的startMoving接口可实现划词面板随鼠标拖动
        }
      }
    })
    .backgroundColor('#AAA000')
    .height('100%')
    .width('100%')
  }
}
// [End MainPanel]