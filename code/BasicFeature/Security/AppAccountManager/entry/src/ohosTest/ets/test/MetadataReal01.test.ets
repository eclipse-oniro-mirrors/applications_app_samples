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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BundleCatalog, BundleEntry } from '../../../main/ets/model/BundleCatalog';
import { BaseDataSource } from '../../../main/ets/common/BaseDataSource';
import { AccountValidator } from '../../../main/ets/model/AccountValidator';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

class NumberSource extends BaseDataSource<number> {
    private items: number[] = [];

    public totalCount(): number {
        return this.items.length;
    }

    public getData(index: number): number | undefined {
        return this.items[index];
    }

    public push(value: number): void {
        this.items.push(value);
        this.notifyDataAdd(this.items.length - 1);
    }

    public shift(): void {
        this.items.shift();
        this.notifyDataDelete(0);
    }
}

class RecordingListener implements DataChangeListener {
    public adds: number[] = [];
    public changes: number[] = [];
    public deletes: number[] = [];
    public moves: string[] = [];
    public reloads: number = 0;
    public batches: number[] = [];

    onDataReloaded(): void {
        this.reloads++;
    }

    onDataAdded(index: number): void {
        this.adds.push(index);
    }

    onDataAdd(index: number): void {
        this.adds.push(index);
    }

    onDataMoved(from: number, to: number): void {
        this.moves.push(`${from}->${to}`);
    }

    onDataMove(from: number, to: number): void {
        this.moves.push(`${from}->${to}`);
    }

    onDataDeleted(index: number): void {
        this.deletes.push(index);
    }

    onDataDelete(index: number): void {
        this.deletes.push(index);
    }

    onDataChanged(index: number): void {
        this.changes.push(index);
    }

    onDataChange(index: number): void {
        this.changes.push(index);
    }

    onDatasetChange(dataOperations: DataOperation[]): void {
        this.batches.push(dataOperations.length);
    }
}

export default function metadataTest() {
    describe('MetadataTest', () => {
        let source: NumberSource = new NumberSource();
        let listener: RecordingListener = new RecordingListener();

        beforeEach(() => {
            source = new NumberSource();
            listener = new RecordingListener();
        });

        /**
         * @tc.name   testMetadata0001
         * @tc.number SUB_ACCT_META_0001
         * @tc.desc   示例应用目录固定为三个条目，顺序为音乐、视频、地图
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testMetadata0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0001 begin');
            const actual: number = BundleCatalog.count();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', actual, 3);
            expect(actual).assertEqual(3);
            expect(BundleCatalog.names()).assertDeepEquals(['Music', 'Video', 'Map']);
            expect(actual === 4).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0001 end');
        });

        /**
         * @tc.name   testMetadata0002
         * @tc.number SUB_ACCT_META_0002
         * @tc.desc   entries 返回副本，修改副本不影响目录本体
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0002 begin');
            const copy: BundleEntry[] = BundleCatalog.entries();
            copy.push(copy[0]);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'copyLength=%{public}d catalogLength=%{public}d', copy.length,
                BundleCatalog.count());
            expect(copy.length).assertEqual(4);
            expect(BundleCatalog.count()).assertEqual(3);
            expect(BundleCatalog.entries().length).assertEqual(3);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0002 end');
        });

        /**
         * @tc.name   testMetadata0003
         * @tc.number SUB_ACCT_META_0003
         * @tc.desc   下标 0 与 2 分别命中首尾条目，名称与顺序表一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0003 begin');
            let first: BundleEntry | undefined = BundleCatalog.getAt(0);
            let last: BundleEntry | undefined = BundleCatalog.getAt(2);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s last=%{public}s', first?.name, last?.name);
            expect(first?.name).assertEqual('Music');
            expect(last?.name).assertEqual('Map');
            expect(BundleCatalog.getAt(1)?.name).assertEqual('Video');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0003 end');
        });

        /**
         * @tc.name   testMetadata0004
         * @tc.number SUB_ACCT_META_0004
         * @tc.desc   下标 3 与 -1 越界，getAt 返回 undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0004 begin');
            expect(BundleCatalog.getAt(3)).assertUndefined();
            expect(BundleCatalog.getAt(-1)).assertUndefined();
            expect(BundleCatalog.getAt(0) === undefined).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0004 end');
        });

        /**
         * @tc.name   testMetadata0005
         * @tc.number SUB_ACCT_META_0005
         * @tc.desc   字符大小写与部分名称都不算已知应用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0005 begin');
            expect(BundleCatalog.contains('Music')).assertTrue();
            expect(BundleCatalog.contains('music')).assertFalse();
            expect(BundleCatalog.contains('Musi')).assertFalse();
            expect(BundleCatalog.contains('')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0005 end');
        });

        /**
         * @tc.name   testMetadata0006
         * @tc.number SUB_ACCT_META_0006
         * @tc.desc   默认应用名为列表开头条目，与 getAt 结果一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0006 begin');
            const actual: string = BundleCatalog.defaultName();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'Music');
            expect(actual).assertEqual('Music');
            expect(actual).assertEqual(BundleCatalog.names()[0]);
            expect(actual === 'Video').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0006 end');
        });

        /**
         * @tc.name   testMetadata0007
         * @tc.number SUB_ACCT_META_0007
         * @tc.desc   控件 id 由应用名追加固定后缀生成，与首页注册的 id 一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testMetadata0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0007 begin');
            expect(BundleCatalog.idOf('Music')).assertEqual('MusicApp');
            expect(BundleCatalog.idOf('Video')).assertEqual('VideoApp');
            expect(BundleCatalog.idOf('Map')).assertEqual('MapApp');
            expect(BundleCatalog.idOf('Music')).assertEqual(`${BundleCatalog.names()[0]}App`);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0007 end');
        });

        /**
         * @tc.name   testMetadata0008
         * @tc.number SUB_ACCT_META_0008
         * @tc.desc   未知应用名生成的 id 仍按同一后缀规则，不返回空串
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0008 begin');
            expect(BundleCatalog.idOf('Book')).assertEqual('BookApp');
            expect(BundleCatalog.idOf('')).assertEqual('App');
            expect(BundleCatalog.idOf('Book') === 'Book').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0008 end');
        });

        /**
         * @tc.name   testMetadata0009
         * @tc.number SUB_ACCT_META_0009
         * @tc.desc   每个目录条目都带有图标与文案资源，名称非空
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0009 begin');
            let entries: BundleEntry[] = BundleCatalog.entries();
            let i: number = 0;
            while (i < entries.length) {
                expect(entries[i].name.length > 0).assertTrue();
                i++;
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'imgId=%{public}d textId=%{public}d', entries[0].img.id,
                entries[0].text.id);
            expect(entries[0].img.id > 0).assertTrue();
            expect(entries[0].text.id > 0).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0009 end');
        });

        /**
         * @tc.name   testMetadata0010
         * @tc.number SUB_ACCT_META_0010
         * @tc.desc   基类未覆盖时总数与数据项均为默认值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0010 begin');
            let base: BaseDataSource<number> = new BaseDataSource<number>();
            expect(base.totalCount()).assertEqual(0);
            expect(base.getData(0)).assertUndefined();
            expect(base.listenerCount()).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0010 end');
        });

        /**
         * @tc.name   testMetadata0011
         * @tc.number SUB_ACCT_META_0011
         * @tc.desc   子类覆盖后总数与数据项反映真实数据
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0011 begin');
            source.push(10);
            source.push(20);
            expect(source.totalCount()).assertEqual(2);
            expect(source.getData(0)).assertEqual(10);
            expect(source.getData(1)).assertEqual(20);
            expect(source.getData(2)).assertUndefined();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0011 end');
        });

        /**
         * @tc.name   testMetadata0012
         * @tc.number SUB_ACCT_META_0012
         * @tc.desc   注册监听器后计数递增，重复注册同一监听器不再递增
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0012 begin');
            expect(source.listenerCount()).assertEqual(0);
            source.registerDataChangeListener(listener);
            expect(source.listenerCount()).assertEqual(1);
            source.registerDataChangeListener(listener);
            expect(source.listenerCount()).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0012 end');
        });

        /**
         * @tc.name   testMetadata0013
         * @tc.number SUB_ACCT_META_0013
         * @tc.desc   注销已注册监听器后计数归零，重复注销不抛异常
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0013 begin');
            source.registerDataChangeListener(listener);
            source.unregisterDataChangeListener(listener);
            expect(source.listenerCount()).assertEqual(0);
            source.unregisterDataChangeListener(listener);
            expect(source.listenerCount()).assertEqual(0);
            expect(source.totalCount()).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0013 end');
        });

        /**
         * @tc.name   testMetadata0014
         * @tc.number SUB_ACCT_META_0014
         * @tc.desc   新增数据时监听器收到对应下标
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0014 begin');
            source.registerDataChangeListener(listener);
            source.push(7);
            source.push(8);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'adds=%{public}s', JSON.stringify(listener.adds));
            expect(listener.adds.length).assertEqual(2);
            expect(listener.adds[0]).assertEqual(0);
            expect(listener.adds[1]).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0014 end');
        });

        /**
         * @tc.name   testMetadata0015
         * @tc.number SUB_ACCT_META_0015
         * @tc.desc   删除数据时监听器收到下标 0，新增计数不随之增加
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0015 begin');
            source.registerDataChangeListener(listener);
            source.push(1);
            source.push(2);
            source.shift();
            expect(listener.deletes.length).assertEqual(1);
            expect(listener.deletes[0]).assertEqual(0);
            expect(listener.adds.length).assertEqual(2);
            expect(source.totalCount()).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0015 end');
        });

        /**
         * @tc.name   testMetadata0016
         * @tc.number SUB_ACCT_META_0016
         * @tc.desc   重新加载通知派发到监听器，单次调用只累加一次
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0016 begin');
            source.registerDataChangeListener(listener);
            source.notifyDataReload();
            expect(listener.reloads).assertEqual(1);
            expect(listener.adds.length).assertEqual(0);
            expect(listener.changes.length).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0016 end');
        });

        /**
         * @tc.name   testMetadata0017
         * @tc.number SUB_ACCT_META_0017
         * @tc.desc   位置移动通知按起止下标派发，其它计数不变
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0017 begin');
            source.registerDataChangeListener(listener);
            source.notifyDataMove(0, 2);
            expect(listener.moves.length).assertEqual(1);
            expect(listener.moves[0]).assertEqual('0->2');
            expect(listener.deletes.length).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0017 end');
        });

        /**
         * @tc.name   testMetadata0018
         * @tc.number SUB_ACCT_META_0018
         * @tc.desc   未注册监听器时通知不抛异常，注册计数保持零
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0018 begin');
            source.notifyDataAdd(0);
            source.notifyDataChange(0);
            source.notifyDataDelete(0);
            source.notifyDataReload();
            expect(source.listenerCount()).assertEqual(0);
            expect(listener.adds.length).assertEqual(0);
            expect(listener.reloads).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0018 end');
        });

        /**
         * @tc.name   testMetadata0019
         * @tc.number SUB_ACCT_META_0019
         * @tc.desc   数据变化通知携带下标，与新增下标互不串扰
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0019 begin');
            source.registerDataChangeListener(listener);
            source.notifyDataChange(3);
            expect(listener.changes.length).assertEqual(1);
            expect(listener.changes[0]).assertEqual(3);
            expect(listener.adds.length).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0019 end');
        });

        /**
         * @tc.name   testMetadata0020
         * @tc.number SUB_ACCT_META_0020
         * @tc.desc   两个监听器同时收到同一次新增通知
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0020 begin');
            const second: RecordingListener = new RecordingListener();
            source.registerDataChangeListener(listener);
            source.registerDataChangeListener(second);
            source.notifyDataAdd(1);
            expect(source.listenerCount()).assertEqual(2);
            expect(listener.adds[0]).assertEqual(1);
            expect(second.adds[0]).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0020 end');
        });

        /**
         * @tc.name   testMetadata0021
         * @tc.number SUB_ACCT_META_0021
         * @tc.desc   注销其中一个监听器后，剩余的监听器仍收到通知
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0021 begin');
            const second: RecordingListener = new RecordingListener();
            source.registerDataChangeListener(listener);
            source.registerDataChangeListener(second);
            source.unregisterDataChangeListener(listener);
            source.notifyDataAdd(2);
            expect(source.listenerCount()).assertEqual(1);
            expect(listener.adds.length).assertEqual(0);
            expect(second.adds[0]).assertEqual(2);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0021 end');
        });

        /**
         * @tc.name   testMetadata0022
         * @tc.number SUB_ACCT_META_0022
         * @tc.desc   密码最短长度为六位，与输入框提示一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testMetadata0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0022 begin');
            const actual: number = AccountValidator.MIN_PASSWORD_LENGTH;
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', actual, 6);
            expect(actual).assertEqual(6);
            expect(AccountValidator.isPasswordLongEnough('123456')).assertTrue();
            expect(AccountValidator.isPasswordLongEnough('12345')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0022 end');
        });

        /**
         * @tc.name   testMetadata0023
         * @tc.number SUB_ACCT_META_0023
         * @tc.desc   用户名输入长度上限为十五，资料字段上限为十八
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0023 begin');
            expect(AccountValidator.USERNAME_MAX_LENGTH).assertEqual(15);
            expect(AccountValidator.FIELD_MAX_LENGTH).assertEqual(18);
            expect(AccountValidator.USERNAME_MAX_LENGTH < AccountValidator.FIELD_MAX_LENGTH).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0023 end');
        });

        /**
         * @tc.name   testMetadata0024
         * @tc.number SUB_ACCT_META_0024
         * @tc.desc   登录页输入上限为二十，大于注册页的两个上限
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0024 begin');
            expect(AccountValidator.LOGIN_MAX_LENGTH).assertEqual(20);
            expect(AccountValidator.LOGIN_MAX_LENGTH > AccountValidator.FIELD_MAX_LENGTH).assertTrue();
            expect(AccountValidator.LOGIN_MAX_LENGTH === 15).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0024 end');
        });

        /**
         * @tc.name   testMetadata0025
         * @tc.number SUB_ACCT_META_0025
         * @tc.desc   邮箱正则源码固定，要求本地部分、域名与 2 到 6 位顶级域
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0025 begin');
            const actual: string = AccountValidator.EMAIL_PATTERN.source;
            hilog.info(LOG_DOMAIN, LOG_TAG, 'source=%{public}s', actual);
            expect(actual).assertContain('{2,6}');
            expect(actual).assertContain('@');
            expect(actual.startsWith('^')).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0025 end');
        });

        /**
         * @tc.name   testMetadata0026
         * @tc.number SUB_ACCT_META_0026
         * @tc.desc   用户名正则只接受字母、数字与下划线
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testMetadata0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0026 begin');
            expect(AccountValidator.isUsernameValid('tom_01')).assertTrue();
            expect(AccountValidator.isUsernameValid('tom-01')).assertFalse();
            expect(AccountValidator.isUsernameValid('')).assertFalse();
            expect(AccountValidator.USERNAME_PATTERN.source).assertEqual('^[A-Za-z0-9_]+$');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0026 end');
        });

        /**
         * @tc.name   testMetadata0027
         * @tc.number SUB_ACCT_META_0027
         * @tc.desc   邮箱正则对顶级域长度一到七位的判定与 {2,6} 一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0027 begin');
            expect(AccountValidator.isEmailValid('a@b.c')).assertFalse();
            expect(AccountValidator.isEmailValid('a@b.co')).assertTrue();
            expect(AccountValidator.isEmailValid('a@b.abcdef')).assertTrue();
            expect(AccountValidator.isEmailValid('a@b.abcdefg')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0027 end');
        });

        /**
         * @tc.name   testMetadata0028
         * @tc.number SUB_ACCT_META_0028
         * @tc.desc   目录名称与 id 一一对应，不存在重复 id
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0028 begin');
            let ids: string[] = [];
            let i: number = 0;
            while (i < BundleCatalog.count()) {
                ids.push(BundleCatalog.idOf(BundleCatalog.names()[i]));
                i++;
            }
            hilog.info(LOG_DOMAIN, LOG_TAG, 'ids=%{public}s', ids.join(','));
            expect(ids).assertDeepEquals(['MusicApp', 'VideoApp', 'MapApp']);
            expect(ids.indexOf('MusicApp')).assertEqual(0);
            expect(ids.length).assertEqual(BundleCatalog.count());
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0028 end');
        });

        /**
         * @tc.name   testMetadata0029
         * @tc.number SUB_ACCT_META_0029
         * @tc.desc   密码长度判定的下界与上界之间所有长度都判为满足
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0029 begin');
            let len: number = 6;
            while (len <= 20) {
                expect(AccountValidator.isPasswordLongEnough('p'.repeat(len))).assertTrue();
                len++;
            }
            expect(AccountValidator.isPasswordLongEnough('p'.repeat(5))).assertFalse();
            expect(AccountValidator.isPasswordLongEnough('')).assertFalse();
            expect(AccountValidator.MIN_PASSWORD_LENGTH).assertEqual(6);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0029 end');
        });

        /**
         * @tc.name   testMetadata0030
         * @tc.number SUB_ACCT_META_0030
         * @tc.desc   contains 与 idOf 对同一名称的判定一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testMetadata0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0030 begin');
            let i: number = 0;
            while (i < BundleCatalog.count()) {
                let current: string = BundleCatalog.names()[i];
                expect(BundleCatalog.contains(current)).assertTrue();
                expect(BundleCatalog.idOf(current)).assertEqual(`${current}App`);
                i++;
            }
            expect(BundleCatalog.contains('MusicApp')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMetadata0030 end');
        });
    });
}
