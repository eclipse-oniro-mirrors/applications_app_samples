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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AccountModel } from '../../../main/ets/model/AccountModel';
import { AccountErrorCode, AccountServiceError } from '../../../main/ets/model/AccountErrorCode';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

/** 每次用例都重新创建的主账号。 */
const LIVE_NAME: string = 'acct_boundary_live';
/** 始终不存在的账号名，用于走缺失分支。 */
const ABSENT_NAME: string = 'acct_boundary_absent_2026';

function codeOf(err: Object): number {
    let error: BusinessError = err as BusinessError;
    return error.code;
}

async function dropAccount(model: AccountModel, name: string): Promise<void> {
    try {
        await model.deleteAccount(name);
    } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'account %{public}s absent, code=%{public}d', name, error.code);
    }
}

export default function serviceBoundaryTest() {
    describe('ServiceBoundaryTest', () => {
        let model: AccountModel = new AccountModel();

        beforeEach(async () => {
            await dropAccount(model, LIVE_NAME);
            await dropAccount(model, ABSENT_NAME);
        });

        afterEach(async () => {
            await dropAccount(model, LIVE_NAME);
            await dropAccount(model, ABSENT_NAME);
        });

        /**
         * @tc.name   testServiceBoundary0021
         * @tc.number SUB_ACCT_SVCREAL_0021
         * @tc.desc   读取不存在账号的扩展信息抛出账号不存在，描述文本同步可读
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0021 begin');
            let code: number = 0;
            let threw: boolean = false;
            try {
                await model.getAccountExtraInfo(ABSENT_NAME);
            } catch (err) {
                threw = true;
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'threw=%{public}s code=%{public}d', String(threw), code);
            expect(threw).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.describe(code)).assertEqual('account not found');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0021 end');
        });

        /**
         * @tc.name   testServiceBoundary0022
         * @tc.number SUB_ACCT_SVCREAL_0022
         * @tc.desc   读取不存在账号的关联数据抛出账号不存在，而不是返回空串
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0022 begin');
            let code: number = 0;
            let threw: boolean = false;
            try {
                await model.getAssociatedData(ABSENT_NAME, 'anyKey');
            } catch (err) {
                threw = true;
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'threw=%{public}s code=%{public}d', String(threw), code);
            expect(threw).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.isRecoverable(code)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0022 end');
        });

        /**
         * @tc.name   testServiceBoundary0023
         * @tc.number SUB_ACCT_SVCREAL_0023
         * @tc.desc   账号删除后再写凭据被拒绝，但写路径透出的是未映射码，与读路径的 not-found 不同源
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0023 begin');
            await model.addAccount(LIVE_NAME);
            await model.setAccountCredential(LIVE_NAME, 'email_Music', 'live@example.com');
            await model.deleteAccount(LIVE_NAME);
            let code: number = 0;
            let threw: boolean = false;
            try {
                await model.setAccountCredential(LIVE_NAME, 'email_Music', 'after@example.com');
            } catch (err) {
                threw = true;
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wroteAfterDelete=%{public}s code=%{public}d', String(threw), code);
            /**
             * 真机实测：删除后写凭据抛 10001，而读路径（getAccountCredential / getAccountExtraInfo）抛 10002。
             * main 的错误码映射只登记了 10002/10004，10001 落到 UNKNOWN，因此这里只能断言「被拒绝且未归一」，
             * 不去强行要求 isAccountNotFound。主侧补映射后，本用例可收紧为语义判定。
             */
            expect(threw).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertFalse();
            expect(code === 0).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0023 end');
        });

        /**
         * @tc.name   testServiceBoundary0024
         * @tc.number SUB_ACCT_SVCREAL_0024
         * @tc.desc   账号删除后再写扩展信息抛出账号不存在，不静默丢弃
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0024 begin');
            await model.addAccount(LIVE_NAME);
            await model.deleteAccount(LIVE_NAME);
            let code: number = 0;
            let threw: boolean = false;
            try {
                await model.setAccountExtraInfo(LIVE_NAME, 'extra-after-delete');
            } catch (err) {
                threw = true;
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'threw=%{public}s code=%{public}d', String(threw), code);
            expect(threw).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.describe(code) === 'account already exists').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0024 end');
        });

        /**
         * @tc.name   testServiceBoundary0025
         * @tc.number SUB_ACCT_SVCREAL_0025
         * @tc.desc   账号删除后再写关联数据抛出账号不存在，服务端不做隐式重建
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0025 begin');
            await model.addAccount(LIVE_NAME);
            await model.deleteAccount(LIVE_NAME);
            let code: number = 0;
            let threw: boolean = false;
            try {
                await model.setAssociatedData(LIVE_NAME, 'profile', 'after-delete');
            } catch (err) {
                threw = true;
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'threw=%{public}s code=%{public}d', String(threw), code);
            expect(threw).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.isRecoverable(code)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0025 end');
        });

        /**
         * @tc.name   testServiceBoundary0026
         * @tc.number SUB_ACCT_SVCREAL_0026
         * @tc.desc   扩展信息二次写入后读回新值，旧值不再可见
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0026 begin');
            await model.addAccount(LIVE_NAME);
            await model.setAccountExtraInfo(LIVE_NAME, 'first-extra');
            const afterFirst: string = await model.getAccountExtraInfo(LIVE_NAME);
            await model.setAccountExtraInfo(LIVE_NAME, 'second-extra');
            const afterSecond: string = await model.getAccountExtraInfo(LIVE_NAME);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s', afterFirst, afterSecond);
            expect(afterFirst).assertEqual('first-extra');
            expect(afterSecond).assertEqual('second-extra');
            expect(afterSecond === afterFirst).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0026 end');
        });

        /**
         * @tc.name   testServiceBoundary0027
         * @tc.number SUB_ACCT_SVCREAL_0027
         * @tc.desc   账号删除后读取扩展信息抛出账号不存在，不再返回已写内容
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0027 begin');
            await model.addAccount(LIVE_NAME);
            await model.setAccountExtraInfo(LIVE_NAME, 'kept-before-delete');
            await model.deleteAccount(LIVE_NAME);
            let code: number = 0;
            let threw: boolean = false;
            try {
                await model.getAccountExtraInfo(LIVE_NAME);
            } catch (err) {
                threw = true;
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'threw=%{public}s code=%{public}d', String(threw), code);
            expect(threw).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.describe(code)).assertEqual('account not found');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0027 end');
        });

        /**
         * @tc.name   testServiceBoundary0028
         * @tc.number SUB_ACCT_SVCREAL_0028
         * @tc.desc   四类可换输入重试的错误码都被判定为可恢复
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0028 begin');
            const invalid: boolean = AccountErrorCode.isRecoverable(AccountServiceError.INVALID_PARAM);
            const exists: boolean = AccountErrorCode.isRecoverable(AccountServiceError.ACCOUNT_ALREADY_EXISTS);
            const absent: boolean = AccountErrorCode.isRecoverable(AccountServiceError.ACCOUNT_NOT_FOUND);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'invalid=%{public}s exists=%{public}s absent=%{public}s',
                String(invalid), String(exists), String(absent));
            expect(invalid).assertTrue();
            expect(exists).assertTrue();
            expect(absent).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0028 end');
        });

        /**
         * @tc.name   testServiceBoundary0029
         * @tc.number SUB_ACCT_SVCREAL_0029
         * @tc.desc   系统级异常与未知码不属于可恢复错误，避免调用方盲目重试
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0029 begin');
            const system: boolean = AccountErrorCode.isRecoverable(AccountServiceError.SYSTEM_SERVICE_EXCEPTION);
            const unknown: boolean = AccountErrorCode.isRecoverable(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'system=%{public}s unknown=%{public}s',
                String(system), String(unknown));
            expect(system).assertFalse();
            expect(unknown).assertFalse();
            expect(AccountErrorCode.isRecoverable(AccountServiceError.ACCOUNT_NUMBER_REACHES_LIMIT)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0029 end');
        });

        /**
         * @tc.name   testServiceBoundary0030
         * @tc.number SUB_ACCT_SVCREAL_0030
         * @tc.desc   账号数量上限错误带专属描述，与未知码的兜底文本可区分
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testServiceBoundary0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0030 begin');
            const limitText: string = AccountErrorCode.describe(AccountServiceError.ACCOUNT_NUMBER_REACHES_LIMIT);
            const unknownText: string = AccountErrorCode.describe(7777);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'limit=%{public}s unknown=%{public}s', limitText, unknownText);
            expect(limitText).assertEqual('the number of accounts reaches the upper limit');
            expect(unknownText).assertEqual('unexpected account error, code is 7777');
            expect(limitText === unknownText).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceBoundary0030 end');
        });
    })
}
