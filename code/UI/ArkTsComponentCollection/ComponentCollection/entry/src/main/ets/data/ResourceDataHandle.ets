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
 * @file entry/src/main/ets/data/ResourceDataHandle.ets
 * 文件职责：ResourceDataHandle 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：getStringArrayData、getStringData。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import Logger from '../util/Logger';

let context = getContext(this);

/**
 * getStringArrayData：函数定义，承载本文件对应的逻辑与数据。
 */
export function getStringArrayData(resourceArrayData: Resource[]): string[] {
  if (!resourceArrayData) {
    return [];
  }
  let resourceStringArrayData: string[] = [];
  resourceArrayData.forEach(item => {
    try {
      resourceStringArrayData.push(context.resourceManager.getStringSync(item.id));
    } catch (error) {
      Logger.error(`callback getStringValue failed, error code: ${error.code}, message: ${error.message}.`);
    }
  })
  return resourceStringArrayData;
}

/**
 * getStringData：函数定义，承载本文件对应的逻辑与数据。
 */
export function getStringData(resourceData: Resource): string {
  if (!resourceData) {
    return '';
  }
  return context.resourceManager.getStringSync(resourceData.id);
}