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

export default function joinPathMatrixExtendedTest(): void {
  describe('AbilityFeatureJoinPathMatrixExtendedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0092
     * @tc.name      testJoinPathMatrix0092
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/trail.txt " 拼接为 "/data/storage/el2/base/haps/entry/temp/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0092 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0092 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/trail.txt ');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0092 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0093
     * @tc.name      testJoinPathMatrix0093
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "sp ace.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0093 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0093 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/sp ace.txt');
      expect(joined.length).assertEqual(49);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0093 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0094
     * @tc.name      testJoinPathMatrix0094
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "a.b.c.d" 拼接为 "/data/storage/el2/base/haps/entry/temp/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0094 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0094 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/a.b.c.d');
      expect(joined.length).assertEqual(46);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0094 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0095
     * @tc.name      testJoinPathMatrix0095
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/../up.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0095 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0095 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/../up.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0095 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0096
     * @tc.name      testJoinPathMatrix0096
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "./cur.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0096 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0096 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/./cur.txt');
      expect(joined.length).assertEqual(48);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0096 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0097
     * @tc.name      testJoinPathMatrix0097
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "name/" 拼接为 "/data/storage/el2/base/haps/entry/temp/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0097 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0097 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/name/');
      expect(joined.length).assertEqual(44);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0097 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0098
     * @tc.name      testJoinPathMatrix0098
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/name//" 拼接为 "/data/storage/el2/base/haps/entry/temp/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0098 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0098 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/name//');
      expect(joined.length).assertEqual(45);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0098 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0099
     * @tc.name      testJoinPathMatrix0099
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/data/storage/el2/base/haps/entry/temp/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0099 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0099 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(79);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0099 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0100
     * @tc.name      testJoinPathMatrix0100
     * @tc.desc      目录 "/data/storage/el2/base/haps/entry/temp" 与文件名 "/emoji😀.txt" 拼接为 "/data/storage/el2/base/haps/entry/temp/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0100 begin');
      const dir: string = '/data/storage/el2/base/haps/entry/temp';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0100 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/haps/entry/temp/emoji😀.txt');
      expect(joined.length).assertEqual(50);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/haps/entry/temp/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0100 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0101
     * @tc.name      testJoinPathMatrix0101
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "test.txt" 拼接为 "/data/storage/el2/database/entry/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0101 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0101 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/test.txt');
      expect(joined.length).assertEqual(41);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0101 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0102
     * @tc.name      testJoinPathMatrix0102
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/test.txt" 拼接为 "/data/storage/el2/database/entry/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0102 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0102 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/test.txt');
      expect(joined.length).assertEqual(41);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0102 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0103
     * @tc.name      testJoinPathMatrix0103
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "//test.txt" 拼接为 "/data/storage/el2/database/entry/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0103 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0103 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/test.txt');
      expect(joined.length).assertEqual(41);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0103 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0104
     * @tc.name      testJoinPathMatrix0104
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/////test.txt" 拼接为 "/data/storage/el2/database/entry/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0104 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0104 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/test.txt');
      expect(joined.length).assertEqual(41);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0104 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0105
     * @tc.name      testJoinPathMatrix0105
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 空串 拼接为 "/data/storage/el2/database/entry"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0105 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0105 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry');
      expect(joined.length).assertEqual(32);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0105 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0106
     * @tc.name      testJoinPathMatrix0106
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/" 拼接为 "/data/storage/el2/database/entry"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0106 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0106 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry');
      expect(joined.length).assertEqual(32);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0106 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0107
     * @tc.name      testJoinPathMatrix0107
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "//" 拼接为 "/data/storage/el2/database/entry"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0107 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0107 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry');
      expect(joined.length).assertEqual(32);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0107 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0108
     * @tc.name      testJoinPathMatrix0108
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "////" 拼接为 "/data/storage/el2/database/entry"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0108 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0108 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry');
      expect(joined.length).assertEqual(32);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0108 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0109
     * @tc.name      testJoinPathMatrix0109
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "a/b.txt" 拼接为 "/data/storage/el2/database/entry/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0109 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0109 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/a/b.txt');
      expect(joined.length).assertEqual(40);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0109 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0110
     * @tc.name      testJoinPathMatrix0110
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/a/b/c.txt" 拼接为 "/data/storage/el2/database/entry/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0110 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0110 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/a/b/c.txt');
      expect(joined.length).assertEqual(42);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0110 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0111
     * @tc.name      testJoinPathMatrix0111
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 ".hidden" 拼接为 "/data/storage/el2/database/entry/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0111 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0111 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/.hidden');
      expect(joined.length).assertEqual(40);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0111 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0112
     * @tc.name      testJoinPathMatrix0112
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/.hidden" 拼接为 "/data/storage/el2/database/entry/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0112 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0112 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/.hidden');
      expect(joined.length).assertEqual(40);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0112 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0113
     * @tc.name      testJoinPathMatrix0113
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "noext" 拼接为 "/data/storage/el2/database/entry/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0113 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0113 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/noext');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0113 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0114
     * @tc.name      testJoinPathMatrix0114
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/中文名.txt" 拼接为 "/data/storage/el2/database/entry/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0114 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0114 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/中文名.txt');
      expect(joined.length).assertEqual(40);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0114 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0115
     * @tc.name      testJoinPathMatrix0115
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "数据.db" 拼接为 "/data/storage/el2/database/entry/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0115 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0115 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/数据.db');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0115 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0116
     * @tc.name      testJoinPathMatrix0116
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 " lead.txt" 拼接为 "/data/storage/el2/database/entry/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0116 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0116 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/ lead.txt');
      expect(joined.length).assertEqual(42);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0116 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0117
     * @tc.name      testJoinPathMatrix0117
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/trail.txt " 拼接为 "/data/storage/el2/database/entry/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0117 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0117 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/trail.txt ');
      expect(joined.length).assertEqual(43);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0117 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0118
     * @tc.name      testJoinPathMatrix0118
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "sp ace.txt" 拼接为 "/data/storage/el2/database/entry/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0118 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0118 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/sp ace.txt');
      expect(joined.length).assertEqual(43);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0118 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0119
     * @tc.name      testJoinPathMatrix0119
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "a.b.c.d" 拼接为 "/data/storage/el2/database/entry/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0119 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0119 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/a.b.c.d');
      expect(joined.length).assertEqual(40);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0119 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0120
     * @tc.name      testJoinPathMatrix0120
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/../up.txt" 拼接为 "/data/storage/el2/database/entry/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0120 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0120 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/../up.txt');
      expect(joined.length).assertEqual(42);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0120 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0121
     * @tc.name      testJoinPathMatrix0121
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "./cur.txt" 拼接为 "/data/storage/el2/database/entry/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0121 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0121 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/./cur.txt');
      expect(joined.length).assertEqual(42);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0121 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0122
     * @tc.name      testJoinPathMatrix0122
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "name/" 拼接为 "/data/storage/el2/database/entry/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0122 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0122 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/name/');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0122 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0123
     * @tc.name      testJoinPathMatrix0123
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/name//" 拼接为 "/data/storage/el2/database/entry/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0123 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0123 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/name//');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0123 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0124
     * @tc.name      testJoinPathMatrix0124
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/data/storage/el2/database/entry/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0124 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0124 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(73);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0124 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0125
     * @tc.name      testJoinPathMatrix0125
     * @tc.desc      目录 "/data/storage/el2/database/entry" 与文件名 "/emoji😀.txt" 拼接为 "/data/storage/el2/database/entry/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0125 begin');
      const dir: string = '/data/storage/el2/database/entry';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0125 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/database/entry/emoji😀.txt');
      expect(joined.length).assertEqual(44);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/database/entry/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0125 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0126
     * @tc.name      testJoinPathMatrix0126
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "test.txt" 拼接为 "/data/storage/el2/base/cache/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0126 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0126 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/test.txt');
      expect(joined.length).assertEqual(37);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0126 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0127
     * @tc.name      testJoinPathMatrix0127
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/test.txt" 拼接为 "/data/storage/el2/base/cache/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0127 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0127 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/test.txt');
      expect(joined.length).assertEqual(37);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0127 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0128
     * @tc.name      testJoinPathMatrix0128
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "//test.txt" 拼接为 "/data/storage/el2/base/cache/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0128 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0128 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/test.txt');
      expect(joined.length).assertEqual(37);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0128 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0129
     * @tc.name      testJoinPathMatrix0129
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/////test.txt" 拼接为 "/data/storage/el2/base/cache/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0129 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0129 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/test.txt');
      expect(joined.length).assertEqual(37);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0129 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0130
     * @tc.name      testJoinPathMatrix0130
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 空串 拼接为 "/data/storage/el2/base/cache"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0130 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0130 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache');
      expect(joined.length).assertEqual(28);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0130 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0131
     * @tc.name      testJoinPathMatrix0131
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/" 拼接为 "/data/storage/el2/base/cache"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0131 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0131 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache');
      expect(joined.length).assertEqual(28);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0131 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0132
     * @tc.name      testJoinPathMatrix0132
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "//" 拼接为 "/data/storage/el2/base/cache"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0132 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0132 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache');
      expect(joined.length).assertEqual(28);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0132 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0133
     * @tc.name      testJoinPathMatrix0133
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "////" 拼接为 "/data/storage/el2/base/cache"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0133 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0133 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache');
      expect(joined.length).assertEqual(28);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0133 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0134
     * @tc.name      testJoinPathMatrix0134
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "a/b.txt" 拼接为 "/data/storage/el2/base/cache/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0134 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0134 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/a/b.txt');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0134 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0135
     * @tc.name      testJoinPathMatrix0135
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/a/b/c.txt" 拼接为 "/data/storage/el2/base/cache/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0135 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0135 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/a/b/c.txt');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0135 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0136
     * @tc.name      testJoinPathMatrix0136
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 ".hidden" 拼接为 "/data/storage/el2/base/cache/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0136 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0136 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/.hidden');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0136 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0137
     * @tc.name      testJoinPathMatrix0137
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/.hidden" 拼接为 "/data/storage/el2/base/cache/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0137 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0137 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/.hidden');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0137 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0138
     * @tc.name      testJoinPathMatrix0138
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "noext" 拼接为 "/data/storage/el2/base/cache/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0138 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0138 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/noext');
      expect(joined.length).assertEqual(34);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0138 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0139
     * @tc.name      testJoinPathMatrix0139
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/中文名.txt" 拼接为 "/data/storage/el2/base/cache/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0139 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0139 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/中文名.txt');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0139 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0140
     * @tc.name      testJoinPathMatrix0140
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "数据.db" 拼接为 "/data/storage/el2/base/cache/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0140 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0140 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/数据.db');
      expect(joined.length).assertEqual(34);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0140 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0141
     * @tc.name      testJoinPathMatrix0141
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 " lead.txt" 拼接为 "/data/storage/el2/base/cache/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0141 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0141 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/ lead.txt');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0141 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0142
     * @tc.name      testJoinPathMatrix0142
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/trail.txt " 拼接为 "/data/storage/el2/base/cache/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0142 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0142 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/trail.txt ');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0142 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0143
     * @tc.name      testJoinPathMatrix0143
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "sp ace.txt" 拼接为 "/data/storage/el2/base/cache/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0143 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0143 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/sp ace.txt');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0143 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0144
     * @tc.name      testJoinPathMatrix0144
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "a.b.c.d" 拼接为 "/data/storage/el2/base/cache/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0144 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0144 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/a.b.c.d');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0144 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0145
     * @tc.name      testJoinPathMatrix0145
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/../up.txt" 拼接为 "/data/storage/el2/base/cache/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0145 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0145 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/../up.txt');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0145 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0146
     * @tc.name      testJoinPathMatrix0146
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "./cur.txt" 拼接为 "/data/storage/el2/base/cache/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0146 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0146 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/./cur.txt');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0146 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0147
     * @tc.name      testJoinPathMatrix0147
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "name/" 拼接为 "/data/storage/el2/base/cache/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0147 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0147 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/name/');
      expect(joined.length).assertEqual(34);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0147 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0148
     * @tc.name      testJoinPathMatrix0148
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/name//" 拼接为 "/data/storage/el2/base/cache/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0148 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0148 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/name//');
      expect(joined.length).assertEqual(35);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0148 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0149
     * @tc.name      testJoinPathMatrix0149
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/data/storage/el2/base/cache/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0149 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0149 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(69);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0149 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0150
     * @tc.name      testJoinPathMatrix0150
     * @tc.desc      目录 "/data/storage/el2/base/cache" 与文件名 "/emoji😀.txt" 拼接为 "/data/storage/el2/base/cache/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0150 begin');
      const dir: string = '/data/storage/el2/base/cache';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0150 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el2/base/cache/emoji😀.txt');
      expect(joined.length).assertEqual(40);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el2/base/cache/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0150 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0151
     * @tc.name      testJoinPathMatrix0151
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "test.txt" 拼接为 "/data/storage/el1/base/files/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0151 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0151 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/test.txt');
      expect(joined.length).assertEqual(37);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0151 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0152
     * @tc.name      testJoinPathMatrix0152
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/test.txt" 拼接为 "/data/storage/el1/base/files/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0152 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0152 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/test.txt');
      expect(joined.length).assertEqual(37);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0152 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0153
     * @tc.name      testJoinPathMatrix0153
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "//test.txt" 拼接为 "/data/storage/el1/base/files/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0153 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0153 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/test.txt');
      expect(joined.length).assertEqual(37);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0153 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0154
     * @tc.name      testJoinPathMatrix0154
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/////test.txt" 拼接为 "/data/storage/el1/base/files/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0154 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0154 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/test.txt');
      expect(joined.length).assertEqual(37);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0154 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0155
     * @tc.name      testJoinPathMatrix0155
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 空串 拼接为 "/data/storage/el1/base/files"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0155 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0155 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files');
      expect(joined.length).assertEqual(28);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0155 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0156
     * @tc.name      testJoinPathMatrix0156
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/" 拼接为 "/data/storage/el1/base/files"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0156 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0156 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files');
      expect(joined.length).assertEqual(28);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0156 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0157
     * @tc.name      testJoinPathMatrix0157
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "//" 拼接为 "/data/storage/el1/base/files"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0157 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0157 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files');
      expect(joined.length).assertEqual(28);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0157 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0158
     * @tc.name      testJoinPathMatrix0158
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "////" 拼接为 "/data/storage/el1/base/files"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0158 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '////';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0158 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files');
      expect(joined.length).assertEqual(28);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0158 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0159
     * @tc.name      testJoinPathMatrix0159
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "a/b.txt" 拼接为 "/data/storage/el1/base/files/a/b.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0159 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = 'a/b.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0159 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/a/b.txt');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/a/b.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0159 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0160
     * @tc.name      testJoinPathMatrix0160
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/a/b/c.txt" 拼接为 "/data/storage/el1/base/files/a/b/c.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0160 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/a/b/c.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0160 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/a/b/c.txt');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a/b/c.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/a/b/c.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0160 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0161
     * @tc.name      testJoinPathMatrix0161
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 ".hidden" 拼接为 "/data/storage/el1/base/files/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0161 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0161 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/.hidden');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0161 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0162
     * @tc.name      testJoinPathMatrix0162
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/.hidden" 拼接为 "/data/storage/el1/base/files/.hidden"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0162 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/.hidden';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0162 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/.hidden');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/.hidden');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/.hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0162 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0163
     * @tc.name      testJoinPathMatrix0163
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "noext" 拼接为 "/data/storage/el1/base/files/noext"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0163 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = 'noext';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0163 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/noext');
      expect(joined.length).assertEqual(34);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/noext');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/noext');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0163 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0164
     * @tc.name      testJoinPathMatrix0164
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/中文名.txt" 拼接为 "/data/storage/el1/base/files/中文名.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0164 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/中文名.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0164 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/中文名.txt');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/中文名.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/中文名.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0164 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0165
     * @tc.name      testJoinPathMatrix0165
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "数据.db" 拼接为 "/data/storage/el1/base/files/数据.db"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0165 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '数据.db';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0165 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/数据.db');
      expect(joined.length).assertEqual(34);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/数据.db');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/数据.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0165 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0166
     * @tc.name      testJoinPathMatrix0166
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 " lead.txt" 拼接为 "/data/storage/el1/base/files/ lead.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0166 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = ' lead.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0166 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/ lead.txt');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/ lead.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/ lead.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0166 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0167
     * @tc.name      testJoinPathMatrix0167
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/trail.txt " 拼接为 "/data/storage/el1/base/files/trail.txt "，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0167 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/trail.txt ';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0167 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/trail.txt ');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/trail.txt ');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/trail.txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0167 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0168
     * @tc.name      testJoinPathMatrix0168
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "sp ace.txt" 拼接为 "/data/storage/el1/base/files/sp ace.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0168 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = 'sp ace.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0168 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/sp ace.txt');
      expect(joined.length).assertEqual(39);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/sp ace.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/sp ace.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0168 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0169
     * @tc.name      testJoinPathMatrix0169
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "a.b.c.d" 拼接为 "/data/storage/el1/base/files/a.b.c.d"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0169 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = 'a.b.c.d';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0169 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/a.b.c.d');
      expect(joined.length).assertEqual(36);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/a.b.c.d');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/a.b.c.d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0169 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0170
     * @tc.name      testJoinPathMatrix0170
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/../up.txt" 拼接为 "/data/storage/el1/base/files/../up.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0170 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/../up.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0170 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/../up.txt');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/../up.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/../up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0170 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0171
     * @tc.name      testJoinPathMatrix0171
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "./cur.txt" 拼接为 "/data/storage/el1/base/files/./cur.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0171 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = './cur.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0171 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/./cur.txt');
      expect(joined.length).assertEqual(38);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/./cur.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/./cur.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0171 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0172
     * @tc.name      testJoinPathMatrix0172
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "name/" 拼接为 "/data/storage/el1/base/files/name/"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0172 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = 'name/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0172 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/name/');
      expect(joined.length).assertEqual(34);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name/');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/name/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0172 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0173
     * @tc.name      testJoinPathMatrix0173
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/name//" 拼接为 "/data/storage/el1/base/files/name//"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0173 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/name//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0173 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/name//');
      expect(joined.length).assertEqual(35);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/name//');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/name//');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0173 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0174
     * @tc.name      testJoinPathMatrix0174
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 拼接为 "/data/storage/el1/base/files/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0174 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0174 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joined.length).assertEqual(69);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0174 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0175
     * @tc.name      testJoinPathMatrix0175
     * @tc.desc      目录 "/data/storage/el1/base/files" 与文件名 "/emoji😀.txt" 拼接为 "/data/storage/el1/base/files/emoji😀.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testJoinPathMatrix0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0175 begin');
      const dir: string = '/data/storage/el1/base/files';
      const name: string = '/emoji😀.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0175 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/data/storage/el1/base/files/emoji😀.txt');
      expect(joined.length).assertEqual(40);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/emoji😀.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/data/storage/el1/base/files/emoji😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0175 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0176
     * @tc.name      testJoinPathMatrix0176
     * @tc.desc      目录 "/a" 与文件名 "test.txt" 拼接为 "/a/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0176 begin');
      const dir: string = '/a';
      const name: string = 'test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0176 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/test.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0176 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0177
     * @tc.name      testJoinPathMatrix0177
     * @tc.desc      目录 "/a" 与文件名 "/test.txt" 拼接为 "/a/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0177 begin');
      const dir: string = '/a';
      const name: string = '/test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0177 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/test.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0177 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0178
     * @tc.name      testJoinPathMatrix0178
     * @tc.desc      目录 "/a" 与文件名 "//test.txt" 拼接为 "/a/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0178 begin');
      const dir: string = '/a';
      const name: string = '//test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0178 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/test.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0178 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0179
     * @tc.name      testJoinPathMatrix0179
     * @tc.desc      目录 "/a" 与文件名 "/////test.txt" 拼接为 "/a/test.txt"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0179 begin');
      const dir: string = '/a';
      const name: string = '/////test.txt';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0179 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a/test.txt');
      expect(joined.length).assertEqual(11);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('/test.txt');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0179 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0180
     * @tc.name      testJoinPathMatrix0180
     * @tc.desc      目录 "/a" 与文件名 空串 拼接为 "/a"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0180 begin');
      const dir: string = '/a';
      const name: string = '';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0180 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a');
      expect(joined.length).assertEqual(2);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0180 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0181
     * @tc.name      testJoinPathMatrix0181
     * @tc.desc      目录 "/a" 与文件名 "/" 拼接为 "/a"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0181 begin');
      const dir: string = '/a';
      const name: string = '/';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0181 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a');
      expect(joined.length).assertEqual(2);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0181 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_JOIN_PATH_0182
     * @tc.name      testJoinPathMatrix0182
     * @tc.desc      目录 "/a" 与文件名 "//" 拼接为 "/a"，再补一个前导斜杠结果不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testJoinPathMatrix0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0182 begin');
      const dir: string = '/a';
      const name: string = '//';
      const joined: string = joinStoragePath(dir, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinPathMatrix0182 params: dir=${dir}, name=${name}, joined=${joined}`);
      expect(joined).assertEqual('/a');
      expect(joined.length).assertEqual(2);
      expect(joined.startsWith(dir)).assertTrue();
      expect(joined.substring(dir.length)).assertEqual('');
      expect(joinStoragePath(dir, '/' + name)).assertEqual('/a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinPathMatrix0182 end');
    })
  })
}
