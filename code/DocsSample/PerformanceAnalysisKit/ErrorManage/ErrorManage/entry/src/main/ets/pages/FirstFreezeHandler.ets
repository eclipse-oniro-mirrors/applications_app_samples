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

// [Start first_freeze_handler]
import { errorManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;

let firstHandler: errorManager.FreezeObserver = () => {};
const firstFreezeHandler: errorManager.FreezeObserver = () => {
    // 自定义的第一个FreezeHandler实现逻辑
    hilog.info(DOMAIN, 'testErrorManage', '%{public}s', '[FirstHandler] First freeze handler invoked.');
    if (firstHandler) {
        firstHandler();
    } else {
        hilog.info(DOMAIN, 'testErrorManage', '%{public}s', '[FirstHandler] First freeze handler end.');
    }
};

export function setFirstFreezeHandler() {
    try {
        firstHandler = errorManager.setDefaultFreezeObserver(firstFreezeHandler);
    } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        hilog.error(DOMAIN, 'testErrorManage', 'error: %{public}s, %{public}s', `${code}`, `${message}`);
    }
    hilog.info(DOMAIN, 'testErrorManage', '%{public}s', 'Registered First freeze Handler.');
}
// [End first_freeze_handler]
