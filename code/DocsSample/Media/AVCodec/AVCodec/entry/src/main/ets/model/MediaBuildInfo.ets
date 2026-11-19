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

import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import Logger from '../common/utils/Logger';

export interface MediaBuildIdentity {
  appVersion: string;
  revision: string;
  sourceDigest: string;
  builtAt: string;
}

export class MediaBuildInfo {
  private static identity: MediaBuildIdentity | undefined = undefined;

  static bind(manager: resourceManager.ResourceManager): void {
    try {
      const bytes: Uint8Array = manager.getRawFileContentSync('build-info.json');
      const identity: MediaBuildIdentity = JSON.parse(util.TextDecoder.create('utf-8').decodeToString(bytes)) as
        MediaBuildIdentity;
      if (!MediaBuildInfo.valid(identity)) { throw new Error('Invalid build identity'); }
      MediaBuildInfo.identity = identity;
    } catch (error) {
      MediaBuildInfo.identity = undefined;
      Logger.warn('MediaBuildInfo', 'Read build identity failed: ' + String(error));
    }
  }

  static valid(identity: MediaBuildIdentity): boolean {
    return identity !== null && typeof identity === 'object' && typeof identity.appVersion === 'string' &&
      identity.appVersion.length > 0 && identity.appVersion.length <= 128 &&
      typeof identity.revision === 'string' &&
      (identity.revision === 'unknown' || /^[0-9a-f]{40,64}$/.test(identity.revision)) &&
      typeof identity.sourceDigest === 'string' && /^[0-9a-f]{64}$/.test(identity.sourceDigest) &&
      typeof identity.builtAt === 'string' && identity.builtAt.length <= 40 &&
      Number.isFinite(Date.parse(identity.builtAt));
  }

  static current(): MediaBuildIdentity | undefined {
    const value: MediaBuildIdentity | undefined = MediaBuildInfo.identity;
    return value === undefined ? undefined : {
      appVersion: value.appVersion,
      revision: value.revision,
      sourceDigest: value.sourceDigest,
      builtAt: value.builtAt
    };
  }
}
