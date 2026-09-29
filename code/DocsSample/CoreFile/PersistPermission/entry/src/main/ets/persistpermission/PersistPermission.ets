/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// [Start activate_permission_example]
// [Start revoke_permission_example]
// [Start persist_permission_example]
import { BusinessError } from '@kit.BasicServicesKit';
import { picker } from '@kit.CoreFileKit';
import { fileShare } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';

// [StartExclude activate_permission_example]
// [StartExclude revoke_permission_example]
export async function persistPermissionExample(context: common.UIAbilityContext): Promise<void> {
  try {
    // [StartExclude persist_permission_example]
    // [Start can_use_example]
    if (!canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization')) {
      console.error('this api is not supported on this device');
      return;
    }
    // [End can_use_example]
    // [EndExclude persist_permission_example]
    let store = await preferences.getPreferences(context, { name: 'persist_permission' });
    let documentSelectOptions = new picker.DocumentSelectOptions();
    let documentPicker = new picker.DocumentViewPicker();
    let uris = await documentPicker.select(documentSelectOptions);
    if (uris.length === 0) {
      console.info('No URI selected');
      return;
    }
    // 可以组合授予多个权限，例如读写权限可使用 fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE。 
    // 注意：只能对已获取到的临时权限进行持久化授权操作，否则会报错。
    let policyInfo: fileShare.PolicyInfo = {
      uri: uris[0],
      operationMode: fileShare.OperationMode.READ_MODE,
    };
    let policies: fileShare.PolicyInfo[] = [policyInfo];
    await fileShare.persistPermission(policies);
    // 此示例保存最近一次成功持久化授权的 URI，供激活和撤销操作使用。
    await store.put('uri', uris[0]);
    await store.flush();
    console.info('persistPermission successfully');
  } catch (error) {
    let err = error as BusinessError<Array<fileShare.PolicyErrorResult>>;
    console.error(`persistPermission failed with err, Error code: ${err.code}, message: ${err.message}`);
    if (err.code === 13900001 && err.data) {
      for (let i = 0; i < err.data.length; i++) {
        console.error('error code : ' + JSON.stringify(err.data[i].code));
        console.error('error uri : ' + JSON.stringify(err.data[i].uri));
        console.error('error reason : ' + JSON.stringify(err.data[i].message));
      }
    }
  }
}
// [End persist_permission_example]
// [EndExclude revoke_permission_example]
export async function revokePermissionExample(context: common.UIAbilityContext): Promise<void> {
  try {
    let store = await preferences.getPreferences(context, { name: 'persist_permission' });
    // 使用 Picker 获取且成功持久化授权的 URI，不手动构造 URI。
    let uri = await store.get('uri', '') as string;
    if (uri.length === 0) {
      console.info('Persist a URI before using this operation');
      return;
    }
    // 可以组合取消多个权限，例如读写权限可使用 fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE。 
    // 注意：只能对已获取到的持久化权限进行取消持久化授权操作，否则会报错。
    let policyInfo: fileShare.PolicyInfo = {
      uri: uri,
      operationMode: fileShare.OperationMode.READ_MODE,
    };
    let policies: fileShare.PolicyInfo[] = [policyInfo];
    await fileShare.revokePermission(policies);
    await store.delete('uri');
    await store.flush();
    console.info('revokePermission successfully');
  } catch (error) {
    let err = error as BusinessError<Array<fileShare.PolicyErrorResult>>;
    console.error(`revokePermission failed with err, Error code: ${err.code}, message: ${err.message}`);
    if (err.code === 13900001 && err.data) {
      for (let i = 0; i < err.data.length; i++) {
        console.error('error code : ' + JSON.stringify(err.data[i].code));
        console.error('error uri : ' + JSON.stringify(err.data[i].uri));
        console.error('error reason : ' + JSON.stringify(err.data[i].message));
      }
    }
  }
}
// [End revoke_permission_example]
// [EndExclude activate_permission_example]
export async function activatePermissionExample(context: common.UIAbilityContext): Promise<void> {
  try {
    let store = await preferences.getPreferences(context, { name: 'persist_permission' });
    // 使用 Picker 获取且成功持久化授权的 URI，不手动构造 URI。
    let uri = await store.get('uri', '') as string;
    if (uri.length === 0) {
      console.info('Persist a URI before using this operation');
      return;
    }
    // 可以组合激活多个权限，例如读写权限可使用 fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE。 
    // 注意：只能对已获取到的持久化权限进行激活持久化授权操作，否则会报错。
    let policyInfo: fileShare.PolicyInfo = {
      uri: uri,
      operationMode: fileShare.OperationMode.READ_MODE,
    };
    let policies: fileShare.PolicyInfo[] = [policyInfo];
    await fileShare.activatePermission(policies);
    console.info('activatePermission successfully');
  } catch (error) {
    let err = error as BusinessError<Array<fileShare.PolicyErrorResult>>;
    console.error(`activatePermission failed with err, Error code: ${err.code}, message: ${err.message}`);
    if (err.code === 13900001 && err.data) {
      for (let i = 0; i < err.data.length; i++) {
        console.error('error code : ' + JSON.stringify(err.data[i].code));
        console.error('error uri : ' + JSON.stringify(err.data[i].uri));
        console.error('error reason : ' + JSON.stringify(err.data[i].message));
      }
    }
  }
}
// [End activate_permission_example]