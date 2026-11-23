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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import Logger from '../../../main/ets/model/Logger';

const DOMAIN: number = 0xF814;
const TAG: string = 'LoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function loggerCoreTest(): void {
  describe('SocketLoggerCoreTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_LOGGER_0501
     * @tc.name      testLogger0501
     * @tc.desc      Verify info logging completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0501 begin');
      let noThrow: boolean = true;
      try {
        Logger.info('ohosTest info');
      } catch (e) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('testLogger0501 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGER_0502
     * @tc.name      testLogger0502
     * @tc.desc      Verify debug logging completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0502 begin');
      let noThrow: boolean = true;
      try {
        Logger.debug('ohosTest debug');
      } catch (e) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('testLogger0502 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGER_0503
     * @tc.name      testLogger0503
     * @tc.desc      Verify warn logging completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0503 begin');
      let noThrow: boolean = true;
      try {
        Logger.warn('ohosTest warn');
      } catch (e) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('testLogger0503 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGER_0504
     * @tc.name      testLogger0504
     * @tc.desc      Verify error logging completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0504 begin');
      let noThrow: boolean = true;
      try {
        Logger.error('ohosTest error');
      } catch (e) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('testLogger0504 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGER_0505
     * @tc.name      testLogger0505
     * @tc.desc      Verify multi argument info logging completes safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0505 begin');
      let noThrow: boolean = true;
      try {
        Logger.info('part-a', 'part-b');
      } catch (e) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('testLogger0505 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGER_0506
     * @tc.name      testLogger0506
     * @tc.desc      Verify interleaved info and error calls complete safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0506 begin');
      let steps: number = 0;
      try {
        Logger.info('step one');
        steps++;
        Logger.error('step two');
        steps++;
      } catch (e) {
        steps = 0;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual steps=${steps}, expected=2`);
      expect(steps).assertEqual(2);
      log('testLogger0506 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGER_0507
     * @tc.name      testLogger0507
     * @tc.desc      Verify ten consecutive logging calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0507 begin');
      let noThrow: boolean = true;
      try {
        for (let i: number = 0; i < 10; i++) {
          Logger.info('loop ' + i);
        }
      } catch (e) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('testLogger0507 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGGER_0508
     * @tc.name      testLogger0508
     * @tc.desc      Verify special characters pass through warn logging safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogger0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLogger0508 begin');
      let noThrow: boolean = true;
      try {
        Logger.warn('特殊%字符\n换行\\反斜杠');
      } catch (e) {
        noThrow = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue noThrow=${noThrow}`);
      expect(noThrow).assertTrue();
      log('testLogger0508 end');
    })
  })
}
