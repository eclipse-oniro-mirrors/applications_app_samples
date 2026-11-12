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

const MOCK_SCENE_EN_RAWFILE: string = 'scene_mock_en.json';

/**
 * 读取英文演示场景数据（数据来自 resources/rawfile/scene_mock_en.json）。
 */
export function getMockEn(): string {
  const content: Uint8Array = getContext().resourceManager.getRawFileContentSync(MOCK_SCENE_EN_RAWFILE);
  return util.TextDecoder.create('utf-8').decodeToString(content);
}
