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

import { sleep } from './common';
// [Start import]
import { abilityToolAccessCtrl } from '@kit.abilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [End import]

export async function requestToolTicket(): Promise<string> {
  let result: string = '';
  // [Start requestToolTicketCliCmdPrepare]
  let cliCmdInfos: abilityToolAccessCtrl.CliCmdInfo[] = [{
     cliCmdName: 'ohos-batteryManager',
     subCliCmdName: 'total-energy'
  }];
  // [End requestToolTicketCliCmdPrepare]
  // [Start requestToolTicketTicketOptionsPrepare]
  let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
    ticketExpireTimeMs: 10000
  };
  // [End requestToolTicketTicketOptionsPrepare]
  // [Start requestToolTicketTicketFunctionCall]
  abilityToolAccessCtrl.requestToolTicket(
  cliCmdInfos, ticketOpions).then((data: abilityToolAccessCtrl.TicketQueryResult) => {
    // [StartExclude requestToolTicket]
    result = 'Succeeded in request tool ticket';
    // [EndExclude requestToolTicket]
    if (data.ticket) {
      // 用户已授权所有所需权限，获取到已认证的ticket，可用于执行CLI工具。
      console.info('ticket: ' + data.ticket);
    } else {
      // 用户尚未授权所有权限，查看需要授权的权限列表。
      for (let i = 0; i < data.permissionResults.length; i++) {
        let permission = data.permissionResults[i].permission;
        let status = data.permissionResults[i].permissionStatus;
        console.info(`permission: ${permission}, status: ${status}`);
      }
      // 引导用户完成权限授权后，再次调用requestToolTicket获取ticket。
    }
  // [End requestToolTicketTicketFunctionCall]
  // [Start requestToolTicketTicketErrorHandle]
  }).catch((err: BusinessError): void => {
    console.error(`requestToolTicket fail, code: ${err.code}, message: ${err.message}`);
    // [StartExclude requestToolTicket]
    result = 'Failed to request tool ticket';
    // [EndExclude requestToolTicket]
  });
  // [End requestToolTicketTicketErrorHandle]
  await sleep(500);
  return result;
}