'use static'
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

// [Start MenuPanel]
import { SelectionModel } from '../models/SelectionModel';
import { PanelInfo, PanelType } from '@ohos.selectionInput.SelectionPanel';
import selectionManager from '@ohos.selectionInput.selectionManager';
import SelectionExtensionContext from '@ohos.selectionInput.SelectionExtensionContext';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import {Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct MenuPanel {
  @State message: string = 'MenuPanel';
  selectionInfo: selectionManager.SelectionInfo | undefined = undefined;

  CreateMainPanel() {
    this.selectionInfo = SelectionModel.getInstance()?.getSelectionInfo();
    let panelInfo: PanelInfo = {
      panelType: PanelType.MAIN_PANEL,
      x: 0,
      y: 0,
      width: 1500,
      height: 1000
    }
    let contextTemp = SelectionModel.getInstance()?.getContext();
    if (contextTemp !== undefined) {
      selectionManager.createPanel(contextTemp, panelInfo)
        .then(async (panel: selectionManager.Panel) => {
          SelectionModel.getInstance()?.setSelectionPanel(panel);
          hilog.info(0x0000, 'SelectionExtensionAbility', 'Succeed to create main panel');

          if (this.selectionInfo !== undefined) {
            panel.moveToGlobalDisplay((this.selectionInfo as selectionManager.SelectionInfo).startDisplayX + 100,
              (this.selectionInfo as selectionManager.SelectionInfo).startDisplayY + 100);
          }
          try {
            panel.onDestroy(() => {
              hilog.info(0x0000, 'SelectionExtensionAbility', 'panel has destroyed');
            })
          } catch (error) {
            hilog.info(0x0000, 'SelectionExtensionAbility', 'Failed to listen window destroy');
          }
          panel.setUiContent('pages/MainPanel')
            .then(() => {
              hilog.info(0x0000, 'SelectionExtensionAbility', 'Succeed to setUiContent [pages/MainPanel].');
            })
            .catch((error) => {
              hilog.info(0x0000, 'SelectionExtensionAbility',
                `Failed to setUiContent of main panel, error: error:${error.code}, errormessage: ${error.message}`);
              return;
            });

          await panel.show()
            .then(() => {
              hilog.info(0x0000, 'SelectionExtensionAbility', 'Succeed to show main panel.');
            })
        })
    }
  }

  startEntryAbility() {   // 拉起应用
    let wantAbility: Want = {
      bundleName: 'com.selection.selectionapplication',   // 应用的bundleName
      abilityName: 'EntryAbility',    // 应用的abilityName
    };
    let context: SelectionExtensionContext | undefined = SelectionModel.getInstance()?.getContext();
    if (context !== undefined) {
      context.startAbility(wantAbility)
        .then(() => {
          hilog.info(0x0000, 'SelectionExtensionAbility', `startAbility success, want: ${wantAbility.abilityName}`);
        })
    }
  }

  build() {
    Column() {
      Button('click to show MAIN_PANEL')
        .onClick(() => {
          this.CreateMainPanel();
        })
      Button('start EntryAbility')
        .onClick(() => {
          this.startEntryAbility();
        })
    }
    .backgroundColor('#AAFFFF')
    .height('100%')
    .width('100%')
  }
}
// [End MenuPanel]