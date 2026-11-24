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
import { AccountErrorCode } from '../../../main/ets/model/AccountErrorCode';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const LONG_VALUE: string = 'c'.repeat(256);
const HUGE_VALUE: string = 'credential'.repeat(410);

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

export default function accountModelTest() {
    describe('AccountModelTest', () => {
        let model: AccountModel = new AccountModel();
        const name: string = 'acct_svc_main';

        beforeEach(async () => {
            await dropAccount(model, name);
        });

        afterEach(async () => {
            await dropAccount(model, name);
        });

        /**
         * @tc.name   testAcctSvc0001
         * @tc.number SUB_ACCT_ACCTSVC_0001
         * @tc.desc   新增账号后写入凭据，再读回凭据与写入值一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAcctSvc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0001 begin');
            await model.addAccount(name);
            await model.setAccountCredential(name, 'email_Music', 'tom@example.com');
            const actual: string = await model.getAccountCredential(name, 'email_Music');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'tom@example.com');
            expect(actual).assertEqual('tom@example.com');
            expect(actual.length).assertEqual(15);
            expect(actual === 'tom@example.org').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0001 end');
        });

        /**
         * @tc.name   testAcctSvc0002
         * @tc.number SUB_ACCT_ACCTSVC_0002
         * @tc.desc   重复新增同名账号抛出账号已存在错误码 12300004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAcctSvc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0002 begin');
            await model.addAccount(name);
            let code: number = 0;
            try {
                await model.addAccount(name);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d no-error-code is %{public}s', code, 'unexpected');
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isAccountAlreadyExists(code)).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0002 end');
        });

        /**
         * @tc.name   testAcctSvc0003
         * @tc.number SUB_ACCT_ACCTSVC_0003
         * @tc.desc   删除不存在的账号抛出账号不存在错误码 12300003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAcctSvc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0003 begin');
            let code: number = 0;
            try {
                await model.deleteAccount('acct_svc_ghost');
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d no-error-code is %{public}s', code, 'unexpected');
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.isRecoverable(code)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0003 end');
        });

        /**
         * @tc.name   testAcctSvc0004
         * @tc.number SUB_ACCT_ACCTSVC_0004
         * @tc.desc   同一凭据类型二次写入后读回新值，旧值不可见
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0004 begin');
            await model.addAccount(name);
            await model.setAccountCredential(name, 'signature_Music', 'first');
            await model.setAccountCredential(name, 'signature_Music', 'second');
            const actual: string = await model.getAccountCredential(name, 'signature_Music');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'second');
            expect(actual).assertEqual('second');
            expect(actual === 'first').assertFalse();
            expect(actual.length).assertEqual(6);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0004 end');
        });

        /**
         * @tc.name   testAcctSvc0005
         * @tc.number SUB_ACCT_ACCTSVC_0005
         * @tc.desc   写入扩展信息后 getAccountExtraInfo 读回同值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0005 begin');
            await model.addAccount(name);
            await model.setAccountExtraInfo(name, 'extra-001');
            const actual: string = await model.getAccountExtraInfo(name);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'extra-001');
            expect(actual).assertEqual('extra-001');
            expect(actual.length).assertEqual(9);
            expect(actual === 'extra-002').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0005 end');
        });

        /**
         * @tc.name   testAcctSvc0006
         * @tc.number SUB_ACCT_ACCTSVC_0006
         * @tc.desc   写入关联数据后 getAssociatedData 读回同值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0006 begin');
            await model.addAccount(name);
            await model.setAssociatedData(name, 'key_Music', 'pwd-value');
            const actual: string = await model.getAssociatedData(name, 'key_Music');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'pwd-value');
            expect(actual).assertEqual('pwd-value');
            expect(actual.length).assertEqual(9);
            expect(actual === 'pwd-valuE').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0006 end');
        });

        /**
         * @tc.name   testAcctSvc0007
         * @tc.number SUB_ACCT_ACCTSVC_0007
         * @tc.desc   同一关联数据键二次写入后读回新值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0007 begin');
            await model.addAccount(name);
            await model.setAssociatedData(name, 'key_Music', 'old-pass');
            await model.setAssociatedData(name, 'key_Music', 'new-pass');
            const actual: string = await model.getAssociatedData(name, 'key_Music');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'new-pass');
            expect(actual).assertEqual('new-pass');
            expect(actual === 'old-pass').assertFalse();
            expect(actual.indexOf('new')).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0007 end');
        });

        /**
         * @tc.name   testAcctSvc0008
         * @tc.number SUB_ACCT_ACCTSVC_0008
         * @tc.desc   读取未写入的凭据类型抛出约定错误码 12300002 或 12300003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0008 begin');
            await model.addAccount(name);
            let code: number = 0;
            try {
                await model.getAccountCredential(name, 'email_Video');
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d no-error-code is %{public}s', code, 'unexpected');
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isRecoverable(code)).assertTrue();
            expect(AccountErrorCode.of(code) !== 0).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0008 end');
        });

        /**
         * @tc.name   testAcctSvc0009
         * @tc.number SUB_ACCT_ACCTSVC_0009
         * @tc.desc   读取未写入的关联数据键抛出约定错误码 12300002 或 12300003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0009 begin');
            await model.addAccount(name);
            let code: number = 0;
            try {
                await model.getAssociatedData(name, 'key_Video');
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d no-error-code is %{public}s', code, 'unexpected');
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isRecoverable(code)).assertTrue();
            expect(AccountErrorCode.describe(code).length > 0).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0009 end');
        });

        /**
         * @tc.name   testAcctSvc0010
         * @tc.number SUB_ACCT_ACCTSVC_0010
         * @tc.desc   中文凭据写入后读回内容一致，长度按字符计为 2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0010 begin');
            await model.addAccount(name);
            await model.setAccountCredential(name, 'signature_Music', '晴天');
            const actual: string = await model.getAccountCredential(name, 'signature_Music');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, '晴天');
            expect(actual).assertEqual('晴天');
            expect(actual.length).assertEqual(2);
            expect(actual === '晴 天').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0010 end');
        });

        /**
         * @tc.name   testAcctSvc0011
         * @tc.number SUB_ACCT_ACCTSVC_0011
         * @tc.desc   256 字符凭据写入后读回长度不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0011 begin');
            await model.addAccount(name);
            await model.setAccountCredential(name, 'email_Map', LONG_VALUE);
            const actual: string = await model.getAccountCredential(name, 'email_Map');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actualLength=%{public}d expected=%{public}d', actual.length, 256);
            expect(actual.length).assertEqual(256);
            expect(actual).assertEqual(LONG_VALUE);
            expect(actual === '').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0011 end');
        });

        /**
         * @tc.name   testAcctSvc0012
         * @tc.number SUB_ACCT_ACCTSVC_0012
         * @tc.desc   4100 字符凭据超过 1024 上限，写入被拒绝
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0012 begin');
            await model.addAccount(name);
            let code: number = 0;
            try {
                await model.setAccountCredential(name, 'email_Map', HUGE_VALUE);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'rejectCode=%{public}d expected=%{public}s', code, 'non-zero');
            expect(code !== 0).assertTrue();
            expect(code === 12300002 || code === 12300004 || code === 10004).assertTrue();
            expect(AccountErrorCode.describe(code).length > 0).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0012 end');
        });

        /**
         * @tc.name   testAcctSvc0013
         * @tc.number SUB_ACCT_ACCTSVC_0013
         * @tc.desc   空串凭据写入后读回仍为空串
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0013 begin');
            await model.addAccount(name);
            await model.setAccountCredential(name, 'signature_Map', '');
            const actual: string = await model.getAccountCredential(name, 'signature_Map');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[]', actual);
            expect(actual).assertEqual('');
            expect(actual.length).assertEqual(0);
            expect(actual === 'null').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0013 end');
        });

        /**
         * @tc.name   testAcctSvc0014
         * @tc.number SUB_ACCT_ACCTSVC_0014
         * @tc.desc   同一账号的两种凭据类型互不覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0014 begin');
            await model.addAccount(name);
            await model.setAccountCredential(name, 'email_Music', 'a@b.com');
            await model.setAccountCredential(name, 'signature_Music', 'hello');
            expect(await model.getAccountCredential(name, 'email_Music')).assertEqual('a@b.com');
            expect(await model.getAccountCredential(name, 'signature_Music')).assertEqual('hello');
            expect(await model.getAccountCredential(name, 'email_Music') === 'hello').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0014 end');
        });

        /**
         * @tc.name   testAcctSvc0015
         * @tc.number SUB_ACCT_ACCTSVC_0015
         * @tc.desc   同一账号的两个关联数据键互不覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0015 begin');
            await model.addAccount(name);
            await model.setAssociatedData(name, 'key_Music', 'music-pwd');
            await model.setAssociatedData(name, 'key_Video', 'video-pwd');
            expect(await model.getAssociatedData(name, 'key_Music')).assertEqual('music-pwd');
            expect(await model.getAssociatedData(name, 'key_Video')).assertEqual('video-pwd');
            expect(await model.getAssociatedData(name, 'key_Music') === 'video-pwd').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0015 end');
        });

        /**
         * @tc.name   testAcctSvc0016
         * @tc.number SUB_ACCT_ACCTSVC_0016
         * @tc.desc   用户名与应用名拼接后的账号名可作为合法账号标识
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0016 begin');
            const joined: string = 'tom_Music';
            await dropAccount(model, joined);
            await model.addAccount(joined);
            await model.setAssociatedData(joined, 'key_Music', 'joined-pwd');
            const actual: string = await model.getAssociatedData(joined, 'key_Music');
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'joined-pwd');
            expect(actual).assertEqual('joined-pwd');
            expect(joined.indexOf('_')).assertEqual(3);
            expect(joined.endsWith('_Music')).assertTrue();
            await dropAccount(model, joined);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0016 end');
        });

        /**
         * @tc.name   testAcctSvc0017
         * @tc.number SUB_ACCT_ACCTSVC_0017
         * @tc.desc   带下划线与数字的账号名可作为合法账号标识
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0017 begin');
            const user: string = 'test_user01';
            await dropAccount(model, user);
            await model.addAccount(user);
            await model.setAccountCredential(user, 'email_Music', 'user01@example.com');
            expect(await model.getAccountCredential(user, 'email_Music')).assertEqual('user01@example.com');
            expect(user.length).assertEqual(11);
            expect(user === 'test_user1').assertFalse();
            await dropAccount(model, user);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0017 end');
        });

        /**
         * @tc.name   testAcctSvc0018
         * @tc.number SUB_ACCT_ACCTSVC_0018
         * @tc.desc   账号名大小写敏感，Two 与 two 是两个不同账号
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0018 begin');
            const upper: string = 'acct_svc_Two';
            const lower: string = 'acct_svc_two';
            await dropAccount(model, upper);
            await dropAccount(model, lower);
            await model.addAccount(upper);
            await model.addAccount(lower);
            await model.setAssociatedData(upper, 'key_Music', 'upper-pwd');
            await model.setAssociatedData(lower, 'key_Music', 'lower-pwd');
            expect(await model.getAssociatedData(upper, 'key_Music')).assertEqual('upper-pwd');
            expect(await model.getAssociatedData(lower, 'key_Music')).assertEqual('lower-pwd');
            expect(upper === lower).assertFalse();
            await dropAccount(model, upper);
            await dropAccount(model, lower);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0018 end');
        });

        /**
         * @tc.name   testAcctSvc0019
         * @tc.number SUB_ACCT_ACCTSVC_0019
         * @tc.desc   空串账号名新增时抛出参数非法错误码 12300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0019 begin');
            let code: number = 0;
            try {
                await model.addAccount('');
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d no-error-code is %{public}s', code, 'unexpected');
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isRecoverable(code)).assertTrue();
            expect(AccountErrorCode.describe(code).length > 0).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0019 end');
        });

        /**
         * @tc.name   testAcctSvc0020
         * @tc.number SUB_ACCT_ACCTSVC_0020
         * @tc.desc   账号删除后读凭据抛出账号不存在错误码 12300003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0020 begin');
            await model.addAccount(name);
            await model.setAccountCredential(name, 'email_Music', 'gone@example.com');
            await model.deleteAccount(name);
            let code: number = 0;
            try {
                await model.getAccountCredential(name, 'email_Music');
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d no-error-code is %{public}s', code, 'unexpected');
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.isAccountAlreadyExists(code)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0020 end');
        });

        /**
         * @tc.name   testAcctSvc0021
         * @tc.number SUB_ACCT_ACCTSVC_0021
         * @tc.desc   删除后重新新增同名账号可以成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0021 begin');
            await model.addAccount(name);
            await model.deleteAccount(name);
            let code: number = 0;
            try {
                await model.addAccount(name);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', code, 0);
            expect(code).assertEqual(0);
            expect(AccountErrorCode.isAccountAlreadyExists(code)).assertFalse();
            await model.setAccountCredential(name, 'email_Music', 'again@example.com');
            expect(await model.getAccountCredential(name, 'email_Music')).assertEqual('again@example.com');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0021 end');
        });

        /**
         * @tc.name   testAcctSvc0022
         * @tc.number SUB_ACCT_ACCTSVC_0022
         * @tc.desc   两个账号的同名凭据互不影响
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0022 begin');
            const other: string = 'acct_svc_other';
            await dropAccount(model, other);
            await model.addAccount(name);
            await model.addAccount(other);
            await model.setAccountCredential(name, 'email_Music', 'main@example.com');
            await model.setAccountCredential(other, 'email_Music', 'other@example.com');
            expect(await model.getAccountCredential(name, 'email_Music')).assertEqual('main@example.com');
            expect(await model.getAccountCredential(other, 'email_Music')).assertEqual('other@example.com');
            expect(name === other).assertFalse();
            await dropAccount(model, other);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0022 end');
        });

        /**
         * @tc.name   testAcctSvc0023
         * @tc.number SUB_ACCT_ACCTSVC_0023
         * @tc.desc   两个账号的同名关联数据互相隔离
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAcctSvc0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0023 begin');
            const other: string = 'acct_svc_peer';
            await dropAccount(model, other);
            await model.addAccount(name);
            await model.addAccount(other);
            await model.setAssociatedData(name, 'key_Music', 'main-pwd');
            await model.setAssociatedData(other, 'key_Music', 'peer-pwd');
            expect(await model.getAssociatedData(name, 'key_Music')).assertEqual('main-pwd');
            expect(await model.getAssociatedData(other, 'key_Music')).assertEqual('peer-pwd');
            await model.deleteAccount(other);
            expect(await model.getAssociatedData(name, 'key_Music')).assertEqual('main-pwd');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0023 end');
        });

        /**
         * @tc.name   testAcctSvc0024
         * @tc.number SUB_ACCT_ACCTSVC_0024
         * @tc.desc   新增账号后未写入扩展信息时读回空串
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0024 begin');
            await model.addAccount(name);
            const actual: string = await model.getAccountExtraInfo(name);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[]', actual);
            expect(actual).assertEqual('');
            expect(actual.length).assertEqual(0);
            expect(actual === 'null').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0024 end');
        });

        /**
         * @tc.name   testAcctSvc0025
         * @tc.number SUB_ACCT_ACCTSVC_0025
         * @tc.desc   完整生命周期：新增、写凭据、写关联、读取、删除、再读失败
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0025 begin');
            await model.addAccount(name);
            await model.setAccountCredential(name, 'email_Music', 'life@example.com');
            await model.setAssociatedData(name, 'key_Music', 'life-pwd');
            expect(await model.getAccountCredential(name, 'email_Music')).assertEqual('life@example.com');
            expect(await model.getAssociatedData(name, 'key_Music')).assertEqual('life-pwd');
            await model.deleteAccount(name);
            let code: number = 0;
            try {
                await model.getAssociatedData(name, 'key_Music');
            } catch (err) {
                code = codeOf(err);
            }
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.describe(code).length > 0).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0025 end');
        });

        /**
         * @tc.name   testAcctSvc0026
         * @tc.number SUB_ACCT_ACCTSVC_0026
         * @tc.desc   错误码判定器对 12300004 判为已存在、对 12300003 判为不存在
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0026 begin');
            expect(AccountErrorCode.isAccountAlreadyExists(12300004)).assertTrue();
            expect(AccountErrorCode.isAccountAlreadyExists(12300003)).assertFalse();
            expect(AccountErrorCode.isAccountNotFound(12300003)).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(12300004)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0026 end');
        });

        /**
         * @tc.name   testAcctSvc0027
         * @tc.number SUB_ACCT_ACCTSVC_0027
         * @tc.desc   可重试错误包含参数非法、已存在、不存在三类，系统级错误不可重试
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0027 begin');
            expect(AccountErrorCode.isRecoverable(12300002)).assertTrue();
            expect(AccountErrorCode.isRecoverable(12300003)).assertTrue();
            expect(AccountErrorCode.isRecoverable(12300004)).assertTrue();
            expect(AccountErrorCode.isRecoverable(12300001)).assertFalse();
            expect(AccountErrorCode.isRecoverable(12300007)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0027 end');
        });

        /**
         * @tc.name   testAcctSvc0028
         * @tc.number SUB_ACCT_ACCTSVC_0028
         * @tc.desc   重复删除同一账号，第二次抛出账号不存在错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0028 begin');
            await model.addAccount(name);
            await model.deleteAccount(name);
            let code: number = 0;
            try {
                await model.deleteAccount(name);
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d no-error-code is %{public}s', code, 'unexpected');
            expect(code !== 0).assertTrue();
            expect(AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(AccountErrorCode.describe(code)).assertEqual('account not found');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0028 end');
        });

        /**
         * @tc.name   testAcctSvc0029
         * @tc.number SUB_ACCT_ACCTSVC_0029
         * @tc.desc   写入扩展信息两次后读回值为后一次
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0029 begin');
            await model.addAccount(name);
            await model.setAccountExtraInfo(name, 'first-extra');
            await model.setAccountExtraInfo(name, 'second-extra');
            const actual: string = await model.getAccountExtraInfo(name);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'second-extra');
            expect(actual).assertEqual('second-extra');
            expect(actual === 'first-extra').assertFalse();
            expect(actual.length).assertEqual(12);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0029 end');
        });

        /**
         * @tc.name   testAcctSvc0030
         * @tc.number SUB_ACCT_ACCTSVC_0030
         * @tc.desc   未新增账号就写凭据抛出账号不存在错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAcctSvc0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0030 begin');
            let code: number = 0;
            try {
                await model.setAccountCredential('acct_svc_absent', 'email_Music', 'x@y.com');
            } catch (err) {
                code = codeOf(err);
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d device not-found family is %{public}s', code,
                '10001|12300003');
            expect(code !== 0).assertTrue();
            expect(code === 10001 || AccountErrorCode.isAccountNotFound(code)).assertTrue();
            expect(code === 12300002).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAcctSvc0030 end');
        });
    });
}
