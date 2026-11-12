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

import { util } from '@kit.ArkTS';

const PROFILE_ECA_RAWFILE: string = 'scene_profile_eca.json';

/**
 * 读取演示设备物模型数据（数据来自 resources/rawfile/scene_profile_eca.json）。
 */
export function getProfileEca(): string {
  const content: Uint8Array = getContext().resourceManager.getRawFileContentSync(PROFILE_ECA_RAWFILE);
  return util.TextDecoder.create('utf-8').decodeToString(content);
}
