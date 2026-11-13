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

export default function joinPathMatrixTailTest(): void {
  describe('AbilityFeatureJoinPathMatrixTailTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0274
     * @tc.name      testJoinPathMatrix0274
     * @tc.desc      目录 "relative/dir" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "relative/dir/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0274 begin');
      const dir: string = 'relative/dir';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('relative/dir/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(53);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0274 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0275
     * @tc.name      testJoinPathMatrix0275
     * @tc.desc      目录 "relative/dir" 与文件名 "/emoji😀.txt" 拼接为 "relative/dir/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0275 begin');
      const dir: string = 'relative/dir';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('relative/dir/emoji😀.txt');
      expect(joined.length).assertEqual(24);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0275 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0276
     * @tc.name      testJoinPathMatrix0276
     * @tc.desc      目录 "/dir with space" 与文件名 "test.txt" 拼接为 "/dir with space/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0276 begin');
      const dir: string = '/dir with space';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/test.txt');
      expect(joined.length).assertEqual(24);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0276 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0277
     * @tc.name      testJoinPathMatrix0277
     * @tc.desc      目录 "/dir with space" 与文件名 "/test.txt" 拼接为 "/dir with space/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0277 begin');
      const dir: string = '/dir with space';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/test.txt');
      expect(joined.length).assertEqual(24);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0277 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0278
     * @tc.name      testJoinPathMatrix0278
     * @tc.desc      目录 "/dir with space" 与文件名 "//test.txt" 拼接为 "/dir with space/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0278 begin');
      const dir: string = '/dir with space';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/test.txt');
      expect(joined.length).assertEqual(24);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0278 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0279
     * @tc.name      testJoinPathMatrix0279
     * @tc.desc      目录 "/dir with space" 与文件名 "/////test.txt" 拼接为 "/dir with space/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0279 begin');
      const dir: string = '/dir with space';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/test.txt');
      expect(joined.length).assertEqual(24);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0279 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0280
     * @tc.name      testJoinPathMatrix0280
     * @tc.desc      目录 "/dir with space" 与文件名 空串 拼接为 "/dir with space"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0280 begin');
      const dir: string = '/dir with space';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space');
      expect(joined.length).assertEqual(15);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0280 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0281
     * @tc.name      testJoinPathMatrix0281
     * @tc.desc      目录 "/dir with space" 与文件名 "/" 拼接为 "/dir with space"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0281 begin');
      const dir: string = '/dir with space';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space');
      expect(joined.length).assertEqual(15);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0281 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0282
     * @tc.name      testJoinPathMatrix0282
     * @tc.desc      目录 "/dir with space" 与文件名 "//" 拼接为 "/dir with space"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0282 begin');
      const dir: string = '/dir with space';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space');
      expect(joined.length).assertEqual(15);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0282 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0283
     * @tc.name      testJoinPathMatrix0283
     * @tc.desc      目录 "/dir with space" 与文件名 "////" 拼接为 "/dir with space"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0283 begin');
      const dir: string = '/dir with space';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space');
      expect(joined.length).assertEqual(15);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0283 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0284
     * @tc.name      testJoinPathMatrix0284
     * @tc.desc      目录 "/dir with space" 与文件名 "a/b.txt" 拼接为 "/dir with space/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0284 begin');
      const dir: string = '/dir with space';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/a/b.txt');
      expect(joined.length).assertEqual(23);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0284 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0285
     * @tc.name      testJoinPathMatrix0285
     * @tc.desc      目录 "/dir with space" 与文件名 "/a/b/c.txt" 拼接为 "/dir with space/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0285 begin');
      const dir: string = '/dir with space';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/a/b/c.txt');
      expect(joined.length).assertEqual(25);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0285 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0286
     * @tc.name      testJoinPathMatrix0286
     * @tc.desc      目录 "/dir with space" 与文件名 ".hidden" 拼接为 "/dir with space/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0286 begin');
      const dir: string = '/dir with space';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/.hidden');
      expect(joined.length).assertEqual(23);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0286 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0287
     * @tc.name      testJoinPathMatrix0287
     * @tc.desc      目录 "/dir with space" 与文件名 "/.hidden" 拼接为 "/dir with space/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0287 begin');
      const dir: string = '/dir with space';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/.hidden');
      expect(joined.length).assertEqual(23);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0287 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0288
     * @tc.name      testJoinPathMatrix0288
     * @tc.desc      目录 "/dir with space" 与文件名 "noext" 拼接为 "/dir with space/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0288 begin');
      const dir: string = '/dir with space';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/noext');
      expect(joined.length).assertEqual(21);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0288 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0289
     * @tc.name      testJoinPathMatrix0289
     * @tc.desc      目录 "/dir with space" 与文件名 "/中文名.txt" 拼接为 "/dir with space/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0289 begin');
      const dir: string = '/dir with space';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/中文名.txt');
      expect(joined.length).assertEqual(23);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0289 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0290
     * @tc.name      testJoinPathMatrix0290
     * @tc.desc      目录 "/dir with space" 与文件名 "数据.db" 拼接为 "/dir with space/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0290 begin');
      const dir: string = '/dir with space';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/数据.db');
      expect(joined.length).assertEqual(21);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0290 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0291
     * @tc.name      testJoinPathMatrix0291
     * @tc.desc      目录 "/dir with space" 与文件名 " lead.txt" 拼接为 "/dir with space/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0291 begin');
      const dir: string = '/dir with space';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/ lead.txt');
      expect(joined.length).assertEqual(25);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0291 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0292
     * @tc.name      testJoinPathMatrix0292
     * @tc.desc      目录 "/dir with space" 与文件名 "/trail.txt " 拼接为 "/dir with space/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0292 begin');
      const dir: string = '/dir with space';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/trail.txt ');
      expect(joined.length).assertEqual(26);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0292 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0293
     * @tc.name      testJoinPathMatrix0293
     * @tc.desc      目录 "/dir with space" 与文件名 "sp ace.txt" 拼接为 "/dir with space/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0293 begin');
      const dir: string = '/dir with space';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/sp ace.txt');
      expect(joined.length).assertEqual(26);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0293 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0294
     * @tc.name      testJoinPathMatrix0294
     * @tc.desc      目录 "/dir with space" 与文件名 "a.b.c.d" 拼接为 "/dir with space/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0294 begin');
      const dir: string = '/dir with space';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/a.b.c.d');
      expect(joined.length).assertEqual(23);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0294 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0295
     * @tc.name      testJoinPathMatrix0295
     * @tc.desc      目录 "/dir with space" 与文件名 "/../up.txt" 拼接为 "/dir with space/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0295 begin');
      const dir: string = '/dir with space';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/../up.txt');
      expect(joined.length).assertEqual(25);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0295 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0296
     * @tc.name      testJoinPathMatrix0296
     * @tc.desc      目录 "/dir with space" 与文件名 "./cur.txt" 拼接为 "/dir with space/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0296 begin');
      const dir: string = '/dir with space';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/./cur.txt');
      expect(joined.length).assertEqual(25);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0296 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0297
     * @tc.name      testJoinPathMatrix0297
     * @tc.desc      目录 "/dir with space" 与文件名 "name/" 拼接为 "/dir with space/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0297 begin');
      const dir: string = '/dir with space';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/name/');
      expect(joined.length).assertEqual(21);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0297 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0298
     * @tc.name      testJoinPathMatrix0298
     * @tc.desc      目录 "/dir with space" 与文件名 "/name//" 拼接为 "/dir with space/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0298 begin');
      const dir: string = '/dir with space';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/name//');
      expect(joined.length).assertEqual(22);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0298 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0299
     * @tc.name      testJoinPathMatrix0299
     * @tc.desc      目录 "/dir with space" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/dir with space/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0299 begin');
      const dir: string = '/dir with space';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(56);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0299 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0300
     * @tc.name      testJoinPathMatrix0300
     * @tc.desc      目录 "/dir with space" 与文件名 "/emoji😀.txt" 拼接为 "/dir with space/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0300 begin');
      const dir: string = '/dir with space';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      expect(joined).assertEqual('/dir with space/emoji😀.txt');
      expect(joined.length).assertEqual(27);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/dir with space/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0300 end');
    })
  })
}
