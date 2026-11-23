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
const MUSIC: string = 'flow_Music';
const VIDEO: string = 'flow_Video';
const USER: string = 'flow_user';
const USER_TWO: string = 'flow_user2';

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

async function registerUser(context: common.Context, model: AccountModel, data: AccountData, user: string,
    bundle: string, email: string, signature: string, password: string): Promise<void> {
    const accountName: string = AccountKeyBuilder.accountName(user, bundle);
    await model.addAccount(accountName);
    if (email !== '') {
        await model.setAccountCredential(accountName,
            AccountKeyBuilder.credentialType(AccountKeyBuilder.EMAIL_FIELD, bundle), email);
    }
    if (signature !== '') {
        await model.setAccountCredential(accountName,
            AccountKeyBuilder.credentialType(AccountKeyBuilder.SIGNATURE_FIELD, bundle), signature);
    }
    await model.setAssociatedData(accountName, AccountKeyBuilder.associatedKey(bundle), password);
    await data.putStorageValue(context, user, password, bundle);
    await data.putStorageValue(context, bundle, AccountKeyBuilder.LOGIN_FLAG, accountName);
}

async function loginOf(context: common.Context, data: AccountData, user: string, bundle: string,
    password: string): Promise<LoginResult> {
    const accountName: string = AccountKeyBuilder.accountName(user, bundle);
    const stored: string = String(await data.getStorageValue(context, user, bundle));
    const flag: string = String(await data.getStorageValue(context, bundle, accountName));
    let input: LoginInput = { name: user, password: password };
    return AccountValidator.validateLogin(input, stored, flag);
}

/**
 * 复刻 ModifyInfo 的点击顺序：先写凭据，后做表单校验（既存缺陷，只记录不修改）。
 */
async function modifyApply(context: common.Context, model: AccountModel, data: AccountData, user: string,
    bundle: string, email: string, signature: string, password: string,
    confirmPassword: string): Promise<ModifyResult> {
    const accountName: string = AccountKeyBuilder.accountName(user, bundle);
    if (email !== '') {
        await model.setAccountCredential(accountName,
            AccountKeyBuilder.credentialType(AccountKeyBuilder.EMAIL_FIELD, bundle), email);
    }
    if (signature !== '') {
        await model.setAccountCredential(accountName,
            AccountKeyBuilder.credentialType(AccountKeyBuilder.SIGNATURE_FIELD, bundle), signature);
    }
    const stored: string = String(await data.getStorageValue(context, user, bundle));
    let input: ModifyInput = {
        email: email, signature: signature, password: password, confirmPassword: confirmPassword
    };
    const check: ModifyResult = AccountValidator.validateModify(input, stored);
    if (check === ModifyResult.OK_WITH_PASSWORD) {
        await data.putStorageValue(context, user, password, bundle);
    }
    return check;
}

export default function flowValidateRealTest() {
    describe('FlowValidateRealTest', () => {
        let delegatorContext: common.Context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
        let context: common.Context = TestContextHolder.getContext(delegatorContext);
        let model: AccountModel = new AccountModel();
        let data: AccountData = AccountData.getInstance();
        const accountName: string = AccountKeyBuilder.accountName(USER, MUSIC);

        beforeEach(async () => {
            await dropStore(context, MUSIC);
            await dropStore(context, VIDEO);
            await dropStore(context, accountName);
            await dropStore(context, AccountKeyBuilder.accountName(USER, VIDEO));
            await dropStore(context, AccountKeyBuilder.accountName(USER_TWO, MUSIC));
            await dropAccount(model, accountName);
            await dropAccount(model, AccountKeyBuilder.accountName(USER, VIDEO));
            await dropAccount(model, AccountKeyBuilder.accountName(USER_TWO, MUSIC));
        });

        afterEach(async () => {
            await dropStore(context, MUSIC);
            await dropStore(context, VIDEO);
            await dropStore(context, accountName);
            await dropStore(context, AccountKeyBuilder.accountName(USER, VIDEO));
            await dropStore(context, AccountKeyBuilder.accountName(USER_TWO, MUSIC));
            await dropAccount(model, accountName);
            await dropAccount(model, AccountKeyBuilder.accountName(USER, VIDEO));
            await dropAccount(model, AccountKeyBuilder.accountName(USER_TWO, MUSIC));
        });

        /**
         * @tc.name   testFlowValidate0001
         * @tc.number SUB_ACCT_FLOWREAL_0001
         * @tc.desc   注册写入的五处数据都能被登录流程读到，登录一次判定成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0001 begin');
            await registerUser(context, model, data, USER, MUSIC, 'flow@example.com', 'hi', 'pass123');
            const check: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            const flag: string = String(await data.getStorageValue(context, MUSIC, accountName));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d email=%{public}s flag=%{public}s', check, email, flag);
            expect(check).assertEqual(LoginResult.OK);
            expect(email).assertEqual('flow@example.com');
            expect(flag).assertEqual(AccountKeyBuilder.LOGIN_FLAG);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0001 end');
        });

        /**
         * @tc.name   testFlowValidate0002
         * @tc.number SUB_ACCT_FLOWREAL_0002
         * @tc.desc   注册时邮箱留空，登录仍成功而资料页邮箱回退为空串
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0002 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const check: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            let email: string = '';
            let code: number = 0;
            try {
                email = await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d code=%{public}d', check, code);
            expect(check).assertEqual(LoginResult.OK);
            expect(email).assertEqual('');
            expect(code === 0).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0002 end');
        });

        /**
         * @tc.name   testFlowValidate0003
         * @tc.number SUB_ACCT_FLOWREAL_0003
         * @tc.desc   六位密码完成注册并登录，五位密码在校验阶段被拦下不落库
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0003 begin');
            let shortInput: RegisterInput = {
                username: USER, email: '', signature: '', password: 'abcde', confirmPassword: 'abcde'
            };
            const shortCheck: RegisterResult = AccountValidator.validateRegister(shortInput, false);
            await registerUser(context, model, data, USER, MUSIC, '', '', 'abcdef');
            const check: LoginResult = await loginOf(context, data, USER, MUSIC, 'abcdef');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'short=%{public}d check=%{public}d', shortCheck, check);
            expect(shortCheck).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
            expect(check).assertEqual(LoginResult.OK);
            expect(shortCheck === RegisterResult.OK).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0003 end');
        });

        /**
         * @tc.name   testFlowValidate0004
         * @tc.number SUB_ACCT_FLOWREAL_0004
         * @tc.desc   用户名取 15 位上限完成注册，账号名后缀应用名后仍可登录
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0004 begin');
            const longUser: string = 'abcdefghijklmno';
            const longAccount: string = AccountKeyBuilder.accountName(longUser, MUSIC);
            await dropAccount(model, longAccount);
            await registerUser(context, model, data, longUser, MUSIC, '', 'sig', 'pass123');
            const check: LoginResult = await loginOf(context, data, longUser, MUSIC, 'pass123');
            const stored: string = String(await data.getStorageValue(context, longUser, MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'account=%{public}s check=%{public}d', longAccount, check);
            expect(longUser.length).assertEqual(AccountValidator.USERNAME_MAX_LENGTH);
            expect(check).assertEqual(LoginResult.OK);
            expect(stored).assertEqual('pass123');
            await dropAccount(model, longAccount);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0004 end');
        });

        /**
         * @tc.name   testFlowValidate0005
         * @tc.number SUB_ACCT_FLOWREAL_0005
         * @tc.desc   同一账号错密码失败、正确密码成功的两次登录互不影响
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0005 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const wrong: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass124');
            const right: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wrong=%{public}d right=%{public}d', wrong, right);
            expect(wrong).assertEqual(LoginResult.FAILED);
            expect(right).assertEqual(LoginResult.OK);
            expect(wrong === right).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0005 end');
        });

        /**
         * @tc.name   testFlowValidate0006
         * @tc.number SUB_ACCT_FLOWREAL_0006
         * @tc.desc   同一用户在两个应用注册后各用各的密码登录，交叉密码判定失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0006 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'music-pass');
            await registerUser(context, model, data, USER, VIDEO, '', '', 'video-pass');
            const music: LoginResult = await loginOf(context, data, USER, MUSIC, 'music-pass');
            const video: LoginResult = await loginOf(context, data, USER, VIDEO, 'video-pass');
            const crossed: LoginResult = await loginOf(context, data, USER, MUSIC, 'video-pass');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'music=%{public}d video=%{public}d cross=%{public}d', music, video,
                crossed);
            expect(music).assertEqual(LoginResult.OK);
            expect(video).assertEqual(LoginResult.OK);
            expect(crossed).assertEqual(LoginResult.FAILED);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0006 end');
        });

        /**
         * @tc.name   testFlowValidate0007
         * @tc.number SUB_ACCT_FLOWREAL_0007
         * @tc.desc   重复注册同名用户时第二次被拒绝，已写入的密码不被覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0007 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'first-pass');
            let code: number = 0;
            try {
                await model.addAccount(accountName);
            } catch (err) {
                code = codeOf(err);
            }
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'code=%{public}d stored=%{public}s', code, stored);
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isAccountAlreadyExists(code)).assertTrue();
            expect(stored).assertEqual('first-pass');
            expect(stored === 'second-pass').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0007 end');
        });

        /**
         * @tc.name   testFlowValidate0008
         * @tc.number SUB_ACCT_FLOWREAL_0008
         * @tc.desc   登录标记缺失时读回字符串 null，即便密码正确也判定失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0008 begin');
            await model.addAccount(accountName);
            await data.putStorageValue(context, USER, 'pass123', MUSIC);
            const flag: string = String(await data.getStorageValue(context, MUSIC, accountName));
            const check: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'flag=%{public}s check=%{public}d', flag, check);
            expect(flag).assertEqual('null');
            expect(check).assertEqual(LoginResult.FAILED);
            expect(check === LoginResult.OK).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0008 end');
        });

        /**
         * @tc.name   testFlowValidate0009
         * @tc.number SUB_ACCT_FLOWREAL_0009
         * @tc.desc   只改资料时返回无密码成功，邮箱凭据更新而登录密码保持原值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0009 begin');
            await registerUser(context, model, data, USER, MUSIC, 'old@example.com', 'sig', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, 'new@example.com', 'new-sig', '', '');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d email=%{public}s', check, email);
            expect(check).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
            expect(email).assertEqual('new@example.com');
            expect(login).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0009 end');
        });

        /**
         * @tc.name   testFlowValidate0010
         * @tc.number SUB_ACCT_FLOWREAL_0010
         * @tc.desc   改密码返回有密码成功，新密码可登录而旧密码立即失效
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0010 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'fresh456', 'fresh456');
            const oldLogin: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            const newLogin: LoginResult = await loginOf(context, data, USER, MUSIC, 'fresh456');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d old=%{public}d new=%{public}d', check, oldLogin,
                newLogin);
            expect(check).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(oldLogin).assertEqual(LoginResult.FAILED);
            expect(newLogin).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0010 end');
        });

        /**
         * @tc.name   testFlowValidate0011
         * @tc.number SUB_ACCT_FLOWREAL_0011
         * @tc.desc   新密码与已存密码相同时返回相同分支，偏好设置里的密码不被重写
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0011 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'pass123', 'pass123');
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d stored=%{public}s', check, stored);
            expect(check).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
            expect(stored).assertEqual('pass123');
            expect(login).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0011 end');
        });

        /**
         * @tc.name   testFlowValidate0012
         * @tc.number SUB_ACCT_FLOWREAL_0012
         * @tc.desc   确认密码不一致时返回不一致分支，原有密码继续可用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0012 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'fresh456', 'fresh457');
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d stored=%{public}s', check, stored);
            expect(check).assertEqual(ModifyResult.CONFIRM_MISMATCH);
            expect(stored).assertEqual('pass123');
            expect(login).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0012 end');
        });

        /**
         * @tc.name   testFlowValidate0013
         * @tc.number SUB_ACCT_FLOWREAL_0013
         * @tc.desc   邮箱非法时返回邮箱分支，但页面先写凭据的行为使非法邮箱已落库
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0013 begin');
            await registerUser(context, model, data, USER, MUSIC, 'old@example.com', '', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, 'bad@', '', '', '');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d email=%{public}s', check, email);
            expect(check).assertEqual(ModifyResult.EMAIL_INVALID);
            expect(email).assertEqual('bad@');
            expect(email === 'old@example.com').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0013 end');
        });

        /**
         * @tc.name   testFlowValidate0014
         * @tc.number SUB_ACCT_FLOWREAL_0014
         * @tc.desc   邮箱非法与密码过短同时存在时只报邮箱分支，密码不被写入
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0014 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, 'bad@', '', 'abc', 'abc');
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d stored=%{public}s', check, stored);
            expect(check).assertEqual(ModifyResult.EMAIL_INVALID);
            expect(stored).assertEqual('pass123');
            expect(check === ModifyResult.PASSWORD_TOO_SHORT).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0014 end');
        });

        /**
         * @tc.name   testFlowValidate0015
         * @tc.number SUB_ACCT_FLOWREAL_0015
         * @tc.desc   新密码只有五位时返回过短分支，偏好设置保持原密码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0015 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'abcd', 'abcd');
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d stored=%{public}s', check, stored);
            expect(check).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
            expect(stored).assertEqual('pass123');
            expect(login).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0015 end');
        });

        /**
         * @tc.name   testFlowValidate0016
         * @tc.number SUB_ACCT_FLOWREAL_0016
         * @tc.desc   改资料时邮箱留空不会读取改写凭据，原有邮箱在详情页保持不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0016 begin');
            await registerUser(context, model, data, USER, MUSIC, 'keep@example.com', 'old-sig', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', 'new-sig', '', '');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            const signature: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('signature', MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d email=%{public}s sig=%{public}s', check, email,
                signature);
            expect(check).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
            expect(email).assertEqual('keep@example.com');
            expect(signature).assertEqual('new-sig');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0016 end');
        });

        /**
         * @tc.name   testFlowValidate0017
         * @tc.number SUB_ACCT_FLOWREAL_0017
         * @tc.desc   连续两次改密码，第二次改回原密码后原密码重新可用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0017 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const first: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'other78', 'other78');
            const second: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'pass123', 'pass123');
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}d second=%{public}d', first, second);
            expect(first).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(second).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(login).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0017 end');
        });

        /**
         * @tc.name   testFlowValidate0018
         * @tc.number SUB_ACCT_FLOWREAL_0018
         * @tc.desc   一次提交同时改资料与密码，凭据与登录密码都按新值生效
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0018 begin');
            await registerUser(context, model, data, USER, MUSIC, 'a@example.com', 'a-sig', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, 'b@example.com', 'b-sig', 'fresh456', 'fresh456');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            const newLogin: LoginResult = await loginOf(context, data, USER, MUSIC, 'fresh456');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d email=%{public}s', check, email);
            expect(check).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(email).assertEqual('b@example.com');
            expect(newLogin).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0018 end');
        });

        /**
         * @tc.name   testFlowValidate0019
         * @tc.number SUB_ACCT_FLOWREAL_0019
         * @tc.desc   删除账号后读关联数据抛账号不存在，偏好设置里的密码回到缺失态
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0019 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            await model.deleteAccount(accountName);
            await data.deleteStorageValue(context, USER, MUSIC);
            let code: number = 0;
            try {
                await model.getAssociatedData(accountName, AccountKeyBuilder.associatedKey(MUSIC));
            } catch (err) {
                code = codeOf(err);
            }
            const has: boolean = await data.hasStorageValue(context, USER, MUSIC);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'code=%{public}d has=%{public}s', code, String(has));
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(has).assertFalse();
            expect(String(await data.getStorageValue(context, USER, MUSIC))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0019 end');
        });

        /**
         * @tc.name   testFlowValidate0020
         * @tc.number SUB_ACCT_FLOWREAL_0020
         * @tc.desc   删除只清密码不清登录标记，输入字符串 null 可绕过判定登录成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0020 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            await model.deleteAccount(accountName);
            await data.deleteStorageValue(context, USER, MUSIC);
            const flag: string = String(await data.getStorageValue(context, MUSIC, accountName));
            const bypass: LoginResult = await loginOf(context, data, USER, MUSIC, 'null');
            const normal: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'flag=%{public}s bypass=%{public}d normal=%{public}d', flag, bypass,
                normal);
            expect(flag).assertEqual(AccountKeyBuilder.LOGIN_FLAG);
            expect(bypass).assertEqual(LoginResult.OK);
            expect(normal).assertEqual(LoginResult.FAILED);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0020 end');
        });

        /**
         * @tc.name   testFlowValidate0021
         * @tc.number SUB_ACCT_FLOWREAL_0021
         * @tc.desc   删除后重新注册同名用户可以成功，新密码覆盖旧密码并可通过登录
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0021 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'first-pass');
            await model.deleteAccount(accountName);
            await data.deleteStorageValue(context, USER, MUSIC);
            await registerUser(context, model, data, USER, MUSIC, '', '', 'second-pass');
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'second-pass');
            const oldLogin: LoginResult = await loginOf(context, data, USER, MUSIC, 'first-pass');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'new=%{public}d old=%{public}d', login, oldLogin);
            expect(login).assertEqual(LoginResult.OK);
            expect(oldLogin).assertEqual(LoginResult.FAILED);
            expect(login === oldLogin).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0021 end');
        });

        /**
         * @tc.name   testFlowValidate0022
         * @tc.number SUB_ACCT_FLOWREAL_0022
         * @tc.desc   账号被删除后应用账号不可读，登录仍按偏好设置判定成功且不重建账号
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0022 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            await model.deleteAccount(accountName);
            const check: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            let code: number = 0;
            try {
                await model.getAccountExtraInfo(accountName);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d code=%{public}d', check, code);
            expect(check).assertEqual(LoginResult.OK);
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(code !== 0).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0022 end');
        });

        /**
         * @tc.name   testFlowValidate0023
         * @tc.number SUB_ACCT_FLOWREAL_0023
         * @tc.desc   删除不存在的账号抛账号不存在错误码，错误码判定器给出一致结论
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0023 begin');
            let code: number = 0;
            try {
                await model.deleteAccount(accountName);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'code=%{public}d', code);
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(code === 12300004).assertFalse();
            expect(code !== 0).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0023 end');
        });

        /**
         * @tc.name   testFlowValidate0024
         * @tc.number SUB_ACCT_FLOWREAL_0024
         * @tc.desc   删除后重新注册同名用户，上一轮的邮箱凭据不可见
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0024 begin');
            await registerUser(context, model, data, USER, MUSIC, 'old@example.com', '', 'pass123');
            await model.deleteAccount(accountName);
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            let code: number = 0;
            try {
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'code=%{public}d', code);
            expect(code !== 0).assertTrue();
            expect(code === 12300002 || AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(await model.getAssociatedData(accountName, AccountKeyBuilder.associatedKey(MUSIC)))
                .assertEqual('pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0024 end');
        });

        /**
         * @tc.name   testFlowValidate0025
         * @tc.number SUB_ACCT_FLOWREAL_0025
         * @tc.desc   删除一个应用下的账号只清该应用账号，另一个应用的密码与登录不受影响
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0025 begin');
            const videoAccount: string = AccountKeyBuilder.accountName(USER, VIDEO);
            await registerUser(context, model, data, USER, MUSIC, '', '', 'music-pass');
            await registerUser(context, model, data, USER, VIDEO, '', '', 'video-pass');
            await model.deleteAccount(accountName);
            const music: LoginResult = await loginOf(context, data, USER, MUSIC, 'music-pass');
            const video: LoginResult = await loginOf(context, data, USER, VIDEO, 'video-pass');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'music=%{public}d video=%{public}d', music, video);
            expect(music).assertEqual(LoginResult.OK);
            expect(video).assertEqual(LoginResult.OK);
            expect(await model.getAssociatedData(videoAccount, AccountKeyBuilder.associatedKey(VIDEO)))
                .assertEqual('video-pass');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0025 end');
        });

        /**
         * @tc.name   testFlowValidate0026
         * @tc.number SUB_ACCT_FLOWREAL_0026
         * @tc.desc   重复删除同一个键不抛错，存在性查询两次都回到 false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0026 begin');
            await data.putStorageValue(context, USER, 'pass123', MUSIC);
            await data.deleteStorageValue(context, USER, MUSIC);
            await data.deleteStorageValue(context, USER, MUSIC);
            const first: boolean = await data.hasStorageValue(context, USER, MUSIC);
            const second: boolean = await data.hasStorageValue(context, USER, MUSIC);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s', String(first), String(second));
            expect(first).assertFalse();
            expect(second).assertFalse();
            expect(first === second).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0026 end');
        });

        /**
         * @tc.name   testFlowValidate0027
         * @tc.number SUB_ACCT_FLOWREAL_0027
         * @tc.desc   删除账号返回未等待的任务对象，等待完成后账号才真正不可读
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0027 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const pending: Promise<void> = model.deleteAccount(accountName);
            expect(String(typeof pending)).assertEqual('object');
            await pending;
            let code: number = 0;
            try {
                await model.getAssociatedData(accountName, AccountKeyBuilder.associatedKey(MUSIC));
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'code=%{public}d', code);
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(code === 0).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0027 end');
        });

        /**
         * @tc.name   testFlowValidate0028
         * @tc.number SUB_ACCT_FLOWREAL_0028
         * @tc.desc   非法邮箱被写入后，用合法邮箱再改一次可以修复凭据
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0028 begin');
            await registerUser(context, model, data, USER, MUSIC, 'good@example.com', '', 'pass123');
            const broken: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, 'bad@', '', '', '');
            const repaired: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, 'fixed@example.com', '', '', '');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'broken=%{public}d repaired=%{public}d email=%{public}s', broken, repaired,
                email);
            expect(broken).assertEqual(ModifyResult.EMAIL_INVALID);
            expect(repaired).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
            expect(email).assertEqual('fixed@example.com');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0028 end');
        });

        /**
         * @tc.name   testFlowValidate0029
         * @tc.number SUB_ACCT_FLOWREAL_0029
         * @tc.desc   缺失密码时写入真实密码后，字符串 null 不再能登录
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0029 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            await data.deleteStorageValue(context, USER, MUSIC);
            const before: LoginResult = await loginOf(context, data, USER, MUSIC, 'null');
            await data.putStorageValue(context, USER, 'pass123', MUSIC);
            const after: LoginResult = await loginOf(context, data, USER, MUSIC, 'null');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'before=%{public}d after=%{public}d', before, after);
            expect(before).assertEqual(LoginResult.OK);
            expect(after).assertEqual(LoginResult.FAILED);
            expect(before === after).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0029 end');
        });

        /**
         * @tc.name   testFlowValidate0030
         * @tc.number SUB_ACCT_FLOWREAL_0030
         * @tc.desc   注册到删除再重注册的全生命周期，每一步结论都与状态一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0030 begin');
            await registerUser(context, model, data, USER, MUSIC, 'first@example.com', '', 'pass123');
            const step1: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            const step2: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'fresh456', 'fresh456');
            const step3: LoginResult = await loginOf(context, data, USER, MUSIC, 'fresh456');
            await model.deleteAccount(accountName);
            await data.deleteStorageValue(context, USER, MUSIC);
            await registerUser(context, model, data, USER, MUSIC, 'third@example.com', '', 'third789');
            const step4: LoginResult = await loginOf(context, data, USER, MUSIC, 'third789');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 's1=%{public}d s2=%{public}d s3=%{public}d s4=%{public}d', step1, step2,
                step3, step4);
            expect(step1).assertEqual(LoginResult.OK);
            expect(step2).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(step3).assertEqual(LoginResult.OK);
            expect(step4).assertEqual(LoginResult.OK);
            expect(email).assertEqual('third@example.com');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0030 end');
        });

        /**
         * @tc.name   testFlowValidate0031
         * @tc.number SUB_ACCT_FLOWREAL_0031
         * @tc.desc   两个用户在同一应用下的凭据互相独立，密码交叉登录失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0031 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'first-pass');
            await registerUser(context, model, data, USER_TWO, MUSIC, '', '', 'second-pass');
            const first: LoginResult = await loginOf(context, data, USER, MUSIC, 'first-pass');
            const second: LoginResult = await loginOf(context, data, USER_TWO, MUSIC, 'second-pass');
            const crossed: LoginResult = await loginOf(context, data, USER_TWO, MUSIC, 'first-pass');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}d second=%{public}d cross=%{public}d', first, second,
                crossed);
            expect(first).assertEqual(LoginResult.OK);
            expect(second).assertEqual(LoginResult.OK);
            expect(crossed).assertEqual(LoginResult.FAILED);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0031 end');
        });

        /**
         * @tc.name   testFlowValidate0032
         * @tc.number SUB_ACCT_FLOWREAL_0032
         * @tc.desc   只改签名时邮箱凭据保持原值，签名按新值写入
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0032 begin');
            await registerUser(context, model, data, USER, MUSIC, 'keep@example.com', 'old-sig', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', 'fresh-sig', '', '');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            const signature: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('signature', MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d sig=%{public}s', check, signature);
            expect(check).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
            expect(email).assertEqual('keep@example.com');
            expect(signature).assertEqual('fresh-sig');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0032 end');
        });

        /**
         * @tc.name   testFlowValidate0033
         * @tc.number SUB_ACCT_FLOWREAL_0033
         * @tc.desc   六十四位长密码完成注册并登录，读写不做长度截断
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0033 begin');
            const longPassword: string = 'p'.repeat(64);
            await registerUser(context, model, data, USER, MUSIC, '', '', longPassword);
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, longPassword);
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'login=%{public}d head=%{public}s', login, stored.substring(0, 8));
            expect(login).assertEqual(LoginResult.OK);
            expect(stored.substring(0, 8)).assertEqual('pppppppp');
            expect(stored.substring(56)).assertEqual('pppppppp');
            expect(stored).assertEqual(longPassword);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0033 end');
        });

        /**
         * @tc.name   testFlowValidate0034
         * @tc.number SUB_ACCT_FLOWREAL_0034
         * @tc.desc   六个汉字的中文密码可完成注册并登录，长度按字符计数
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0034 begin');
            const chinese: string = '中文密码验证';
            await registerUser(context, model, data, USER, MUSIC, '', '', chinese);
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, chinese);
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'login=%{public}d stored=%{public}s', login, stored);
            expect(chinese.length).assertEqual(6);
            expect(login).assertEqual(LoginResult.OK);
            expect(stored).assertEqual(chinese);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0034 end');
        });

        /**
         * @tc.name   testFlowValidate0035
         * @tc.number SUB_ACCT_FLOWREAL_0035
         * @tc.desc   中文签名可以写入，中文邮箱在修改校验阶段被判非法
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0035 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '中文@example.com', '晴天', '', '');
            const signature: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('signature', MUSIC));
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'check=%{public}d sig=%{public}s', check, signature);
            expect(check).assertEqual(ModifyResult.EMAIL_INVALID);
            expect(signature).assertEqual('晴天');
            expect(email).assertEqual('中文@example.com');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0035 end');
        });

        /**
         * @tc.name   testFlowValidate0036
         * @tc.number SUB_ACCT_FLOWREAL_0036
         * @tc.desc   扩展信息写入与读取正常，且不参与登录判定
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0036 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            await model.setAccountExtraInfo(accountName, 'extra-ok');
            const extra: string = await model.getAccountExtraInfo(accountName);
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'extra=%{public}s login=%{public}d', extra, login);
            expect(extra).assertEqual('extra-ok');
            expect(login).assertEqual(LoginResult.OK);
            expect(extra === '').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0036 end');
        });

        /**
         * @tc.name   testFlowValidate0037
         * @tc.number SUB_ACCT_FLOWREAL_0037
         * @tc.desc   关联数据与偏好设置保存同一份密码，两处读回逐字符相同
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0037 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            const associated: string =
                await model.getAssociatedData(accountName, AccountKeyBuilder.associatedKey(MUSIC));
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, associated);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'associated=%{public}s stored=%{public}s', associated, stored);
            expect(associated).assertEqual(stored);
            expect(associated.length).assertEqual(7);
            expect(login).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0037 end');
        });

        /**
         * @tc.name   testFlowValidate0038
         * @tc.number SUB_ACCT_FLOWREAL_0038
         * @tc.desc   连续三次改密码后只有最后一次生效，前两次已被覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testFlowValidate0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0038 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            await modifyApply(context, model, data, USER, MUSIC, '', '', 'second1', 'second1');
            await modifyApply(context, model, data, USER, MUSIC, '', '', 'third12', 'third12');
            const last: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'final34', 'final34');
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'final34');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'last=%{public}d stored=%{public}s', last, stored);
            expect(last).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(stored).assertEqual('final34');
            expect(login).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0038 end');
        });

        /**
         * @tc.name   testFlowValidate0039
         * @tc.number SUB_ACCT_FLOWREAL_0039
         * @tc.desc   修改流程不校验登录态，未登录状态下改密码仍返回有密码成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testFlowValidate0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0039 begin');
            await registerUser(context, model, data, USER, MUSIC, '', '', 'pass123');
            await data.deleteStorageValue(context, MUSIC, accountName);
            const loggedOut: LoginResult = await loginOf(context, data, USER, MUSIC, 'pass123');
            const check: ModifyResult =
                await modifyApply(context, model, data, USER, MUSIC, '', '', 'fresh456', 'fresh456');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'loggedOut=%{public}d check=%{public}d', loggedOut, check);
            expect(loggedOut).assertEqual(LoginResult.FAILED);
            expect(check).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(check === ModifyResult.OK_WITHOUT_PASSWORD).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0039 end');
        });

        /**
         * @tc.name   testFlowValidate0040
         * @tc.number SUB_ACCT_FLOWREAL_0040
         * @tc.desc   注册完成后的五项终态同时成立，构成一次完整注册的结果快照
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testFlowValidate0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0040 begin');
            await registerUser(context, model, data, USER, MUSIC, 'snap@example.com', 'snap-sig', 'snap123');
            const email: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('email', MUSIC));
            const signature: string =
                await model.getAccountCredential(accountName, AccountKeyBuilder.credentialType('signature', MUSIC));
            const associated: string =
                await model.getAssociatedData(accountName, AccountKeyBuilder.associatedKey(MUSIC));
            const stored: string = String(await data.getStorageValue(context, USER, MUSIC));
            const login: LoginResult = await loginOf(context, data, USER, MUSIC, 'snap123');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'email=%{public}s stored=%{public}s login=%{public}d', email, stored,
                login);
            expect(email).assertEqual('snap@example.com');
            expect(signature).assertEqual('snap-sig');
            expect(associated).assertEqual('snap123');
            expect(stored).assertEqual('snap123');
            expect(login).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlowValidate0040 end');
        });
    });
}
