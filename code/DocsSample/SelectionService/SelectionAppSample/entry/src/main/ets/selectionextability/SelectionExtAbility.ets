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

// [Start SelectionExtAbility]
import SelectionExtensionAbility from '@ohos.selectionInput.SelectionExtensionAbility';
import { PanelInfo, PanelType } from '@ohos.selectionInput.SelectionPanel';
import selectionManager from '@ohos.selectionInput.selectionManager';
import { SelectionModel } from '../models/SelectionModel';
import Want from '@ohos.app.ability.Want';
import rpc from '@ohos.rpc';
import hilog from '@ohos.hilog';

class SelectionAbilityStub extends rpc.RemoteObject {
  constructor(des: string) {
    super(des);
  }

  onRemoteMessageRequest(
    code: number,
    data: rpc.MessageSequence,
    reply: rpc.MessageSequence,
    options: rpc.MessageOption
  ): boolean | Promise<boolean> {
    return true;
  }
}

class SelectionExtAbility extends SelectionExtensionAbility {
  private panel_: selectionManager.Panel | undefined = undefined;

  onConnect(want: Want): rpc.RemoteObject {
    try {
      SelectionModel.getInstance()?.setContext(this.context);
      selectionManager.onSelectionComplete((info: selectionManager.SelectionInfo) => {
        if (this.panel_ == undefined) {
          this.createSelectionPanel();
        }
        this.onSelected(info);
      });
    } catch(error) {
      hilog.info(0x0000, 'SelectionExtensionAbility',
        `Failed to onConnect, ${error.code}, errormessage: ${error.message}`);
    }
    return new SelectionAbilityStub('remote');
  }

  onDisconnect(): void {
    if (!this.panel_) {
      hilog.info(0x0000, 'SelectionExtensionAbility', 'Panel is not cerated yet.');
      return;
    }
    let panelTemp = this.panel_;
    if (panelTemp !== undefined) {
      panelTemp.onHide(() => {
        hilog.info(0x0000, 'SelectionExtensionAbility', 'Panel has hidden.');
      });
      selectionManager.destroyPanel(panelTemp);
    }
  }

  async createSelectionPanel() {
    let panelInfo: PanelInfo = {
      panelType: PanelType.MENU_PANEL,
      x: 0,
      y: 0,
      width: 500,
      height: 300
    }
    try {
      let panel: selectionManager.Panel = await selectionManager.createPanel(this.context, panelInfo);    // 创建菜单面板
      this.panel_ = panel;
      await panel.setUiContent('pages/MenuPanel')   // 设置菜单面板样式
    } catch(error) {
      hilog.info(0x0000, 'SelectionExtensionAbility',
        `Failed to createPanel, error:${error.code}, errormessage: ${error.message}`);
    }
  }

  async onSelected(info: selectionManager.SelectionInfo) {
    SelectionModel.getInstance()?.setSelectionInfo(info);
    try {
      let content = await selectionManager.getSelectionContent();   // 获取划词内容
      SelectionModel.getInstance()?.setSelectionContent(content);
    } catch (error) {
      console.error(`Failed to get selection content: ${error.code}, errormessage: ${error.message}`);
    }
    if (!this.panel_) {
      hilog.info(0x0000, 'SelectionExtensionAbility', 'Panel is not created yet.');
    }
    this.panel_?.moveToGlobalDisplay(info.startDisplayX, info.startDisplayY)    // 将弹窗移动到用户鼠标划词的起始点
      .then(() => {
        hilog.info(0x0000, 'SelectionExtensionAbility', 'Move succeed.');
      })
      .catch((error) => {
        hilog.info(0x0000, 'SelectionExtensionAbility',
          `Failed to move, error: ${error.code}, errormessage: ${error.message}`);
      });

    this.panel_?.show()    // 显示弹窗
      .then(() => {
        hilog.info(0x0000, 'SelectionExtensionAbility', 'Show succeed.');
      });

    this.panel_?.onHide(() => {    // 监听弹窗隐藏（窗口失焦时会触发隐藏）
      hilog.info(0x0000, 'SelectionExtensionAbility', 'panel has hidden.');
    })
  }
}

export default SelectionExtAbility;
// [End SelectionExtAbility]