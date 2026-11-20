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
 * 资源字符串读取工具：用于需要在纯字符串上下文（如模型字段、字符串比较、字符串拼接）中使用资源文案的场景。
 */
export class StringRes {
  private static cache: Map<number, string> = new Map<number, string>();

  public static get(res: Resource): string {
    let cached: string | undefined = StringRes.cache.get(res.id);
    if (cached !== undefined) {
      return cached;
    }
    let value: string = getContext().resourceManager.getStringSync(res);
    StringRes.cache.set(res.id, value);
    return value;
  }
}
