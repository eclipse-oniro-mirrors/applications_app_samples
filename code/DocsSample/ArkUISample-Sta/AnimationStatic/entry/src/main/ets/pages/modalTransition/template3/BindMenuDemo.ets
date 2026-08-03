'use static'
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

// [Start bind_menu_demo]
import hilog from '@ohos.hilog';
import { common } from '@kit.AbilityKit';
import {
  $r,
  Entry,
  Component,
  Column,
  Button,
  FlexAlign,
  ResourceStr,
  MenuElement
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

const DOMAIN: int = 0xF811;
const TAG: string = '[Sample_Animation]';

class BMD {
  public value: ResourceStr = '';
  public action: () => void = () => {
  };
}

@Entry
@Component
struct BindMenuDemo {
  @State items: Array<MenuElement> = [
    {
      // 请将$r('app.string.modal_transition_text23')替换为实际资源文件，在本示例中该资源文件的value值为"菜单项1"
      value: $r('app.string.modal_transition_text23'),
      action: () => {
        hilog.info(DOMAIN, TAG, 'handle Menu1 select');
      }
    } as MenuElement,
    {
      // 请将$r('app.string.modal_transition_text24')替换为实际资源文件，在本示例中该资源文件的value值为"菜单项2"
      value: $r('app.string.modal_transition_text24'),
      action: () => {
        hilog.info(DOMAIN, TAG, 'handle Menu2 select');
      }
    } as MenuElement
  ]

  build(): void {
    Column() {
      Button('click')
        .backgroundColor(0x409eff)
        // 第一步: 定义一组数据用来表示菜单按钮项
        // 第二步: 通过bindMenu接口将菜单数据绑定给元素
        .bindMenu(this.items)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height(437)
  }
}

// [End bind_menu_demo]
