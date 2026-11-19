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
import logger from '../../../main/ets/utils/Logger';

const DOMAIN: number = 0xF814;
const TAG: string = 'EntryLoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function runSafely(action: () => void): boolean {
  let thrown: boolean = false;
  try {
    action();
  } catch (err) {
    thrown = true;
  }
  return thrown;
}

export default function entryLoggerCoreTest(): void {
  describe('EntryLoggerCoreTest', () => {
    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0101
     * @tc.name      testEntryLoggerCore0101
     * @tc.desc      Verify logger.info accepts a plain message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0101 begin');
      const thrown: boolean = runSafely(() => {
        logger.info('ohosTest plain info message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testEntryLoggerCore0101 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0102
     * @tc.name      testEntryLoggerCore0102
     * @tc.desc      Verify logger.debug accepts a plain message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0102 begin');
      const thrown: boolean = runSafely(() => {
        logger.debug('ohosTest plain debug message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testEntryLoggerCore0102 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0103
     * @tc.name      testEntryLoggerCore0103
     * @tc.desc      Verify logger.warn accepts a plain message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0103 begin');
      const thrown: boolean = runSafely(() => {
        logger.warn('ohosTest plain warn message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testEntryLoggerCore0103 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0104
     * @tc.name      testEntryLoggerCore0104
     * @tc.desc      Verify logger.error accepts a plain message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0104 begin');
      const thrown: boolean = runSafely(() => {
        logger.error('ohosTest plain error message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testEntryLoggerCore0104 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0105
     * @tc.name      testEntryLoggerCore0105
     * @tc.desc      Verify calling all four logger levels in sequence does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0105 begin');
      const thrown: boolean = runSafely(() => {
        logger.debug('seq debug');
        logger.info('seq info');
        logger.warn('seq warn');
        logger.error('seq error');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testEntryLoggerCore0105 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0106
     * @tc.name      testEntryLoggerCore0106
     * @tc.desc      Verify logger.info accepts an empty string message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0106 begin');
      const thrown: boolean = runSafely(() => {
        logger.info('');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testEntryLoggerCore0106 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0107
     * @tc.name      testEntryLoggerCore0107
     * @tc.desc      Verify logger.info accepts Chinese and special characters without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0107 begin');
      const thrown: boolean = runSafely(() => {
        logger.info('中文消息 %%{}[] 窗口管理');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testEntryLoggerCore0107 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0108
     * @tc.name      testEntryLoggerCore0108
     * @tc.desc      Verify logger.info accepts a long message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0108 begin');
      let longMessage: string = '';
      for (let i: number = 0; i < 200; i++) {
        longMessage += 'WindowManage';
      }
      const thrown: boolean = runSafely(() => {
        logger.info(longMessage);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testEntryLoggerCore0108 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0109
     * @tc.name      testEntryLoggerCore0109
     * @tc.desc      Check the exported logger is an object instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0109 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${logger !== undefined && logger !== null}`);
      expect(logger !== undefined && logger !== null).assertTrue();
      log('testEntryLoggerCore0109 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_ENTRYLOGGER_0110
     * @tc.name      testEntryLoggerCore0110
     * @tc.desc      Check all four logger levels are exposed as functions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryLoggerCore0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEntryLoggerCore0110 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      log('testEntryLoggerCore0110 end');
    })
  })
}
