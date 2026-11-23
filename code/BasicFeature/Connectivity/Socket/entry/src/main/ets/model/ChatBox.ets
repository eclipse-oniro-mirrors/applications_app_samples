/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/model/ChatBox.ets
 * 文件职责：ChatBox 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChatBox。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

export class ChatBox {
  isSend: boolean
  message: string
  date: string

  /** 构造 ChatBox 实例。 */
  constructor(isSend: boolean, message: string, date: string) {
    this.isSend = isSend
    this.message = message
    this.date = date
  }
}