/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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

import common from '@ohos.app.ability.common';
import consts from '../module/Consts';
import dataPreferences from '@ohos.data.preferences';
import Logger from '../module/Logger';

const TAG: string = '[Sample_CustomCommonEvent]';

export default class HistoryFeature {
  constructor(abilityContext: common.UIAbilityContext) {
    this.innerContext = abilityContext;
  }

  static shouldKeep(detail: Array<string>): boolean {
    return JSON.stringify(detail) !== '[]';
  }

  static assemble(records: Array<string>, details: Array<Array<string>>): Array<Array<string>> {
    const kept: Array<Array<string>> = [];
    for (let index = 0; index < records.length; index++) {
      if (HistoryFeature.shouldKeep(details[index])) {
        kept.push(details[index]);
      }
    }
    return kept;
  }

  static isCompleteRecord(detail: Array<string>): boolean {
    if (detail.length < 4) {
      return false;
    }
    for (let index = 0; index < 4; index++) {
      let field: string = detail[index];
      if (!field) {
        return false;
      }
    }
    return true;
  }

  async getData(): Promise<Array<Array<string>>> {
    await this.init();
    return new Promise<Array<Array<string>>>((resolve) => {
      resolve(this.dataSource);
    });
  }

  private async init(): Promise<void> {
    const prefer: dataPreferences.Preferences =
      await dataPreferences.getPreferences(this.innerContext, consts.DATA_BASE_NAME);
    let records: Array<string> = [];
    await prefer.get(consts.DATA_BASE_KEY_TOTAL_TIMES, []).then((value: Array<string>) => {
      records = value;
    });
    let details: Array<Array<string>> = [];
    for (let item of records) {
      await prefer.get(item, []).then((detail: Array<string>) => {
        details.push(detail);
      }).catch((error) => {
        Logger.info(TAG, `Failed to get value code is ${error.code}`);
        details.push([]);
      });
    }
    this.dataSource = HistoryFeature.assemble(records, details);
  }

  private dataSource: Array<Array<string>> = [];
  private innerContext: common.UIAbilityContext = null;
}