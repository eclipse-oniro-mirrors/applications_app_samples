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
import { BundleCatalog, BundleEntry } from '../../../main/ets/model/BundleCatalog';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

const NAME_MUSIC: string = 'Music';
const NAME_VIDEO: string = 'Video';
const NAME_MAP: string = 'Map';
const ID_SUFFIX: string = 'App';

export default function catalogIndexTest() {
    describe('CatalogIndexTest', () => {

        /**
         * @tc.name   testCatalogIndex0031
         * @tc.number SUB_ACCT_META_0031
         * @tc.desc   三个合法下标依次取回音乐、视频、地图，名称与顺序表一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testCatalogIndex0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0031 begin');
            const atZero: BundleEntry | undefined = BundleCatalog.getAt(0);
            const atOne: BundleEntry | undefined = BundleCatalog.getAt(1);
            const atTwo: BundleEntry | undefined = BundleCatalog.getAt(2);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'middle=%{public}s', String(atOne?.name));
            expect(atZero?.name).assertEqual(NAME_MUSIC);
            expect(atOne?.name).assertEqual(NAME_VIDEO);
            expect(atTwo?.name).assertEqual(NAME_MAP);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0031 end');
        });

        /**
         * @tc.name   testCatalogIndex0032
         * @tc.number SUB_ACCT_META_0032
         * @tc.desc   names 返回三项且逐项与 getAt 同一下标的应用名相等
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testCatalogIndex0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0032 begin');
            const names: string[] = BundleCatalog.names();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'names=%{public}d first=%{public}s', names.length, names[0]);
            expect(names.length).assertEqual(BundleCatalog.count());
            expect(names[0]).assertEqual(BundleCatalog.getAt(0)?.name);
            expect(names[2]).assertEqual(BundleCatalog.getAt(2)?.name);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0032 end');
        });

        /**
         * @tc.name   testCatalogIndex0033
         * @tc.number SUB_ACCT_META_0033
         * @tc.desc   names 每次调用返回独立数组，向结果追加元素不改变目录本体
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testCatalogIndex0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0033 begin');
            const first: string[] = BundleCatalog.names();
            first.push('Extra');
            const second: string[] = BundleCatalog.names();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}d second=%{public}d',
                first.length, second.length);
            expect(first.length).assertEqual(BundleCatalog.count() + 1);
            expect(second.length).assertEqual(BundleCatalog.count());
            expect(BundleCatalog.contains('Extra')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0033 end');
        });

        /**
         * @tc.name   testCatalogIndex0034
         * @tc.number SUB_ACCT_META_0034
         * @tc.desc   contains 对三个已知名均为 true，对空串与截断名均为 false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testCatalogIndex0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0034 begin');
            const known: boolean = BundleCatalog.contains(NAME_MUSIC) && BundleCatalog.contains(NAME_VIDEO) &&
                BundleCatalog.contains(NAME_MAP);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'known=%{public}s truncated=%{public}s',
                String(known), String(BundleCatalog.contains('Musi')));
            expect(known).assertTrue();
            expect(BundleCatalog.contains('Musi')).assertFalse();
            expect(BundleCatalog.contains('')).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0034 end');
        });

        /**
         * @tc.name   testCatalogIndex0035
         * @tc.number SUB_ACCT_META_0035
         * @tc.desc   count 与 entries 长度、names 长度三者相等且固定为三
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testCatalogIndex0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0035 begin');
            const total: number = BundleCatalog.count();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}d entries=%{public}d',
                total, BundleCatalog.entries().length);
            expect(total).assertEqual(3);
            expect(BundleCatalog.entries().length).assertEqual(total);
            expect(BundleCatalog.names().length).assertEqual(total);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0035 end');
        });

        /**
         * @tc.name   testCatalogIndex0036
         * @tc.number SUB_ACCT_META_0036
         * @tc.desc   idOf 对三个名称分别追加固定后缀，生成三项互不相同的控件 id
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testCatalogIndex0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0036 begin');
            const musicId: string = BundleCatalog.idOf(NAME_MUSIC);
            const videoId: string = BundleCatalog.idOf(NAME_VIDEO);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'music=%{public}s video=%{public}s', musicId, videoId);
            expect(musicId).assertEqual(NAME_MUSIC + ID_SUFFIX);
            expect(videoId).assertEqual(NAME_VIDEO + ID_SUFFIX);
            expect(musicId === videoId).assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0036 end');
        });

        /**
         * @tc.name   testCatalogIndex0037
         * @tc.number SUB_ACCT_META_0037
         * @tc.desc   下标 3、4、100 与负下标全部越界，getAt 一律返回 undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testCatalogIndex0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0037 begin');
            const atEnd: BundleEntry | undefined = BundleCatalog.getAt(BundleCatalog.count());
            const beyondLast: BundleEntry | undefined = BundleCatalog.getAt(100);
            const beforeFirst: BundleEntry | undefined = BundleCatalog.getAt(-1);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'atCount=%{public}s beyond=%{public}s',
                String(atEnd), String(beyondLast));
            expect(atEnd).assertUndefined();
            expect(beyondLast).assertUndefined();
            expect(beforeFirst).assertUndefined();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0037 end');
        });

        /**
         * @tc.name   testCatalogIndex0038
         * @tc.number SUB_ACCT_META_0038
         * @tc.desc   entries 每次返回新数组，但元素与 getAt 同下标仍为同一对象引用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testCatalogIndex0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0038 begin');
            const first: BundleEntry[] = BundleCatalog.entries();
            const second: BundleEntry[] = BundleCatalog.entries();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'sameArray=%{public}s sameElement=%{public}s',
                String(first === second), String(first[1] === BundleCatalog.getAt(1)));
            expect(first === second).assertFalse();
            expect(first[1] === BundleCatalog.getAt(1)).assertTrue();
            expect(first.length).assertEqual(second.length);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCatalogIndex0038 end');
        });
    })
}
