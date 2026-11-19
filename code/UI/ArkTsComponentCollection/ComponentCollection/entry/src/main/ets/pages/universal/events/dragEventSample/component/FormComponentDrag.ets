/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/pages/universal/events/dragEventSample/component/FormComponentDrag.ets
 * 文件职责：FormComponentDrag 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FormComponentDrag。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import Logger from '../../../../../util/Logger';

const TAG = '[FormComponentDrag]';

/**
 * FormComponentDrag：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct FormComponentDrag {
  // @State formId：组件内部状态
  @State formId: string = '0'
  // @State visible：组件内部状态
  @State visible: boolean = true

  @Builder pixelMapBuilder() {
    // FormComponent：卡片组件
    // 关键属性：allowUpdate、尺寸、圆角
    FormComponent({
      id: this.formId,
      name: "widget",
      bundle: "com.ohos.camera",
      ability: "com.ohos.camera.FormAbility",
      module: "phone",
      dimension: FormDimension.Dimension_1_2,
      temporary: false
    }).id('form_component_drag_form_component_1')
      .allowUpdate(true)
      .size({ width: 160, height: 52 })
      .borderRadius(24)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // FormComponent：卡片组件
    // 关键属性：allowUpdate、尺寸、圆角、可见性、onAcquired
    FormComponent({
      id: this.formId,
      name: "widget",
      bundle: "com.ohos.camera",
      ability: "com.ohos.camera.FormAbility",
      module: "phone",
      dimension: FormDimension.Dimension_1_2,
      temporary: false
    })
      .id('formComponent')
      .allowUpdate(true)
      .size({ width: 160, height: 52 })
      .borderRadius(24)
      .visibility(this.visible ? Visibility.Visible : Visibility.Hidden)
      .onAcquired((form: FormCallbackInfo) => {
        if (form.id === -1) {
          this.formId = form.idString
        } else {
          this.formId = form.id.toString()
        }
      })
      .onError((err: ErrorInformation) => {
        Logger.error(TAG, `fail to add form, errcode: ${err.errcode}, msg: ${err.msg}`)
      })
      .onDragStart(() => {
        this.visible = false
        return this.pixelMapBuilder
      })
      .onDragEnd(() => {
        this.visible = true
      })
  }
}