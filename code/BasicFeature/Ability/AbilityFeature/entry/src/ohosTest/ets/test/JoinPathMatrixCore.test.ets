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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { joinStoragePath } from '../../../main/ets/model/StoragePath';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_AbilityFeature_JoinPath]';

export default function joinPathMatrixCoreTest(): void {
  describe('AbilityFeatureJoinPathMatrixCoreTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0001
     * @tc.name      testJoinPathMatrix0001
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "test.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0001 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/test.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0002
     * @tc.name      testJoinPathMatrix0002
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/test.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0002 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/test.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0003
     * @tc.name      testJoinPathMatrix0003
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "//test.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0003 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/test.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0004
     * @tc.name      testJoinPathMatrix0004
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/////test.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0004 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/test.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0005
     * @tc.name      testJoinPathMatrix0005
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 空串 拼接为 "/data/storage/el2/base/haps/entry/cache"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0005 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0006
     * @tc.name      testJoinPathMatrix0006
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/" 拼接为 "/data/storage/el2/base/haps/entry/cache"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0006 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0007
     * @tc.name      testJoinPathMatrix0007
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "//" 拼接为 "/data/storage/el2/base/haps/entry/cache"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0007 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0008
     * @tc.name      testJoinPathMatrix0008
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "////" 拼接为 "/data/storage/el2/base/haps/entry/cache"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0008 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0009
     * @tc.name      testJoinPathMatrix0009
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "a/b.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0009 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/a/b.txt');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0010
     * @tc.name      testJoinPathMatrix0010
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/a/b/c.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0010 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/a/b/c.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0011
     * @tc.name      testJoinPathMatrix0011
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 ".hidden" 拼接为 "/data/storage/el2/base/haps/entry/cache/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0011 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/.hidden');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0012
     * @tc.name      testJoinPathMatrix0012
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/.hidden" 拼接为 "/data/storage/el2/base/haps/entry/cache/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0012 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/.hidden');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0013
     * @tc.name      testJoinPathMatrix0013
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "noext" 拼接为 "/data/storage/el2/base/haps/entry/cache/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0013 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/noext');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0014
     * @tc.name      testJoinPathMatrix0014
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/中文名.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0014 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/中文名.txt');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0015
     * @tc.name      testJoinPathMatrix0015
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "数据.db" 拼接为 "/data/storage/el2/base/haps/entry/cache/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0015 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/数据.db');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0016
     * @tc.name      testJoinPathMatrix0016
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 " lead.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0016 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/ lead.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0017
     * @tc.name      testJoinPathMatrix0017
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/trail.txt " 拼接为 "/data/storage/el2/base/haps/entry/cache/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0017 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/trail.txt ');
      expect(joined.length).assertEqual(50);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0018
     * @tc.name      testJoinPathMatrix0018
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "sp ace.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0018 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/sp ace.txt');
      expect(joined.length).assertEqual(50);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0019
     * @tc.name      testJoinPathMatrix0019
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "a.b.c.d" 拼接为 "/data/storage/el2/base/haps/entry/cache/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0019 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/a.b.c.d');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0020
     * @tc.name      testJoinPathMatrix0020
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/../up.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0020 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/../up.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0021
     * @tc.name      testJoinPathMatrix0021
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "./cur.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0021 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/./cur.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0022
     * @tc.name      testJoinPathMatrix0022
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "name/" 拼接为 "/data/storage/el2/base/haps/entry/cache/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0022 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/name/');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0023
     * @tc.name      testJoinPathMatrix0023
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/name//" 拼接为 "/data/storage/el2/base/haps/entry/cache/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0023 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/name//');
      expect(joined.length).assertEqual(46);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0024
     * @tc.name      testJoinPathMatrix0024
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/data/storage/el2/base/haps/entry/cache/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0024 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(80);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0025
     * @tc.name      testJoinPathMatrix0025
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/cache" 与文件名 "/emoji😀.txt" 拼接为 "/data/storage/el2/base/haps/entry/cache/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0025 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/cache';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/cache/emoji😀.txt');
      expect(joined.length).assertEqual(51);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/cache/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0026
     * @tc.name      testJoinPathMatrix0026
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "test.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0026 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/test.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0027
     * @tc.name      testJoinPathMatrix0027
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/test.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0027 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/test.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0028
     * @tc.name      testJoinPathMatrix0028
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "//test.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0028 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/test.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0029
     * @tc.name      testJoinPathMatrix0029
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/////test.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0029 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/test.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0030
     * @tc.name      testJoinPathMatrix0030
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 空串 拼接为 "/data/storage/el2/base/haps/entry/files"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0030 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0031
     * @tc.name      testJoinPathMatrix0031
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/" 拼接为 "/data/storage/el2/base/haps/entry/files"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0031 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0032
     * @tc.name      testJoinPathMatrix0032
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "//" 拼接为 "/data/storage/el2/base/haps/entry/files"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0032 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0033
     * @tc.name      testJoinPathMatrix0033
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "////" 拼接为 "/data/storage/el2/base/haps/entry/files"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0033 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0034
     * @tc.name      testJoinPathMatrix0034
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "a/b.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0034 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/a/b.txt');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0035
     * @tc.name      testJoinPathMatrix0035
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/a/b/c.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0035 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/a/b/c.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0036
     * @tc.name      testJoinPathMatrix0036
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 ".hidden" 拼接为 "/data/storage/el2/base/haps/entry/files/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0036 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/.hidden');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0037
     * @tc.name      testJoinPathMatrix0037
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/.hidden" 拼接为 "/data/storage/el2/base/haps/entry/files/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0037 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/.hidden');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0038
     * @tc.name      testJoinPathMatrix0038
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "noext" 拼接为 "/data/storage/el2/base/haps/entry/files/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0038 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/noext');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0039
     * @tc.name      testJoinPathMatrix0039
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/中文名.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0039 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/中文名.txt');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0040
     * @tc.name      testJoinPathMatrix0040
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "数据.db" 拼接为 "/data/storage/el2/base/haps/entry/files/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0040 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/数据.db');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0041
     * @tc.name      testJoinPathMatrix0041
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 " lead.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0041 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/ lead.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0042
     * @tc.name      testJoinPathMatrix0042
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/trail.txt " 拼接为 "/data/storage/el2/base/haps/entry/files/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0042 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/trail.txt ');
      expect(joined.length).assertEqual(50);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0043
     * @tc.name      testJoinPathMatrix0043
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "sp ace.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0043 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/sp ace.txt');
      expect(joined.length).assertEqual(50);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0044
     * @tc.name      testJoinPathMatrix0044
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "a.b.c.d" 拼接为 "/data/storage/el2/base/haps/entry/files/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0044 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/a.b.c.d');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0045
     * @tc.name      testJoinPathMatrix0045
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/../up.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0045 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/../up.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0046
     * @tc.name      testJoinPathMatrix0046
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "./cur.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0046 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/./cur.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0047
     * @tc.name      testJoinPathMatrix0047
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "name/" 拼接为 "/data/storage/el2/base/haps/entry/files/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0047 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/name/');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0048
     * @tc.name      testJoinPathMatrix0048
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/name//" 拼接为 "/data/storage/el2/base/haps/entry/files/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0048 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/name//');
      expect(joined.length).assertEqual(46);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0049
     * @tc.name      testJoinPathMatrix0049
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/data/storage/el2/base/haps/entry/files/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0049 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(80);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0050
     * @tc.name      testJoinPathMatrix0050
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/files" 与文件名 "/emoji😀.txt" 拼接为 "/data/storage/el2/base/haps/entry/files/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0050 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/files';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/files/emoji😀.txt');
      expect(joined.length).assertEqual(51);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/files/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0051
     * @tc.name      testJoinPathMatrix0051
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "test.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0051 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/test.txt');
      expect(joined.length).assertEqual(54);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0052
     * @tc.name      testJoinPathMatrix0052
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/test.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0052 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/test.txt');
      expect(joined.length).assertEqual(54);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0053
     * @tc.name      testJoinPathMatrix0053
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "//test.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0053 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/test.txt');
      expect(joined.length).assertEqual(54);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0054
     * @tc.name      testJoinPathMatrix0054
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/////test.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0054 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/test.txt');
      expect(joined.length).assertEqual(54);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0055
     * @tc.name      testJoinPathMatrix0055
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 空串 拼接为 "/data/storage/el2/base/haps/entry/preferences"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0055 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0056
     * @tc.name      testJoinPathMatrix0056
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/" 拼接为 "/data/storage/el2/base/haps/entry/preferences"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0056 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0057
     * @tc.name      testJoinPathMatrix0057
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "//" 拼接为 "/data/storage/el2/base/haps/entry/preferences"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0057 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0058
     * @tc.name      testJoinPathMatrix0058
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "////" 拼接为 "/data/storage/el2/base/haps/entry/preferences"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0058 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0059
     * @tc.name      testJoinPathMatrix0059
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "a/b.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0059 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/a/b.txt');
      expect(joined.length).assertEqual(53);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0060
     * @tc.name      testJoinPathMatrix0060
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/a/b/c.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0060 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/a/b/c.txt');
      expect(joined.length).assertEqual(55);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0061
     * @tc.name      testJoinPathMatrix0061
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 ".hidden" 拼接为 "/data/storage/el2/base/haps/entry/preferences/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0061 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/.hidden');
      expect(joined.length).assertEqual(53);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0062
     * @tc.name      testJoinPathMatrix0062
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/.hidden" 拼接为 "/data/storage/el2/base/haps/entry/preferences/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0062 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/.hidden');
      expect(joined.length).assertEqual(53);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0063
     * @tc.name      testJoinPathMatrix0063
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "noext" 拼接为 "/data/storage/el2/base/haps/entry/preferences/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0063 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/noext');
      expect(joined.length).assertEqual(51);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0064
     * @tc.name      testJoinPathMatrix0064
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/中文名.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0064 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/中文名.txt');
      expect(joined.length).assertEqual(53);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0064 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0065
     * @tc.name      testJoinPathMatrix0065
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "数据.db" 拼接为 "/data/storage/el2/base/haps/entry/preferences/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0065 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/数据.db');
      expect(joined.length).assertEqual(51);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0065 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0066
     * @tc.name      testJoinPathMatrix0066
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 " lead.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0066 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/ lead.txt');
      expect(joined.length).assertEqual(55);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0066 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0067
     * @tc.name      testJoinPathMatrix0067
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/trail.txt " 拼接为 "/data/storage/el2/base/haps/entry/preferences/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0067 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/trail.txt ');
      expect(joined.length).assertEqual(56);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0067 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0068
     * @tc.name      testJoinPathMatrix0068
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "sp ace.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0068 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/sp ace.txt');
      expect(joined.length).assertEqual(56);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0068 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0069
     * @tc.name      testJoinPathMatrix0069
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "a.b.c.d" 拼接为 "/data/storage/el2/base/haps/entry/preferences/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0069 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/a.b.c.d');
      expect(joined.length).assertEqual(53);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0069 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0070
     * @tc.name      testJoinPathMatrix0070
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/../up.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0070 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/../up.txt');
      expect(joined.length).assertEqual(55);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0070 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0071
     * @tc.name      testJoinPathMatrix0071
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "./cur.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0071 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/./cur.txt');
      expect(joined.length).assertEqual(55);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0071 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0072
     * @tc.name      testJoinPathMatrix0072
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "name/" 拼接为 "/data/storage/el2/base/haps/entry/preferences/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0072 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/name/');
      expect(joined.length).assertEqual(51);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0072 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0073
     * @tc.name      testJoinPathMatrix0073
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/name//" 拼接为 "/data/storage/el2/base/haps/entry/preferences/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0073 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/name//');
      expect(joined.length).assertEqual(52);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0073 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0074
     * @tc.name      testJoinPathMatrix0074
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/data/storage/el2/base/haps/entry/preferences/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0074 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(86);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0074 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0075
     * @tc.name      testJoinPathMatrix0075
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/preferences" 与文件名 "/emoji😀.txt" 拼接为 "/data/storage/el2/base/haps/entry/preferences/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0075 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/preferences';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/preferences/emoji😀.txt');
      expect(joined.length).assertEqual(57);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/preferences/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0075 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0076
     * @tc.name      testJoinPathMatrix0076
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "test.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0076 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/test.txt');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0076 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0077
     * @tc.name      testJoinPathMatrix0077
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/test.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0077 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/test.txt');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0077 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0078
     * @tc.name      testJoinPathMatrix0078
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "//test.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0078 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/test.txt');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0078 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0079
     * @tc.name      testJoinPathMatrix0079
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/////test.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0079 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/test.txt');
      expect(joined.length).assertEqual(47);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0079 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0080
     * @tc.name      testJoinPathMatrix0080
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 空串 拼接为 "/data/storage/el2/base/haps/entry/temp"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0080 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0080 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0081
     * @tc.name      testJoinPathMatrix0081
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/" 拼接为 "/data/storage/el2/base/haps/entry/temp"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0081 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0081 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0082
     * @tc.name      testJoinPathMatrix0082
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "//" 拼接为 "/data/storage/el2/base/haps/entry/temp"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0082 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0082 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0083
     * @tc.name      testJoinPathMatrix0083
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "////" 拼接为 "/data/storage/el2/base/haps/entry/temp"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0083 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0083 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0084
     * @tc.name      testJoinPathMatrix0084
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "a/b.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0084 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/a/b.txt');
      expect(joined.length).assertEqual(46);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0084 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0085
     * @tc.name      testJoinPathMatrix0085
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/a/b/c.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0085 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/a/b/c.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0085 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0086
     * @tc.name      testJoinPathMatrix0086
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 ".hidden" 拼接为 "/data/storage/el2/base/haps/entry/temp/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0086 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/.hidden');
      expect(joined.length).assertEqual(46);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0086 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0087
     * @tc.name      testJoinPathMatrix0087
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/.hidden" 拼接为 "/data/storage/el2/base/haps/entry/temp/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0087 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/.hidden');
      expect(joined.length).assertEqual(46);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0087 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0088
     * @tc.name      testJoinPathMatrix0088
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "noext" 拼接为 "/data/storage/el2/base/haps/entry/temp/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0088 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/noext');
      expect(joined.length).assertEqual(44);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0088 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0089
     * @tc.name      testJoinPathMatrix0089
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/中文名.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0089 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/中文名.txt');
      expect(joined.length).assertEqual(46);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0089 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0090
     * @tc.name      testJoinPathMatrix0090
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "数据.db" 拼接为 "/data/storage/el2/base/haps/entry/temp/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0090 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/数据.db');
      expect(joined.length).assertEqual(44);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0090 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0091
     * @tc.name      testJoinPathMatrix0091
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 " lead.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0091 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/ lead.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0091 end');
    })
  })
}
