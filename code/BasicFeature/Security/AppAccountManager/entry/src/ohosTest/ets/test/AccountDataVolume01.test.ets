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
import { AccountData } from '../../../main/ets/model/AccountData';
import { TestContextHolder } from '../testability/TestContextHolder';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const STORE: string = 'acct_keydata_store';
const STORE_ALT: string = 'acct_keydata_store_alt';
const LONG_VALUE: string = 'a'.repeat(256);
const HUGE_VALUE: string = 'sample'.repeat(683);

async function dropStore(context: common.Context, name: string): Promise<void> {
    try {
        await preferences.deletePreferences(context, name);
    } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'store %{public}s absent, code=%{public}d', name, error.code);
    }
}

export default function accountDataTest() {
    describe('AccountDataTest', () => {
        let delegatorContext: common.Context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
        let context: common.Context = TestContextHolder.getContext(delegatorContext);
        let data: AccountData = AccountData.getInstance();

        beforeEach(async () => {
            await dropStore(context, STORE);
            await dropStore(context, STORE_ALT);
        });

        afterEach(async () => {
            await dropStore(context, STORE);
            await dropStore(context, STORE_ALT);
        });

        /**
         * @tc.name   testKeyData0001
         * @tc.number SUB_ACCT_KEYDATA_0001
         * @tc.desc   写入一个键后 hasStorageValue 返回 true，同文件其它键仍为 false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0001 begin');
            await data.putStorageValue(context, 'name', 'tom', STORE);
            const actual: boolean = await data.hasStorageValue(context, 'name', STORE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(true));
            expect(actual).assertTrue();
            expect(String(await data.getStorageValue(context, 'name', STORE))).assertEqual('tom');
            expect(await data.hasStorageValue(context, 'absent', STORE)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0001 end');
        });

        /**
         * @tc.name   testKeyData0002
         * @tc.number SUB_ACCT_KEYDATA_0002
         * @tc.desc   写入后读回的值与写入值逐字符相同
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0002 begin');
            await data.putStorageValue(context, 'password', 'secret123', STORE);
            const actual: string = String(await data.getStorageValue(context, 'password', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'secret123');
            expect(actual).assertEqual('secret123');
            expect(actual.length).assertEqual(9);
            expect(actual === 'secret124').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0002 end');
        });

        /**
         * @tc.name   testKeyData0003
         * @tc.number SUB_ACCT_KEYDATA_0003
         * @tc.desc   从未写入的键 hasStorageValue 返回 false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0003 begin');
            const actual: boolean = await data.hasStorageValue(context, 'never_written', STORE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(false));
            expect(actual).assertFalse();
            await data.putStorageValue(context, 'never_written', 'v', STORE);
            expect(await data.hasStorageValue(context, 'never_written', STORE)).assertTrue();
            expect(await data.hasStorageValue(context, 'never_written2', STORE)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0003 end');
        });

        /**
         * @tc.name   testKeyData0004
         * @tc.number SUB_ACCT_KEYDATA_0004
         * @tc.desc   缺失键的读回值是字符串 null，而不是空串，记录该缺省行为
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0004 begin');
            const actual: string = String(await data.getStorageValue(context, 'missing_key', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'null');
            expect(actual).assertEqual('null');
            expect(actual.length).assertEqual(4);
            expect(actual === '').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0004 end');
        });

        /**
         * @tc.name   testKeyData0005
         * @tc.number SUB_ACCT_KEYDATA_0005
         * @tc.desc   同一键二次写入后读回新值，旧值不再可见
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0005 begin');
            await data.putStorageValue(context, 'name', 'first', STORE);
            await data.putStorageValue(context, 'name', 'second', STORE);
            const actual: string = String(await data.getStorageValue(context, 'name', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'second');
            expect(actual).assertEqual('second');
            expect(actual === 'first').assertFalse();
            expect(await data.hasStorageValue(context, 'name', STORE)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0005 end');
        });

        /**
         * @tc.name   testKeyData0006
         * @tc.number SUB_ACCT_KEYDATA_0006
         * @tc.desc   删除键后 hasStorageValue 返回 false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0006 begin');
            await data.putStorageValue(context, 'name', 'tom', STORE);
            await data.deleteStorageValue(context, 'name', STORE);
            const actual: boolean = await data.hasStorageValue(context, 'name', STORE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actual), String(false));
            expect(actual).assertFalse();
            expect(String(await data.getStorageValue(context, 'name', STORE))).assertEqual('null');
            expect(await data.hasStorageValue(context, 'other', STORE)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0006 end');
        });

        /**
         * @tc.name   testKeyData0007
         * @tc.number SUB_ACCT_KEYDATA_0007
         * @tc.desc   删除不存在的键不抛异常，读回值仍为字符串 null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0007 begin');
            await data.deleteStorageValue(context, 'ghost', STORE);
            const actual: string = String(await data.getStorageValue(context, 'ghost', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'null');
            expect(actual).assertEqual('null');
            expect(await data.hasStorageValue(context, 'ghost', STORE)).assertFalse();
            expect(actual === 'ghost').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0007 end');
        });

        /**
         * @tc.name   testKeyData0008
         * @tc.number SUB_ACCT_KEYDATA_0008
         * @tc.desc   空串作为值可以写入并原样读回
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0008 begin');
            await data.putStorageValue(context, 'empty', '', STORE);
            const actual: string = String(await data.getStorageValue(context, 'empty', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[]', actual);
            expect(actual).assertEqual('');
            expect(actual.length).assertEqual(0);
            expect(await data.hasStorageValue(context, 'empty', STORE)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0008 end');
        });

        /**
         * @tc.name   testKeyData0009
         * @tc.number SUB_ACCT_KEYDATA_0009
         * @tc.desc   单个空格作为值写入后读回仍是一个空格，未被裁剪
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0009 begin');
            await data.putStorageValue(context, 'blank', ' ', STORE);
            const actual: string = String(await data.getStorageValue(context, 'blank', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[ ]', actual);
            expect(actual).assertEqual(' ');
            expect(actual.length).assertEqual(1);
            expect(actual === '').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0009 end');
        });

        /**
         * @tc.name   testKeyData0010
         * @tc.number SUB_ACCT_KEYDATA_0010
         * @tc.desc   中文值写入后读回内容一致，长度按字符计为 2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0010 begin');
            await data.putStorageValue(context, 'signature', '晴天', STORE);
            const actual: string = String(await data.getStorageValue(context, 'signature', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, '晴天');
            expect(actual).assertEqual('晴天');
            expect(actual.length).assertEqual(2);
            expect(actual === '晴天 ').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0010 end');
        });

        /**
         * @tc.name   testKeyData0011
         * @tc.number SUB_ACCT_KEYDATA_0011
         * @tc.desc   含下划线的键按字面匹配，不与同前缀键混淆
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0011 begin');
            await data.putStorageValue(context, 'tom_Music', 'music-pass', STORE);
            await data.putStorageValue(context, 'tom_Video', 'video-pass', STORE);
            const actual: string = String(await data.getStorageValue(context, 'tom_Music', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'music-pass');
            expect(actual).assertEqual('music-pass');
            expect(String(await data.getStorageValue(context, 'tom_Video', STORE))).assertEqual('video-pass');
            expect(String(await data.getStorageValue(context, 'tom', STORE))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0011 end');
        });

        /**
         * @tc.name   testKeyData0012
         * @tc.number SUB_ACCT_KEYDATA_0012
         * @tc.desc   256 字符的值写入后读回长度不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0012 begin');
            await data.putStorageValue(context, 'long', LONG_VALUE, STORE);
            const actual: string = String(await data.getStorageValue(context, 'long', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actualLength=%{public}d expected=%{public}d', actual.length, 256);
            expect(actual.length).assertEqual(256);
            expect(actual).assertEqual(LONG_VALUE);
            expect(actual === LONG_VALUE + 'a').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0012 end');
        });

        /**
         * @tc.name   testKeyData0013
         * @tc.number SUB_ACCT_KEYDATA_0013
         * @tc.desc   4098 字符的值写入后读回内容与长度均不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0013 begin');
            await data.putStorageValue(context, 'huge', HUGE_VALUE, STORE);
            const actual: string = String(await data.getStorageValue(context, 'huge', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actualLength=%{public}d expected=%{public}d', actual.length, 4098);
            expect(actual.length).assertEqual(4098);
            expect(actual).assertEqual(HUGE_VALUE);
            expect(actual === '').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0013 end');
        });

        /**
         * @tc.name   testKeyData0014
         * @tc.number SUB_ACCT_KEYDATA_0014
         * @tc.desc   同文件内两个不同的键各自保存自己的值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0014 begin');
            await data.putStorageValue(context, 'left', 'L', STORE);
            await data.putStorageValue(context, 'right', 'R', STORE);
            expect(String(await data.getStorageValue(context, 'left', STORE))).assertEqual('L');
            expect(String(await data.getStorageValue(context, 'right', STORE))).assertEqual('R');
            expect(String(await data.getStorageValue(context, 'middle', STORE))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0014 end');
        });

        /**
         * @tc.name   testKeyData0015
         * @tc.number SUB_ACCT_KEYDATA_0015
         * @tc.desc   连续写入十个键后逐个读回，值与序号一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0015 begin');
            let i: number = 0;
            while (i < 10) {
                await data.putStorageValue(context, `k${i}`, `v${i}`, STORE);
                i++;
            }
            const first: string = String(await data.getStorageValue(context, 'k0', STORE));
            const last: string = String(await data.getStorageValue(context, 'k9', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s last=%{public}s', first, last);
            expect(first).assertEqual('v0');
            expect(last).assertEqual('v9');
            expect(String(await data.getStorageValue(context, 'k10', STORE))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0015 end');
        });

        /**
         * @tc.name   testKeyData0016
         * @tc.number SUB_ACCT_KEYDATA_0016
         * @tc.desc   两个不同 preferences 文件的同名键互不影响
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0016 begin');
            await data.putStorageValue(context, 'shared', 'main-store', STORE);
            await data.putStorageValue(context, 'shared', 'alt-store', STORE_ALT);
            expect(String(await data.getStorageValue(context, 'shared', STORE))).assertEqual('main-store');
            expect(String(await data.getStorageValue(context, 'shared', STORE_ALT))).assertEqual('alt-store');
            expect(await data.hasStorageValue(context, 'shared', STORE)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0016 end');
        });

        /**
         * @tc.name   testKeyData0017
         * @tc.number SUB_ACCT_KEYDATA_0017
         * @tc.desc   只在备用文件写入时，主文件读回仍为字符串 null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0017 begin');
            await data.putStorageValue(context, 'only_alt', 'x', STORE_ALT);
            const actual: string = String(await data.getStorageValue(context, 'only_alt', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'null');
            expect(actual).assertEqual('null');
            expect(String(await data.getStorageValue(context, 'only_alt', STORE_ALT))).assertEqual('x');
            expect(await data.hasStorageValue(context, 'only_alt', STORE)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0017 end');
        });

        /**
         * @tc.name   testKeyData0018
         * @tc.number SUB_ACCT_KEYDATA_0018
         * @tc.desc   删除一个键不影响同文件内的其它键
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0018 begin');
            await data.putStorageValue(context, 'keep', 'K', STORE);
            await data.putStorageValue(context, 'drop', 'D', STORE);
            await data.deleteStorageValue(context, 'drop', STORE);
            expect(String(await data.getStorageValue(context, 'keep', STORE))).assertEqual('K');
            expect(await data.hasStorageValue(context, 'drop', STORE)).assertFalse();
            expect(String(await data.getStorageValue(context, 'drop', STORE))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0018 end');
        });

        /**
         * @tc.name   testKeyData0019
         * @tc.number SUB_ACCT_KEYDATA_0019
         * @tc.desc   连续删除同一个键两次不抛异常，状态保持不存在
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0019 begin');
            await data.putStorageValue(context, 'twice', 'T', STORE);
            await data.deleteStorageValue(context, 'twice', STORE);
            await data.deleteStorageValue(context, 'twice', STORE);
            expect(await data.hasStorageValue(context, 'twice', STORE)).assertFalse();
            expect(String(await data.getStorageValue(context, 'twice', STORE))).assertEqual('null');
            expect(await data.hasStorageValue(context, 'twice2', STORE)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0019 end');
        });

        /**
         * @tc.name   testKeyData0020
         * @tc.number SUB_ACCT_KEYDATA_0020
         * @tc.desc   重复写入相同值后键依然存在且值不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0020 begin');
            await data.putStorageValue(context, 'same', 'v', STORE);
            await data.putStorageValue(context, 'same', 'v', STORE);
            expect(String(await data.getStorageValue(context, 'same', STORE))).assertEqual('v');
            expect(await data.hasStorageValue(context, 'same', STORE)).assertTrue();
            expect(String(await data.getStorageValue(context, 'same2', STORE))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0020 end');
        });

        /**
         * @tc.name   testKeyData0021
         * @tc.number SUB_ACCT_KEYDATA_0021
         * @tc.desc   用户名作为键、应用名作为文件名时读回密码值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0021 begin');
            await data.putStorageValue(context, 'jerry', 'pwd-0001', 'Music');
            const actual: string = String(await data.getStorageValue(context, 'jerry', 'Music'));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'pwd-0001');
            expect(actual).assertEqual('pwd-0001');
            expect(String(await data.getStorageValue(context, 'jerry', 'Video'))).assertEqual('null');
            expect(await data.hasStorageValue(context, 'jerry', 'Music')).assertTrue();
            await dropStore(context, 'Music');
            await dropStore(context, 'Video');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0021 end');
        });

        /**
         * @tc.name   testKeyData0022
         * @tc.number SUB_ACCT_KEYDATA_0022
         * @tc.desc   登录标记键以 true 为值时读回 true，与密码值共存
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testKeyData0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0022 begin');
            await data.putStorageValue(context, 'tom', 'pwd', STORE);
            await data.putStorageValue(context, 'Music', 'true', STORE);
            expect(String(await data.getStorageValue(context, 'Music', STORE))).assertEqual('true');
            expect(String(await data.getStorageValue(context, 'tom', STORE))).assertEqual('pwd');
            expect(await data.hasStorageValue(context, 'Video', STORE)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0022 end');
        });

        /**
         * @tc.name   testKeyData0023
         * @tc.number SUB_ACCT_KEYDATA_0023
         * @tc.desc   字符串 false 作为值可读回，不会被当作布尔假值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0023 begin');
            await data.putStorageValue(context, 'flag', 'false', STORE);
            const actual: string = String(await data.getStorageValue(context, 'flag', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'false');
            expect(actual).assertEqual('false');
            expect(actual === 'true').assertFalse();
            expect(actual.length).assertEqual(5);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0023 end');
        });

        /**
         * @tc.name   testKeyData0024
         * @tc.number SUB_ACCT_KEYDATA_0024
         * @tc.desc   显式写入字符串 null 后读回无法与缺省值区分
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0024 begin');
            await data.putStorageValue(context, 'explicit', 'null', STORE);
            const present: string = String(await data.getStorageValue(context, 'explicit', STORE));
            const absent: string = String(await data.getStorageValue(context, 'absent', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'present=%{public}s absent=%{public}s', present, absent);
            expect(present).assertEqual(absent);
            expect(present).assertEqual('null');
            expect(await data.hasStorageValue(context, 'explicit', STORE)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0024 end');
        });

        /**
         * @tc.name   testKeyData0025
         * @tc.number SUB_ACCT_KEYDATA_0025
         * @tc.desc   键大小写敏感，Name 与 name 不相干
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0025 begin');
            await data.putStorageValue(context, 'Name', 'upper', STORE);
            await data.putStorageValue(context, 'name', 'lower', STORE);
            expect(String(await data.getStorageValue(context, 'Name', STORE))).assertEqual('upper');
            expect(String(await data.getStorageValue(context, 'name', STORE))).assertEqual('lower');
            expect(String(await data.getStorageValue(context, 'NAME', STORE))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0025 end');
        });

        /**
         * @tc.name   testKeyData0026
         * @tc.number SUB_ACCT_KEYDATA_0026
         * @tc.desc   含点号的键按字面匹配，has 与 get 结果一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0026 begin');
            await data.putStorageValue(context, 'tom.smith', 'dotted', STORE);
            const actual: string = String(await data.getStorageValue(context, 'tom.smith', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'dotted');
            expect(actual).assertEqual('dotted');
            expect(await data.hasStorageValue(context, 'tom.smith', STORE)).assertTrue();
            expect(String(await data.getStorageValue(context, 'tom', STORE))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0026 end');
        });

        /**
         * @tc.name   testKeyData0027
         * @tc.number SUB_ACCT_KEYDATA_0027
         * @tc.desc   删除后重新写入，键恢复存在且读到新值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0027 begin');
            await data.putStorageValue(context, 'cycle', 'one', STORE);
            await data.deleteStorageValue(context, 'cycle', STORE);
            await data.putStorageValue(context, 'cycle', 'two', STORE);
            const actual: string = String(await data.getStorageValue(context, 'cycle', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'two');
            expect(actual).assertEqual('two');
            expect(actual === 'one').assertFalse();
            expect(await data.hasStorageValue(context, 'cycle', STORE)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0027 end');
        });

        /**
         * @tc.name   testKeyData0028
         * @tc.number SUB_ACCT_KEYDATA_0028
         * @tc.desc   三个文件依次写入同名键，各自保留自己的值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0028 begin');
            const third: string = 'acct_keydata_store_third';
            await dropStore(context, third);
            await data.putStorageValue(context, 'k', 'one', STORE);
            await data.putStorageValue(context, 'k', 'two', STORE_ALT);
            await data.putStorageValue(context, 'k', 'three', third);
            expect(String(await data.getStorageValue(context, 'k', STORE))).assertEqual('one');
            expect(String(await data.getStorageValue(context, 'k', STORE_ALT))).assertEqual('two');
            expect(String(await data.getStorageValue(context, 'k', third))).assertEqual('three');
            await dropStore(context, third);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0028 end');
        });

        /**
         * @tc.name   testKeyData0029
         * @tc.number SUB_ACCT_KEYDATA_0029
         * @tc.desc   值为单个字符时读回长度为一，未被补位
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0029 begin');
            await data.putStorageValue(context, 'single', 'Z', STORE);
            const actual: string = String(await data.getStorageValue(context, 'single', STORE));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s length=%{public}d', actual, actual.length);
            expect(actual).assertEqual('Z');
            expect(actual.length).assertEqual(1);
            expect(actual === 'ZZ').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0029 end');
        });

        /**
         * @tc.name   testKeyData0030
         * @tc.number SUB_ACCT_KEYDATA_0030
         * @tc.desc   写入后读回再写入再读回，三轮值依次递进
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testKeyData0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0030 begin');
            const rounds: string[] = ['r1', 'r2', 'r3'];
            let i: number = 0;
            while (i < rounds.length) {
                await data.putStorageValue(context, 'round', rounds[i], STORE);
                expect(String(await data.getStorageValue(context, 'round', STORE))).assertEqual(rounds[i]);
                i++;
            }
            expect(String(await data.getStorageValue(context, 'round', STORE))).assertEqual('r3');
            expect(await data.hasStorageValue(context, 'round', STORE)).assertTrue();
            expect(String(await data.getStorageValue(context, 'rounds', STORE))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyData0030 end');
        });
    });
}
