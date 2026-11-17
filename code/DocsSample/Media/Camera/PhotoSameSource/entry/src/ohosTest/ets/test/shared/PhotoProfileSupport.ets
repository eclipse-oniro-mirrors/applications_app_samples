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

import { camera } from '@kit.CameraKit';

export function previewProfile(width: number, height: number, format: number): camera.Profile {
  return { format: format, size: { width: width, height: height } };
}

export function videoProfile(width: number, height: number, format: number, min: number, max: number): camera.VideoProfile {
  return { format: format, size: { width: width, height: height }, frameRateRange: { min: min, max: max } };
}

export function capability(previews: camera.Profile[], videos: camera.VideoProfile[],
  photos: camera.Profile[]): camera.CameraOutputCapability {
  return {
    previewProfiles: previews,
    photoProfiles: photos,
    videoProfiles: videos,
    supportedMetadataObjectTypes: []
  } as camera.CameraOutputCapability;
}
