/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

/**
 * @file entry/src/main/ets/pages/globalMethods/GlobalMethodData.ets
 * 文件职责：GlobalMethodData 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ThirdLevelCategory } from '../../model/CategoricalDataType'

const DIALOG: ThirdLevelCategory =
  {
    image: $r('app.media.ic_dialog'),
    // image：图标 / 图片资源
    title: $r('app.string.dialog'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.alert_dialog'),
        // title：文本内容
        url: 'pages/globalMethods/dialogs/alertDialogSample/AlertDialogSample'
        // url：资源地址
      },
      {
        title: $r('app.string.custom_dialog'),
        // title：文本内容
        url: 'pages/globalMethods/dialogs/customDialogSample/CustomDialogSample'
        // url：资源地址
      },
      {
        title: $r('app.string.date_picker_dialog'),
        // title：文本内容
        url: 'pages/globalMethods/dialogs/dateDialogSample/DateDialogSample'
        // url：资源地址
      },
      {
        title: $r('app.string.time_picker_dialog'),
        // title：文本内容
        url: 'pages/globalMethods/dialogs/timeDialogSample/TimeDialogSample'
        // url：资源地址
      },
      {
        title: $r('app.string.action_sheet_dialog'),
        // title：文本内容
        url: 'pages/globalMethods/dialogs/actionSheetDialogSample/ActionSheetDialogSample'
        // url：资源地址
      },
      {
        title: $r('app.string.text_picker_dialog'),
        // title：文本内容
        url: 'pages/globalMethods/dialogs/textPickerDialogSample/TextPickerDialogSample'
        // url：资源地址
      }
    ]
  }

const MENU: ThirdLevelCategory =
  {
    image: $r('app.media.ic_global_menu'),
    // image：图标 / 图片资源
    title: $r('app.string.global_menu'),
    // title：文本内容
    url: 'pages/globalMethods/dialogs/menuSample/MenuSample',
    // url：资源地址
  }

const BINDSHEET: ThirdLevelCategory =
  {
    image: $r('app.media.ic_bindSheet'),
    // image：图标 / 图片资源
    title: $r('app.string.global_bindSheet_menu'),
    // title：文本内容
    url: 'pages/globalMethods/dialogs/bindSheetSample/BindSheetSample',
    // url：资源地址
  }

const POPUP: ThirdLevelCategory =
  {
    image: $r('app.media.ic_popUp'),
    // image：图标 / 图片资源
    title: $r('app.string.global_popUp_menu'),
    // title：文本内容
    url: 'pages/globalMethods/dialogs/popUpSample/PopUpSample',
    // url：资源地址
  }

// The global method categorizes data, second menu data
export const GLOBAL_METHOD_CATEGORIES: ThirdLevelCategory[] = [DIALOG,MENU, BINDSHEET, POPUP]