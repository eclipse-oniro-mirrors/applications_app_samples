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

/**
 * 获取Object的所有键名
 * 由于ArkTS中无Object.keys方法，需将此方法单独抽离至ts文件中
 * 参考平台 API 文档中 data.preferences 相关说明
 *
 * @param obj - 目标Object
 * @returns string[] 键名数组
 */
export function getObjectKeys(obj: Object): string[] {
  let keys = Object.keys(obj);
  return keys;
}
