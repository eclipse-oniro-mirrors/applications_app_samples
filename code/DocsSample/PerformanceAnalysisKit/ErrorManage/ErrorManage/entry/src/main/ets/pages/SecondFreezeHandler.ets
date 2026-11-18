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

// [Start second_freeze_handler]
import { errorManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;

let secondHandler: errorManager.FreezeObserver = () => {};
const secondFreezeHandler: errorManager.FreezeObserver = () => {
    // 自定义的第二个SecondHandler实现逻辑
    hilog.info(DOMAIN, 'testErrorManage', '%{public}s', '[SecondHandler] Second freeze handler invoked.');
    if (secondHandler) {
        secondHandler();
    } else {
        hilog.info(DOMAIN, 'testErrorManage', '%{public}s', '[SecondHandler] Second freeze handler end.');
    }
};

export function setSecondFreezeHandler() {
    try {
        secondHandler = errorManager.setDefaultFreezeObserver(secondFreezeHandler);
    } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        hilog.error(DOMAIN, 'testErrorManage', 'error: %{public}s, %{public}s', `${code}`, `${message}`);
    }
    hilog.info(DOMAIN, 'testErrorManage', '%{public}s', 'Registered Second freeze Handler.');
}
// [End second_freeze_handler]
