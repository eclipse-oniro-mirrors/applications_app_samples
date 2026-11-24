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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import preferences from '@ohos.data.preferences';
import { AccountModel } from '../../../main/ets/model/AccountModel';
import { AccountData } from '../../../main/ets/model/AccountData';
import { AccountKeyBuilder } from '../../../main/ets/model/AccountKeyBuilder';
import { AccountErrorCode } from '../../../main/ets/model/AccountErrorCode';
import { TestContextHolder } from '../testability/TestContextHolder';
import {
    AccountValidator, LoginInput, LoginResult, ModifyInput, ModifyResult, RegisterInput, RegisterResult
} from '../../../main/ets/model/AccountValidator';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const MUSIC: string = 'svc_Music';
const VIDEO: string = 'svc_Video';

function codeOf(err: Object): number {
    let error: BusinessError = err as BusinessError;
    return error.code;
}

async function dropStore(context: common.Context, name: string): Promise<void> {
    try {
        await preferences.deletePreferences(context, name);
    } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'store %{public}s absent, code=%{public}d', name, error.code);
    }
}

async function dropAccount(model: AccountModel, name: string): Promise<void> {
    try {
        await model.deleteAccount(name);
    } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'account %{public}s absent, code=%{public}d', name, error.code);
    }
}

export default function serviceRealTest() {
    describe('ServiceRealTest', () => {
        let delegatorContext: common.Context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
        let context: common.Context = TestContextHolder.getContext(delegatorContext);
        let model: AccountModel = new AccountModel();
        let data: AccountData = AccountData.getInstance();
        const user: string = 'svc_user';
        const accountName: string = AccountKeyBuilder.accountName(user, MUSIC);

        beforeEach(async () => {
            await dropStore(context, MUSIC);
            await dropStore(context, VIDEO);
            await dropStore(context, accountName);
            await dropStore(context, AccountKeyBuilder.accountName(user, VIDEO));
            await dropAccount(model, accountName);
            await dropAccount(model, AccountKeyBuilder.accountName(user, VIDEO));
        });

        afterEach(async () => {
            await dropStore(context, MUSIC);
            await dropStore(context, VIDEO);
            await dropStore(context, accountName);
            await dropStore(context, AccountKeyBuilder.accountName(user, VIDEO));
            await dropAccount(model, accountName);
            await dropAccount(model, AccountKeyBuilder.accountName(user, VIDEO));
        });

        /**
         * @tc.name   testServiceReal0001
         * @tc.number SUB_ACCT_SVCREAL_0001
         * @tc.desc   注册流程写入账号、两项凭据、关联数据与偏好设置，五处都可读回
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testServiceReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0001 begin');
            const input: RegisterInput = {
                username: user, email: 'tom@example.com', signature: 'hello',
                password: 'pass123', confirmPassword: 'pass123'
            };
            const check: RegisterResult = AccountValidator.validateRegister(input, false);
            await model.addAccount(accountName);
            await model.setAccountCredential(accountName,
                AccountKeyBuilder.credentialType(AccountKeyBuilder.EMAIL_FIELD, MUSIC), input.email);
            await model.setAccountCredential(accountName,
                AccountKeyBuilder.credentialType(AccountKeyBuilder.SIGNATURE_FIELD, MUSIC), input.signature);
            await model.setAssociatedData(accountName, AccountKeyBuilder.associatedKey(MUSIC), input.password);
            await data.putStorageValue(context, user, input.password, MUSIC);
            await data.putStorageValue(context, MUSIC, AccountKeyBuilder.LOGIN_FLAG, accountName);
            expect(check).assertEqual(RegisterResult.OK);
            expect(await model.getAccountCredential(accountName, 'email_' + MUSIC)).assertEqual('tom@example.com');
            expect(await model.getAssociatedData(accountName, 'key_' + MUSIC)).assertEqual('pass123');
            expect(String(await data.getStorageValue(context, user, MUSIC))).assertEqual('pass123');
            expect(String(await data.getStorageValue(context, MUSIC, accountName)))
                .assertEqual(AccountKeyBuilder.LOGIN_FLAG);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0001 end');
        });

        /**
         * @tc.name   testServiceReal0002
         * @tc.number SUB_ACCT_SVCREAL_0002
         * @tc.desc   用注册产物做登录判定，密码与标记都匹配时返回成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testServiceReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0002 begin');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            await data.putStorageValue(context, MUSIC, AccountKeyBuilder.LOGIN_FLAG, accountName);
            const stored: string = String(await data.getStorageValue(context, user, MUSIC));
            const flag: string = String(await data.getStorageValue(context, MUSIC, accountName));
            const input: LoginInput = { name: user, password: 'pass123' };
            const check: LoginResult = AccountValidator.validateLogin(input, stored, flag);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'stored=%{public}s flag=%{public}s check=%{public}d', stored, flag, check);
            expect(check).assertEqual(LoginResult.OK);
            expect(stored).assertEqual('pass123');
            expect(flag).assertEqual(AccountKeyBuilder.LOGIN_FLAG);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0002 end');
        });

        /**
         * @tc.name   testServiceReal0003
         * @tc.number SUB_ACCT_SVCREAL_0003
         * @tc.desc   登录密码与已保存密码不同时判定为失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testServiceReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0003 begin');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            await data.putStorageValue(context, MUSIC, AccountKeyBuilder.LOGIN_FLAG, accountName);
            const stored: string = String(await data.getStorageValue(context, user, MUSIC));
            const flag: string = String(await data.getStorageValue(context, MUSIC, accountName));
            const input: LoginInput = { name: user, password: 'pass124' };
            const check: LoginResult = AccountValidator.validateLogin(input, stored, flag);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d expected=%{public}d', check, LoginResult.FAILED);
            expect(check).assertEqual(LoginResult.FAILED);
            expect(check === LoginResult.OK).assertFalse();
            expect(stored).assertEqual('pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0003 end');
        });

        /**
         * @tc.name   testServiceReal0004
         * @tc.number SUB_ACCT_SVCREAL_0004
         * @tc.desc   未写入登录标记时读回字符串 null，登录判定回落到失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0004 begin');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            const flag: string = String(await data.getStorageValue(context, MUSIC, accountName));
            const input: LoginInput = { name: user, password: 'pass123' };
            const check: LoginResult = AccountValidator.validateLogin(input, 'pass123', flag);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'flag=%{public}s check=%{public}d', flag, check);
            expect(flag).assertEqual('null');
            expect(check).assertEqual(LoginResult.FAILED);
            expect(check === LoginResult.OK).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0004 end');
        });

        /**
         * @tc.name   testServiceReal0005
         * @tc.number SUB_ACCT_SVCREAL_0005
         * @tc.desc   修改流程只改资料不改密码时返回无密码成功，已存密码保持不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testServiceReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0005 begin');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            const input: ModifyInput = {
                email: 'new@example.com', signature: 'new-sign', password: '', confirmPassword: ''
            };
            const check: ModifyResult = AccountValidator.validateModify(input, 'pass123');
            expect(check).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
            expect(String(await data.getStorageValue(context, user, MUSIC))).assertEqual('pass123');
            expect(check === ModifyResult.OK_WITH_PASSWORD).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0005 end');
        });

        /**
         * @tc.name   testServiceReal0006
         * @tc.number SUB_ACCT_SVCREAL_0006
         * @tc.desc   修改流程改密码时返回有密码成功，偏好设置写入新密码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testServiceReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0006 begin');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            const input: ModifyInput = {
                email: 'new@example.com', signature: 'new-sign', password: 'fresh456', confirmPassword: 'fresh456'
            };
            const check: ModifyResult = AccountValidator.validateModify(input, 'pass123');
            await data.putStorageValue(context, user, input.password, MUSIC);
            expect(check).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(String(await data.getStorageValue(context, user, MUSIC))).assertEqual('fresh456');
            expect(String(await data.getStorageValue(context, user, MUSIC)) === 'pass123').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0006 end');
        });

        /**
         * @tc.name   testServiceReal0007
         * @tc.number SUB_ACCT_SVCREAL_0007
         * @tc.desc   修改流程新密码与旧密码相同时返回密码相同分支，偏好设置不被覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0007 begin');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            const input: ModifyInput = {
                email: '', signature: '', password: 'pass123', confirmPassword: 'pass123'
            };
            const check: ModifyResult = AccountValidator.validateModify(input, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d expected=%{public}d', check,
                ModifyResult.PASSWORD_SAME_AS_OLD);
            expect(check).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
            expect(String(await data.getStorageValue(context, user, MUSIC))).assertEqual('pass123');
            expect(check === ModifyResult.OK_WITH_PASSWORD).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0007 end');
        });

        /**
         * @tc.name   testServiceReal0008
         * @tc.number SUB_ACCT_SVCREAL_0008
         * @tc.desc   修改流程确认密码不一致时返回不一致分支，偏好设置不被覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0008 begin');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            const input: ModifyInput = {
                email: '', signature: '', password: 'fresh456', confirmPassword: 'fresh457'
            };
            const check: ModifyResult = AccountValidator.validateModify(input, 'pass123');
            expect(check).assertEqual(ModifyResult.CONFIRM_MISMATCH);
            expect(String(await data.getStorageValue(context, user, MUSIC))).assertEqual('pass123');
            expect(check === ModifyResult.OK_WITH_PASSWORD).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0008 end');
        });

        /**
         * @tc.name   testServiceReal0009
         * @tc.number SUB_ACCT_SVCREAL_0009
         * @tc.desc   删除流程同时移除应用账号与偏好设置，两处读回都回到缺失态
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testServiceReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0009 begin');
            await model.addAccount(accountName);
            await model.setAssociatedData(accountName, 'key_' + MUSIC, 'pass123');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            await model.deleteAccount(accountName);
            await data.deleteStorageValue(context, user, MUSIC);
            let code: number = 0;
            try {
                await model.getAssociatedData(accountName, 'key_' + MUSIC);
            } catch (err) {
                code = codeOf(err);
            }
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(String(await data.getStorageValue(context, user, MUSIC))).assertEqual('null');
            expect(await data.hasStorageValue(context, user, MUSIC)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0009 end');
        });

        /**
         * @tc.name   testServiceReal0010
         * @tc.number SUB_ACCT_SVCREAL_0010
         * @tc.desc   删除后重新注册同名用户可以成功，且读到新的关联数据
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0010 begin');
            await model.addAccount(accountName);
            await model.setAssociatedData(accountName, 'key_' + MUSIC, 'first-pass');
            await model.deleteAccount(accountName);
            await model.addAccount(accountName);
            await model.setAssociatedData(accountName, 'key_' + MUSIC, 'second-pass');
            const actual: string = await model.getAssociatedData(accountName, 'key_' + MUSIC);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'second-pass');
            expect(actual).assertEqual('second-pass');
            expect(actual === 'first-pass').assertFalse();
            expect(actual.length).assertEqual(11);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0010 end');
        });

        /**
         * @tc.name   testServiceReal0011
         * @tc.number SUB_ACCT_SVCREAL_0011
         * @tc.desc   同一用户在两个示例应用下的账号与偏好设置互相隔离
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0011 begin');
            const videoAccount: string = AccountKeyBuilder.accountName(user, VIDEO);
            await model.addAccount(accountName);
            await model.addAccount(videoAccount);
            await model.setAssociatedData(accountName, 'key_' + MUSIC, 'music-pass');
            await model.setAssociatedData(videoAccount, 'key_' + VIDEO, 'video-pass');
            await data.putStorageValue(context, user, 'music-pass', MUSIC);
            await data.putStorageValue(context, user, 'video-pass', VIDEO);
            expect(await model.getAssociatedData(accountName, 'key_' + MUSIC)).assertEqual('music-pass');
            expect(await model.getAssociatedData(videoAccount, 'key_' + VIDEO)).assertEqual('video-pass');
            expect(String(await data.getStorageValue(context, user, MUSIC))).assertEqual('music-pass');
            expect(String(await data.getStorageValue(context, user, VIDEO))).assertEqual('video-pass');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0011 end');
        });

        /**
         * @tc.name   testServiceReal0012
         * @tc.number SUB_ACCT_SVCREAL_0012
         * @tc.desc   注册时邮箱为空则不写邮箱凭据，读取该凭据抛出错误
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testServiceReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0012 begin');
            await model.addAccount(accountName);
            await model.setAssociatedData(accountName, 'key_' + MUSIC, 'pass123');
            let code: number = 0;
            try {
                await model.getAccountCredential(accountName, 'email_' + MUSIC);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'code=%{public}d', code);
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isRecoverable(code)).assertTrue();
            expect(await model.getAssociatedData(accountName, 'key_' + MUSIC)).assertEqual('pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0012 end');
        });

        /**
         * @tc.name   testServiceReal0013
         * @tc.number SUB_ACCT_SVCREAL_0013
         * @tc.desc   注册时签名与邮箱都为空，只写关联数据，两项凭据均读不到
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testServiceReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0013 begin');
            await model.addAccount(accountName);
            let emailCode: number = 0;
            let signCode: number = 0;
            try {
                await model.getAccountCredential(accountName, 'email_' + MUSIC);
            } catch (err) {
                emailCode = codeOf(err);
            }
            try {
                await model.getAccountCredential(accountName, 'signature_' + MUSIC);
            } catch (err) {
                signCode = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'emailCode=%{public}d signCode=%{public}d', emailCode, signCode);
            expect(emailCode).assertEqual(signCode);
            expect(emailCode === 0).assertFalse();
            expect(AccountErrorCode.isRecoverable(emailCode)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0013 end');
        });

        /**
         * @tc.name   testServiceReal0014
         * @tc.number SUB_ACCT_SVCREAL_0014
         * @tc.desc   邮箱非法的注册输入在校验阶段被拦下，不会创建应用账号
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0014 begin');
            const input: RegisterInput = {
                username: user, email: 'bad-email', signature: '', password: 'pass123', confirmPassword: 'pass123'
            };
            const check: RegisterResult = AccountValidator.validateRegister(input, false);
            let code: number = 0;
            try {
                await model.getAccountCredential(accountName, 'email_' + MUSIC);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d code=%{public}d', check, code);
            expect(check).assertEqual(RegisterResult.EMAIL_INVALID);
            expect(AccountErrorCode.isRecoverable(code)).assertTrue();
            expect(check === RegisterResult.OK).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0014 end');
        });

        /**
         * @tc.name   testServiceReal0015
         * @tc.number SUB_ACCT_SVCREAL_0015
         * @tc.desc   用户名为空的注册输入返回空用户名分支，优先于其它分支
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0015 begin');
            const input: RegisterInput = {
                username: '', email: 'bad-email', signature: '', password: '', confirmPassword: 'x'
            };
            const check: RegisterResult = AccountValidator.validateRegister(input, true);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d expected=%{public}d', check,
                RegisterResult.USERNAME_EMPTY);
            expect(check).assertEqual(RegisterResult.USERNAME_EMPTY);
            expect(check === RegisterResult.ACCOUNT_EXISTS).assertFalse();
            expect(check === RegisterResult.EMAIL_INVALID).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0015 end');
        });

        /**
         * @tc.name   testServiceReal0016
         * @tc.number SUB_ACCT_SVCREAL_0016
         * @tc.desc   重复注册同名用户返回账号已存在，原有凭据保持不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0016 begin');
            await model.addAccount(accountName);
            await model.setAccountCredential(accountName, 'email_' + MUSIC, 'first@example.com');
            const input: RegisterInput = {
                username: user, email: 'second@example.com', signature: '', password: 'pass123',
                confirmPassword: 'pass123'
            };
            const exists: boolean = await data.hasStorageValue(context, user, MUSIC);
            const check: RegisterResult = AccountValidator.validateRegister(input, true);
            let code: number = 0;
            try {
                await model.addAccount(accountName);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'exists=%{public}s check=%{public}d code=%{public}d', String(exists), check,
                code);
            expect(exists).assertFalse();
            expect(check).assertEqual(RegisterResult.ACCOUNT_EXISTS);
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isAccountAlreadyExists(code)).assertTrue();
            expect(await model.getAccountCredential(accountName, 'email_' + MUSIC)).assertEqual('first@example.com');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0016 end');
        });

        /**
         * @tc.name   testServiceReal0017
         * @tc.number SUB_ACCT_SVCREAL_0017
         * @tc.desc   登录密码为空时返回空密码分支，不依赖已保存密码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0017 begin');
            const input: LoginInput = { name: user, password: '' };
            const check: LoginResult = AccountValidator.validateLogin(input, 'null', 'null');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d expected=%{public}d', check, LoginResult.PASSWORD_EMPTY);
            expect(check).assertEqual(LoginResult.PASSWORD_EMPTY);
            expect(check === LoginResult.FAILED).assertFalse();
            expect(check === LoginResult.NAME_EMPTY).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0017 end');
        });

        /**
         * @tc.name   testServiceReal0018
         * @tc.number SUB_ACCT_SVCREAL_0018
         * @tc.desc   登录用户名为空时返回空用户名分支，优先于空密码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0018 begin');
            const input: LoginInput = { name: '', password: '' };
            const check: LoginResult = AccountValidator.validateLogin(input, 'pass123', 'true');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d expected=%{public}d', check, LoginResult.NAME_EMPTY);
            expect(check).assertEqual(LoginResult.NAME_EMPTY);
            expect(check === LoginResult.PASSWORD_EMPTY).assertFalse();
            expect(check === LoginResult.OK).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0018 end');
        });

        /**
         * @tc.name   testServiceReal0019
         * @tc.number SUB_ACCT_SVCREAL_0019
         * @tc.desc   修改邮箱非法时返回邮箱非法分支，已保存密码保持不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testServiceReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0019 begin');
            await data.putStorageValue(context, user, 'pass123', MUSIC);
            const input: ModifyInput = {
                email: 'bad@', signature: '', password: 'pass123', confirmPassword: 'pass123'
            };
            const check: ModifyResult = AccountValidator.validateModify(input, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d expected=%{public}d', check, ModifyResult.EMAIL_INVALID);
            expect(check).assertEqual(ModifyResult.EMAIL_INVALID);
            expect(String(await data.getStorageValue(context, user, MUSIC))).assertEqual('pass123');
            expect(check === ModifyResult.PASSWORD_SAME_AS_OLD).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0019 end');
        });

        /**
         * @tc.name   testServiceReal0020
         * @tc.number SUB_ACCT_SVCREAL_0020
         * @tc.desc   两个应用的登录标记与密码交叉不串，各自判定互不影响
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testServiceReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0020 begin');
            const videoAccount: string = AccountKeyBuilder.accountName(user, VIDEO);
            await data.putStorageValue(context, user, 'music-pass', MUSIC);
            await data.putStorageValue(context, MUSIC, AccountKeyBuilder.LOGIN_FLAG, accountName);
            await data.putStorageValue(context, user, 'video-pass', VIDEO);
            await data.putStorageValue(context, VIDEO, AccountKeyBuilder.LOGIN_FLAG, videoAccount);
            const musicCheck: LoginResult = AccountValidator.validateLogin(
                { name: user, password: 'music-pass' },
                String(await data.getStorageValue(context, user, MUSIC)),
                String(await data.getStorageValue(context, MUSIC, accountName)));
            const videoCheck: LoginResult = AccountValidator.validateLogin(
                { name: user, password: 'video-pass' },
                String(await data.getStorageValue(context, user, VIDEO)),
                String(await data.getStorageValue(context, VIDEO, videoAccount)));
            const crossCheck: LoginResult = AccountValidator.validateLogin(
                { name: user, password: 'video-pass' },
                String(await data.getStorageValue(context, user, MUSIC)),
                String(await data.getStorageValue(context, MUSIC, accountName)));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'music=%{public}d video=%{public}d cross=%{public}d', musicCheck,
                videoCheck, crossCheck);
            expect(musicCheck).assertEqual(LoginResult.OK);
            expect(videoCheck).assertEqual(LoginResult.OK);
            expect(crossCheck).assertEqual(LoginResult.FAILED);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testServiceReal0020 end');
        });
    });
}
