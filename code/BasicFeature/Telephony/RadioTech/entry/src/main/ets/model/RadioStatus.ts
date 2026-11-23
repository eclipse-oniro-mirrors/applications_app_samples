/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import Logger from './Logger';
import { radio, sim } from '@kit.TelephonyKit';
import { NetworkStateFormatter, NetworkStateSnapshot } from './NetworkStateFormatter';
import { RadioTechFormatter, RadioTechSnapshot } from './RadioTechFormatter';
import { SignalFormatter, SignalSnapshot } from './SignalFormatter';
import { SimInfoFormatter } from './SimInfoFormatter';
import { SlotModel } from './SlotModel';

const TAG: string = '[RadioStatus]';

export class RadioStatus {
  constructor() {
  }

  async getSimSpn(slotId: number): Promise<string> {
    const simSpn: string = await sim.getSimSpn(slotId);
    const formatted: string = SimInfoFormatter.formatSpn(simSpn);
    Logger.info(`${TAG}, getSimSpn radioTech = ${formatted}`);
    return formatted;
  }

  async getRadioTech(slotId: number): Promise<string> {
    const radioTech: radio.NetworkRadioTech = await radio.getRadioTech(slotId);
    const snapshot: RadioTechSnapshot = {
      psRadioTech: radioTech.psRadioTech,
      csRadioTech: radioTech.csRadioTech
    };
    const formatted: string = RadioTechFormatter.format(snapshot);
    Logger.info(`${TAG}, getRadioTech radioTech = ${formatted}`);
    return formatted;
  }

  async getSignalInformation(slotId: number): Promise<string> {
    const signalInformation: radio.SignalInformation[] = await radio.getSignalInformation(slotId);
    const snapshots: SignalSnapshot[] = [];
    for (let index: number = 0; index < signalInformation.length; index++) {
      snapshots.push({
        signalType: signalInformation[index].signalType,
        signalLevel: signalInformation[index].signalLevel,
        dBm: signalInformation[index].dBm
      });
    }
    const formatted: string = SignalFormatter.formatList(snapshots);
    Logger.info(`${TAG}, getSignalInformation signalInformation = ${formatted}`);
    return formatted;
  }

  async getNetworkSelectionMode(slotId: number): Promise<string> {
    Logger.info(`${TAG}, getNetworkSelectionMode networkSelectionMode start`);
    const networkSelectionMode: radio.NetworkSelectionMode = await radio.getNetworkSelectionMode(slotId);
    const formatted: string = SlotModel.selectionModeName(networkSelectionMode);
    Logger.info(`${TAG}, getNetworkSelectionMode networkSelectionMode = ${formatted}`);
    return formatted;
  }

  async getISOCountryCodeForNetwork(slotId: number): Promise<string> {
    const iSOCountryCode: string = await radio.getISOCountryCodeForNetwork(slotId);
    const formatted: string = SimInfoFormatter.formatIsoCountryCode(iSOCountryCode);
    Logger.info(`${TAG}, getISOCountryCodeForNetwork iSOCountryCode = ${formatted}`);
    return formatted;
  }

  async getNetworkState(): Promise<string> {
    const data: radio.NetworkState = await radio.getNetworkState();
    const snapshot: NetworkStateSnapshot = {
      longOperatorName: data.longOperatorName,
      shortOperatorName: data.shortOperatorName,
      plmnNumeric: data.plmnNumeric,
      isRoaming: data.isRoaming,
      regState: data.regState,
      nsaState: data.nsaState,
      isCaActive: data.isCaActive,
      isEmergency: data.isEmergency
    };
    const networkState: string = NetworkStateFormatter.format(snapshot);
    Logger.info(`${TAG}, getNetworkState networkState = ${networkState}`);
    return networkState;
  }

  async getRadioOn(): Promise<string> {
    Logger.info(`${TAG}, getRadioOn radioOn start`);
    const radioOn: boolean = await radio.isRadioOn();
    const formatted: string = SimInfoFormatter.formatRadioOn(radioOn);
    Logger.info(`${TAG}, getRadioOn radioOn = ${formatted}`);
    return formatted;
  }
}
