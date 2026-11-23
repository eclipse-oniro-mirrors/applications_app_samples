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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AccountModel } from '../../../main/ets/model/AccountModel';
import { AccountKeyBuilder } from '../../../main/ets/model/AccountKeyBuilder';
import { AccountValidator, RegisterResult } from '../../../main/ets/model/AccountValidator';
import {
    startSampleApp, backToEntrance, expectWideLayout, existsId, waitId, tapId, typeId, enabledId, readId,
    confirmDialog, closeDialog, cancelDialog, existsCancelDialog, registerId, modifyId, sleep,
    ID_MUSIC, ID_VIDEO, ID_MAP, ID_NAME, ID_PASSWORD, ID_LOGIN, ID_REGISTER, ID_COMPLETE,
    ID_MODIFY, ID_APPLICATION, ID_DELETE, ID_MOD_COMPLETE, ID_BACK, COMPONENT_WAIT
} from './UiHelper';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const BUNDLE: string = 'Music';
const OTHER_BUNDLE: string = 'Video';
/**
 * 用户名每个用例重新生成。应用侧用的偏好设置目录属于 entry 模块，测试进程拿到的是
 * entry_test 模块的目录，两边互相看不见，只能靠换用户名避免读到上一次的账号。
 */
let USER: string = 'ui_user';
const PASSWORD: string = 'uiPass123';
const EMAIL: string = 'ui@example.com';
const SIGNATURE: string = 'ui-sign';

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

/** 清掉本用例用户名下的应用账号，避免同名账号影响下一次注册或登录。 */
async function resetAccounts(model: AccountModel): Promise<void> {
    await dropAccount(model, accountNameOf(USER, BUNDLE));
    await dropAccount(model, accountNameOf(USER, OTHER_BUNDLE));
}

/** 凭据不存在时返回 true，用于替代测试侧读不到的偏好设置断言。 */
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

/** 在注册页填写五个字段并提交，随后关闭结果弹窗。 */
async function submitRegister(driver: Driver, email: string, signature: string,
    password: string, confirm: string): Promise<void> {
    await typeId(driver, registerId(1), USER);
    await typeId(driver, registerId(2), email);
    await typeId(driver, registerId(3), signature);
    await typeId(driver, registerId(4), password);
    await typeId(driver, registerId(5), confirm);
    await tapId(driver, ID_COMPLETE);
    await closeDialog(driver);
    await sleep(200);
}

/** 在登录页填写两个字段并提交，失败弹窗会被关闭。 */
async function submitLogin(driver: Driver, name: string, password: string): Promise<void> {
    await typeId(driver, ID_NAME, name);
    await typeId(driver, ID_PASSWORD, password);
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
    await submitRegister(driver, EMAIL, SIGNATURE, PASSWORD, PASSWORD);
    await waitId(driver, ID_NAME, COMPONENT_WAIT);
    await submitLogin(driver, USER, PASSWORD);
    await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
}

/** 从账号页进入修改页，四个输入框按顺序就位。 */
async function enterModify(driver: Driver): Promise<boolean> {
    await tapId(driver, ID_MODIFY);
    return await waitId(driver, modifyId(1), COMPONENT_WAIT);
}

/** 在修改页填写四个字段并提交，随后关闭结果弹窗。 */
async function submitModify(driver: Driver, email: string, signature: string,
    password: string, confirm: string): Promise<void> {
    await typeId(driver, modifyId(1), email);
    await typeId(driver, modifyId(2), signature);
    await typeId(driver, modifyId(3), password);
    await typeId(driver, modifyId(4), confirm);
    await tapId(driver, ID_MOD_COMPLETE);
    await closeDialog(driver);
    await sleep(200);
}

export default function accountUiFlowTest() {
    describe('AccountUiFlowTest', () => {
        let driver: Driver = Driver.create();
        let model: AccountModel = new AccountModel();

        beforeAll(async () => {
            await startSampleApp();
        });

        beforeEach(async () => {
            USER = 'ui' + String(Date.now() % 1000000);
            await startSampleApp();
            await backToEntrance(driver);
            await resetAccounts(model);
        });

        afterEach(async () => {
            await backToEntrance(driver);
            await resetAccounts(model);
        });

        /**
         * @tc.name   testAccountUi0001
         * @tc.number SUB_ACCT_UI_1001
         * @tc.desc   入口页列出三个应用，登录面板是否同屏由布局策略决定
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0001 begin');
            const wide: boolean = expectWideLayout();
            const hasMusic: boolean = await existsId(driver, ID_MUSIC);
            const hasVideo: boolean = await existsId(driver, ID_VIDEO);
            const hasMap: boolean = await existsId(driver, ID_MAP);
            const hasName: boolean = await existsId(driver, ID_NAME);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s cards=%{public}s%{public}s%{public}s name=%{public}s',
                String(wide), String(hasMusic), String(hasVideo), String(hasMap), String(hasName));
            expect(hasMusic).assertTrue();
            expect(hasVideo).assertTrue();
            expect(hasMap).assertTrue();
            expect(hasName).assertEqual(wide);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0001 end');
        });

        /**
         * @tc.name   testAccountUi0002
         * @tc.number SUB_ACCT_UI_1002
         * @tc.desc   点击 Music 卡片进入登录页，四个交互控件全部就位
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0002 begin');
            await tapId(driver, ID_MUSIC);
            const hasName: boolean = await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const hasPassword: boolean = await existsId(driver, ID_PASSWORD);
            const hasLogin: boolean = await existsId(driver, ID_LOGIN);
            const hasRegister: boolean = await existsId(driver, ID_REGISTER);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'name=%{public}s password=%{public}s login=%{public}s register=%{public}s',
                String(hasName), String(hasPassword), String(hasLogin), String(hasRegister));
            expect(hasName).assertTrue();
            expect(hasPassword).assertTrue();
            expect(hasLogin).assertTrue();
            expect(hasRegister).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0002 end');
        });

        /**
         * @tc.name   testAccountUi0003
         * @tc.number SUB_ACCT_UI_1003
         * @tc.desc   点击 Video 卡片同样进入登录页，且不出现账号面板
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0003 begin');
            await tapId(driver, ID_VIDEO);
            const hasName: boolean = await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const hasModify: boolean = await existsId(driver, ID_MODIFY);
            const hasDelete: boolean = await existsId(driver, ID_DELETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'name=%{public}s modify=%{public}s delete=%{public}s',
                String(hasName), String(hasModify), String(hasDelete));
            expect(hasName).assertTrue();
            expect(hasModify).assertFalse();
            expect(hasDelete).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0003 end');
        });

        /**
         * @tc.name   testAccountUi0004
         * @tc.number SUB_ACCT_UI_1004
         * @tc.desc   点击 Map 卡片进入登录页，三个应用入口互不影响
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0004 begin');
            await tapId(driver, ID_MAP);
            const hasName: boolean = await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const hasLogin: boolean = await existsId(driver, ID_LOGIN);
            const stillHasMap: boolean = await existsId(driver, ID_MAP);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'name=%{public}s login=%{public}s mapCard=%{public}s',
                String(hasName), String(hasLogin), String(stillHasMap));
            expect(hasName).assertTrue();
            expect(hasLogin).assertTrue();
            expect(stillHasMap).assertEqual(expectWideLayout());
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0004 end');
        });

        /**
         * @tc.name   testAccountUi0005
         * @tc.number SUB_ACCT_UI_1005
         * @tc.desc   用户名与密码都为空时点登录，停在登录页不回退不跳转
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0005 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_LOGIN);
            const closed: boolean = await closeDialog(driver);
            const stillLogin: boolean = await existsId(driver, ID_NAME);
            const hasAccountPanel: boolean = await existsId(driver, ID_MODIFY);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'dialog=%{public}s login=%{public}s account=%{public}s',
                String(closed), String(stillLogin), String(hasAccountPanel));
            expect(closed).assertTrue();
            expect(stillLogin).assertTrue();
            expect(hasAccountPanel).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0005 end');
        });

        /**
         * @tc.name   testAccountUi0006
         * @tc.number SUB_ACCT_UI_1006
         * @tc.desc   只填用户名不填密码时点登录，仍停在登录页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0006 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await submitLogin(driver, USER, '');
            const stillLogin: boolean = await existsId(driver, ID_PASSWORD);
            const hasDelete: boolean = await existsId(driver, ID_DELETE);
            const hasRegister: boolean = await existsId(driver, ID_REGISTER);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'login=%{public}s delete=%{public}s register=%{public}s',
                String(stillLogin), String(hasDelete), String(hasRegister));
            expect(stillLogin).assertTrue();
            expect(hasDelete).assertFalse();
            expect(hasRegister).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0006 end');
        });

        /**
         * @tc.name   testAccountUi0007
         * @tc.number SUB_ACCT_UI_1007
         * @tc.desc   未注册的账号配合法密码登录，停在登录页且没有账号面板
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0007 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await submitLogin(driver, USER, PASSWORD);
            const stillLogin: boolean = await existsId(driver, ID_LOGIN);
            const hasModify: boolean = await existsId(driver, ID_MODIFY);
            const hasApplication: boolean = await existsId(driver, ID_APPLICATION);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'login=%{public}s modify=%{public}s application=%{public}s',
                String(stillLogin), String(hasModify), String(hasApplication));
            expect(stillLogin).assertTrue();
            expect(hasModify).assertFalse();
            expect(hasApplication).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0007 end');
        });

        /**
         * @tc.name   testAccountUi0008
         * @tc.number SUB_ACCT_UI_1008
         * @tc.desc   点注册按钮进入注册页，五个输入框与提交按钮齐全
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0008 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            const hasFirst: boolean = await waitId(driver, registerId(1), COMPONENT_WAIT);
            const hasFourth: boolean = await existsId(driver, registerId(4));
            const hasFifth: boolean = await existsId(driver, registerId(5));
            const hasComplete: boolean = await existsId(driver, ID_COMPLETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s fourth=%{public}s fifth=%{public}s complete=%{public}s',
                String(hasFirst), String(hasFourth), String(hasFifth), String(hasComplete));
            expect(hasFirst).assertTrue();
            expect(hasFourth).assertTrue();
            expect(hasFifth).assertTrue();
            expect(hasComplete).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0008 end');
        });

        /**
         * @tc.name   testAccountUi0009
         * @tc.number SUB_ACCT_UI_1009
         * @tc.desc   注册页用户名留空提交，停在注册页并给出空用户名提示
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0009 begin');
            const expected: RegisterResult = AccountValidator.validateRegister(
                { username: '', email: EMAIL, signature: SIGNATURE, password: PASSWORD, confirmPassword: PASSWORD },
                    false);
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await submitRegister(driver, EMAIL, SIGNATURE, PASSWORD, PASSWORD);
            await typeId(driver, registerId(1), '');
            await tapId(driver, ID_COMPLETE);
            const closed: boolean = await closeDialog(driver);
            const stillRegister: boolean = await existsId(driver, ID_COMPLETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'expected=%{public}d dialog=%{public}s page=%{public}s',
                expected, String(closed), String(stillRegister));
            expect(expected).assertEqual(RegisterResult.USERNAME_EMPTY);
            expect(closed).assertTrue();
            expect(stillRegister).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0009 end');
        });

        /**
         * @tc.name   testAccountUi0010
         * @tc.number SUB_ACCT_UI_1010
         * @tc.desc   注册页填入非法邮箱提交，停在注册页且不创建账号
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0010 begin');
            const expected: RegisterResult = AccountValidator.validateRegister(
                { username: USER, email: 'bad-email', signature: SIGNATURE, password: PASSWORD,
                    confirmPassword: PASSWORD },
                false);
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await submitRegister(driver, 'bad-email', SIGNATURE, PASSWORD, PASSWORD);
            const stillRegister: boolean = await existsId(driver, registerId(2));
            const accountAbsent: boolean =
                await credentialAbsent(model, accountNameOf(USER, BUNDLE), 'email_' + BUNDLE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'expected=%{public}d page=%{public}s absent=%{public}s',
                expected, String(stillRegister), String(accountAbsent));
            expect(expected).assertEqual(RegisterResult.EMAIL_INVALID);
            expect(stillRegister).assertTrue();
            expect(accountAbsent).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0010 end');
        });

        /**
         * @tc.name   testAccountUi0011
         * @tc.number SUB_ACCT_UI_1011
         * @tc.desc   注册页密码留空提交，停在注册页并提示密码为空
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0011 begin');
            const expected: RegisterResult = AccountValidator.validateRegister(
                { username: USER, email: EMAIL, signature: SIGNATURE, password: '', confirmPassword: '' }, false);
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await submitRegister(driver, EMAIL, SIGNATURE, '', '');
            const stillRegister: boolean = await existsId(driver, registerId(4));
            const hasName: boolean = await existsId(driver, ID_NAME);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'expected=%{public}d page=%{public}s loginPanel=%{public}s',
                expected, String(stillRegister), String(hasName));
            expect(expected).assertEqual(RegisterResult.PASSWORD_EMPTY);
            expect(stillRegister).assertTrue();
            expect(hasName).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0011 end');
        });

        /**
         * @tc.name   testAccountUi0012
         * @tc.number SUB_ACCT_UI_1012
         * @tc.desc   注册页五位密码提交，停在注册页且不写任何凭据
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0012 begin');
            const expected: RegisterResult = AccountValidator.validateRegister(
                { username: USER, email: EMAIL, signature: SIGNATURE, password: 'abcde', confirmPassword: 'abcde' },
                    false);
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await submitRegister(driver, EMAIL, SIGNATURE, 'abcde', 'abcde');
            const stillRegister: boolean = await existsId(driver, ID_COMPLETE);
            const accountAbsent: boolean =
                await credentialAbsent(model, accountNameOf(USER, BUNDLE), 'email_' + BUNDLE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'expected=%{public}d page=%{public}s absent=%{public}s',
                expected, String(stillRegister), String(accountAbsent));
            expect(expected).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
            expect(stillRegister).assertTrue();
            expect(accountAbsent).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0012 end');
        });

        /**
         * @tc.name   testAccountUi0013
         * @tc.number SUB_ACCT_UI_1013
         * @tc.desc   注册页两次密码不一致提交，停在注册页且账号未创建
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0013 begin');
            const expected: RegisterResult = AccountValidator.validateRegister(
                { username: USER, email: EMAIL, signature: SIGNATURE, password: PASSWORD,
                    confirmPassword: 'uiPass124' },
                false);
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await submitRegister(driver, EMAIL, SIGNATURE, PASSWORD, 'uiPass124');
            const stillRegister: boolean = await existsId(driver, registerId(5));
            let code: number = 0;
            try {
                await model.getAccountCredential(accountNameOf(USER, BUNDLE), 'email_' + BUNDLE);
            } catch (err) {
                let error: BusinessError = err as BusinessError;
                code = error.code;
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'expected=%{public}d page=%{public}s code=%{public}d',
                expected, String(stillRegister), code);
            expect(expected).assertEqual(RegisterResult.CONFIRM_MISMATCH);
            expect(stillRegister).assertTrue();
            expect(code === 0).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0013 end');
        });

        /**
         * @tc.name   testAccountUi0014
         * @tc.number SUB_ACCT_UI_1014
         * @tc.desc   合法表单完成注册，确认弹窗后回到登录页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0014 begin');
            const expected: RegisterResult = AccountValidator.validateRegister(
                { username: USER, email: EMAIL, signature: SIGNATURE, password: PASSWORD, confirmPassword: PASSWORD },
                false);
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await submitRegister(driver, EMAIL, SIGNATURE, PASSWORD, PASSWORD);
            const backToLogin: boolean = await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await sleep(COMPONENT_WAIT);
            const registerGone: boolean = await existsId(driver, registerId(1));
            const savedEmail: string =
                await model.getAccountCredential(accountNameOf(USER, BUNDLE), 'email_' + BUNDLE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'expected=%{public}d login=%{public}s register=%{public}s email=%{public}s',
                expected, String(backToLogin), String(registerGone), savedEmail);
            expect(expected).assertEqual(RegisterResult.OK);
            expect(backToLogin).assertTrue();
            expect(registerGone).assertFalse();
            expect(savedEmail).assertEqual(EMAIL);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0014 end');
        });

        /**
         * @tc.name   testAccountUi0015
         * @tc.number SUB_ACCT_UI_1015
         * @tc.desc   注册成功后用同一组凭据登录，进入账号页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0015 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await submitRegister(driver, EMAIL, SIGNATURE, PASSWORD, PASSWORD);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await submitLogin(driver, USER, PASSWORD);
            const hasModify: boolean = await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
            const hasDelete: boolean = await existsId(driver, ID_DELETE);
            const hasApplication: boolean = await existsId(driver, ID_APPLICATION);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'modify=%{public}s delete=%{public}s application=%{public}s',
                String(hasModify), String(hasDelete), String(hasApplication));
            expect(hasModify).assertTrue();
            expect(hasDelete).assertTrue();
            expect(hasApplication).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0015 end');
        });

        /**
         * @tc.name   testAccountUi0016
         * @tc.number SUB_ACCT_UI_1016
         * @tc.desc   账号页三个按钮在已登录态下全部可用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0016 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await submitRegister(driver, EMAIL, SIGNATURE, PASSWORD, PASSWORD);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await submitLogin(driver, USER, PASSWORD);
            await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
            const modifyEnabled: boolean = await enabledId(driver, ID_MODIFY);
            const deleteEnabled: boolean = await enabledId(driver, ID_DELETE);
            const applicationEnabled: boolean = await enabledId(driver, ID_APPLICATION);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'modify=%{public}s delete=%{public}s application=%{public}s',
                String(modifyEnabled), String(deleteEnabled), String(applicationEnabled));
            expect(modifyEnabled).assertTrue();
            expect(deleteEnabled).assertTrue();
            expect(applicationEnabled).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0016 end');
        });

        /**
         * @tc.name   testAccountUi0017
         * @tc.number SUB_ACCT_UI_1017
         * @tc.desc   账号页点修改进入修改页，四个输入框与保存按钮就位
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0017 begin');
            await registerAndLogin(driver);
            const entered: boolean = await enterModify(driver);
            const hasThird: boolean = await existsId(driver, modifyId(3));
            const hasFourth: boolean = await existsId(driver, modifyId(4));
            const hasSave: boolean = await existsId(driver, ID_MOD_COMPLETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s third=%{public}s fourth=%{public}s save=%{public}s',
                String(entered), String(hasThird), String(hasFourth), String(hasSave));
            expect(entered).assertTrue();
            expect(hasThird).assertTrue();
            expect(hasFourth).assertTrue();
            expect(hasSave).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0017 end');
        });

        /**
         * @tc.name   testAccountUi0018
         * @tc.number SUB_ACCT_UI_1018
         * @tc.desc   只改签名不动密码时保存，签名与邮箱写回凭据后回到账号页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0018 begin');
            await registerAndLogin(driver);
            await enterModify(driver);
            await submitModify(driver, EMAIL, 'ui-sign-2', '', '');
            const backToAccount: boolean = await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
            const savedSignature: string =
                await model.getAccountCredential(accountNameOf(USER, BUNDLE), 'signature_' + BUNDLE);
            const savedEmail: string =
                await model.getAccountCredential(accountNameOf(USER, BUNDLE), 'email_' + BUNDLE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'account=%{public}s signature=%{public}s email=%{public}s',
                String(backToAccount), savedSignature, savedEmail);
            expect(backToAccount).assertTrue();
            expect(savedSignature).assertEqual('ui-sign-2');
            expect(savedEmail).assertEqual(EMAIL);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0018 end');
        });

        /**
         * @tc.name   testAccountUi0019
         * @tc.number SUB_ACCT_UI_1019
         * @tc.desc   修改页非法邮箱被拦下，但凭据已先写入库（既存缺陷，只记录不修）
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0019 begin');
            await registerAndLogin(driver);
            await enterModify(driver);
            await submitModify(driver, 'bad-email', SIGNATURE, '', '');
            const stillModify: boolean = await existsId(driver, ID_MOD_COMPLETE);
            const storedEmail: string =
                await model.getAccountCredential(accountNameOf(USER, BUNDLE), 'email_' + BUNDLE);
            const hasDelete: boolean = await existsId(driver, ID_DELETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'page=%{public}s email=%{public}s account=%{public}s',
                String(stillModify), storedEmail, String(hasDelete));
            expect(stillModify).assertTrue();
            expect(storedEmail).assertEqual('bad-email');
            expect(hasDelete).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0019 end');
        });

        /**
         * @tc.name   testAccountUi0020
         * @tc.number SUB_ACCT_UI_1020
         * @tc.desc   修改页五位密码被拦下，停在修改页且不回到账号页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0020 begin');
            await registerAndLogin(driver);
            await enterModify(driver);
            await submitModify(driver, '', '', 'abcde', 'abcde');
            const stillModify: boolean = await existsId(driver, modifyId(4));
            const accountShown: boolean = await existsId(driver, ID_MODIFY);
            const passwordEcho: string = await readId(driver, modifyId(4));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'page=%{public}s account=%{public}s echo=%{public}s',
                String(stillModify), String(accountShown), passwordEcho);
            expect(stillModify).assertTrue();
            expect(accountShown).assertFalse();
            expect(passwordEcho).assertEqual('abcde');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0020 end');
        });

        /**
         * @tc.name   testAccountUi0021
         * @tc.number SUB_ACCT_UI_1021
         * @tc.desc   修改页两次新密码不一致被拦下，停在修改页且不回到账号页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0021 begin');
            await registerAndLogin(driver);
            await enterModify(driver);
            await submitModify(driver, '', '', 'fresh456', 'fresh457');
            const stillModify: boolean = await existsId(driver, modifyId(3));
            const accountShown: boolean = await existsId(driver, ID_MODIFY);
            const canRetry: boolean = await enabledId(driver, ID_MOD_COMPLETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'page=%{public}s account=%{public}s retry=%{public}s',
                String(stillModify), String(accountShown), String(canRetry));
            expect(stillModify).assertTrue();
            expect(accountShown).assertFalse();
            expect(canRetry).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0021 end');
        });

        /**
         * @tc.name   testAccountUi0022
         * @tc.number SUB_ACCT_UI_1022
         * @tc.desc   新密码与旧密码相同时被拦下，停在修改页且不回到账号页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0022 begin');
            await registerAndLogin(driver);
            await enterModify(driver);
            await submitModify(driver, '', '', PASSWORD, PASSWORD);
            const stillModify: boolean = await existsId(driver, ID_MOD_COMPLETE);
            const accountGone: boolean = await existsId(driver, ID_DELETE);
            const confirmEcho: string = await readId(driver, modifyId(4));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'page=%{public}s account=%{public}s echo=%{public}s',
                String(stillModify), String(accountGone), confirmEcho);
            expect(stillModify).assertTrue();
            expect(accountGone).assertFalse();
            expect(confirmEcho).assertEqual(PASSWORD);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0022 end');
        });

        /**
         * @tc.name   testAccountUi0023
         * @tc.number SUB_ACCT_UI_1023
         * @tc.desc   改密码成功后回到账号页，修改页随之关闭（新密码可用性由登录用例验证）
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0023 begin');
            await registerAndLogin(driver);
            await enterModify(driver);
            await submitModify(driver, '', '', 'fresh456', 'fresh456');
            const backToAccount: boolean = await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
            await sleep(COMPONENT_WAIT);
            const modifyGone: boolean = await existsId(driver, ID_MOD_COMPLETE);
            const deleteShown: boolean = await existsId(driver, ID_DELETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'account=%{public}s modifyPage=%{public}s delete=%{public}s',
                String(backToAccount), String(modifyGone), String(deleteShown));
            expect(backToAccount).assertTrue();
            expect(modifyGone).assertFalse();
            expect(deleteShown).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0023 end');
        });

        /**
         * @tc.name   testAccountUi0024
         * @tc.number SUB_ACCT_UI_1024
         * @tc.desc   改密码后用旧密码登录失败，停在登录页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0024 begin');
            await registerAndLogin(driver);
            await enterModify(driver);
            await submitModify(driver, '', '', 'fresh456', 'fresh456');
            await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
            await tapId(driver, ID_APPLICATION);
            await confirmDialog(driver);
            await waitId(driver, ID_MUSIC, COMPONENT_WAIT);
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await submitLogin(driver, USER, PASSWORD);
            const stillLogin: boolean = await existsId(driver, ID_NAME);
            const hasModify: boolean = await existsId(driver, ID_MODIFY);
            const nameEcho: string = await readId(driver, ID_NAME);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'login=%{public}s modify=%{public}s name=%{public}s',
                String(stillLogin), String(hasModify), nameEcho);
            expect(stillLogin).assertTrue();
            expect(hasModify).assertFalse();
            expect(nameEcho).assertEqual(USER);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0024 end');
        });

        /**
         * @tc.name   testAccountUi0025
         * @tc.number SUB_ACCT_UI_1025
         * @tc.desc   改密码后用新密码登录成功，进入账号页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0025 begin');
            await registerAndLogin(driver);
            await enterModify(driver);
            await submitModify(driver, '', '', 'fresh456', 'fresh456');
            await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
            await tapId(driver, ID_APPLICATION);
            await confirmDialog(driver);
            await waitId(driver, ID_MUSIC, COMPONENT_WAIT);
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await submitLogin(driver, USER, 'fresh456');
            const hasDelete: boolean = await waitId(driver, ID_DELETE, COMPONENT_WAIT);
            const hasApplication: boolean = await existsId(driver, ID_APPLICATION);
            const noLoginPanel: boolean = await existsId(driver, ID_LOGIN);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'delete=%{public}s application=%{public}s login=%{public}s',
                String(hasDelete), String(hasApplication), String(noLoginPanel));
            expect(hasDelete).assertTrue();
            expect(hasApplication).assertTrue();
            expect(noLoginPanel).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0025 end');
        });

        /**
         * @tc.name   testAccountUi0026
         * @tc.number SUB_ACCT_UI_1026
         * @tc.desc   账号页点切换应用弹出确认框，确认前不跳转
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0026 begin');
            await registerAndLogin(driver);
            const pageBefore: boolean = await existsId(driver, ID_MODIFY);
            await tapId(driver, ID_APPLICATION);
            const dialogShown: boolean = await existsCancelDialog(driver);
            const cancelled: boolean = await cancelDialog(driver);
            const stillHere: boolean = await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'before=%{public}s dialog=%{public}s cancel=%{public}s here=%{public}s',
                String(pageBefore), String(dialogShown), String(cancelled), String(stillHere));
            expect(pageBefore).assertTrue();
            expect(dialogShown).assertTrue();
            expect(cancelled).assertTrue();
            expect(stillHere).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0026 end');
        });

        /**
         * @tc.name   testAccountUi0027
         * @tc.number SUB_ACCT_UI_1027
         * @tc.desc   账号页点删除弹出确认框，确认前账号与页面都在
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0027 begin');
            await registerAndLogin(driver);
            await tapId(driver, ID_DELETE);
            const dialogShown: boolean = await existsCancelDialog(driver);
            const cancelled: boolean = await cancelDialog(driver);
            const stillHere: boolean = await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
            const credential: string =
                await model.getAccountCredential(accountNameOf(USER, BUNDLE), 'email_' + BUNDLE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'dialog=%{public}s cancel=%{public}s here=%{public}s email=%{public}s',
                String(dialogShown), String(cancelled), String(stillHere), credential);
            expect(dialogShown).assertTrue();
            expect(cancelled).assertTrue();
            expect(stillHere).assertTrue();
            expect(credential).assertEqual(EMAIL);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0027 end');
        });

        /**
         * @tc.name   testAccountUi0028
         * @tc.number SUB_ACCT_UI_1028
         * @tc.desc   登录页返回按钮回到入口页，账号面板随之消失
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0028 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const hadBack: boolean = await existsId(driver, ID_BACK);
            await tapId(driver, ID_BACK);
            const confirmed: boolean = await confirmDialog(driver);
            const backHome: boolean = await waitId(driver, ID_MUSIC, COMPONENT_WAIT);
            const backGone: boolean = await existsId(driver, ID_BACK);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'bar=%{public}s dialog=%{public}s home=%{public}s gone=%{public}s',
                String(hadBack), String(confirmed), String(backHome), String(backGone));
            expect(hadBack).assertTrue();
            expect(confirmed).assertTrue();
            expect(backHome).assertTrue();
            expect(backGone).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0028 end');
        });

        /**
         * @tc.name   testAccountUi0029
         * @tc.number SUB_ACCT_UI_1029
         * @tc.desc   注册页返回按钮回到登录页，注册输入框随之消失
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0029 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            await tapId(driver, ID_BACK);
            const confirmed: boolean = await confirmDialog(driver);
            const backToLogin: boolean = await waitId(driver, ID_LOGIN, COMPONENT_WAIT);
            const registerGone: boolean = await existsId(driver, ID_COMPLETE);
            const hasPassword: boolean = await existsId(driver, ID_PASSWORD);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'dialog=%{public}s login=%{public}s register=%{public}s',
                String(confirmed), String(backToLogin), String(registerGone));
            expect(confirmed).assertTrue();
            expect(backToLogin).assertTrue();
            expect(registerGone).assertFalse();
            expect(hasPassword).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0029 end');
        });

        /**
         * @tc.name   testAccountUi0030
         * @tc.number SUB_ACCT_UI_1030
         * @tc.desc   Music 下注册的账号无法在 Video 入口登录，应用间互相隔离
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUi0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0030 begin');
            await registerAndLogin(driver);
            await tapId(driver, ID_APPLICATION);
            await confirmDialog(driver);
            await waitId(driver, ID_MUSIC, COMPONENT_WAIT);
            await tapId(driver, ID_VIDEO);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await submitLogin(driver, USER, PASSWORD);
            const stillLogin: boolean = await existsId(driver, ID_NAME);
            const hasModify: boolean = await existsId(driver, ID_MODIFY);
            const videoAbsent: boolean =
                await credentialAbsent(model, accountNameOf(USER, OTHER_BUNDLE), 'email_' + OTHER_BUNDLE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'login=%{public}s modify=%{public}s videoAbsent=%{public}s',
                String(stillLogin), String(hasModify), String(videoAbsent));
            expect(stillLogin).assertTrue();
            expect(hasModify).assertFalse();
            expect(videoAbsent).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUi0030 end');
        });
    });
}
