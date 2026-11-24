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

import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AccountModel } from '../../../main/ets/model/AccountModel';
import { AccountKeyBuilder } from '../../../main/ets/model/AccountKeyBuilder';
import {
    startSampleApp, backToEntrance, existsId, waitId, tapId, typeId,
    confirmDialog, closeDialog, registerId, sleep,
    ID_MUSIC, ID_NAME, ID_PASSWORD, ID_LOGIN, ID_REGISTER, ID_COMPLETE,
    ID_MODIFY, ID_APPLICATION, ID_DELETE, COMPONENT_WAIT
} from './UiHelper';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const BUNDLE: string = 'Music';
const OTHER_BUNDLE: string = 'Video';
/** 用户名每个用例重新生成，避免读到上一次流程留下的应用账号。 */
let USER: string = 'ui_state_user';
const PASSWORD: string = 'statePass123';
const EMAIL: string = 'state@example.com';
const SIGNATURE: string = 'state-sign';

function accountNameOf(user: string, bundle: string): string {
    return AccountKeyBuilder.accountName(user, bundle);
}

async function dropAccount(model: AccountModel, name: string): Promise<void> {
    try {
        await model.deleteAccount(name);
    } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'account %{public}s absent, code=%{public}d', name, error.code);
    }
}

async function resetAccounts(model: AccountModel): Promise<void> {
    await dropAccount(model, accountNameOf(USER, BUNDLE));
    await dropAccount(model, accountNameOf(USER, OTHER_BUNDLE));
}

/** 凭据不存在时返回 true。 */
async function credentialAbsent(model: AccountModel, name: string, field: string): Promise<boolean> {
    try {
        await model.getAccountCredential(name, field);
        return false;
    } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'credential %{public}s absent, code=%{public}d', field, error.code);
        return true;
    }
}

async function submitRegister(driver: Driver): Promise<void> {
    await typeId(driver, registerId(1), USER);
    await typeId(driver, registerId(2), EMAIL);
    await typeId(driver, registerId(3), SIGNATURE);
    await typeId(driver, registerId(4), PASSWORD);
    await typeId(driver, registerId(5), PASSWORD);
    await tapId(driver, ID_COMPLETE);
    await closeDialog(driver);
    await sleep(200);
}

async function submitLogin(driver: Driver): Promise<void> {
    await typeId(driver, ID_NAME, USER);
    await typeId(driver, ID_PASSWORD, PASSWORD);
    await tapId(driver, ID_LOGIN);
    await closeDialog(driver);
    await sleep(200);
}

/** 从入口页走完注册与登录，停在账号页。 */
async function registerAndLogin(driver: Driver): Promise<void> {
    await tapId(driver, ID_MUSIC);
    await waitId(driver, ID_NAME, COMPONENT_WAIT);
    await tapId(driver, ID_REGISTER);
    await waitId(driver, registerId(1), COMPONENT_WAIT);
    await submitRegister(driver);
    await waitId(driver, ID_NAME, COMPONENT_WAIT);
    await submitLogin(driver);
    await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
}

export default function uiStateTest() {
    describe('UiStateTest', () => {
        let driver: Driver = Driver.create();
        let model: AccountModel = new AccountModel();

        beforeAll(async () => {
            await startSampleApp();
        });

        beforeEach(async () => {
            USER = 'state' + String(Date.now() % 1000000);
            await startSampleApp();
            await backToEntrance(driver);
            await resetAccounts(model);
        });

        /**
         * @tc.name   testUiState0031
         * @tc.number SUB_ACCT_UI_1031
         * @tc.desc   切换应用弹窗点确认后回到入口页，账号页三个按钮全部消失
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testUiState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiState0031 begin');
            await registerAndLogin(driver);
            const onAccountPage: boolean = await existsId(driver, ID_APPLICATION);
            await tapId(driver, ID_APPLICATION);
            const confirmed: boolean = await confirmDialog(driver);
            const backHome: boolean = await waitId(driver, ID_MUSIC, COMPONENT_WAIT);
            const accountGone: boolean = await existsId(driver, ID_MODIFY);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'before=%{public}s confirm=%{public}s home=%{public}s gone=%{public}s',
                String(onAccountPage), String(confirmed), String(backHome), String(accountGone));
            expect(onAccountPage).assertTrue();
            expect(confirmed).assertTrue();
            expect(backHome).assertTrue();
            expect(accountGone).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiState0031 end');
        });

        /**
         * @tc.name   testUiState0032
         * @tc.number SUB_ACCT_UI_1032
         * @tc.desc   删除弹窗点确认后回到登录页，账号页按钮不再渲染
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testUiState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiState0032 begin');
            await registerAndLogin(driver);
            await tapId(driver, ID_DELETE);
            const confirmed: boolean = await confirmDialog(driver);
            const backToLogin: boolean = await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const deleteGone: boolean = await existsId(driver, ID_DELETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'confirm=%{public}s login=%{public}s gone=%{public}s',
                String(confirmed), String(backToLogin), String(deleteGone));
            expect(confirmed).assertTrue();
            expect(backToLogin).assertTrue();
            expect(deleteGone).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiState0032 end');
        });

        /**
         * @tc.name   testUiState0033
         * @tc.number SUB_ACCT_UI_1033
         * @tc.desc   删除确认后凭据不可读，同一组凭据再登录仍停在登录页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testUiState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiState0033 begin');
            await registerAndLogin(driver);
            const name: string = accountNameOf(USER, BUNDLE);
            const beforeDelete: boolean = await credentialAbsent(model, name, 'email_' + BUNDLE);
            await tapId(driver, ID_DELETE);
            await confirmDialog(driver);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const afterDelete: boolean = await credentialAbsent(model, name, 'email_' + BUNDLE);
            await submitLogin(driver);
            const stillOnLogin: boolean = await existsId(driver, ID_NAME);
            const accountPageGone: boolean = await existsId(driver, ID_MODIFY);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'beforeAbsent=%{public}s afterAbsent=%{public}s login=%{public}s',
                String(beforeDelete), String(afterDelete), String(stillOnLogin));
            expect(beforeDelete).assertFalse();
            expect(afterDelete).assertTrue();
            expect(stillOnLogin).assertTrue();
            expect(accountPageGone).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiState0033 end');
        });
    })
}
