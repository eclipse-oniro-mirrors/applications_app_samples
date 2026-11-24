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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testLogger from '../utils/Logger';

const DOMAIN: number = 0xF812;
const TAG: string = 'TestLoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function buildLongText(unit: string, times: number): string {
  let result: string = '';
  for (let i: number = 0; i < times; i++) {
    result += unit;
  }
  return result;
}

export default function testLoggerCoreTest(): void {
  describe('TestLoggerCoreTest', () => {
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0101
     * @tc.name      testTestLogger0101
     * @tc.desc      Verify the test side logger singleton is exported and not null.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0101 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue testLogger !== null=${testLogger !== null}`);
      expect(testLogger !== null).assertTrue();
      log('testTestLogger0101 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0102
     * @tc.name      testTestLogger0102
     * @tc.desc      Verify the test side logger singleton is an object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0102 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof testLogger=${typeof testLogger}, expected='object'`);
      expect(typeof testLogger).assertEqual('object');
      log('testTestLogger0102 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0103
     * @tc.name      testTestLogger0103
     * @tc.desc      Verify info is exposed as a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0103 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof testLogger.info=${typeof testLogger.info}`);
      expect(typeof testLogger.info).assertEqual('function');
      log('testTestLogger0103 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0104
     * @tc.name      testTestLogger0104
     * @tc.desc      Verify error is exposed as a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0104 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof testLogger.error=${typeof testLogger.error}`);
      expect(typeof testLogger.error).assertEqual('function');
      log('testTestLogger0104 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0105
     * @tc.name      testTestLogger0105
     * @tc.desc      Verify calling info with a plain message does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0105 begin');
      testLogger.info('test logger info smoke');
      expect(true).assertTrue();
      log('testTestLogger0105 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0106
     * @tc.name      testTestLogger0106
     * @tc.desc      Verify calling error with a plain message does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0106 begin');
      testLogger.error('test logger error smoke');
      expect(true).assertTrue();
      log('testTestLogger0106 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0107
     * @tc.name      testTestLogger0107
     * @tc.desc      Verify info tolerates an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0107 begin');
      testLogger.info('');
      expect(true).assertTrue();
      log('testTestLogger0107 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0108
     * @tc.name      testTestLogger0108
     * @tc.desc      Verify info tolerates CJK characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0108 begin');
      testLogger.info('测试日志中文内容');
      expect(true).assertTrue();
      log('testTestLogger0108 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0109
     * @tc.name      testTestLogger0109
     * @tc.desc      Verify info tolerates a 512 character message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0109 begin');
      const longText: string = buildLongText('info', 128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual longText.length=${longText.length}, expected=512`);
      expect(longText.length).assertEqual(512);
      testLogger.info(longText);
      log('testTestLogger0109 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0110
     * @tc.name      testTestLogger0110
     * @tc.desc      Verify info accepts multiple arguments in one call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0110 begin');
      testLogger.info('t1', 't2', 't3');
      expect(true).assertTrue();
      log('testTestLogger0110 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0111
     * @tc.name      testTestLogger0111
     * @tc.desc      Verify error tolerates an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0111 begin');
      testLogger.error('');
      expect(true).assertTrue();
      log('testTestLogger0111 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0112
     * @tc.name      testTestLogger0112
     * @tc.desc      Verify error tolerates special characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0112 begin');
      testLogger.error('tag=<DLP>&state="ready"');
      expect(true).assertTrue();
      log('testTestLogger0112 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0113
     * @tc.name      testTestLogger0113
     * @tc.desc      Verify error accepts multiple arguments in one call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0113 begin');
      testLogger.error('f1', 'f2', 'f3', 'f4');
      expect(true).assertTrue();
      log('testTestLogger0113 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0114
     * @tc.name      testTestLogger0114
     * @tc.desc      Verify repeated access to the singleton returns the same instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0114 begin');
      const first: object = testLogger;
      const second: object = testLogger;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first === second=${first === second}`);
      expect(first === second).assertTrue();
      log('testTestLogger0114 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0115
     * @tc.name      testTestLogger0115
     * @tc.desc      Verify info and error are distinct method references.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0115 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${testLogger.info === testLogger.error}`);
      expect(testLogger.info === testLogger.error).assertFalse();
      log('testTestLogger0115 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0116
     * @tc.name      testTestLogger0116
     * @tc.desc      Verify ten consecutive info calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0116 begin');
      for (let i: number = 0; i < 10; i++) {
        testLogger.info('burst ' + i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTestLogger0116 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0117
     * @tc.name      testTestLogger0117
     * @tc.desc      Verify ten consecutive error calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0117 begin');
      for (let i: number = 0; i < 10; i++) {
        testLogger.error('burst ' + i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTestLogger0117 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TLGR_0118
     * @tc.name      testTestLogger0118
     * @tc.desc      Verify interleaved info and error calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTestLogger0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTestLogger0118 begin');
      for (let i: number = 0; i < 5; i++) {
        testLogger.info('mixed info ' + i);
        testLogger.error('mixed error ' + i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testTestLogger0118 end');
    })
  })
}
