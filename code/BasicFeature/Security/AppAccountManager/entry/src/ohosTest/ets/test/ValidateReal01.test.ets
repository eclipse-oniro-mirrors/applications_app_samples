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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
    AccountValidator, LoginInput, LoginResult, ModifyInput, ModifyResult, RegisterInput, RegisterResult
} from '../../../main/ets/model/AccountValidator';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

function regInput(username: string, email: string, signature: string, password: string,
    confirmPassword: string): RegisterInput {
    let input: RegisterInput = {
        username: username, email: email, signature: signature,
        password: password, confirmPassword: confirmPassword
    };
    return input;
}

function modInput(email: string, signature: string, password: string, confirmPassword: string): ModifyInput {
    let input: ModifyInput = {
        email: email, signature: signature, password: password, confirmPassword: confirmPassword
    };
    return input;
}

function loginInput(name: string, password: string): LoginInput {
    let input: LoginInput = { name: name, password: password };
    return input;
}

const OK_REGISTER: RegisterInput = regInput('tom', 'tom@example.com', 'hello', 'pass123', 'pass123');
const OK_PASSWORD: string = 'pass123';

export default function validateRealTest() {
    describe('ValidateRealTest', () => {
        /**
         * @tc.name   testValidateReal0001
         * @tc.number SUB_ACCT_VALREAL_0001
         * @tc.desc   四个长度常量取自页面输入框上限，密码下限最小且登录上限最大
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0001 begin');
            expect(AccountValidator.MIN_PASSWORD_LENGTH).assertEqual(6);
            expect(AccountValidator.USERNAME_MAX_LENGTH).assertEqual(15);
            expect(AccountValidator.FIELD_MAX_LENGTH).assertEqual(18);
            expect(AccountValidator.LOGIN_MAX_LENGTH).assertEqual(20);
            expect(AccountValidator.MIN_PASSWORD_LENGTH < AccountValidator.USERNAME_MAX_LENGTH).assertTrue();
            expect(AccountValidator.USERNAME_MAX_LENGTH < AccountValidator.FIELD_MAX_LENGTH).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0001 end');
        });

        /**
         * @tc.name   testValidateReal0002
         * @tc.number SUB_ACCT_VALREAL_0002
         * @tc.desc   用户名正则只放行字母数字与下划线，源串与页面 inputFilter 同源
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0002 begin');
            const source: string = AccountValidator.USERNAME_PATTERN.source;
            expect(source).assertEqual('^[A-Za-z0-9_]+$');
            expect(source.startsWith('^')).assertTrue();
            expect(source.endsWith('$')).assertTrue();
            expect(AccountValidator.isUsernameValid('tom_01')).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0002 end');
        });

        /**
         * @tc.name   testValidateReal0003
         * @tc.number SUB_ACCT_VALREAL_0003
         * @tc.desc   邮箱正则源串包含顶级域长度的 2 到 6 量词与唯一的 at 分隔符
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0003 begin');
            const source: string = AccountValidator.EMAIL_PATTERN.source;
            expect(source.indexOf('{2,6}') > 0).assertTrue();
            expect(source.indexOf('@') > 0).assertTrue();
            expect(source.lastIndexOf('@')).assertEqual(source.indexOf('@'));
            expect(source.endsWith('$')).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0003 end');
        });

        /**
         * @tc.name   testValidateReal0004
         * @tc.number SUB_ACCT_VALREAL_0004
         * @tc.desc   两个正则常量都是正则对象，源串非空且可重复调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0004 begin');
            expect(AccountValidator.EMAIL_PATTERN.source.length).assertLarger(10);
            expect(AccountValidator.USERNAME_PATTERN.source.length).assertLarger(5);
            expect(AccountValidator.isEmailValid('a@b.co')).assertTrue();
            expect(AccountValidator.isEmailValid('a@b.co')).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0004 end');
        });

        /**
         * @tc.name   testValidateReal0005
         * @tc.number SUB_ACCT_VALREAL_0005
         * @tc.desc   注册结果枚举取值与页面原有分支顺序逐位对齐
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0005 begin');
            expect(RegisterResult.OK).assertEqual(0);
            expect(RegisterResult.USERNAME_EMPTY).assertEqual(1);
            expect(RegisterResult.ACCOUNT_EXISTS).assertEqual(2);
            expect(RegisterResult.EMAIL_INVALID).assertEqual(3);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0005 end');
        });

        /**
         * @tc.name   testValidateReal0006
         * @tc.number SUB_ACCT_VALREAL_0006
         * @tc.desc   注册结果枚举后三位的取值与分支顺序继续递增
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0006 begin');
            expect(RegisterResult.PASSWORD_EMPTY).assertEqual(4);
            expect(RegisterResult.PASSWORD_TOO_SHORT).assertEqual(5);
            expect(RegisterResult.CONFIRM_MISMATCH).assertEqual(6);
            expect(RegisterResult.CONFIRM_MISMATCH > RegisterResult.PASSWORD_TOO_SHORT).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0006 end');
        });

        /**
         * @tc.name   testValidateReal0007
         * @tc.number SUB_ACCT_VALREAL_0007
         * @tc.desc   修改结果枚举中两个成功分支排在最前，用于区分是否带密码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0007 begin');
            expect(ModifyResult.OK_WITH_PASSWORD).assertEqual(0);
            expect(ModifyResult.OK_WITHOUT_PASSWORD).assertEqual(1);
            expect(Number(ModifyResult.OK_WITH_PASSWORD) === Number(ModifyResult.OK_WITHOUT_PASSWORD)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0007 end');
        });

        /**
         * @tc.name   testValidateReal0008
         * @tc.number SUB_ACCT_VALREAL_0008
         * @tc.desc   修改结果枚举的失败分支按邮箱、密码长度、旧密码、确认顺序排列
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0008 begin');
            expect(ModifyResult.EMAIL_INVALID).assertEqual(2);
            expect(ModifyResult.PASSWORD_TOO_SHORT).assertEqual(3);
            expect(ModifyResult.PASSWORD_SAME_AS_OLD).assertEqual(4);
            expect(ModifyResult.CONFIRM_MISMATCH).assertEqual(5);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0008 end');
        });

        /**
         * @tc.name   testValidateReal0009
         * @tc.number SUB_ACCT_VALREAL_0009
         * @tc.desc   登录结果枚举四个取值固定，失败分支排在最后
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0009 begin');
            expect(LoginResult.OK).assertEqual(0);
            expect(LoginResult.NAME_EMPTY).assertEqual(1);
            expect(LoginResult.PASSWORD_EMPTY).assertEqual(2);
            expect(LoginResult.FAILED).assertEqual(3);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0009 end');
        });

        /**
         * @tc.name   testValidateReal0010
         * @tc.number SUB_ACCT_VALREAL_0010
         * @tc.desc   三个枚举的成功值都是 0，可被调用方按 0 判定成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0010 begin');
            expect(RegisterResult.OK).assertEqual(0);
            expect(LoginResult.OK).assertEqual(0);
            expect(ModifyResult.OK_WITH_PASSWORD).assertEqual(0);
            expect(Number(RegisterResult.OK) === Number(LoginResult.OK)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0010 end');
        });

        /**
         * @tc.name   testValidateReal0011
         * @tc.number SUB_ACCT_VALREAL_0011
         * @tc.desc   合法注册输入同时满足登录判定，注册与登录共用同一份密码约定
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0011 begin');
            const reg: RegisterResult = AccountValidator.validateRegister(OK_REGISTER, false);
            const login: LoginResult =
                AccountValidator.validateLogin(loginInput('tom', OK_PASSWORD), OK_PASSWORD, 'true');
            expect(reg).assertEqual(RegisterResult.OK);
            expect(login).assertEqual(LoginResult.OK);
            expect(reg).assertEqual(login);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0011 end');
        });

        /**
         * @tc.name   testValidateReal0012
         * @tc.number SUB_ACCT_VALREAL_0012
         * @tc.desc   密码长度判定与注册分支在 5 和 6 两个邻点上保持一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0012 begin');
            const short: RegisterResult =
                AccountValidator.validateRegister(regInput('tom', '', 's', 'abcde', 'abcde'), false);
            const enough: RegisterResult =
                AccountValidator.validateRegister(regInput('tom', '', 's', 'abcdef', 'abcdef'), false);
            expect(AccountValidator.isPasswordLongEnough('abcde')).assertFalse();
            expect(short).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
            expect(AccountValidator.isPasswordLongEnough('abcdef')).assertTrue();
            expect(enough).assertEqual(RegisterResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0012 end');
        });

        /**
         * @tc.name   testValidateReal0013
         * @tc.number SUB_ACCT_VALREAL_0013
         * @tc.desc   邮箱判定与注册邮箱分支对同一批地址给出互斥结论
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0013 begin');
            const bad: string = 'tom@example.c';
            const good: string = 'tom@example.co';
            expect(AccountValidator.isEmailValid(bad)).assertFalse();
            expect(AccountValidator.validateRegister(regInput('tom', bad, 's', OK_PASSWORD, OK_PASSWORD), false))
                .assertEqual(RegisterResult.EMAIL_INVALID);
            expect(AccountValidator.isEmailValid(good)).assertTrue();
            expect(AccountValidator.validateRegister(regInput('tom', good, 's', OK_PASSWORD, OK_PASSWORD), false))
                .assertEqual(RegisterResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0013 end');
        });

        /**
         * @tc.name   testValidateReal0014
         * @tc.number SUB_ACCT_VALREAL_0014
         * @tc.desc   空用户名在字符判定与注册分支上都被拒绝，结论方向一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0014 begin');
            expect(AccountValidator.isUsernameValid('')).assertFalse();
            expect(AccountValidator.validateRegister(regInput('', '', '', '', ''), false))
                .assertEqual(RegisterResult.USERNAME_EMPTY);
            expect(AccountValidator.isUsernameValid('tom')).assertTrue();
            expect(AccountValidator.validateRegister(regInput('tom', '', '', '', ''), false))
                .assertEqual(RegisterResult.PASSWORD_EMPTY);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0014 end');
        });

        /**
         * @tc.name   testValidateReal0015
         * @tc.number SUB_ACCT_VALREAL_0015
         * @tc.desc   修改成功带密码时新密码与已存密码必须不同，否则走相同分支
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0015 begin');
            const fresh: ModifyResult =
                AccountValidator.validateModify(modInput('', 's', 'fresh456', 'fresh456'), OK_PASSWORD);
            const same: ModifyResult =
                AccountValidator.validateModify(modInput('', 's', OK_PASSWORD, OK_PASSWORD), OK_PASSWORD);
            expect(fresh).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(same).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
            expect(fresh === same).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0015 end');
        });

        /**
         * @tc.name   testValidateReal0016
         * @tc.number SUB_ACCT_VALREAL_0016
         * @tc.desc   只改资料时两个密码字段都为空，落到无密码成功分支
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0016 begin');
            const onlyProfile: ModifyResult =
                AccountValidator.validateModify(modInput('new@example.com', 'sig', '', ''), OK_PASSWORD);
            expect(onlyProfile).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
            expect(onlyProfile === ModifyResult.PASSWORD_SAME_AS_OLD).assertFalse();
            expect(onlyProfile).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0016 end');
        });

        /**
         * @tc.name   testValidateReal0017
         * @tc.number SUB_ACCT_VALREAL_0017
         * @tc.desc   注册允许邮箱留空，留空时不进入邮箱格式分支
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0017 begin');
            const empty: RegisterResult =
                AccountValidator.validateRegister(regInput('tom', '', 'sig', OK_PASSWORD, OK_PASSWORD), false);
            expect(empty).assertEqual(RegisterResult.OK);
            expect(AccountValidator.isEmailValid('')).assertFalse();
            expect(empty === RegisterResult.EMAIL_INVALID).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0017 end');
        });

        /**
         * @tc.name   testValidateReal0018
         * @tc.number SUB_ACCT_VALREAL_0018
         * @tc.desc   登录成功需要已存密码与登录标记同时匹配，任一不满足即失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0018 begin');
            const both: LoginResult = AccountValidator.validateLogin(loginInput('tom', OK_PASSWORD), OK_PASSWORD,
                'true');
            const flagOnly: LoginResult =
                AccountValidator.validateLogin(loginInput('tom', 'wrong12'), OK_PASSWORD, 'true');
            const passOnly: LoginResult = AccountValidator.validateLogin(loginInput('tom', OK_PASSWORD), OK_PASSWORD,
                'null');
            expect(both).assertEqual(LoginResult.OK);
            expect(flagOnly).assertEqual(LoginResult.FAILED);
            expect(passOnly).assertEqual(LoginResult.FAILED);
            expect(flagOnly).assertEqual(passOnly);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0018 end');
        });

        /**
         * @tc.name   testValidateReal0019
         * @tc.number SUB_ACCT_VALREAL_0019
         * @tc.desc   登录标记只认字符串 true，其它取值一律判为失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0019 begin');
            const input: LoginInput = loginInput('tom', OK_PASSWORD);
            expect(AccountValidator.validateLogin(input, OK_PASSWORD, 'TRUE')).assertEqual(LoginResult.FAILED);
            expect(AccountValidator.validateLogin(input, OK_PASSWORD, ' true')).assertEqual(LoginResult.FAILED);
            expect(AccountValidator.validateLogin(input, OK_PASSWORD, '1')).assertEqual(LoginResult.FAILED);
            expect(AccountValidator.validateLogin(input, OK_PASSWORD, 'true')).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0019 end');
        });

        /**
         * @tc.name   testValidateReal0020
         * @tc.number SUB_ACCT_VALREAL_0020
         * @tc.desc   登录空用户名优先于空密码，两个都空时返回用户名空
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0020 begin');
            const bothEmpty: LoginResult = AccountValidator.validateLogin(loginInput('', ''), '', 'true');
            const passEmpty: LoginResult = AccountValidator.validateLogin(loginInput('tom', ''), OK_PASSWORD, 'true');
            expect(bothEmpty).assertEqual(LoginResult.NAME_EMPTY);
            expect(passEmpty).assertEqual(LoginResult.PASSWORD_EMPTY);
            expect(bothEmpty === passEmpty).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0020 end');
        });

        /**
         * @tc.name   testValidateReal0021
         * @tc.number SUB_ACCT_VALREAL_0021
         * @tc.desc   修改时邮箱非法优先于密码过短，两个缺陷同时存在只报邮箱
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0021 begin');
            const both: ModifyResult =
                AccountValidator.validateModify(modInput('tom@', 'sig', 'abc', 'abc'), OK_PASSWORD);
            const shortOnly: ModifyResult =
                AccountValidator.validateModify(modInput('', 'sig', 'abc', 'abc'), OK_PASSWORD);
            expect(both).assertEqual(ModifyResult.EMAIL_INVALID);
            expect(shortOnly).assertEqual(ModifyResult.PASSWORD_TOO_SHORT);
            expect(both < shortOnly).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0021 end');
        });

        /**
         * @tc.name   testValidateReal0022
         * @tc.number SUB_ACCT_VALREAL_0022
         * @tc.desc   注册空用户名优先于账号已存在，两个条件同时成立只报用户名空
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0022 begin');
            const both: RegisterResult = AccountValidator.validateRegister(regInput('', 'tom@', '', '', ''), true);
            const existsOnly: RegisterResult =
                AccountValidator.validateRegister(regInput('tom', 'tom@', '', '', ''), true);
            expect(both).assertEqual(RegisterResult.USERNAME_EMPTY);
            expect(existsOnly).assertEqual(RegisterResult.ACCOUNT_EXISTS);
            expect(both < existsOnly).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0022 end');
        });

        /**
         * @tc.name   testValidateReal0023
         * @tc.number SUB_ACCT_VALREAL_0023
         * @tc.desc   注册邮箱非法优先于密码为空，空密码不掩盖地址格式问题
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0023 begin');
            const both: RegisterResult = AccountValidator.validateRegister(regInput('tom', 'tom@', '', '', ''), false);
            const passEmpty: RegisterResult = AccountValidator.validateRegister(regInput('tom', '', '', '', ''), false);
            expect(both).assertEqual(RegisterResult.EMAIL_INVALID);
            expect(passEmpty).assertEqual(RegisterResult.PASSWORD_EMPTY);
            expect(both < passEmpty).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0023 end');
        });

        /**
         * @tc.name   testValidateReal0024
         * @tc.number SUB_ACCT_VALREAL_0024
         * @tc.desc   注册密码过短优先于确认不一致，长度问题先于两次输入比较
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testValidateReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0024 begin');
            const both: RegisterResult = AccountValidator.validateRegister(regInput('tom', '', 's', 'abc', 'xyz'),
                false);
            const mismatch: RegisterResult =
                AccountValidator.validateRegister(regInput('tom', '', 's', OK_PASSWORD, 'pass999'), false);
            expect(both).assertEqual(RegisterResult.PASSWORD_TOO_SHORT);
            expect(mismatch).assertEqual(RegisterResult.CONFIRM_MISMATCH);
            expect(both < mismatch).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0024 end');
        });

        /**
         * @tc.name   testValidateReal0025
         * @tc.number SUB_ACCT_VALREAL_0025
         * @tc.desc   修改时旧密码相同优先于确认不一致，相同密码不会被确认分支覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testValidateReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0025 begin');
            const both: ModifyResult =
                AccountValidator.validateModify(modInput('', 's', OK_PASSWORD, 'other123'), OK_PASSWORD);
            expect(both).assertEqual(ModifyResult.PASSWORD_SAME_AS_OLD);
            expect(both === ModifyResult.CONFIRM_MISMATCH).assertFalse();
            expect(both > ModifyResult.PASSWORD_TOO_SHORT).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0025 end');
        });

        /**
         * @tc.name   testValidateReal0026
         * @tc.number SUB_ACCT_VALREAL_0026
         * @tc.desc   邮箱顶级域长度 2 与 6 在窗口内，1 与 7 越界
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0026 begin');
            expect(AccountValidator.isEmailValid('a@b.co')).assertTrue();
            expect(AccountValidator.isEmailValid('a@b.abcdef')).assertTrue();
            expect(AccountValidator.isEmailValid('a@b.c')).assertFalse();
            expect(AccountValidator.isEmailValid('a@b.abcdefg')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0026 end');
        });

        /**
         * @tc.name   testValidateReal0027
         * @tc.number SUB_ACCT_VALREAL_0027
         * @tc.desc   邮箱本地部分允许下划线、点号与减号三种分隔符
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0027 begin');
            expect(AccountValidator.isEmailValid('tom_smith@example.com')).assertTrue();
            expect(AccountValidator.isEmailValid('tom.smith@example.com')).assertTrue();
            expect(AccountValidator.isEmailValid('tom-smith@example.com')).assertTrue();
            expect(AccountValidator.isEmailValid('tom_smith@example.c')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0027 end');
        });

        /**
         * @tc.name   testValidateReal0028
         * @tc.number SUB_ACCT_VALREAL_0028
         * @tc.desc   邮箱本地部分拒绝加号、百分号与空格三种常见非法字符
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0028 begin');
            expect(AccountValidator.isEmailValid('tom+tag@example.com')).assertFalse();
            expect(AccountValidator.isEmailValid('tom%tag@example.com')).assertFalse();
            expect(AccountValidator.isEmailValid('tom tag@example.com')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0028 end');
        });

        /**
         * @tc.name   testValidateReal0029
         * @tc.number SUB_ACCT_VALREAL_0029
         * @tc.desc   邮箱域名允许减号但拒绝下划线，两个近似地址结论相反
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testValidateReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0029 begin');
            expect(AccountValidator.isEmailValid('tom@ex-ample.com')).assertTrue();
            expect(AccountValidator.isEmailValid('tom@ex_ample.com')).assertFalse();
            expect(AccountValidator.isEmailValid('tom@ex-ample.com'))
                .assertEqual(!AccountValidator.isEmailValid('tom@ex_ample.com'));
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0029 end');
        });

        /**
         * @tc.name   testValidateReal0030
         * @tc.number SUB_ACCT_VALREAL_0030
         * @tc.desc   邮箱各段字符类对大小写不做区分，同一地址换大小写结论不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0030 begin');
            const lower: boolean = AccountValidator.isEmailValid('tom.smith@example.com');
            expect(AccountValidator.isEmailValid('TOM.SMITH@EXAMPLE.COM')).assertEqual(lower);
            expect(lower).assertTrue();
            expect(AccountValidator.isEmailValid('Tom.Smith@Example.Com')).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0030 end');
        });

        /**
         * @tc.name   testValidateReal0031
         * @tc.number SUB_ACCT_VALREAL_0031
         * @tc.desc   邮箱本地部分的多点写法仍在字符类内，允许连续两个点
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testValidateReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0031 begin');
            expect(AccountValidator.isEmailValid('tom..smith@example.com')).assertTrue();
            expect(AccountValidator.isEmailValid('.tom@example.com')).assertTrue();
            expect(AccountValidator.isEmailValid('tom.@example.com')).assertTrue();
            expect(AccountValidator.isEmailValid('tom..smith@example.com') ===
                AccountValidator.isEmailValid('tom.smith@example.com')).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0031 end');
        });

        /**
         * @tc.name   testValidateReal0032
         * @tc.number SUB_ACCT_VALREAL_0032
         * @tc.desc   邮箱首尾空白会被整串锚定规则拒绝，去掉空白后又合法
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testValidateReal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0032 begin');
            expect(AccountValidator.isEmailValid(' tom@example.com')).assertFalse();
            expect(AccountValidator.isEmailValid('tom@example.com ')).assertFalse();
            expect(AccountValidator.isEmailValid('tom@example.com')).assertTrue();
            expect(AccountValidator.isEmailValid('\ttom@example.com')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0032 end');
        });

        /**
         * @tc.name   testValidateReal0033
         * @tc.number SUB_ACCT_VALREAL_0033
         * @tc.desc   邮箱各段都只接受 ASCII，中文与全角符号一律非法
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testValidateReal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0033 begin');
            expect(AccountValidator.isEmailValid('中文@example.com')).assertFalse();
            expect(AccountValidator.isEmailValid('tom@例子.com')).assertFalse();
            expect(AccountValidator.isEmailValid('tom＠example.com')).assertFalse();
            expect(AccountValidator.isEmailValid('tom@example.com😀')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0033 end');
        });

        /**
         * @tc.name   testValidateReal0034
         * @tc.number SUB_ACCT_VALREAL_0034
         * @tc.desc   用户名允许数字与下划线，拒绝点号、减号与中文
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0034 begin');
            expect(AccountValidator.isUsernameValid('user_01')).assertTrue();
            expect(AccountValidator.isUsernameValid('12345')).assertTrue();
            expect(AccountValidator.isUsernameValid('tom.smith')).assertFalse();
            expect(AccountValidator.isUsernameValid('tom-smith')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0034 end');
        });

        /**
         * @tc.name   testValidateReal0035
         * @tc.number SUB_ACCT_VALREAL_0035
         * @tc.desc   密码只数代码单元，六个空格满下限，五空格与五位制表符都被拦下
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0035 begin');
            expect(AccountValidator.isPasswordLongEnough('     ')).assertFalse();
            expect(AccountValidator.isPasswordLongEnough('      ')).assertTrue();
            expect(AccountValidator.isPasswordLongEnough('\t\t\t\t\t\t')).assertTrue();
            expect(AccountValidator.isPasswordLongEnough('\t\t\t\t\t')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0035 end');
        });

        /**
         * @tc.name   testValidateReal0036
         * @tc.number SUB_ACCT_VALREAL_0036
         * @tc.desc   注册通过后按同一密码登录通过，改密码后旧密码立即失效
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0036 begin');
            const reg: RegisterResult = AccountValidator.validateRegister(OK_REGISTER, false);
            const firstLogin: LoginResult =
                AccountValidator.validateLogin(loginInput('tom', OK_PASSWORD), OK_PASSWORD, 'true');
            const modify: ModifyResult =
                AccountValidator.validateModify(modInput('', 's', 'fresh456', 'fresh456'), OK_PASSWORD);
            const oldLogin: LoginResult =
                AccountValidator.validateLogin(loginInput('tom', OK_PASSWORD), 'fresh456', 'true');
            const newLogin: LoginResult =
                AccountValidator.validateLogin(loginInput('tom', 'fresh456'), 'fresh456', 'true');
            expect(reg).assertEqual(RegisterResult.OK);
            expect(firstLogin).assertEqual(LoginResult.OK);
            expect(modify).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(oldLogin).assertEqual(LoginResult.FAILED);
            expect(newLogin).assertEqual(LoginResult.OK);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0036 end');
        });

        /**
         * @tc.name   testValidateReal0037
         * @tc.number SUB_ACCT_VALREAL_0037
         * @tc.desc   只改资料不改密码时登录凭据不变，旧密码仍可登录
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0037 begin');
            const modify: ModifyResult =
                AccountValidator.validateModify(modInput('new@example.com', 'new-sign', '', ''), OK_PASSWORD);
            const login: LoginResult =
                AccountValidator.validateLogin(loginInput('tom', OK_PASSWORD), OK_PASSWORD, 'true');
            expect(modify).assertEqual(ModifyResult.OK_WITHOUT_PASSWORD);
            expect(login).assertEqual(LoginResult.OK);
            expect(login === LoginResult.FAILED).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0037 end');
        });

        /**
         * @tc.name   testValidateReal0038
         * @tc.number SUB_ACCT_VALREAL_0038
         * @tc.desc   账号被移除后密码与标记都不可读，登录判定回落到失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0038 begin');
            const removed: LoginResult = AccountValidator.validateLogin(loginInput('tom', OK_PASSWORD), 'null', 'null');
            expect(removed).assertEqual(LoginResult.FAILED);
            expect(removed === LoginResult.OK).assertFalse();
            expect(removed).assertEqual(LoginResult.FAILED + 0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0038 end');
        });

        /**
         * @tc.name   testValidateReal0039
         * @tc.number SUB_ACCT_VALREAL_0039
         * @tc.desc   两个账号的凭据彼此独立，交叉密码无法互相登录
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testValidateReal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0039 begin');
            const first: LoginResult =
                AccountValidator.validateLogin(loginInput('tom', 'pass123'), 'pass123', 'true');
            const second: LoginResult =
                AccountValidator.validateLogin(loginInput('jerry', 'jerry12'), 'jerry12', 'true');
            const crossed: LoginResult =
                AccountValidator.validateLogin(loginInput('tom', 'jerry12'), 'pass123', 'true');
            expect(first).assertEqual(LoginResult.OK);
            expect(second).assertEqual(LoginResult.OK);
            expect(crossed).assertEqual(LoginResult.FAILED);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0039 end');
        });

        /**
         * @tc.name   testValidateReal0040
         * @tc.number SUB_ACCT_VALREAL_0040
         * @tc.desc   注册、登录、修改三套校验在同一条输入上给出可推演的一致结论
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testValidateReal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0040 begin');
            const reg: RegisterResult = AccountValidator.validateRegister(regInput('tom', 'tom@example.com', '',
                'abcdef',
                'abcdef'), false);
            const login: LoginResult = AccountValidator.validateLogin(loginInput('tom', 'abcdef'), 'abcdef', 'true');
            const modify: ModifyResult = AccountValidator.validateModify(modInput('tom@example.org', 'sig', 'ghijkl',
                'ghijkl'), 'abcdef');
            expect(reg).assertEqual(RegisterResult.OK);
            expect(login).assertEqual(LoginResult.OK);
            expect(modify).assertEqual(ModifyResult.OK_WITH_PASSWORD);
            expect(reg === RegisterResult.OK && login === LoginResult.OK).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testValidateReal0040 end');
        });
    });
}
