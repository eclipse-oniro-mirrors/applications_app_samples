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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppInfo } from '../../../../main/ets/bridge/DragAndExchangeBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new AppInfo (1 cases). */
export default function appInfoCtorTest(): void {
  describe('AppInfoCtorTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_APP_INFO_CTOR_0001
     * @tc.name      DragAndExchange_AppInfoCtor_0001
     * @tc.desc      new AppInfo() initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_AppInfoCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}AppInfoCtor_0001 begin`);
      const subject: AppInfo = new AppInfo();
      logInfo(`new AppInfo(): subject.icon=${subject.icon}`);
      expect(subject.icon).assertEqual('');
      logInfo(`new AppInfo(): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new AppInfo(): subject.visible=${subject.visible}`);
      expect(subject.visible).assertTrue();
      logInfo(`${BUNDLE}AppInfoCtor_0001 end`);
    });
  });
}
