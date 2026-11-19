/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { abilityAccessCtrl, common, Permissions } from '@kit.AbilityKit';

const TAG = 'Tag_MicPermission';
const MIC_PERMISSION: Permissions = 'ohos.permission.MICROPHONE';

/**
 * Check microphone permission; request it if not granted.
 * Returns true if permission is already granted or was just granted,
 * false if the user denied or an error occurred.
 */
export async function ensureMicrophonePermission(context: common.UIAbilityContext): Promise<boolean> {
  const atManager = abilityAccessCtrl.createAtManager();
  const tokenId = context.applicationInfo.accessTokenId;

  try {
    const status = await atManager.checkAccessToken(tokenId, MIC_PERMISSION);
    if (status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
      console.info(`${TAG}: Microphone permission already granted`);
      return true;
    }
    console.info(`${TAG}: Microphone permission not granted, requesting...`);
    const result = await atManager.requestPermissionsFromUser(context, [MIC_PERMISSION]);
    const granted = result.authResults.length > 0 &&
      result.authResults[0] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    console.info(`${TAG}: Permission request result: granted=${granted}`);
    return granted;
  } catch (err) {
    const e = err as Error;
    console.error(`${TAG}: Permission check failed: ${e.message}`);
    return false;
  }
}
