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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { AccountData } from '../../../main/ets/model/AccountData';
import { TestContextHolder } from '../testability/TestContextHolder';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

/** 主存储文件名，与 AccountData 调用方传入的 url 同义。 */
const ISO_A: string = 'acct_iso_store_a';
/** 备用存储文件名。 */
const ISO_B: string = 'acct_iso_store_b';
/** 与 ISO_A 共享前缀但更短，用于验证文件名按整串匹配。 */
const ISO_PREFIX: string = 'acct_iso';
/** 含点号的文件名。 */
const ISO_DOT: string = 'acct.iso.store';
/** 含下划线与数字的文件名。 */
const ISO_UND: string = 'acct_iso_2026';
/** 小写文件名。 */
const ISO_CASE_LO: string = 'acct_iso_case';
/** 与上一项仅大小写不同。 */
const ISO_CASE_UP: string = 'acct_iso_CASE';
/** 中文文件名。 */
const ISO_CN: string = '账号隔离存储';

const ALL_STORES: string[] = [ISO_A, ISO_B, ISO_PREFIX, ISO_DOT, ISO_UND, ISO_CASE_LO, ISO_CASE_UP, ISO_CN];

async function dropStore(context: common.Context, name: string): Promise<void> {
    try {
        await preferences.deletePreferences(context, name);
    } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'store %{public}s absent, code=%{public}d', name, error.code);
    }
}

export default function storeIsolationTest() {
    describe('StoreIsolationTest', () => {
        let delegatorContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
        let context: common.Context = TestContextHolder.getContext(delegatorContext);
        let data: AccountData = AccountData.getInstance();

        beforeEach(async () => {
            for (const name of ALL_STORES) {
                await dropStore(context, name);
            }
        });

        afterEach(async () => {
            for (const name of ALL_STORES) {
                await dropStore(context, name);
            }
        });

        /**
         * @tc.name   testStoreIsolation0001
         * @tc.number SUB_ACCT_KEYDATA_0031
         * @tc.desc   getInstance 重复调用返回同一实例，保证 storage 字段只有一份
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0001 begin');
            const first: AccountData = AccountData.getInstance();
            const second: AccountData = AccountData.getInstance();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first === second), 'true');
            expect(first === second).assertTrue();
            expect(first instanceof AccountData).assertTrue();
            expect(second === null).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0001 end');
        });

        /**
         * @tc.name   testStoreIsolation0002
         * @tc.number SUB_ACCT_KEYDATA_0032
         * @tc.desc   getStorage 返回的 store 可直接读写，与同 url 的封装读回一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0002 begin');
            const store: preferences.Preferences = await data.getStorage(context, ISO_A);
            expect(store === null).assertFalse();
            if (store !== null) {
                await store.put('direct', 'value');
                await store.flush();
                const viaStore: string = String(await store.get('direct', ''));
                hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', viaStore, 'value');
                expect(viaStore).assertEqual('value');
                expect(String(await data.getStorageValue(context, 'direct', ISO_A))).assertEqual('value');
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0002 end');
        });

        /**
         * @tc.name   testStoreIsolation0003
         * @tc.number SUB_ACCT_KEYDATA_0033
         * @tc.desc   两个不同 url 取到的 store 是两个对象，同名键不会共存
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0003 begin');
            const storeA: preferences.Preferences = await data.getStorage(context, ISO_A);
            const storeB: preferences.Preferences = await data.getStorage(context, ISO_B);
            expect(storeA === null).assertFalse();
            expect(storeB === null).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'sameObject=%{public}s expected=%{public}s', String(storeA === storeB),
                'false');
            expect(storeA === storeB).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0003 end');
        });

        /**
         * @tc.name   testStoreIsolation0004
         * @tc.number SUB_ACCT_KEYDATA_0034
         * @tc.desc   urlA 写入的键在 urlB 下 has 为 false，读回仍是缺省字符串 null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0004 begin');
            await data.putStorageValue(context, 'shared', 'A', ISO_A);
            const seenInB: boolean = await data.hasStorageValue(context, 'shared', ISO_B);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'hasInB=%{public}s expected=%{public}s', String(seenInB), 'false');
            expect(seenInB).assertFalse();
            expect(String(await data.getStorageValue(context, 'shared', ISO_B))).assertEqual('null');
            expect(String(await data.getStorageValue(context, 'shared', ISO_A))).assertEqual('A');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0004 end');
        });

        /**
         * @tc.name   testStoreIsolation0005
         * @tc.number SUB_ACCT_KEYDATA_0035
         * @tc.desc   同名键在两个 url 下各自保存自己的值，互不覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0005 begin');
            await data.putStorageValue(context, 'name', 'tom', ISO_A);
            await data.putStorageValue(context, 'name', 'jerry', ISO_B);
            const valueA: string = String(await data.getStorageValue(context, 'name', ISO_A));
            const valueB: string = String(await data.getStorageValue(context, 'name', ISO_B));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'a=%{public}s b=%{public}s', valueA, valueB);
            expect(valueA).assertEqual('tom');
            expect(valueB).assertEqual('jerry');
            expect(await data.hasStorageValue(context, 'name', ISO_A)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0005 end');
        });

        /**
         * @tc.name   testStoreIsolation0006
         * @tc.number SUB_ACCT_KEYDATA_0036
         * @tc.desc   交替用两个 url 往返读写，storage 字段被反复重建但值不串
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0006 begin');
            await data.putStorageValue(context, 'token', 'a1', ISO_A);
            await data.putStorageValue(context, 'token', 'b1', ISO_B);
            const backToA: string = String(await data.getStorageValue(context, 'token', ISO_A));
            const backToB: string = String(await data.getStorageValue(context, 'token', ISO_B));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'a=%{public}s b=%{public}s', backToA, backToB);
            expect(backToA).assertEqual('a1');
            expect(backToB).assertEqual('b1');
            expect(backToA === backToB).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0006 end');
        });

        /**
         * @tc.name   testStoreIsolation0007
         * @tc.number SUB_ACCT_KEYDATA_0037
         * @tc.desc   共享前缀的文件名按整串匹配，acct_iso 的键不在 acct_iso_store_a 下可见
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0007 begin');
            await data.putStorageValue(context, 'prefix', 'p', ISO_PREFIX);
            const leakedToLonger: boolean = await data.hasStorageValue(context, 'prefix', ISO_A);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'leaked=%{public}s expected=%{public}s', String(leakedToLonger), 'false');
            expect(leakedToLonger).assertFalse();
            expect(await data.hasStorageValue(context, 'prefix', ISO_PREFIX)).assertTrue();
            expect(String(await data.getStorageValue(context, 'prefix', ISO_A))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0007 end');
        });

        /**
         * @tc.name   testStoreIsolation0008
         * @tc.number SUB_ACCT_KEYDATA_0038
         * @tc.desc   含点号的文件名可作为独立 store，不与同名主体的其它 store 互通
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0008 begin');
            await data.putStorageValue(context, 'k', 'dot', ISO_DOT);
            const dotted: string = String(await data.getStorageValue(context, 'k', ISO_DOT));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s expected=%{public}s', dotted, 'dot');
            expect(dotted).assertEqual('dot');
            expect(await data.hasStorageValue(context, 'k', ISO_A)).assertFalse();
            expect(String(await data.getStorageValue(context, 'k', ISO_A))).assertEqual('null');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0008 end');
        });

        /**
         * @tc.name   testStoreIsolation0009
         * @tc.number SUB_ACCT_KEYDATA_0039
         * @tc.desc   含下划线与数字的文件名写入后读回一致，且与主 store 隔离
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0009 begin');
            await data.putStorageValue(context, 'k', 'underscore', ISO_UND);
            const roundTrip: string = String(await data.getStorageValue(context, 'k', ISO_UND));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s expected=%{public}s', roundTrip, 'underscore');
            expect(roundTrip).assertEqual('underscore');
            expect(await data.hasStorageValue(context, 'k', ISO_A)).assertFalse();
            expect(await data.hasStorageValue(context, 'k', ISO_UND)).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0009 end');
        });

        /**
         * @tc.name   testStoreIsolation0010
         * @tc.number SUB_ACCT_KEYDATA_0040
         * @tc.desc   文件名大小写敏感，acct_iso_case 与 acct_iso_CASE 是两个 store
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0010 begin');
            await data.putStorageValue(context, 'caseKey', 'lower', ISO_CASE_LO);
            const inUpperStore: boolean = await data.hasStorageValue(context, 'caseKey', ISO_CASE_UP);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'inUpper=%{public}s expected=%{public}s', String(inUpperStore), 'false');
            expect(inUpperStore).assertFalse();
            expect(String(await data.getStorageValue(context, 'caseKey', ISO_CASE_UP))).assertEqual('null');
            expect(String(await data.getStorageValue(context, 'caseKey', ISO_CASE_LO))).assertEqual('lower');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0010 end');
        });

        /**
         * @tc.name   testStoreIsolation0011
         * @tc.number SUB_ACCT_KEYDATA_0041
         * @tc.desc   已取出的 store 引用在切换其它 url 后仍指向原文件
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0011 begin');
            const heldA: preferences.Preferences = await data.getStorage(context, ISO_A);
            await data.putStorageValue(context, 'switchKey', 'B', ISO_B);
            expect(heldA === null).assertFalse();
            if (heldA !== null) {
                const readFromHeld: string = String(await heldA.get('switchKey', 'null'));
                hilog.info(LOG_DOMAIN, LOG_TAG, 'held=%{public}s expected=%{public}s', readFromHeld, 'null');
                expect(readFromHeld).assertEqual('null');
            }
            expect(String(await data.getStorageValue(context, 'switchKey', ISO_B))).assertEqual('B');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0011 end');
        });

        /**
         * @tc.name   testStoreIsolation0012
         * @tc.number SUB_ACCT_KEYDATA_0042
         * @tc.desc   删除只作用在目标 url，另一个 url 下的同名键仍然可读
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0012 begin');
            await data.putStorageValue(context, 'delKey', 'keepA', ISO_A);
            await data.putStorageValue(context, 'delKey', 'keepB', ISO_B);
            await data.deleteStorageValue(context, 'delKey', ISO_A);
            const stillInB: string = String(await data.getStorageValue(context, 'delKey', ISO_B));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'b=%{public}s expected=%{public}s', stillInB, 'keepB');
            expect(await data.hasStorageValue(context, 'delKey', ISO_A)).assertFalse();
            expect(await data.hasStorageValue(context, 'delKey', ISO_B)).assertTrue();
            expect(stillInB).assertEqual('keepB');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0012 end');
        });

        /**
         * @tc.name   testStoreIsolation0013
         * @tc.number SUB_ACCT_KEYDATA_0043
         * @tc.desc   hasStorageValue 与直接 store.has 结论一致，缺省键两者都为 false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0013 begin');
            await data.putStorageValue(context, 'syncKey', 'v', ISO_A);
            const store: preferences.Preferences = await data.getStorage(context, ISO_A);
            expect(await data.hasStorageValue(context, 'syncKey', ISO_A)).assertTrue();
            if (store !== null) {
                const directPresent: boolean = await store.has('syncKey');
                const directAbsent: boolean = await store.has('missingKey');
                hilog.info(LOG_DOMAIN, LOG_TAG, 'present=%{public}s absent=%{public}s',
                    String(directPresent), String(directAbsent));
                expect(directPresent).assertTrue();
                expect(directAbsent).assertFalse();
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0013 end');
        });

        /**
         * @tc.name   testStoreIsolation0014
         * @tc.number SUB_ACCT_KEYDATA_0044
         * @tc.desc   putStorageValue 内部已 flush，重新取出的 store 对象可直接读到新值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0014 begin');
            await data.putStorageValue(context, 'flushedKey', 'flushed', ISO_A);
            const reread: preferences.Preferences = await data.getStorage(context, ISO_A);
            expect(reread === null).assertFalse();
            if (reread !== null) {
                const fromReread: string = String(await reread.get('flushedKey', 'null'));
                hilog.info(LOG_DOMAIN, LOG_TAG, 'reread=%{public}s expected=%{public}s', fromReread, 'flushed');
                expect(fromReread).assertEqual('flushed');
            }
            expect(String(await data.getStorageValue(context, 'flushedKey', ISO_A))).assertEqual('flushed');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0014 end');
        });

        /**
         * @tc.name   testStoreIsolation0015
         * @tc.number SUB_ACCT_KEYDATA_0045
         * @tc.desc   中文文件名可作为独立 store 写入并读回，与英文名 store 不互通
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStoreIsolation0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0015 begin');
            await data.putStorageValue(context, 'cnKey', 'zh', ISO_CN);
            const cnValue: string = String(await data.getStorageValue(context, 'cnKey', ISO_CN));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s expected=%{public}s', cnValue, 'zh');
            expect(cnValue).assertEqual('zh');
            expect(await data.hasStorageValue(context, 'cnKey', ISO_CN)).assertTrue();
            expect(await data.hasStorageValue(context, 'cnKey', ISO_A)).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStoreIsolation0015 end');
        });
    })
}
