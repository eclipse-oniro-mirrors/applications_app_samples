import { InfConstants, InfControl } from '@ohos/common';

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
export class NetCfgControl implements InfControl {
  private netCfgRecord: Record<string, string> = {};
  private serviceName: string = InfConstants.NET_CFG;

  constructor(netCfgRecord: Record<string, string>) {
    this.netCfgRecord = netCfgRecord;
  }

  public setServiceName(serviceName: string) {
    this.serviceName = serviceName;
  }

  public getServiceName(): string {
    return this.serviceName;
  }

  public getServiceId(): string {
    return '';
  }

  public getDataJson(): string {
    return JSON.stringify(this.netCfgRecord);
  }
}