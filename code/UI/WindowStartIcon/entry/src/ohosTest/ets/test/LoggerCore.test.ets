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
import Logger from '../../../main/ets/utils/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = 'WindowStartIconLoggerTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/**
 * Wraps a void call and reports whether it completed without throwing.
 */
function safeCall(action: () => void): boolean {
  try {
    action();
    return true;
  } catch (error) {
    log('safeCall failed: ' + String(error));
    return false;
  }
}

export default function loggerCoreTest(): void {
  describe('LoggerCoreTest', () => {
    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0001
     * @tc.name      testWindowStartIconLogger0001
     * @tc.desc      Verify the exported Logger object exposes four log level methods as functions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger=${typeof Logger}, expected='object'`);
      expect(typeof Logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Logger !== undefined && Logger !== null}`);
      expect(Logger !== undefined && Logger !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.debug=${typeof Logger.debug}`);
      expect(typeof Logger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.warn=${typeof Logger.warn}`);
      expect(typeof Logger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.error=${typeof Logger.error}`);
      expect(typeof Logger.error).assertEqual('function');
      log('testWindowStartIconLogger0001 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0002
     * @tc.name      testWindowStartIconLogger0002
     * @tc.desc      Verify info logs a normal Chinese message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.info('启动页信息日志'); })`);
      expect(safeCall(() => { Logger.info('启动页信息日志'); })).assertTrue();
      expect(safeCall(() => { Logger.info('startup page info log'); })).assertTrue();
      log('testWindowStartIconLogger0002 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0003
     * @tc.name      testWindowStartIconLogger0003
     * @tc.desc      Verify info tolerates an empty message string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.info(''); })`);
      expect(safeCall(() => { Logger.info(''); })).assertTrue();
      expect(safeCall(() => { Logger.info(' '); })).assertTrue();
      log('testWindowStartIconLogger0003 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0004
     * @tc.name      testWindowStartIconLogger0004
     * @tc.desc      Verify info tolerates a very long message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0004 begin');
      let longMessage: string = '';
      for (let i: number = 0; i < 50; i++) {
        longMessage += 'WindowStartIconLog0123456789';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual longMessage.length=${longMessage.length}, expected=1400`);
      expect(longMessage.length).assertEqual(1400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.info(longMessage); })`);
      expect(safeCall(() => { Logger.info(longMessage); })).assertTrue();
      log('testWindowStartIconLogger0004 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0005
     * @tc.name      testWindowStartIconLogger0005
     * @tc.desc      Verify warn logs a normal message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.warn=${typeof Logger.warn}`);
      expect(typeof Logger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.warn('启动页警告日志'); })`);
      expect(safeCall(() => { Logger.warn('启动页警告日志'); })).assertTrue();
      expect(safeCall(() => { Logger.warn('startup page warn log'); })).assertTrue();
      log('testWindowStartIconLogger0005 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0006
     * @tc.name      testWindowStartIconLogger0006
     * @tc.desc      Verify error logs a normal message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0006 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.error=${typeof Logger.error}`);
      expect(typeof Logger.error).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.error('启动页错误日志'); })`);
      expect(safeCall(() => { Logger.error('启动页错误日志'); })).assertTrue();
      expect(safeCall(() => { Logger.error('startup page error log'); })).assertTrue();
      log('testWindowStartIconLogger0006 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0007
     * @tc.name      testWindowStartIconLogger0007
     * @tc.desc      Verify debug logs a normal message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.debug=${typeof Logger.debug}`);
      expect(typeof Logger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.debug('启动页调试日志'); })`);
      expect(safeCall(() => { Logger.debug('启动页调试日志'); })).assertTrue();
      expect(safeCall(() => { Logger.debug('startup page debug log'); })).assertTrue();
      log('testWindowStartIconLogger0007 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0008
     * @tc.name      testWindowStartIconLogger0008
     * @tc.desc      Verify all four log levels succeed when called in sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.info('seq info'); })`);
      expect(safeCall(() => { Logger.info('seq info'); })).assertTrue();
      expect(safeCall(() => { Logger.warn('seq warn'); })).assertTrue();
      expect(safeCall(() => { Logger.error('seq error'); })).assertTrue();
      expect(safeCall(() => { Logger.debug('seq debug'); })).assertTrue();
      log('testWindowStartIconLogger0008 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0009
     * @tc.name      testWindowStartIconLogger0009
     * @tc.desc      Verify info tolerates format placeholders and line breaks in the message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0009 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.info('%{public}s special %d chars'...`);
      expect(safeCall(() => { Logger.info('%{public}s special %d chars'); })).assertTrue();
      expect(safeCall(() => { Logger.info('line1\nline2\tline3'); })).assertTrue();
      log('testWindowStartIconLogger0009 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0010
     * @tc.name      testWindowStartIconLogger0010
     * @tc.desc      Verify info tolerates numeric and mixed content messages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0010 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.info('countdown=$ {6} borderWidth=...`);
      expect(safeCall(() => { Logger.info(`countdown=${6} borderWidth=${18}px`); })).assertTrue();
      expect(safeCall(() => { Logger.info('0123456789!@#$%^&*()_+-=[]{}'); })).assertTrue();
      log('testWindowStartIconLogger0010 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0011
     * @tc.name      testWindowStartIconLogger0011
     * @tc.desc      Verify info stays stable across ten repeated calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0011 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      let allOk: boolean = true;
      for (let i: number = 0; i < 10; i++) {
        if (!safeCall(() => { Logger.info(`repeat ${i}`); })) {
          allOk = false;
          break;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual allOk=${allOk}, expected=true`);
      expect(allOk).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof allOk=${typeof allOk}, expected='boolean'`);
      expect(typeof allOk).assertEqual('boolean');
      log('testWindowStartIconLogger0011 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0012
     * @tc.name      testWindowStartIconLogger0012
     * @tc.desc      Verify info is declared to return void so the result stays undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0012 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.info=${typeof Logger.info}`);
      expect(typeof Logger.info).assertEqual('function');
      let result: void = Logger.info('void check');
      expect(typeof result).assertEqual('undefined');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.info('void check done'); })`);
      expect(safeCall(() => { Logger.info('void check done'); })).assertTrue();
      log('testWindowStartIconLogger0012 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0013
     * @tc.name      testWindowStartIconLogger0013
     * @tc.desc      Verify debug is declared to return void so the result stays undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0013 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.debug=${typeof Logger.debug}`);
      expect(typeof Logger.debug).assertEqual('function');
      let result: void = Logger.debug('void check');
      expect(typeof result).assertEqual('undefined');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.debug('void check done'); })`);
      expect(safeCall(() => { Logger.debug('void check done'); })).assertTrue();
      log('testWindowStartIconLogger0013 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0014
     * @tc.name      testWindowStartIconLogger0014
     * @tc.desc      Verify warn is declared to return void so the result stays undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0014 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.warn=${typeof Logger.warn}`);
      expect(typeof Logger.warn).assertEqual('function');
      let result: void = Logger.warn('void check');
      expect(typeof result).assertEqual('undefined');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.warn('void check done'); })`);
      expect(safeCall(() => { Logger.warn('void check done'); })).assertTrue();
      log('testWindowStartIconLogger0014 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0015
     * @tc.name      testWindowStartIconLogger0015
     * @tc.desc      Verify error is declared to return void so the result stays undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0015 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger.error=${typeof Logger.error}`);
      expect(typeof Logger.error).assertEqual('function');
      let result: void = Logger.error('void check');
      expect(typeof result).assertEqual('undefined');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue safeCall(() => { Logger.error('void check done'); })`);
      expect(safeCall(() => { Logger.error('void check done'); })).assertTrue();
      log('testWindowStartIconLogger0015 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_LOGGER_0016
     * @tc.name      testWindowStartIconLogger0016
     * @tc.desc      Verify twenty mixed-level calls in a row all succeed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconLogger0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconLogger0016 begin');
      let allOk: boolean = true;
      for (let i: number = 0; i < 5; i++) {
        if (!safeCall(() => { Logger.info(`mix ${i}`); })) {
          allOk = false;
        }
        if (!safeCall(() => { Logger.warn(`mix ${i}`); })) {
          allOk = false;
        }
        if (!safeCall(() => { Logger.error(`mix ${i}`); })) {
          allOk = false;
        }
        if (!safeCall(() => { Logger.debug(`mix ${i}`); })) {
          allOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual allOk=${allOk}, expected=true`);
      expect(allOk).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof allOk=${typeof allOk}, expected='boolean'`);
      expect(typeof allOk).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger=${typeof Logger}, expected='object'`);
      expect(typeof Logger).assertEqual('object');
      log('testWindowStartIconLogger0016 end');
    })
  })
}
