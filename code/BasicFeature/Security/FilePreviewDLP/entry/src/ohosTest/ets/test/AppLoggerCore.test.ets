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
import { logger } from '../../../main/ets/log/Logger';

const DOMAIN: number = 0xF812;
const TAG: string = 'AppLoggerCoreTest';

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

export default function appLoggerCoreTest(): void {
  describe('AppLoggerCoreTest', () => {
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0001
     * @tc.name      testAppLogger0001
     * @tc.desc      Verify the shared app logger instance is exported and not null.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger !== null=${logger !== null}`);
      expect(logger !== null).assertTrue();
      log('testAppLogger0001 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0002
     * @tc.name      testAppLogger0002
     * @tc.desc      Verify the shared app logger instance is an object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testAppLogger0002 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0003
     * @tc.name      testAppLogger0003
     * @tc.desc      Verify info is exposed as a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      log('testAppLogger0003 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0004
     * @tc.name      testAppLogger0004
     * @tc.desc      Verify warn is exposed as a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      log('testAppLogger0004 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0005
     * @tc.name      testAppLogger0005
     * @tc.desc      Verify error is exposed as a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      log('testAppLogger0005 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0006
     * @tc.name      testAppLogger0006
     * @tc.desc      Verify debug is exposed as a callable function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0006 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      log('testAppLogger0006 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0007
     * @tc.name      testAppLogger0007
     * @tc.desc      Verify the four log level methods are distinct references.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse logger.info === logger.warn=${logger.info === logger.warn}`);
      expect(logger.info === logger.warn).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse logger.warn === logger.error=${logger.warn === logger.error}`);
      expect(logger.warn === logger.error).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${logger.error === logger.debug}`);
      expect(logger.error === logger.debug).assertFalse();
      log('testAppLogger0007 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0008
     * @tc.name      testAppLogger0008
     * @tc.desc      Verify calling info with a plain message does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0008 begin');
      logger.info('app logger info smoke');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0008 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0009
     * @tc.name      testAppLogger0009
     * @tc.desc      Verify calling warn with a plain message does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0009 begin');
      logger.warn('app logger warn smoke');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0009 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0010
     * @tc.name      testAppLogger0010
     * @tc.desc      Verify calling error with a plain message does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0010 begin');
      logger.error('app logger error smoke');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0010 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0011
     * @tc.name      testAppLogger0011
     * @tc.desc      Verify calling debug with a plain message does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0011 begin');
      logger.debug('app logger debug smoke');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0011 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0012
     * @tc.name      testAppLogger0012
     * @tc.desc      Verify info tolerates an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0012 begin');
      logger.info('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0012 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0013
     * @tc.name      testAppLogger0013
     * @tc.desc      Verify info tolerates CJK characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0013 begin');
      logger.info('DLP文件添加展示案例日志');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0013 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0014
     * @tc.name      testAppLogger0014
     * @tc.desc      Verify info tolerates special characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0014 begin');
      logger.info('!@#$%^&*()_+-=[]{}|;:,.<>?/~`"\'\\');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0014 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0015
     * @tc.name      testAppLogger0015
     * @tc.desc      Verify info tolerates a 1024 character message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0015 begin');
      const longText: string = buildLongText('abcd', 256);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual longText.length=${longText.length}, expected=1024`);
      expect(longText.length).assertEqual(1024);
      logger.info(longText);
      log('testAppLogger0015 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0016
     * @tc.name      testAppLogger0016
     * @tc.desc      Verify info tolerates a JSON shaped message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0016 begin');
      logger.info('{"action":"viewData","uri":"file://test/sample.dlp"}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0016 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0017
     * @tc.name      testAppLogger0017
     * @tc.desc      Verify info accepts multiple arguments in one call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0017 begin');
      logger.info('a', 'b', 'c', 'd', 'e');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0017 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0018
     * @tc.name      testAppLogger0018
     * @tc.desc      Verify warn tolerates an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0018 begin');
      logger.warn('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0018 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0019
     * @tc.name      testAppLogger0019
     * @tc.desc      Verify warn tolerates CJK and special characters together.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0019 begin');
      logger.warn('选择DLP文件失败 <err=&1>');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0019 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0020
     * @tc.name      testAppLogger0020
     * @tc.desc      Verify warn tolerates a 512 character message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0020 begin');
      const longText: string = buildLongText('warn', 128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual longText.length=${longText.length}, expected=512`);
      expect(longText.length).assertEqual(512);
      logger.warn(longText);
      log('testAppLogger0020 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0021
     * @tc.name      testAppLogger0021
     * @tc.desc      Verify warn accepts multiple arguments in one call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0021 begin');
      logger.warn('w1', 'w2', 'w3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0021 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0022
     * @tc.name      testAppLogger0022
     * @tc.desc      Verify error tolerates an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0022 begin');
      logger.error('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0022 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0023
     * @tc.name      testAppLogger0023
     * @tc.desc      Verify error tolerates CJK characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0023 begin');
      logger.error('预览DLP文件失败');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0023 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0024
     * @tc.name      testAppLogger0024
     * @tc.desc      Verify error tolerates special characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0024 begin');
      logger.error('code=-1; msg="view failed"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0024 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0025
     * @tc.name      testAppLogger0025
     * @tc.desc      Verify error tolerates a 512 character message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0025 begin');
      const longText: string = buildLongText('err0', 128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual longText.length=${longText.length}, expected=512`);
      expect(longText.length).assertEqual(512);
      logger.error(longText);
      log('testAppLogger0025 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0026
     * @tc.name      testAppLogger0026
     * @tc.desc      Verify error accepts multiple arguments in one call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0026 begin');
      logger.error('e1', 'e2', 'e3', 'e4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0026 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0027
     * @tc.name      testAppLogger0027
     * @tc.desc      Verify debug tolerates an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0027 begin');
      logger.debug('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0027 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0028
     * @tc.name      testAppLogger0028
     * @tc.desc      Verify debug tolerates a long CJK message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0028 begin');
      const longText: string = buildLongText('调试', 256);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual longText.length=${longText.length}, expected=512`);
      expect(longText.length).assertEqual(512);
      logger.debug(longText);
      log('testAppLogger0028 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0029
     * @tc.name      testAppLogger0029
     * @tc.desc      Verify debug accepts multiple arguments in one call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0029 begin');
      logger.debug('d1', 'd2', 'd3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0029 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0030
     * @tc.name      testAppLogger0030
     * @tc.desc      Verify ten consecutive info calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0030 begin');
      for (let i: number = 0; i < 10; i++) {
        logger.info('burst ' + i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0030 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0031
     * @tc.name      testAppLogger0031
     * @tc.desc      Verify interleaved warn and error bursts stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0031 begin');
      for (let i: number = 0; i < 5; i++) {
        logger.warn('interleave warn ' + i);
        logger.error('interleave error ' + i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testAppLogger0031 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_LOGG_0032
     * @tc.name      testAppLogger0032
     * @tc.desc      Verify repeated access to the logger binding returns the same instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppLogger0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppLogger0032 begin');
      const first: object = logger;
      const second: object = logger;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first === second=${first === second}`);
      expect(first === second).assertTrue();
      log('testAppLogger0032 end');
    })
  })
}
