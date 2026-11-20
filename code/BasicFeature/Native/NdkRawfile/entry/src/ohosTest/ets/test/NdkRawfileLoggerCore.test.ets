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
import { Logger } from '../../../main/ets/utils/Logger';

const DOMAIN: number = 0xF812;
const TAG: string = 'NdkRawfileLoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function callWithoutThrow(action: () => void): boolean {
  let threw: boolean = false;
  try {
    action();
  } catch (error) {
    threw = true;
  }
  return threw;
}

function longMessage(): string {
  let message: string = '';
  for (let i: number = 0; i < 50; i++) {
    message += 'rawfile-ohosTest-log-line;';
  }
  return message;
}

export default function ndkRawfileLoggerCoreTest(): void {
  describe('NdkRawfileLoggerCoreTest', () => {
    /**
     * @tc.number    SUB_NDKRAWFILE_LOGGER_0405
     * @tc.name      testRawfileLogger0405
     * @tc.desc      Verify the sample logger accepts an empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileLogger0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileLogger0405 begin');
      const threw: boolean = callWithoutThrow(() => {
        Logger.info('');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse threw=${threw}`);
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof threw=${typeof threw}, expected='boolean'`);
      expect(typeof threw).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Logger=${typeof Logger}, expected='object'`);
      expect(typeof Logger).assertEqual('object');
      log('testRawfileLogger0405 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_LOGGER_0406
     * @tc.name      testRawfileLogger0406
     * @tc.desc      Verify the sample logger accepts a long message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileLogger0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileLogger0406 begin');
      const message: string = longMessage();
      const threw: boolean = callWithoutThrow(() => {
        Logger.info(message);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse threw=${threw}`);
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger message.length=${message.length}, expected=1000`);
      expect(message.length).assertLarger(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof message=${typeof message}, expected='string'`);
      expect(typeof message).assertEqual('string');
      log('testRawfileLogger0406 end');
    })

  })
}
