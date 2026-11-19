/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export const tempDirName: string = 'dest';

/**
 * Normalizes a system locale for the native ContentEmbed query APIs.
 *
 * resourceManager reports Java/ICU-style locales ("zh_Hans_CN", underscore
 * separated with a script subtag), which OH_ContentEmbed_GetContentEmbedInfo
 * rejects with CE_ERR_PARAM_INVALID; the APIs expect BCP-47-like values such
 * as "zh-cn". Lowercases, swaps '_' for '-' and drops the 4-letter script
 * subtag ("zh_hans_cn" -> "zh-cn", "en_US" -> "en-us", "en" -> "en").
 *
 * @param raw Locale string from resourceManager (any casing/separator style)
 * @returns Lowercased language[-region] string accepted by the native APIs
 */
export function normalizeLocale(raw: string): string {
  let loc: string = raw.toLowerCase().replace(/_/g, '-');
  const parts: string[] = loc.split('-');
  if (parts.length >= 3 && parts[1].length === 4) {
    parts.splice(1, 1);
    loc = parts.join('-');
  }
  return loc;
}