/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/utils/Util.ets
 * 文件职责：Util 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：resolveIP。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { BusinessError } from '@kit.BasicServicesKit';

/**
 * resolveIP：函数定义，承载本文件对应的逻辑与数据。
 */
export function resolveIP(ip: number) {
  let throwError = (error: BusinessError<string>) => {
    throw error as Error;
  }
  const errorTips: BusinessError<string>= {
    name: 'ErrorTips',
    message: 'the number is not normal',
    code: 400,
    data: 'the number is not normal'
  }
  if (ip < 0 || ip > 0xFFFFFFFF) {
    throwError(errorTips);
  }
  return (ip >>> 24) + '.' + (ip >> 16 & 0xFF) + '.' + (ip >> 8 & 0xFF) + '.' + (ip & 0xFF);
}