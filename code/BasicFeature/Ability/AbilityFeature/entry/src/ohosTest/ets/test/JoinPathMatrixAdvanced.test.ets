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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

export default function joinPathMatrixAdvancedTest(): void {
  describe('AbilityFeatureJoinPathMatrixAdvancedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0183
     * @tc.name      testJoinPathMatrix0183
     * @tc.desc      目录 "/a" 与文件名 "////" 拼接为 "/a"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0183 begin');
      const dir: string = '/a';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0183 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a');
      expect(joined.length).assertEqual(2);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0183 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0184
     * @tc.name      testJoinPathMatrix0184
     * @tc.desc      目录 "/a" 与文件名 "a/b.txt" 拼接为 "/a/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0184 begin');
      const dir: string = '/a';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0184 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/a/b.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0184 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0185
     * @tc.name      testJoinPathMatrix0185
     * @tc.desc      目录 "/a" 与文件名 "/a/b/c.txt" 拼接为 "/a/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0185 begin');
      const dir: string = '/a';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0185 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/a/b/c.txt');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0185 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0186
     * @tc.name      testJoinPathMatrix0186
     * @tc.desc      目录 "/a" 与文件名 ".hidden" 拼接为 "/a/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0186 begin');
      const dir: string = '/a';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0186 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/.hidden');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0186 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0187
     * @tc.name      testJoinPathMatrix0187
     * @tc.desc      目录 "/a" 与文件名 "/.hidden" 拼接为 "/a/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0187 begin');
      const dir: string = '/a';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0187 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/.hidden');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0187 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0188
     * @tc.name      testJoinPathMatrix0188
     * @tc.desc      目录 "/a" 与文件名 "noext" 拼接为 "/a/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0188 begin');
      const dir: string = '/a';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0188 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/noext');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0188 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0189
     * @tc.name      testJoinPathMatrix0189
     * @tc.desc      目录 "/a" 与文件名 "/中文名.txt" 拼接为 "/a/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0189 begin');
      const dir: string = '/a';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0189 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/中文名.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0189 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0190
     * @tc.name      testJoinPathMatrix0190
     * @tc.desc      目录 "/a" 与文件名 "数据.db" 拼接为 "/a/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0190 begin');
      const dir: string = '/a';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0190 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/数据.db');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0190 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0191
     * @tc.name      testJoinPathMatrix0191
     * @tc.desc      目录 "/a" 与文件名 " lead.txt" 拼接为 "/a/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0191 begin');
      const dir: string = '/a';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0191 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/ lead.txt');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0191 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0192
     * @tc.name      testJoinPathMatrix0192
     * @tc.desc      目录 "/a" 与文件名 "/trail.txt " 拼接为 "/a/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0192 begin');
      const dir: string = '/a';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0192 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/trail.txt ');
      expect(joined.length).assertEqual(13);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0192 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0193
     * @tc.name      testJoinPathMatrix0193
     * @tc.desc      目录 "/a" 与文件名 "sp ace.txt" 拼接为 "/a/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0193 begin');
      const dir: string = '/a';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0193 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/sp ace.txt');
      expect(joined.length).assertEqual(13);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0193 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0194
     * @tc.name      testJoinPathMatrix0194
     * @tc.desc      目录 "/a" 与文件名 "a.b.c.d" 拼接为 "/a/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0194 begin');
      const dir: string = '/a';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0194 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/a.b.c.d');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0194 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0195
     * @tc.name      testJoinPathMatrix0195
     * @tc.desc      目录 "/a" 与文件名 "/../up.txt" 拼接为 "/a/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0195 begin');
      const dir: string = '/a';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0195 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/../up.txt');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0195 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0196
     * @tc.name      testJoinPathMatrix0196
     * @tc.desc      目录 "/a" 与文件名 "./cur.txt" 拼接为 "/a/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0196 begin');
      const dir: string = '/a';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0196 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/./cur.txt');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0196 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0197
     * @tc.name      testJoinPathMatrix0197
     * @tc.desc      目录 "/a" 与文件名 "name/" 拼接为 "/a/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0197 begin');
      const dir: string = '/a';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0197 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/name/');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0197 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0198
     * @tc.name      testJoinPathMatrix0198
     * @tc.desc      目录 "/a" 与文件名 "/name//" 拼接为 "/a/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0198 begin');
      const dir: string = '/a';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0198 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/name//');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0198 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0199
     * @tc.name      testJoinPathMatrix0199
     * @tc.desc      目录 "/a" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/a/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0199 begin');
      const dir: string = '/a';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0199 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(43);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0199 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0200
     * @tc.name      testJoinPathMatrix0200
     * @tc.desc      目录 "/a" 与文件名 "/emoji😀.txt" 拼接为 "/a/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0200 begin');
      const dir: string = '/a';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0200 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/emoji😀.txt');
      expect(joined.length).assertEqual(14);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0200 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0201
     * @tc.name      testJoinPathMatrix0201
     * @tc.desc      目录 "/" 与文件名 "test.txt" 拼接为 "//test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0201 begin');
      const dir: string = '/';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0201 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//test.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0201 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0202
     * @tc.name      testJoinPathMatrix0202
     * @tc.desc      目录 "/" 与文件名 "/test.txt" 拼接为 "//test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0202 begin');
      const dir: string = '/';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0202 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//test.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0202 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0203
     * @tc.name      testJoinPathMatrix0203
     * @tc.desc      目录 "/" 与文件名 "//test.txt" 拼接为 "//test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0203 begin');
      const dir: string = '/';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0203 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//test.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0203 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0204
     * @tc.name      testJoinPathMatrix0204
     * @tc.desc      目录 "/" 与文件名 "/////test.txt" 拼接为 "//test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0204 begin');
      const dir: string = '/';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0204 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//test.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0204 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0205
     * @tc.name      testJoinPathMatrix0205
     * @tc.desc      目录 "/" 与文件名 空串 拼接为 "/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0205 begin');
      const dir: string = '/';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0205 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/');
      expect(joined.length).assertEqual(1);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0205 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0206
     * @tc.name      testJoinPathMatrix0206
     * @tc.desc      目录 "/" 与文件名 "/" 拼接为 "/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0206 begin');
      const dir: string = '/';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0206 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/');
      expect(joined.length).assertEqual(1);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0206 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0207
     * @tc.name      testJoinPathMatrix0207
     * @tc.desc      目录 "/" 与文件名 "//" 拼接为 "/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0207 begin');
      const dir: string = '/';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0207 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/');
      expect(joined.length).assertEqual(1);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0207 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0208
     * @tc.name      testJoinPathMatrix0208
     * @tc.desc      目录 "/" 与文件名 "////" 拼接为 "/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0208 begin');
      const dir: string = '/';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0208 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/');
      expect(joined.length).assertEqual(1);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0208 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0209
     * @tc.name      testJoinPathMatrix0209
     * @tc.desc      目录 "/" 与文件名 "a/b.txt" 拼接为 "//a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0209 begin');
      const dir: string = '/';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0209 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//a/b.txt');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0209 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0210
     * @tc.name      testJoinPathMatrix0210
     * @tc.desc      目录 "/" 与文件名 "/a/b/c.txt" 拼接为 "//a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0210 begin');
      const dir: string = '/';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0210 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//a/b/c.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0210 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0211
     * @tc.name      testJoinPathMatrix0211
     * @tc.desc      目录 "/" 与文件名 ".hidden" 拼接为 "//.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0211 begin');
      const dir: string = '/';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0211 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//.hidden');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0211 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0212
     * @tc.name      testJoinPathMatrix0212
     * @tc.desc      目录 "/" 与文件名 "/.hidden" 拼接为 "//.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0212 begin');
      const dir: string = '/';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0212 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//.hidden');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0212 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0213
     * @tc.name      testJoinPathMatrix0213
     * @tc.desc      目录 "/" 与文件名 "noext" 拼接为 "//noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0213 begin');
      const dir: string = '/';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0213 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//noext');
      expect(joined.length).assertEqual(7);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0213 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0214
     * @tc.name      testJoinPathMatrix0214
     * @tc.desc      目录 "/" 与文件名 "/中文名.txt" 拼接为 "//中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0214 begin');
      const dir: string = '/';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0214 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//中文名.txt');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0214 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0215
     * @tc.name      testJoinPathMatrix0215
     * @tc.desc      目录 "/" 与文件名 "数据.db" 拼接为 "//数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0215 begin');
      const dir: string = '/';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0215 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//数据.db');
      expect(joined.length).assertEqual(7);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0215 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0216
     * @tc.name      testJoinPathMatrix0216
     * @tc.desc      目录 "/" 与文件名 " lead.txt" 拼接为 "// lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0216 begin');
      const dir: string = '/';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0216 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('// lead.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('// lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0216 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0217
     * @tc.name      testJoinPathMatrix0217
     * @tc.desc      目录 "/" 与文件名 "/trail.txt " 拼接为 "//trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0217 begin');
      const dir: string = '/';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0217 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//trail.txt ');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0217 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0218
     * @tc.name      testJoinPathMatrix0218
     * @tc.desc      目录 "/" 与文件名 "sp ace.txt" 拼接为 "//sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0218 begin');
      const dir: string = '/';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0218 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//sp ace.txt');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0218 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0219
     * @tc.name      testJoinPathMatrix0219
     * @tc.desc      目录 "/" 与文件名 "a.b.c.d" 拼接为 "//a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0219 begin');
      const dir: string = '/';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0219 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//a.b.c.d');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0219 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0220
     * @tc.name      testJoinPathMatrix0220
     * @tc.desc      目录 "/" 与文件名 "/../up.txt" 拼接为 "//../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0220 begin');
      const dir: string = '/';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0220 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//../up.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0220 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0221
     * @tc.name      testJoinPathMatrix0221
     * @tc.desc      目录 "/" 与文件名 "./cur.txt" 拼接为 "//./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0221 begin');
      const dir: string = '/';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0221 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//./cur.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0221 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0222
     * @tc.name      testJoinPathMatrix0222
     * @tc.desc      目录 "/" 与文件名 "name/" 拼接为 "//name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0222 begin');
      const dir: string = '/';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0222 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//name/');
      expect(joined.length).assertEqual(7);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0222 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0223
     * @tc.name      testJoinPathMatrix0223
     * @tc.desc      目录 "/" 与文件名 "/name//" 拼接为 "//name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0223 begin');
      const dir: string = '/';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0223 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//name//');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0223 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0224
     * @tc.name      testJoinPathMatrix0224
     * @tc.desc      目录 "/" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0224 begin');
      const dir: string = '/';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0224 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(42);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0224 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0225
     * @tc.name      testJoinPathMatrix0225
     * @tc.desc      目录 "/" 与文件名 "/emoji😀.txt" 拼接为 "//emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0225 begin');
      const dir: string = '/';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0225 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('//emoji😀.txt');
      expect(joined.length).assertEqual(13);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('//emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0225 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0226
     * @tc.name      testJoinPathMatrix0226
     * @tc.desc      目录 空串 与文件名 "test.txt" 拼接为 "/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0226 begin');
      const dir: string = '';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0226 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/test.txt');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0226 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0227
     * @tc.name      testJoinPathMatrix0227
     * @tc.desc      目录 空串 与文件名 "/test.txt" 拼接为 "/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0227 begin');
      const dir: string = '';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0227 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/test.txt');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0227 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0228
     * @tc.name      testJoinPathMatrix0228
     * @tc.desc      目录 空串 与文件名 "//test.txt" 拼接为 "/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0228 begin');
      const dir: string = '';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0228 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/test.txt');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0228 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0229
     * @tc.name      testJoinPathMatrix0229
     * @tc.desc      目录 空串 与文件名 "/////test.txt" 拼接为 "/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0229 begin');
      const dir: string = '';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0229 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/test.txt');
      expect(joined.length).assertEqual(9);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0229 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0230
     * @tc.name      testJoinPathMatrix0230
     * @tc.desc      目录 空串 与文件名 空串 拼接为 空串，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0230 begin');
      const dir: string = '';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0230 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('');
      expect(joined.length).assertEqual(0);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0230 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0231
     * @tc.name      testJoinPathMatrix0231
     * @tc.desc      目录 空串 与文件名 "/" 拼接为 空串，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0231 begin');
      const dir: string = '';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0231 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('');
      expect(joined.length).assertEqual(0);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0231 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0232
     * @tc.name      testJoinPathMatrix0232
     * @tc.desc      目录 空串 与文件名 "//" 拼接为 空串，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0232 begin');
      const dir: string = '';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0232 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('');
      expect(joined.length).assertEqual(0);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0232 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0233
     * @tc.name      testJoinPathMatrix0233
     * @tc.desc      目录 空串 与文件名 "////" 拼接为 空串，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0233 begin');
      const dir: string = '';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0233 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('');
      expect(joined.length).assertEqual(0);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0233 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0234
     * @tc.name      testJoinPathMatrix0234
     * @tc.desc      目录 空串 与文件名 "a/b.txt" 拼接为 "/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0234 begin');
      const dir: string = '';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0234 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/b.txt');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0234 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0235
     * @tc.name      testJoinPathMatrix0235
     * @tc.desc      目录 空串 与文件名 "/a/b/c.txt" 拼接为 "/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0235 begin');
      const dir: string = '';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0235 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/b/c.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0235 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0236
     * @tc.name      testJoinPathMatrix0236
     * @tc.desc      目录 空串 与文件名 ".hidden" 拼接为 "/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0236 begin');
      const dir: string = '';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0236 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/.hidden');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0236 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0237
     * @tc.name      testJoinPathMatrix0237
     * @tc.desc      目录 空串 与文件名 "/.hidden" 拼接为 "/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0237 begin');
      const dir: string = '';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0237 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/.hidden');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0237 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0238
     * @tc.name      testJoinPathMatrix0238
     * @tc.desc      目录 空串 与文件名 "noext" 拼接为 "/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0238 begin');
      const dir: string = '';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0238 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/noext');
      expect(joined.length).assertEqual(6);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0238 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0239
     * @tc.name      testJoinPathMatrix0239
     * @tc.desc      目录 空串 与文件名 "/中文名.txt" 拼接为 "/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0239 begin');
      const dir: string = '';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0239 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/中文名.txt');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0239 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0240
     * @tc.name      testJoinPathMatrix0240
     * @tc.desc      目录 空串 与文件名 "数据.db" 拼接为 "/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0240 begin');
      const dir: string = '';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0240 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/数据.db');
      expect(joined.length).assertEqual(6);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0240 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0241
     * @tc.name      testJoinPathMatrix0241
     * @tc.desc      目录 空串 与文件名 " lead.txt" 拼接为 "/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0241 begin');
      const dir: string = '';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0241 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/ lead.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0241 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0242
     * @tc.name      testJoinPathMatrix0242
     * @tc.desc      目录 空串 与文件名 "/trail.txt " 拼接为 "/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0242 begin');
      const dir: string = '';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0242 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/trail.txt ');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0242 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0243
     * @tc.name      testJoinPathMatrix0243
     * @tc.desc      目录 空串 与文件名 "sp ace.txt" 拼接为 "/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0243 begin');
      const dir: string = '';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0243 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/sp ace.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0243 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0244
     * @tc.name      testJoinPathMatrix0244
     * @tc.desc      目录 空串 与文件名 "a.b.c.d" 拼接为 "/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0244 begin');
      const dir: string = '';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0244 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a.b.c.d');
      expect(joined.length).assertEqual(8);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0244 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0245
     * @tc.name      testJoinPathMatrix0245
     * @tc.desc      目录 空串 与文件名 "/../up.txt" 拼接为 "/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0245 begin');
      const dir: string = '';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0245 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/../up.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0245 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0246
     * @tc.name      testJoinPathMatrix0246
     * @tc.desc      目录 空串 与文件名 "./cur.txt" 拼接为 "/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0246 begin');
      const dir: string = '';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0246 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/./cur.txt');
      expect(joined.length).assertEqual(10);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0246 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0247
     * @tc.name      testJoinPathMatrix0247
     * @tc.desc      目录 空串 与文件名 "name/" 拼接为 "/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0247 begin');
      const dir: string = '';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0247 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/name/');
      expect(joined.length).assertEqual(6);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0247 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0248
     * @tc.name      testJoinPathMatrix0248
     * @tc.desc      目录 空串 与文件名 "/name//" 拼接为 "/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0248 begin');
      const dir: string = '';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0248 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/name//');
      expect(joined.length).assertEqual(7);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0248 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0249
     * @tc.name      testJoinPathMatrix0249
     * @tc.desc      目录 空串 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0249 begin');
      const dir: string = '';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0249 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(41);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0249 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0250
     * @tc.name      testJoinPathMatrix0250
     * @tc.desc      目录 空串 与文件名 "/emoji😀.txt" 拼接为 "/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0250 begin');
      const dir: string = '';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0250 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/emoji😀.txt');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0250 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0251
     * @tc.name      testJoinPathMatrix0251
     * @tc.desc      目录 "relative/dir" 与文件名 "test.txt" 拼接为 "relative/dir/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0251 begin');
      const dir: string = 'relative/dir';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0251 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/test.txt');
      expect(joined.length).assertEqual(21);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0251 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0252
     * @tc.name      testJoinPathMatrix0252
     * @tc.desc      目录 "relative/dir" 与文件名 "/test.txt" 拼接为 "relative/dir/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0252 begin');
      const dir: string = 'relative/dir';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0252 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/test.txt');
      expect(joined.length).assertEqual(21);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0252 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0253
     * @tc.name      testJoinPathMatrix0253
     * @tc.desc      目录 "relative/dir" 与文件名 "//test.txt" 拼接为 "relative/dir/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0253 begin');
      const dir: string = 'relative/dir';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0253 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/test.txt');
      expect(joined.length).assertEqual(21);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0253 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0254
     * @tc.name      testJoinPathMatrix0254
     * @tc.desc      目录 "relative/dir" 与文件名 "/////test.txt" 拼接为 "relative/dir/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0254 begin');
      const dir: string = 'relative/dir';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0254 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/test.txt');
      expect(joined.length).assertEqual(21);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0254 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0255
     * @tc.name      testJoinPathMatrix0255
     * @tc.desc      目录 "relative/dir" 与文件名 空串 拼接为 "relative/dir"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0255 begin');
      const dir: string = 'relative/dir';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0255 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0255 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0256
     * @tc.name      testJoinPathMatrix0256
     * @tc.desc      目录 "relative/dir" 与文件名 "/" 拼接为 "relative/dir"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0256 begin');
      const dir: string = 'relative/dir';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0256 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0256 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0257
     * @tc.name      testJoinPathMatrix0257
     * @tc.desc      目录 "relative/dir" 与文件名 "//" 拼接为 "relative/dir"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0257 begin');
      const dir: string = 'relative/dir';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0257 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0257 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0258
     * @tc.name      testJoinPathMatrix0258
     * @tc.desc      目录 "relative/dir" 与文件名 "////" 拼接为 "relative/dir"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0258 begin');
      const dir: string = 'relative/dir';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0258 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir');
      expect(joined.length).assertEqual(12);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0258 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0259
     * @tc.name      testJoinPathMatrix0259
     * @tc.desc      目录 "relative/dir" 与文件名 "a/b.txt" 拼接为 "relative/dir/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0259 begin');
      const dir: string = 'relative/dir';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0259 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/a/b.txt');
      expect(joined.length).assertEqual(20);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0259 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0260
     * @tc.name      testJoinPathMatrix0260
     * @tc.desc      目录 "relative/dir" 与文件名 "/a/b/c.txt" 拼接为 "relative/dir/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0260 begin');
      const dir: string = 'relative/dir';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0260 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/a/b/c.txt');
      expect(joined.length).assertEqual(22);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0260 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0261
     * @tc.name      testJoinPathMatrix0261
     * @tc.desc      目录 "relative/dir" 与文件名 ".hidden" 拼接为 "relative/dir/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0261 begin');
      const dir: string = 'relative/dir';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0261 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/.hidden');
      expect(joined.length).assertEqual(20);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0261 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0262
     * @tc.name      testJoinPathMatrix0262
     * @tc.desc      目录 "relative/dir" 与文件名 "/.hidden" 拼接为 "relative/dir/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0262 begin');
      const dir: string = 'relative/dir';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0262 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/.hidden');
      expect(joined.length).assertEqual(20);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0262 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0263
     * @tc.name      testJoinPathMatrix0263
     * @tc.desc      目录 "relative/dir" 与文件名 "noext" 拼接为 "relative/dir/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0263 begin');
      const dir: string = 'relative/dir';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0263 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/noext');
      expect(joined.length).assertEqual(18);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0263 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0264
     * @tc.name      testJoinPathMatrix0264
     * @tc.desc      目录 "relative/dir" 与文件名 "/中文名.txt" 拼接为 "relative/dir/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0264 begin');
      const dir: string = 'relative/dir';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0264 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/中文名.txt');
      expect(joined.length).assertEqual(20);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0264 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0265
     * @tc.name      testJoinPathMatrix0265
     * @tc.desc      目录 "relative/dir" 与文件名 "数据.db" 拼接为 "relative/dir/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0265 begin');
      const dir: string = 'relative/dir';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0265 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/数据.db');
      expect(joined.length).assertEqual(18);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0265 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0266
     * @tc.name      testJoinPathMatrix0266
     * @tc.desc      目录 "relative/dir" 与文件名 " lead.txt" 拼接为 "relative/dir/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0266 begin');
      const dir: string = 'relative/dir';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0266 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/ lead.txt');
      expect(joined.length).assertEqual(22);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0266 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0267
     * @tc.name      testJoinPathMatrix0267
     * @tc.desc      目录 "relative/dir" 与文件名 "/trail.txt " 拼接为 "relative/dir/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0267 begin');
      const dir: string = 'relative/dir';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0267 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/trail.txt ');
      expect(joined.length).assertEqual(23);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0267 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0268
     * @tc.name      testJoinPathMatrix0268
     * @tc.desc      目录 "relative/dir" 与文件名 "sp ace.txt" 拼接为 "relative/dir/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0268 begin');
      const dir: string = 'relative/dir';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0268 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/sp ace.txt');
      expect(joined.length).assertEqual(23);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0268 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0269
     * @tc.name      testJoinPathMatrix0269
     * @tc.desc      目录 "relative/dir" 与文件名 "a.b.c.d" 拼接为 "relative/dir/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0269 begin');
      const dir: string = 'relative/dir';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0269 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/a.b.c.d');
      expect(joined.length).assertEqual(20);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0269 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0270
     * @tc.name      testJoinPathMatrix0270
     * @tc.desc      目录 "relative/dir" 与文件名 "/../up.txt" 拼接为 "relative/dir/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0270 begin');
      const dir: string = 'relative/dir';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0270 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/../up.txt');
      expect(joined.length).assertEqual(22);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0270 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0271
     * @tc.name      testJoinPathMatrix0271
     * @tc.desc      目录 "relative/dir" 与文件名 "./cur.txt" 拼接为 "relative/dir/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0271 begin');
      const dir: string = 'relative/dir';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0271 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/./cur.txt');
      expect(joined.length).assertEqual(22);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0271 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0272
     * @tc.name      testJoinPathMatrix0272
     * @tc.desc      目录 "relative/dir" 与文件名 "name/" 拼接为 "relative/dir/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0272 begin');
      const dir: string = 'relative/dir';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0272 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/name/');
      expect(joined.length).assertEqual(18);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0272 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0273
     * @tc.name      testJoinPathMatrix0273
     * @tc.desc      目录 "relative/dir" 与文件名 "/name//" 拼接为 "relative/dir/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0273 begin');
      const dir: string = 'relative/dir';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0273 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('relative/dir/name//');
      expect(joined.length).assertEqual(19);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('relative/dir/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0273 end');
    })
  })
}
